package com.jps.domain;

public class NoticeVO {

	private int notice_num;
	private String notice_subject;
	private String notice_content;
	private int notice_count;
	private String notice_date;
	private String notice_file;
	private int notice_important;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public int getNotice_important() {
		return notice_important;
	}
	public void setNotice_important(int notice_important) {
		this.notice_important = notice_important;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_subject=" + notice_subject + ", notice_content="
				+ notice_content + ", notice_count=" + notice_count + ", notice_date=" + notice_date + ", notice_file="
				+ notice_file + ", notice_important=" + notice_important + "]";
	}
	
	
	

	
}
