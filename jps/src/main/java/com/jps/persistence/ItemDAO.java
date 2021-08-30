package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.OrderVO;
import com.jps.domain.searchVO;

public interface ItemDAO {

	public void insertItem(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist(searchVO vo) throws Exception;
	
	public ItemVO itemdetail(Integer item_num) throws Exception;
	
	public List<Item_detailVO> getItemDetail(Integer item_num) throws Exception;
	
	public Item_detailVO getItemSC(Integer idx) throws Exception;

	public int insertRealorder(OrderVO vo) throws Exception;
	
	public String ordernum() throws Exception;
	
}
