package com.jps.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jps.domain.NoticeVO;
import com.jps.domain.searchVO;

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
	public List<NoticeVO> noticelist(searchVO vo) {
		
		return sqlSession.selectList(namespace+".noticelist", vo);
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
	
	@Override
	public void addreadcount(int notice_num) {
		
		sqlSession.update(namespace+".addreadcount", notice_num);
		
		System.out.println("DAO : 조회수 증가 + 1");
		
	}
	
	@Override
	public int noticecount() {
		
		int count = sqlSession.selectOne(namespace+".noticecount");
		
		System.out.println("DAO : 공지사항 글 개수 카운트");
		
		return count;
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo) {

		System.out.println("DAO : 공지사항 제목검색 목록 출력");
		return sqlSession.selectList(namespace+".noticeSearchOfSubject", vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfContent(searchVO vo) {

		System.out.println("DAO : 공지사항 내용검색 목록 출력");
		return sqlSession.selectList(namespace+".noticeSearchOfContent", vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfSC(searchVO vo) {

		System.out.println("DAO : 공지사항 제목+내용 목록 출력");
		return sqlSession.selectList(namespace+".noticeSearchOfSC", vo);
	}
	
	@Override
	public int noticeCountOfSubject(searchVO vo) {
		System.out.println("DAO : 공지사항 제목검색 카운트");
		return sqlSession.selectOne(namespace+".noticeCountOfSubject", vo);
	}
	
	@Override
	public int noticeCountOfContent(searchVO vo) {

		System.out.println("DAO : 공지사항 내용검색 카운트");
		return sqlSession.selectOne(namespace+".noticeCountOfContent", vo);
	}
	
	@Override
	public int noticeCountOfSC(searchVO vo) {

		System.out.println("DAO : 공지사항 제목+내용검색 카운트");
		return sqlSession.selectOne(namespace+".noticeCountOfSC", vo);
	}
	
	
	
	
	
	
	
	
}
