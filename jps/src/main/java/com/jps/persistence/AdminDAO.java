package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;

public interface AdminDAO {

	public void insertItem(ItemVO vo, List<Item_detailVO> dtlList) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
}
