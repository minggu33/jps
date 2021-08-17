package com.jps.persistence;

import java.util.List;
import java.util.Map;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.PopupVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;

public interface AdminDAO {

	public void insertItem(ItemVO vo, List<Item_detailVO> dtlList);
	
	public List<ItemVO> itemlist(searchVO vo);
	public List<ItemVO> itemSearchOfSubject(searchVO vo);
	public List<ItemVO> itemSearchOfContent(searchVO vo);
	public List<ItemVO> itemSearchOfSC(searchVO vo);
	
	public List<UserVO> userlist(searchVO vo);
	
	public List<NoticeVO> noticelist(searchVO vo);
	
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo);

	public List<NoticeVO> noticeSearchOfContent(searchVO vo);
	
	public List<NoticeVO> noticeSearchOfSC(searchVO vo);
	
	public int noticeCountOfSubject(searchVO vo);
	
	public int noticeCountOfContent(searchVO vo);
	
	public int noticeCountOfSC(searchVO vo);
	
	public int updatePoint(UserVO vo);
	
	public int resetPW(String user_num);
	
	public int updateState(UserVO vo);
	
	public int getUserCnt();
	
	public int itemCount();
	public int itemCountOfSubject(searchVO vo);
	public int itemCountOfContent(searchVO vo);
	public int itemCountOfSC(searchVO vo);

	public int getNoticeCnt();
	
	public void insertNotice(NoticeVO vo);
	
	public List<Map<String, Object>> readItemInfo(String item_num);
	
	public void updateItem(ItemVO vo, List<Item_detailVO> dtlList);
	
	public int deleteItem(int item_num);
	
	public NoticeVO readNoticeInfo(int notice_num);
	
	public void updateNotice(NoticeVO vo);
	
	public int deleteNotice(int notice_num);
	
	public List<PopupVO> popupList();
	
	public void insertPopup(PopupVO vo);
	
	public int changePopup(int popup_num);
	
	public int checkPopupCnt();
	
}
