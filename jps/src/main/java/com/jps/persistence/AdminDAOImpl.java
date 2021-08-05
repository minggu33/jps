package com.jps.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
		= "com.jps.mapper.AdminMapper";
	
	@Override
	public void insertItem(ItemVO vo, List<Item_detailVO> dtlList) {
		sqlSession.insert(namespace+".insertItem", vo);
		
		int item_num = sqlSession.selectOne(namespace+".getItemNum");
		
		for(int i=0; i<dtlList.size(); i++) {
			Item_detailVO dtlvo = dtlList.get(i);
			dtlvo.setItem_num(item_num);
			sqlSession.insert(namespace+".insertItemDetail", dtlvo);
		}
	}

	@Override
	public List<ItemVO> itemlist() {
		
		return sqlSession.selectList(namespace+".itemlist");
	}

	@Override
	public List<UserVO> userlist() {
		return sqlSession.selectList(namespace+".userlist");
	}
	
	
	
}
