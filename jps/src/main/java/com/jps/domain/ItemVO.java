package com.jps.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("ItemVO")
public class ItemVO {

	
	private int item_num; 
	private String item_category;
	private String item_name;
	private int item_price;
	private String item_img;
	private String item_content;
	private Date item_create_date;
	private int item_read_count;
	private String item_point;
	
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public Date getItem_create_date() {
		return item_create_date;
	}
	public void setItem_create_date(Date item_create_date) {
		this.item_create_date = item_create_date;
	}
	public int getItem_read_count() {
		return item_read_count;
	}
	public void setItem_read_count(int item_read_count) {
		this.item_read_count = item_read_count;
	}
	public String getItem_point() {
		return item_point;
	}
	public void setItem_point(String item_point) {
		this.item_point = item_point;
	}
	@Override
	public String toString() {
		return "ItemVO [item_num=" + item_num + ", item_category=" + item_category + ", item_name=" + item_name
				+ ", item_price=" + item_price + ", item_img=" + item_img + ", item_content=" + item_content
				+ ", item_create_date=" + item_create_date + ", item_read_count=" + item_read_count + ", item_point="
				+ item_point + "]";
	}
	
	
}
