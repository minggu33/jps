package com.jps.service;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;

public interface ItemService {

	public void item(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	
	public ItemVO read(Integer item_num) throws Exception;
	
	public void order(Integer item_num) throws  Exception;
}
