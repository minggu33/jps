package com.jps.service;

import com.jps.domain.BasketVO;

public interface BasketService {

	public void basket(BasketVO bvo) throws Exception;
	
	public void basketdelete(BasketVO bvo) throws Exception;
}
