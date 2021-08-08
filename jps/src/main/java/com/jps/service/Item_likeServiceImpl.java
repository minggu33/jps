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
	public int read(Item_likeVO ivo) throws Exception {
		return ildao.select(ivo);
	}


	@Override
	public void like(Item_likeVO ilvo) throws Exception {
		ildao.like(ilvo);
	}


	@Override
	public void unlike(Item_likeVO ilvo) throws Exception {
		ildao.unlike(ilvo);
	}

	
	
}
