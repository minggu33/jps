package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;

public interface ItemDAO {

	public void insertItem(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	
	public ItemVO itemdetail(Integer item_num) throws Exception;
	
	public List<Item_detailVO> getItemDetail(Integer item_num) throws Exception;
	
	public Item_detailVO getItemSC(Integer idx) throws Exception;

	
}
