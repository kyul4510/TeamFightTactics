package com.lol.tftVO;

public class TFTMetadataVO {
	int data_version;
	String[] participants;
	String match_id;
	
	public TFTMetadataVO() {
		
	}
	public int getData_version() {
		return data_version;
	}
	public void setData_version(int data_version) {
		this.data_version = data_version;
	}
	public String[] getParticipants() {
		return participants;
	}
	public void setParticipants(String[] participants) {
		this.participants = participants;
	}
	public String getMatch_id() {
		return match_id;
	}
	public void setMatch_id(String match_id) {
		this.match_id = match_id;
	}
}
