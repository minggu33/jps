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
	public int select(Item_likeVO ivo) throws Exception {
		
		return sqlSession.selectOne(namespace+".read", ivo);
		
	}

	@Override
	public void like(Item_likeVO ilvo) throws Exception {
		sqlSession.insert(namespace+".like", ilvo);
	}

	@Override
	public void unlike(Item_likeVO ilvo) throws Exception {
		sqlSession.delete(namespace+".unlike", ilvo);
	}

	
	
}
