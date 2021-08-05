package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.Item_likeVO;
import com.jps.persistence.Item_likeDAO;

@Service
public class Item_likeServiceImpl implements Item_likeService{

	@Inject
	private Item_likeDAO ildao;
	
	
	@Override
	public Item_likeVO read(Integer item_num) throws Exception {
		return ildao.select(item_num);
	}

	
}
