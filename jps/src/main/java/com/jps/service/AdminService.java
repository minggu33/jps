package com.jps.service;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.UserVO;

public interface AdminService {

	public void item(ItemVO vo, List<Item_detailVO> dtlList) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	
	public List<UserVO> userlist() throws Exception;

}
