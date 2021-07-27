package com.jps.persistence;

import com.jps.domain.ItemVO;

public interface ItemDAO {

	public void insertItem(ItemVO vo) throws Exception;
}
