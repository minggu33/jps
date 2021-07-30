package com.jps.service;

import java.util.List;

import com.jps.domain.ItemVO;

public interface ItemService {

	public void item(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	
	public ItemVO read(Integer item_num) throws Exception; 
}
