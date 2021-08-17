package com.jps.domain;

public class PopupVO {

	private int popup_num;
	private String popup_img;
	private String popup_title;
	private int popup_check;
	public int getPopup_num() {
		return popup_num;
	}
	public void setPopup_num(int popup_num) {
		this.popup_num = popup_num;
	}
	public String getPopup_img() {
		return popup_img;
	}
	public void setPopup_img(String popup_img) {
		this.popup_img = popup_img;
	}
	public String getPopup_title() {
		return popup_title;
	}
	public void setPopup_title(String popup_title) {
		this.popup_title = popup_title;
	}
	public int getPopup_check() {
		return popup_check;
	}
	public void setPopup_check(int popup_check) {
		this.popup_check = popup_check;
	}
	@Override
	public String toString() {
		return "PopupVO [popup_num=" + popup_num + ", popup_img=" + popup_img + ", popup_title=" + popup_title
				+ ", popup_check=" + popup_check + "]";
	}
}
