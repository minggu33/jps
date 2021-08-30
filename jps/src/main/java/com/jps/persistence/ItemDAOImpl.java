package com.jps.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.OrderVO;
import com.jps.domain.searchVO;

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
	public List<ItemVO> itemlist(searchVO vo) throws Exception {
		
		return sqlSession.selectList(namespace+".itemlist", vo);
	}

	@Override
	public ItemVO itemdetail(Integer item_num) throws Exception {
		ItemVO vo = sqlSession.selectOne(namespace+".read", item_num);
		return vo;
	}

	@Override
	public List<Item_detailVO> getItemDetail(Integer item_num) throws Exception {
		return sqlSession.selectList(namespace+".getItemDetail", item_num);
	}

	@Override
	public Item_detailVO getItemSC(Integer idx) throws Exception {
		int item_detail_idx = idx;
		return sqlSession.selectOne(namespace+".getItemSC", item_detail_idx);
	}

	@Override
	public int insertRealorder(OrderVO vo) throws Exception {
		return sqlSession.insert(namespace+".order", vo);
	}

	@Override
	public String ordernum() throws Exception {
		return sqlSession.selectOne(namespace+".ordernum" );
	}

	

	
}
