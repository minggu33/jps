package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.UserVO;
import com.jps.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO udao;

	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		System.out.println("S : loginUser(vo)호출 ");

		// DAO 주입
		UserVO loginVO = udao.loginUser(vo);

		return loginVO;
	}

	@Override
	public UserVO infoUser(String user_num) throws Exception {
		System.out.println("S : infoUser(user_id) 호출 ");

		UserVO infoVO = udao.infoUser(user_num);
		System.out.println("S : " + infoVO);

		return infoVO;
	}

	@Override
	public void inserUser(UserVO vo) throws Exception {
		System.out.println("S : inserUser(vo)호출 ");

		udao.insertUser(vo);
	};

	@Override
	public int checkId(String user_id) throws Exception {
		System.out.println("S : checkId(user_id) 호출");

		return udao.checkId(user_id);
	};

	@Override
	public int checkEmail(String user_email) throws Exception {
		System.out.println("S : checkId(user_email) 호출");

		return udao.checkEmail(user_email);
	};

	@Override
	public int checkNickname(String user_nickname) throws Exception {
		System.out.println("S : checkId(user_nickname) 호출");

		return udao.checkNickname(user_nickname);
	};

	@Override
	public int checkPhone(String user_phone) throws Exception {
		System.out.println("S : checkId(user_phone) 호출");

		return udao.checkPhone(user_phone);
	};

}
