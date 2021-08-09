package com.jps.persistence;

import com.jps.domain.BasketVO;

public interface BasketDAO {

	public void insert(BasketVO bvo) throws Exception;
	
	public void delete(BasketVO bvo) throws Exception;
}
