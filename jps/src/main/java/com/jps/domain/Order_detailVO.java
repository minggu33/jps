package com.jps.domain;

public class Order_detailVO {

	private int order_detail_idx;
	private int order_idx;
	private int item_num;
	private String order_detail_color;
	private String order_detail_size;
	private int order_detail_stock;
	public int getOrder_detail_idx() {
		return order_detail_idx;
	}
	public void setOrder_detail_idx(int order_detail_idx) {
		this.order_detail_idx = order_detail_idx;
	}
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getOrder_detail_color() {
		return order_detail_color;
	}
	public void setOrder_detail_color(String order_detail_color) {
		this.order_detail_color = order_detail_color;
	}
	public String getOrder_detail_size() {
		return order_detail_size;
	}
	public void setOrder_detail_size(String order_detail_size) {
		this.order_detail_size = order_detail_size;
	}
	public int getOrder_detail_stock() {
		return order_detail_stock;
	}
	public void setOrder_detail_stock(int order_detail_stock) {
		this.order_detail_stock = order_detail_stock;
	}
	@Override
	public String toString() {
		return "Order_detailVO [order_detail_idx=" + order_detail_idx + ", order_idx=" + order_idx + ", item_num="
				+ item_num + ", order_detail_color=" + order_detail_color + ", order_detail_size=" + order_detail_size
				+ ", order_detail_stock=" + order_detail_stock + "]";
	}
	
	
}
