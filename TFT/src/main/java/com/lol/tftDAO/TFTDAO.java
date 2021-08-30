package com.lol.tftDAO;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.lol.tftVO.TFTCompanionVO;
import com.lol.tftVO.TFTInfoVO;
import com.lol.tftVO.TFTMatchInfoVO;
import com.lol.tftVO.TFTMetadataVO;
import com.lol.tftVO.TFTParticipantVO;
import com.lol.tftVO.TFTSummonerVO;
import com.lol.tftVO.TFTTraitVO;
import com.lol.tftVO.TFTUnitVO;

public class TFTDAO {
	String APIkey = "RGAPI-fc2aeaf3-fd57-4421-9e1b-bcdd08d93a1d";
	
	public TFTSummonerVO getSummoner(String nickname) {
		System.out.println("TFTDAO : 소환사 정보 가져오기");
		
		//한글 닉네임 URL 인코딩
		try {
			nickname = URLEncoder.encode(nickname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//공백 문자 + 인코딩 된 것을 %20으로 변경
		nickname = nickname.replace("+", "%20");
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("X-Riot-Token", APIkey); //API키 정보 헤더 추가
		
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		//롤 서버에 요청
		URI url = URI.create("https://kr.api.riotgames.com/tft/summoner/v1/summoners/by-name/" + nickname);
		//요청 응답 받음
		ResponseEntity<String> response;
		try {
			response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
		} catch (Exception e) {
			return null;
		}
		//응답받은 데이터 VO에 입력
		ObjectMapper om = new ObjectMapper();
		TFTSummonerVO summonerVO = new TFTSummonerVO();
		try {
			summonerVO = om.readValue(response.getBody().toString(), TFTSummonerVO.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("TFTDAO 소환사 이름 : " + summonerVO.getName());
		System.out.println("TFTDAO : 소환사 정보 가져오기 완료");
		return summonerVO;
	}
	
	public String[] getMatches(String puuid, int count) {
		System.out.println("TFTDAO : 소환사 매치리스트 가져오기");
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("X-Riot-Token", APIkey); //헤더에 API키 추가
		
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		URI url = URI.create("https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/" + puuid + "/ids?count=" + count);
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class); //요청을 보내어 결과를 받아옴
		
		String matches = response.getBody().toString();
		matches = matches.replace("[", "");
		matches = matches.replace("]", "");
		matches = matches.replace("\"", "");
		String[] matchList = matches.split(",");
		for (int i = 0; i < matchList.length; i++) {
			System.out.println(matchList[i]);
		}
		
		System.out.println("TFTDAO : 소환사 매치리스트 가져오기 완료");
		return matchList;
	}
	
	public TFTMatchInfoVO[] getMatchInfo(String[] matchList) {
		System.out.println("TFTDAO : 매치상세정보 가져오기");
		String result = ""; //json 객체 담을 것
		JSONParser parser = new JSONParser();
		JSONObject json = null; // json 원본
		TFTMatchInfoVO[] matchInfos = new TFTMatchInfoVO[matchList.length]; //matchInfo 10게임
		TFTMatchInfoVO matchInfo = new TFTMatchInfoVO(); //metadata, info 들 담고있음
		TFTMetadataVO metadataVO = new TFTMetadataVO(); //metadata 담고 있음
		TFTInfoVO infoVO = new TFTInfoVO(); //info 담고 있음
		TFTParticipantVO participantVO = new TFTParticipantVO();
		TFTParticipantVO[] participantVOs = new TFTParticipantVO[8];
		TFTCompanionVO companionVO = new TFTCompanionVO();
		TFTTraitVO traitVO = new TFTTraitVO();
		TFTUnitVO unitVO = new TFTUnitVO();
		for (int i = 0; i < matchList.length; i++) {
			result = getHttpHTML(matchList[i]); //json string 가져오기
			try {
				json = (JSONObject) parser.parse(result); //jsonObject로 파싱
				
				/* metadata json 파싱 */
				JSONObject metadata = (JSONObject) json.get("metadata");
				metadataVO.setData_version(Integer.parseInt((String) metadata.get("data_version")));
				metadataVO.setMatch_id((String)metadata.get("match_id"));
				JSONArray participants =  (JSONArray) metadata.get("participants");
				List<String> participantsList = new ArrayList<String>();
				for (int j = 0; j < participants.size(); j++) {
					participantsList.add((String) participants.get(j));
				}
				String[] participantsArray = participantsList.toArray(new String[participantsList.size()]);
				metadataVO.setParticipants(participantsArray);
				
				/* info json 파싱 */
				JSONObject info = (JSONObject) json.get("info");
				infoVO.setGame_datetime((Long)info.get("game_datetime"));
				infoVO.setTft_set_number(((Long)info.get("tft_set_number")).intValue());
				infoVO.setGame_length(((Double) info.get("game_length")).floatValue());
				infoVO.setQueue_id(((Long)info.get("queue_id")).intValue());
				infoVO.setGame_version((String) info.get("game_version"));
				
				JSONArray participantsObj = (JSONArray) info.get("participants");
				for (int j = 0; j < participantsObj.size(); j++) {
					JSONObject playerInfo = (JSONObject) participantsObj.get(j);
					participantVO.setPlacement(((Long) playerInfo.get("placement")).intValue());
					participantVO.setLevel(((Long) playerInfo.get("level")).intValue());
					participantVO.setLast_round(((Long) playerInfo.get("last_round")).intValue());
					participantVO.setTime_eliminated(((Double) playerInfo.get("time_eliminated")).floatValue());
					
					JSONObject companionObj = (JSONObject) playerInfo.get("companion");
					companionVO.setContent_ID((String) companionObj.get("content_ID"));
					companionVO.setSkin_ID(((Long)companionObj.get("skin_ID")).intValue());
					companionVO.setSpecies((String) companionObj.get("species"));
					participantVO.setCompanion(companionVO);
					
					JSONArray traitsObj = (JSONArray) playerInfo.get("traits");
					TFTTraitVO[] traitVOs = new TFTTraitVO[traitsObj.size()];
					for (int k = 0; k < traitsObj.size(); k++) {
						try {
							JSONObject playerTraits = (JSONObject) traitsObj.get(k);
							traitVO.setTier_total(((Long) playerTraits.get("tier_total")).intValue());
							traitVO.setStyle(((Long)playerTraits.get("style")).intValue());
							traitVO.setName((String) playerTraits.get("name"));
							traitVO.setTier_current(((Long) playerTraits.get("tier_current")).intValue());
							traitVO.setNum_units(((Long) playerTraits.get("num_units")).intValue());
							traitVOs[k] = traitVO;
						} catch (Exception e) {
							// TODO: handle exception
							System.out.println("NULLPOINT EXCEPTION");
						}
					}
					participantVO.setTraits(traitVOs);
					participantVO.setPlayers_eliminated(((Long) playerInfo.get("players_eliminated")).intValue());
					participantVO.setPuuid((String) playerInfo.get("puuid"));
					participantVO.setTotal_damage_to_players(((Long) playerInfo.get("total_damage_to_players")).intValue());
					JSONArray unitsObj = (JSONArray) playerInfo.get("units");
					TFTUnitVO[] unitVOs = new TFTUnitVO[unitsObj.size()];
					for (int k = 0; k < unitsObj.size(); k++) {
						JSONObject playerUnits = (JSONObject) unitsObj.get(k);
						unitVO.setTier(((Long) playerUnits.get("tier")).intValue());
						JSONArray items = (JSONArray) playerUnits.get("items");
						Integer[] itemsarr = new Integer[items.size()];
						for (int l = 0; l < items.size(); l++) {
							itemsarr[l] = ((Long) items.get(l)).intValue();
						}
						unitVO.setItems(itemsarr);
						unitVO.setCharacter_id((String) playerUnits.get("character_id"));
						unitVO.setName((String) playerUnits.get("name"));
						unitVO.setRarity(((Long) playerUnits.get("rarity")).intValue());
						unitVOs[k] = unitVO;
					}
					participantVO.setUnits(unitVOs);
					participantVO.setGold_left(((Long) playerInfo.get("gold_left")).intValue());
					participantVOs[j] = participantVO;
				}
				infoVO.setParticipants(participantVOs);
//				game_datetime = (Long) info.get("game_datetime");
//				game_length = ((Double) info.get("game_length")).floatValue();
//				SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				String str = day.format(new Date(game_datetime));
//				System.out.println("게임 날짜 : " + str);
//				int ig = Math.round(game_length);
//				System.out.println("게임 전체 길이 : " + ig / 3600 + "시" + ig / 60 + "분" + ig % 60 + "초");
				matchInfo.setInfo(infoVO);
				matchInfo.setMetadata(metadataVO);
				
				matchInfos[i] = matchInfo;
				System.out.println("TFTDAO : 매치상세정보 가져오기 완료");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		return matchInfos;
		
//		RestTemplate restTemplate = new RestTemplate();
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_JSON);
//		headers.set("X-Riot-Token", APIkey); //헤더에 API키 추가
//		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
//		for (int i = 0; i < 1; i++) {
//			System.out.println("요청 : " + matchList[i]);
//			URI url = URI.create("https://asia.api.riotgames.com/tft/match/v1/matches/" + matchList[i]);
//			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
//			System.out.println(url);
//			matchList[i] = response.getBody().toString();
//			System.out.println("응답 : " + matchList[i]);
//		}
		
		//header 없이
//		RestTemplate restTemplate = new RestTemplate(); 
//		URI uri = UriComponentsBuilder.fromHttpUrl("https://asia.api.riotgames.com/tft/match/v1/matches/KR_4178897041")
//				.queryParam("api_key", "RGAPI-d2c9c175-f8f9-43cf-b6ca-40192a7f14f0").build().toUri(); 
//		System.out.println(uri);
//		String response = restTemplate.getForObject(uri, String.class);
//		System.out.println(response.toString());
	}
	
	public ArrayList<JSONObject> getMatchInfo2(String[] matchList) {
		System.out.println("TFTDAO : 매치상세정보 가져오기");
		String result = ""; //json 객체 담을 것
		JSONParser parser = new JSONParser();
		JSONObject json = null; // json 원본
		ArrayList<JSONObject> jsons = new ArrayList<JSONObject>();
		JSONObject temp;
		String str;
		for (int i = 0; i < matchList.length; i++) {
			result = getHttpHTML(matchList[i]); //json 가져오기
			try {
				if(result.length() != 0) {
					json = (JSONObject) parser.parse(result); //jsonObject로 파싱
					
					temp = (JSONObject) json.get("info");
					str = (String) temp.get("game_version");
					String[] substr = str.split(" ");
					String[] substr2 = substr[1].split("\\.");
					int version = Integer.parseInt(substr2[1]);
					if(version >= 6) {
						jsons.add(json);
					}
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("TFTDAO : 매치상세정보 가져오기 완료");
		if(jsons.size() == 0) {
			
		}
		return jsons;
	}
	
	public String getHttpHTML(String match) {
		URL url;
		HttpURLConnection conn;
		BufferedReader rd;
		String line;
		String result = "";
		try {
			url = new URL("https://asia.api.riotgames.com/tft/match/v1/matches/"+ match + "?api_key=" + APIkey);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			while ((line = rd.readLine()) != null) {
				result += line + "\n";
			}
			rd.close();
		} catch (IOException e) {
			// TODO: handle exception
		} catch (Exception e) {
			
		}
		return result;
	}
}
