package com.jps.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	private SqlSession sqlSession;

	// mapper 주소
	private static final String namespace = "com.jps.mapper.NoticeMapper";
	
	@Override
	public void noticeWrite(NoticeVO vo) {
		System.out.println("DAO :  noticeWrite(vo) 호출");
		System.out.println("DAO :  DB연결 sqlSession, mapper 사용 sql구문 실행");
		
		sqlSession.insert(namespace + ".noticeWrite", vo);
		
	}
	
	@Override
	public List<NoticeVO> noticelist() {
		
		return sqlSession.selectList(namespace+".noticelist");
	}
	
	@Override
	public NoticeVO noticecontent(int notice_num) {

		NoticeVO vo = sqlSession.selectOne(namespace+".noticecontent", notice_num);
	
		return vo;
	}
	
	@Override
	public NoticeVO noticemodifyGET(int notice_num) {
		
		NoticeVO vo = sqlSession.selectOne(namespace+".noticemodify", notice_num);
		
		return vo;
	}
	
	@Override
	public void noticemodifyPOST(NoticeVO vo) {
		
		sqlSession.update(namespace+".noticeupdate", vo);
		
		System.out.println("DAO : 공지사항 수정완료");
	}
	
	@Override
	public void noticedelete(NoticeVO vo) {
		
		sqlSession.delete(namespace+".noticedelete", vo);
		
		System.out.println("DAO : 공지사항 삭제완료");
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
