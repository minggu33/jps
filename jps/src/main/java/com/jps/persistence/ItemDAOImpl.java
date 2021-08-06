package com.jps.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
		= "com.jps.mapper.ItemMapper";
	
	@Override
	public void insertItem(ItemVO vo) {
		sqlSession.insert(namespace+".insertItem", vo);
	}

	@Override
	public List<ItemVO> itemlist() throws Exception {
		
		return sqlSession.selectList(namespace+".itemlist");
	}

	@Override
	public ItemVO itemdetail(Integer item_num) throws Exception {
		ItemVO vo = sqlSession.selectOne(namespace+".read", item_num);
		return vo;
	}

	
	
	
	
}
