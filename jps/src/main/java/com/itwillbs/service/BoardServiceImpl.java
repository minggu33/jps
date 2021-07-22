package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	//  디비 - 서비스 - 컨트롤러
	
	// DAO 객체 생성 => 주입
	@Inject
	private BoardDAO dao;
	
	@Override
	public void regist(BoardVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public List<BoardVO> listALL() throws Exception {
		return dao.listALL();
	}
	
	
	@Override
	public BoardVO read(int bno) throws Exception {
		System.out.println("S : 컨트롤러에서 read(int bno) 호출");
		System.out.println("S : DAO 호출해서 정보를 전달 받기");
		
		BoardVO vo = dao.read(bno);
		
		System.out.println("S : " + vo);
		System.out.println("S : 컨트롤러로 정보를 리턴");
		
		return vo;
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		System.out.println("S : 컨트롤러가 modify(Integer bno) 호출");
		System.out.println("S : DAO 메서드 호출");
		
		dao.modify(vo);
		
		System.out.println("S : 정보 수정 처리 완료 >> 컨트롤러 이동");
		
	}

	@Override
	public void remove(Integer bno) throws Exception {
		System.out.println("S : 컨트롤러가 remove(Integer bno) 호출");
		System.out.println("S : DAO 메서드 호출");
		
		//DAO 메서드 호출
		dao.remove(bno);
		
		//컨트롤러로 이동

		//페이지 이동 /board/listAll
		
		
	}
	
	
	
	

}
