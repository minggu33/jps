package com.jps.service;

import com.jps.domain.UserVO;

public interface UserService {

	public UserVO loginUser(UserVO vo) throws Exception;

	public UserVO infoUser(int user_num) throws Exception;

	public void inserUser(UserVO vo) throws Exception;

	public int checkId(String user_id) throws Exception;

	public int checkEmail(String user_email) throws Exception;

	public int checkNickname(String user_nickname) throws Exception;

	public int checkPhone(String user_phone) throws Exception;

}
