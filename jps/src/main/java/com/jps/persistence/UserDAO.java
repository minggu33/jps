package com.jps.persistence;

import java.util.List;

import com.jps.domain.BasketVO;
import com.jps.domain.ItemVO;
import com.jps.domain.Item_likeVO;
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
	
	public int changeEmail(UserVO vo);
	
	public void updateLastLogin(String user_num);
	
	public List<BasketVO> getMyBasketList(String user_num);
	
	public UserVO drop(UserVO vo) throws Exception;
	
	public void event(String user_num) throws Exception;

	public List<ItemVO> getMyItemList(String user_num);

	public void changeUser_state(String user_num);
	
	public void cancel(UserVO vo);
	
	public void change1(String user_num);

	public List<BasketVO> getmbList(String user_num);
	
	public List<ItemVO> like(String user_num);

}
