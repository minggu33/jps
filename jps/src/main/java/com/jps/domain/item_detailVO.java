package com.jps.domain;

public abstract class item_detailVO {
	
	private	int item_detail_idx;
	private int item_num;
	private String item_size;
	private String item_color;
	private int item_stock;
	public int getItem_detail_idx() {
		return item_detail_idx;
	}
	public void setItem_detail_idx(int item_detail_idx) {
		this.item_detail_idx = item_detail_idx;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_size() {
		return item_size;
	}
	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}
	public String getItem_color() {
		return item_color;
	}
	public void setItem_color(String item_color) {
		this.item_color = item_color;
	}
	public int getItem_stock() {
		return item_stock;
	} 
	public void setItem_stock(int item_stock) {
		this.item_stock = item_stock;
	}
	@Override
	public String toString() {
		return "item_detailVO [item_detail_idx=" + item_detail_idx + ", item_num=" + item_num + ", item_size="
				+ item_size + ", item_color=" + item_color + ", item_stock=" + item_stock + "]";
	}
	
	
	
}
