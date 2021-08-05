package com.jps.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.Item_likeVO;

@Repository
public class Item_likeDAOImpl implements Item_likeDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
		= "com.jps.mapper.Item_likeMapper";
	
	@Override
	public Item_likeVO select(Integer user_num) throws Exception {
		
		return sqlSession.selectOne(namespace+".read", user_num);
		
	}

	
}
