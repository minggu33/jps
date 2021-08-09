package com.jps.domain;

public class OrderVO {

	private int order_idx;
	private String user_num;
	private String order_date;
	private String order_method;
	private String order_addr;
	private int order_state;
	private int order_total_price;
	private int order_total_point;
	private String order_com_memo;
	private int order_fee;
	private String order_del;
	private String order_del_num;
	private String order_del_memo;
	private int order_coupon_use;
	private String order_coupon;
	private int order_point_use;
	private int order_point_amount;
	private int order_final_price;
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_method() {
		return order_method;
	}
	public void setOrder_method(String order_method) {
		this.order_method = order_method;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	public int getOrder_total_point() {
		return order_total_point;
	}
	public void setOrder_total_point(int order_total_point) {
		this.order_total_point = order_total_point;
	}
	public String getOrder_com_memo() {
		return order_com_memo;
	}
	public void setOrder_com_memo(String order_com_memo) {
		this.order_com_memo = order_com_memo;
	}
	public int getOrder_fee() {
		return order_fee;
	}
	public void setOrder_fee(int order_fee) {
		this.order_fee = order_fee;
	}
	public String getOrder_del() {
		return order_del;
	}
	public void setOrder_del(String order_del) {
		this.order_del = order_del;
	}
	public String getOrder_del_num() {
		return order_del_num;
	}
	public void setOrder_del_num(String order_del_num) {
		this.order_del_num = order_del_num;
	}
	public String getOrder_del_memo() {
		return order_del_memo;
	}
	public void setOrder_del_memo(String order_del_memo) {
		this.order_del_memo = order_del_memo;
	}
	public int getOrder_coupon_use() {
		return order_coupon_use;
	}
	public void setOrder_coupon_use(int order_coupon_use) {
		this.order_coupon_use = order_coupon_use;
	}
	public String getOrder_coupon() {
		return order_coupon;
	}
	public void setOrder_coupon(String order_coupon) {
		this.order_coupon = order_coupon;
	}
	public int getOrder_point_use() {
		return order_point_use;
	}
	public void setOrder_point_use(int order_point_use) {
		this.order_point_use = order_point_use;
	}
	public int getOrder_point_amount() {
		return order_point_amount;
	}
	public void setOrder_point_amount(int order_point_amount) {
		this.order_point_amount = order_point_amount;
	}
	public int getOrder_final_price() {
		return order_final_price;
	}
	public void setOrder_final_price(int order_final_price) {
		this.order_final_price = order_final_price;
	}
	@Override
	public String toString() {
		return "orderVO [order_idx=" + order_idx + ", user_num=" + user_num + ", order_date=" + order_date
				+ ", order_method=" + order_method + ", order_addr=" + order_addr + ", order_state=" + order_state
				+ ", order_total_price=" + order_total_price + ", order_total_point=" + order_total_point
				+ ", order_com_memo=" + order_com_memo + ", order_fee=" + order_fee + ", order_del=" + order_del
				+ ", order_del_num=" + order_del_num + ", order_del_memo=" + order_del_memo + ", order_coupon_use="
				+ order_coupon_use + ", order_coupon=" + order_coupon + ", order_point_use=" + order_point_use
				+ ", order_point_amount=" + order_point_amount + ", order_final_price=" + order_final_price + "]";
	}
	
	
}
