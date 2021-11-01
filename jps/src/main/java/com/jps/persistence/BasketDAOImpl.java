package com.jps.persistence;

import java.util.List;

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

	@Override
	public int check(BasketVO bvo) throws Exception {

		return sqlSession.selectOne(namespace+".check", bvo);
	}

	@Override
	public void update(BasketVO bvo) throws Exception {
			sqlSession.update(namespace+".update", bvo);
	}

	@Override
	public List<BasketVO> getInfo(int basket_idx, String user_num) throws Exception {
		BasketVO vo = new BasketVO();
		vo.setBasket_idx(basket_idx);
		vo.setUser_num(user_num);
		
		return sqlSession.selectList(namespace+".getInfo", vo);
	}

	
	
}
