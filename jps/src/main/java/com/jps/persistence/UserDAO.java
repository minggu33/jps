package com.jps.persistence;

import com.jps.domain.UserVO;

public interface UserDAO {

	// 회원 로그인 기능
	public UserVO loginUser(UserVO vo);

	// 특정 회원 정보
	public UserVO infoUser(String user_num);

	public void insertUser(UserVO vo);

	public int checkId(String user_id);

	public int checkEmail(String user_email);

	public int checkNickname(String user_nickname);

	public int checkPhone(String user_phone);

	public int changePw(String user_num,String user_pw);
	
	public int changeNick(String user_num, String user_nickname);
}
