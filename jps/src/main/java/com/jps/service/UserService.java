package com.jps.service;

import java.util.List;

import com.jps.domain.BasketVO;
import com.jps.domain.ItemVO;
import com.jps.domain.UserVO;

public interface UserService {

	public UserVO loginUser(UserVO vo) throws Exception;

	public UserVO infoUser(String user_num) throws Exception;

	public void inserUser(UserVO vo) throws Exception;

	public int checkId(String user_id) throws Exception;

	public int checkEmail(String user_email) throws Exception;

	public int checkNickname(String user_nickname) throws Exception;

	public int checkPhone(String user_phone) throws Exception;

	public int changePw(String user_num,String user_pw) throws Exception;
	
	public int changeNick(String user_num,String user_nickname) throws Exception;
	
	public int changeEmail(UserVO vo) throws Exception;
	
	public void updateLastLogin(String user_num) throws Exception;
	
	public List<BasketVO> getMyBasketList(String user_num) throws Exception;

	public UserVO drop(UserVO vo) throws Exception;
	
	public void event(String user_num) throws Exception;

	public List<ItemVO> getMyItemList(String user_num) throws Exception;
	
	public List<ItemVO> getmbList(String user_num) throws Exception;
	
	public void change(String user_num) throws Exception;
	
	public void cancel(UserVO vo) throws Exception;
	
	public void change1(String user_num) throws Exception;

}
