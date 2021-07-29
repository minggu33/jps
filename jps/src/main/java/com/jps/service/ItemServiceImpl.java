package com.jps.service;

import java.util.List;

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

	@Override
	public List<ItemVO> itemList() throws Exception {
		return idao.itemList();
	}

	
	
	
}
