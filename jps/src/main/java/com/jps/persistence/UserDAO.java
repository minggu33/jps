package com.jps.persistence;

import com.jps.domain.UserVO;

public interface UserDAO {
	
	
	// 회원 로그인 기능
	public UserVO loginUser(UserVO vo);
	
	// 특정 회원 정보 
	public UserVO getUser(int user_num);
	
}
