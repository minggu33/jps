package com.jps.service;

import javax.inject.Inject;

import com.jps.domain.ItemVO;
import com.jps.persistence.ItemDAO;

public class ItemServiceImpl implements ItemService{

	@Inject
	private ItemDAO idao;
	
	@Override
	public void item(ItemVO vo) throws Exception{
		idao.insertItem(vo);
	}
}
