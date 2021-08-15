package com.jps.service;

import java.util.List;
import java.util.Map;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;

public interface AdminService {

	public void item(ItemVO vo, List<Item_detailVO> dtlList) throws Exception;
	
	public List<ItemVO> itemlist(searchVO vo) throws Exception;
	public List<ItemVO> itemSearchOfSubject(searchVO vo) throws Exception;
	public List<ItemVO> itemSearchOfContent(searchVO vo) throws Exception;
	public List<ItemVO> itemSearchOfSC(searchVO vo) throws Exception;
	
	public List<UserVO> userlist(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticelist(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticeSearchOfContent(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticeSearchOfSC(searchVO vo) throws Exception;
	
	public int noticeCountOfSubject(searchVO vo) throws Exception;
	
	public int noticeCountOfContent(searchVO vo) throws Exception;
	
	public int noticeCountOfSC(searchVO vo) throws Exception;
	
	public int updatePoint(UserVO vo) throws Exception;
	
	public int resetPW(String user_num) throws Exception;
	
	public int updateState(UserVO vo) throws Exception;
	
	public int getUserCnt() throws Exception;
	
	public int itemCount() throws Exception;
	public int itemCountOfSubject(searchVO vo) throws Exception;
	public int itemCountOfContent(searchVO vo) throws Exception;
	public int itemCountOfSC(searchVO vo) throws Exception;
	
	public int getNoticeCnt() throws Exception;
	
	public void insertNotice(NoticeVO vo) throws Exception;
	
	public List<Map<String, Object>> readItemInfo(String item_num) throws Exception;
	
	public void updateItem(ItemVO vo, List<Item_detailVO> dtlList) throws Exception;

}
