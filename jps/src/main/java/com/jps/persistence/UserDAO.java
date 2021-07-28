package com.jps.persistence;

import com.jps.domain.UserVO;

public interface UserDAO {
	
	
	// 회원 로그인 기능
	public UserVO LoginUser(UserVO vo);
	
}
