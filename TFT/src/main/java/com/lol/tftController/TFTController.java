package com.lol.tftController;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lol.tftDAO.TFTDAO;
import com.lol.tftVO.TFTSummonerVO;


@Controller
public class TFTController {
	TFTDAO dao = new TFTDAO();
	TFTSummonerVO summonerInfo = null;
	ArrayList<JSONObject> json;
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		System.out.println("Controller : home 호출");
		return "home";
	}
	
	@RequestMapping(value="summonerInfo")
	@ResponseBody
	public TFTSummonerVO summonerInfo(HttpServletRequest request, Model model) {
		System.out.println("Controller : summonerInfo 호출");
		summonerInfo = dao.getSummoner(request.getParameter("summonerName"));
		System.out.println("Controller : summonerInfo 종료");
		return summonerInfo;
	}
	
	@RequestMapping(value="matchInfo")
	@ResponseBody
	public ArrayList<JSONObject> matchInfo(HttpServletRequest request, Model model) {
		System.out.println("Controller : matchInfo 호출");
//		TFTMatchInfoVO[] matchinfos;
		if(summonerInfo != null) {
			summonerInfo.setMatchList(dao.getMatches(summonerInfo.getPuuid(), 10));
	//		matchinfos = dao.getMatchInfo(SummonerInfo.getMatchList());
			json = dao.getMatchInfo2(summonerInfo.getMatchList());
		}
		System.out.println("Controller : matchInfo 종료");
		return json;
//		return matchinfos;
	}
	
	@RequestMapping(value="viewMore")
	@ResponseBody
	public ArrayList<JSONObject> viewMore(HttpServletRequest request, Model model) {
		System.out.println("Controller : viewMore 호출");
		int page = Integer.parseInt(request.getParameter("page"));
		if(summonerInfo != null) {
			summonerInfo.setMatchList(dao.getMatches(summonerInfo.getPuuid(), (page + 10)));
			String[] matchList = summonerInfo.getMatchList();
			String[] submatchList = new String[10];
			for(int i = page;i < matchList.length; i++ ) {
				submatchList[i-page] = matchList[i];
			}
			summonerInfo.setMatchList(submatchList);
			System.out.println(summonerInfo.toString());
			json = dao.getMatchInfo2(summonerInfo.getMatchList());
		}
		System.out.println("Controller : viewMore 종료");
		return json;
	}
}