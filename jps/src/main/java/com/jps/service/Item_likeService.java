package com.jps.service;

import com.jps.domain.Item_likeVO;

public interface Item_likeService {

	public Item_likeVO read(Item_likeVO ivo) throws Exception;
	
	public void like(String user_num) throws Exception;
	
}
