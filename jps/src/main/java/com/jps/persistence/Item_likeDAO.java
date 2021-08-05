package com.jps.persistence;

import com.jps.domain.Item_likeVO;

public interface Item_likeDAO {
	
	public Item_likeVO select(Integer user_num) throws Exception;

}
