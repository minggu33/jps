package com.jps.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
		= "com.jps.mapper.BasketMapper";
	
	@Override
	public void insert(BasketVO bvo) throws Exception {
		sqlSession.insert(namespace+".insert", bvo);
		
	}

	@Override
	public void delete(BasketVO bvo) throws Exception {
		sqlSession.delete(namespace+".delete", bvo);
	}

	
	
}
