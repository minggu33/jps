package com.jps.service;

import java.util.List;

import com.jps.domain.ItemVO;

public interface AdminService {

	public void item(ItemVO vo) throws Exception;
	
	public List<ItemVO> itemlist() throws Exception;
	

}
