package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.ItemVO;
import com.jps.persistence.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService{

	@Inject
	private ItemDAO idao;
	
	@Override
	public void item(ItemVO vo) throws Exception{
		idao.insertItem(vo);
	}
}
