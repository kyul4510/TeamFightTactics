package com.lol.tftVO;

public class TFTUnitVO {
	Integer tier;
	Integer[] items;
	String character_id;
	String name;
	Integer rarity;
	
	public Integer getTier() {
		return tier;
	}
	public void setTier(Integer tier) {
		this.tier = tier;
	}
	public Integer[] getItems() {
		return items;
	}
	public void setItems(Integer[] items) {
		this.items = items;
	}
	public String getCharacter_id() {
		return character_id;
	}
	public void setCharacter_id(String character_id) {
		this.character_id = character_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getRarity() {
		return rarity;
	}
	public void setRarity(Integer rarity) {
		this.rarity = rarity;
	}
}
