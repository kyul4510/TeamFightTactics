package com.lol.tftVO;

public class TFTParticipantVO {
	Integer placement;
	Integer level;
	Integer last_round;
	Float time_eliminated;
	TFTCompanionVO companion;
	TFTTraitVO[] traits;
	Integer players_eliminated;
	String puuid;
	Integer total_damage_to_players;
	TFTUnitVO[] units;
	Integer gold_left;
	public Integer getPlacement() {
		return placement;
	}
	public void setPlacement(Integer placement) {
		this.placement = placement;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getLast_round() {
		return last_round;
	}
	public void setLast_round(Integer last_round) {
		this.last_round = last_round;
	}
	public Float getTime_eliminated() {
		return time_eliminated;
	}
	public void setTime_eliminated(Float time_eliminated) {
		this.time_eliminated = time_eliminated;
	}
	public TFTCompanionVO getCompanion() {
		return companion;
	}
	public void setCompanion(TFTCompanionVO companion) {
		this.companion = companion;
	}
	public TFTTraitVO[] getTraits() {
		return traits;
	}
	public void setTraits(TFTTraitVO[] traits) {
		this.traits = traits;
	}
	public Integer getPlayers_eliminated() {
		return players_eliminated;
	}
	public void setPlayers_eliminated(Integer players_eliminated) {
		this.players_eliminated = players_eliminated;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public Integer getTotal_damage_to_players() {
		return total_damage_to_players;
	}
	public void setTotal_damage_to_players(Integer total_damage_to_players) {
		this.total_damage_to_players = total_damage_to_players;
	}
	public TFTUnitVO[] getUnits() {
		return units;
	}
	public void setUnits(TFTUnitVO[] units) {
		this.units = units;
	}
	public Integer getGold_left() {
		return gold_left;
	}
	public void setGold_left(Integer gold_left) {
		this.gold_left = gold_left;
	}
}