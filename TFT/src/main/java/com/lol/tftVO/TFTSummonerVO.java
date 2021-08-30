package com.lol.tftVO;

import java.util.Arrays;

public class TFTSummonerVO {
	String id;
	String accountId;
	String puuid;
	String name;
	int profileIconId;
	String revisionDate;
	int summonerLevel;
	String[] matchList;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProfileIconId() {
		return profileIconId;
	}
	public void setProfileIconId(int profileIconId) {
		this.profileIconId = profileIconId;
	}

	public String getRevisionDate() {
		return revisionDate;
	}
	public void setRevisionDate(String revisionDate) {
		this.revisionDate = revisionDate;
	}
	public int getSummonerLevel() {
		return summonerLevel;
	}
	public void setSummonerLevel(int summonerLevel) {
		this.summonerLevel = summonerLevel;
	}
	public String[] getMatchList() {
		return matchList;
	}
	public void setMatchList(String[] matchList) {
		this.matchList = matchList;
	}
	@Override
	public String toString() {
		return "TFTSummonerVO [matchList=" + Arrays.toString(matchList) + "]";
	}
}