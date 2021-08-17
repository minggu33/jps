package com.jps.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.PopupVO;

@Repository
public class PopupDAOImpl implements PopupDAO {
	
	@Inject
	private SqlSession sqlSession;

	// mapper 주소
	private static final String namespace = "com.jps.mapper.PopupMapper";
	
	@Override
	public void insertPopup_img(PopupVO vo) {
		
		System.out.println("DAO :  insertPopup_img(vo) 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");
		
		sqlSession.insert(namespace + ".insertPopup_img", vo);
		
	}
	
	@Override
	public PopupVO getPopup_img() {
		
		System.out.println("DAO :  getPopup_img() 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");
		
		PopupVO vo = sqlSession.selectOne(namespace+".getPopup_img");
		
		return vo;
	}

}
