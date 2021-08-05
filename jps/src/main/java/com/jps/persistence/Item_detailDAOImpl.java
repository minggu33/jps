package com.jps.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jps.domain.Item_detailVO;

public class Item_detailDAOImpl implements Item_detailDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
		= "com.jps.mapper.ItemMapper";
	
	@Override
	public void insertOrder(Integer item_num) {
		sqlSession.insert(namespace+".insertItem", item_num);
	}

	
}
