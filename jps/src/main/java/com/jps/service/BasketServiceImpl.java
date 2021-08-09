package com.jps.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.BasketVO;
import com.jps.persistence.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService{

	@Inject
	private BasketDAO bdao;

	@Override
	public void basket(BasketVO bvo) throws Exception {
		bdao.insert(bvo);
		
	}

	@Override
	public void basketdelete(BasketVO bvo) throws Exception {
		bdao.delete(bvo);
	}

	
	
}
