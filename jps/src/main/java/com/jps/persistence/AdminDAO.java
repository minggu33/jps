package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;

public interface AdminDAO {

	public void insertItem(ItemVO vo, List<Item_detailVO> dtlList);
	
	public List<ItemVO> itemlist();
	
	public List<UserVO> userlist(searchVO vo);
	
	public List<NoticeVO> noticelist();
	
	public int updatePoint(UserVO vo);
	
	public int resetPW(String user_num);
	
	public int updateState(UserVO vo);
	
	public int getUserCnt();
	
	public int getItemCnt();

	public int getNoticeCnt();
}
