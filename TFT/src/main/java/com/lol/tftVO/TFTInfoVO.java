package com.lol.tftVO;

public class TFTInfoVO {
	TFTParticipantVO[] participants;
	Long game_datetime;
	Integer tft_set_number;
	Float game_length;
	Integer queue_id;
	String game_version;
	public TFTParticipantVO[] getParticipants() {
		return participants;
	}
	public void setParticipants(TFTParticipantVO[] participants) {
		this.participants = participants;
	}
	public Long getGame_datetime() {
		return game_datetime;
	}
	public void setGame_datetime(Long game_datetime) {
		this.game_datetime = game_datetime;
	}
	public Integer getTft_set_number() {
		return tft_set_number;
	}
	public void setTft_set_number(Integer tft_set_number) {
		this.tft_set_number = tft_set_number;
	}
	public Float getGame_length() {
		return game_length;
	}
	public void setGame_length(Float game_length) {
		this.game_length = game_length;
	}
	public Integer getQueue_id() {
		return queue_id;
	}
	public void setQueue_id(Integer queue_id) {
		this.queue_id = queue_id;
	}
	public String getGame_version() {
		return game_version;
	}
	public void setGame_version(String game_version) {
		this.game_version = game_version;
	}
}
