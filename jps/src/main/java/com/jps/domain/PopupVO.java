package com.jps.domain;

public class PopupVO {

	private int popup_num;
	private String popup_img;
	
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
	
	@Override
	public String toString() {
		return "PopupVO [popup_num=" + popup_num + ", popup_img=" + popup_img + "]";
	}
	
	
	
}
