package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.UserVO;

public interface AdminDAO {

	public void insertItem(ItemVO vo, List<Item_detailVO> dtlList);
	
	public List<ItemVO> itemlist();
	
	public List<UserVO> userlist();
	
	public int updatePoint(UserVO vo);
	
	public int resetPW(String user_num);
}
