package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.UserVO;
import com.jps.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO udao;

	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		System.out.println("S : loginUser(vo)호출 ");

		//DAO 주입
		UserVO loginVO = udao.LoginUser(vo);
		
		return loginVO;
	}
	
	
}
