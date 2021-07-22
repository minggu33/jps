package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.BoardVO;

public interface BoardDAO {
	//글쓰기(create)
	public void create(BoardVO vo) throws Exception;
	
	//글전체 목록을 가져오는 동작
	public List<BoardVO> listALL() throws Exception;
	
	//글 하나의 정보(read)
	public BoardVO read(Integer bno) throws Exception;
	
	//글정보 수정(modify)
	public void modify(BoardVO vo) throws Exception;
	
	//글정보 삭제(delete)
	public void remove(Integer bno) throws Exception;
	
}
