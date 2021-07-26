package com.jps.domain;

public class jpsVO {
	
	private String User_num;
	private String Id;
	private String Pw;
	private String Email;
	private String Name;
	private String Nickname;
	private String Birth;
	private int Gender;
	private String Addr;
	private String Phone;
	private int Point;
	private String Bank;
	private String Account;
	private String Join_date;
	private String late_login;
	private int state;
	public String getUser_num() {
		return User_num;
	}
	public void setUser_num(String user_num) {
		User_num = user_num;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPw() {
		return Pw;
	}
	public void setPw(String pw) {
		Pw = pw;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getNickname() {
		return Nickname;
	}
	public void setNickname(String nickname) {
		Nickname = nickname;
	}
	public String getBirth() {
		return Birth;
	}
	public void setBirth(String birth) {
		Birth = birth;
	}
	public int getGender() {
		return Gender;
	}
	public void setGender(int gender) {
		Gender = gender;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public int getPoint() {
		return Point;
	}
	public void setPoint(int point) {
		Point = point;
	}
	public String getBank() {
		return Bank;
	}
	public void setBank(String bank) {
		Bank = bank;
	}
	public String getAccount() {
		return Account;
	}
	public void setAccount(String account) {
		Account = account;
	}
	public String getJoin_date() {
		return Join_date;
	}
	public void setJoin_date(String join_date) {
		Join_date = join_date;
	}
	public String getLate_login() {
		return late_login;
	}
	public void setLate_login(String late_login) {
		this.late_login = late_login;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "BoardVO [User_num=" + User_num + ", Id=" + Id + ", Pw=" + Pw + ", Email=" + Email + ", Name=" + Name
				+ ", Nickname=" + Nickname + ", Birth=" + Birth + ", Gender=" + Gender + ", Addr=" + Addr + ", Phone="
				+ Phone + ", Point=" + Point + ", Bank=" + Bank + ", Account=" + Account + ", Join_date=" + Join_date
				+ ", late_login=" + late_login + ", state=" + state + "]";
	}
	
	
}
