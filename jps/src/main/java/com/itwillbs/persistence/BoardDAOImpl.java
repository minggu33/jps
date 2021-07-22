package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardVO;


//Repository 태그로 DAO개체를 누가 찾아오면 impl가 실행되도록 처리한다.
@Repository
public class BoardDAOImpl implements BoardDAO{

	//디비연결/ 자원해제 객체 - SqlSession
	@Inject
	private SqlSession sqlsession;
	
	//mapper 주소 - 임의로 지정 <mapper namespace="com.itwillbs.mapper.BoardMapper"> 여기의 값과 같으면 된다.
	private final static String namespace
	= "com.itwillbs.mapper.BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlsession.insert(namespace+".create", vo);
	}

	@Override
	public List<BoardVO> listALL() throws Exception {
		
		return sqlsession.selectList(namespace+".listALL");
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {

		BoardVO vo =  sqlsession.selectOne(namespace+".read", bno);
		
		System.out.println("DAO : " + vo);
		System.out.println("DAO : 서비스로 sql 결과를 리턴");
		
		return vo;
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		System.out.println("DAO : 서비스가 modify() 호출" );
		System.out.println("DAO : mapper sql 호출");
		
		sqlsession.update(namespace+".modify",vo);
		
		System.out.println("DAO : 정보 수정 완료 > 서비스로 이동");
	}

	@Override
	public void remove(Integer bno) throws Exception {
		System.out.println("DAO : 서비스가 remove(bno) 호출");
		System.out.println("DAO : mapper sql 호출");
		
		sqlsession.delete(namespace+".remove",bno);
		//서비스로 이동
		
		
		
	}
	
	
	
	
	
}
