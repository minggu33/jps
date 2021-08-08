package com.jps.service;

import com.jps.domain.Item_likeVO;

public interface Item_likeService {

	public int read(Item_likeVO ivo) throws Exception;
	
	public void like(Item_likeVO ilvo) throws Exception;
	
	public void unlike(Item_likeVO ilvo) throws Exception;
	
}
