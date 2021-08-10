package com.jps.domain;

import org.apache.ibatis.type.Alias;

@Alias("BasketVO")
public class BasketVO {
	
	private int basket_idx;
	private String user_num;
	private int item_num;
	private String item_color;
	private String item_size;
	private int item_count;
	private String update_date;
	private ItemVO itemvo;
	public int getBasket_idx() {
		return basket_idx;
	}
	public void setBasket_idx(int basket_idx) {
		this.basket_idx = basket_idx;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_color() {
		return item_color;
	}
	public void setItem_color(String item_color) {
		this.item_color = item_color;
	}
	public String getItem_size() {
		return item_size;
	}
	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public ItemVO getItemvo() {
		return itemvo;
	}
	public void setItemvo(ItemVO itemvo) {
		this.itemvo = itemvo;
	}
	@Override
	public String toString() {
		return "BasketVO [basket_idx=" + basket_idx + ", user_num=" + user_num + ", item_num=" + item_num
				+ ", item_color=" + item_color + ", item_size=" + item_size + ", item_count=" + item_count
				+ ", update_date=" + update_date + ", itemvo=" + itemvo + "]";
	}
}
