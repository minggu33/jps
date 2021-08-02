package com.jps.persistence;

import java.util.List;

import com.jps.domain.ItemVO;

public interface AdminDAO {

	public void insertItem(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
}
