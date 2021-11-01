package com.jps.persistence;

import java.util.List;

import com.jps.domain.BasketVO;

public interface BasketDAO {

	public void insert(BasketVO bvo) throws Exception;
	
	public void delete(BasketVO bvo) throws Exception;
	
	public int check(BasketVO bvo) throws Exception;
	
	public void update(BasketVO bvo) throws Exception;
	
	public List<BasketVO> getInfo(int basket_idx, String user_num) throws Exception;
}
