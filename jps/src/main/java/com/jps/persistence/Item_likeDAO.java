package com.jps.persistence;

import com.jps.domain.Item_likeVO;

public interface Item_likeDAO {
	
	public Item_likeVO select(Item_likeVO ivo) throws Exception;

	public void like(String user_num) throws Exception;
}
