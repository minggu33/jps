package com.jps.service;

import com.jps.domain.UserVO;

public interface UserService {

	
	public UserVO loginUser(UserVO vo) throws Exception;
	
	public UserVO infoUser(int user_num) throws Exception;
	
}
