package com.jps.domain;

public class Item_likeVO {
	
	private int idx;
	private int item_num;
	private String user_num;
	private int likecheck;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	@Override
	public String toString() {
		return "Item_likeVO [idx=" + idx + ", item_num=" + item_num + ", user_num=" + user_num + ", likecheck="
				+ likecheck + "]";
	}
	

	
}
