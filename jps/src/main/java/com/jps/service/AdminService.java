package com.jps.service;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;

public interface AdminService {

	public void item(ItemVO vo, List<Item_detailVO> dtlList) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	
	public List<UserVO> userlist(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticelist() throws Exception;
	
	public int updatePoint(UserVO vo) throws Exception;
	
	public int resetPW(String user_num) throws Exception;
	
	public int updateState(UserVO vo) throws Exception;
	
	public int getUserCnt() throws Exception;
	
	public int getItemCnt() throws Exception;
	
	public int getNoticeCnt() throws Exception;
	
	public void insertNotice(NoticeVO vo) throws Exception;

}
