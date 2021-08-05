package com.jps.service;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;

public interface AdminService {

	public void item(ItemVO vo, List<Item_detailVO> dtlList) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	

}
