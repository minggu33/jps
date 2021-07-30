package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;

public interface ItemDAO {

	public void insertItem(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	
	public ItemVO itemdetail(Integer item_num) throws Exception;
	
}
