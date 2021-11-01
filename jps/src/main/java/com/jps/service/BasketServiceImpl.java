package com.jps.service;

import java.util.List;

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

	@Override
	public int check(BasketVO bvo) throws Exception {
		return bdao.check(bvo);
	}

	@Override
	public void update(BasketVO bvo) throws Exception {
		bdao.update(bvo);
	}

	@Override
	public List<BasketVO> getInfo(int basket_idx, String user_num) throws Exception {
		return bdao.getInfo(basket_idx,user_num);
	}

	
	
}
