package com.jps.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.NoticeVO;
import com.jps.domain.searchVO;
import com.jps.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO ndao;
	
	@Override
	public void noticeWrite(NoticeVO vo) throws Exception {

		System.out.println("S : noticeWrite(vo) 호출");
		
		ndao.noticeWrite(vo);
	}
	
	@Override
	public List<NoticeVO> noticelist(searchVO vo) throws Exception {
		
		System.out.println("S : noticelist() 호출");
		
		return ndao.noticelist(vo);
	}
	
	@Override
	public NoticeVO noticecontent(int notice_num) throws Exception {
		
		System.out.println("S : noticecontent(notice_num) 호출");
		
		return ndao.noticecontent(notice_num);
		
	}
	
	@Override
	public NoticeVO noticemodifyGET(int notice_num) throws Exception {
		
		System.out.println("S : noticeModifyGET(notice_num) 호출");
		
		return ndao.noticemodifyGET(notice_num);
	}
	
	@Override
	public void noticemodifyPOST(NoticeVO vo) throws Exception {
		
		System.out.println("S : noticeModifyPOST(notice_num) 호출");
		
		ndao.noticemodifyPOST(vo);
	}
	
	@Override
	public void noticedelete(NoticeVO vo) throws Exception {
		
		System.out.println("S : noticedelete(vo) 호출");
		
		ndao.noticedelete(vo);
		
	}
	
	@Override
	public void addreadcount(int notice_num) throws Exception {
		
		System.out.println("S : noticeaddreadcount(notice_num) 호출");
		
		ndao.addreadcount(notice_num);
		
	}
	
	@Override
	public int noticecount() throws Exception {
		
		System.out.println("S : noticecount() 호출");
		
		return ndao.noticecount();
		
	}
	
	
	@Override
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo) throws Exception {

		System.out.println("S : noticeSearchOfSubject() 호출");
		
		return ndao.noticeSearchOfSubject(vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfContent(searchVO vo) throws Exception {
		
		System.out.println("S : noticeSearchOfContent() 호출");
		
		return ndao.noticeSearchOfContent(vo);
	}
	
	@Override
	public List<NoticeVO> noticeSearchOfSC(searchVO vo) throws Exception {

		System.out.println("S : noticeSearchOfSC() 호출");
		
		return ndao.noticeSearchOfSC(vo);
	}
	
	@Override
	public int noticeCountOfSubject(searchVO vo) throws Exception {
		
		System.out.println("S : noticeCountOfSubject() 호출");
		
		return ndao.noticeCountOfSubject(vo);
	}
	
	@Override
	public int noticeCountOfContent(searchVO vo) throws Exception {

		System.out.println("S : noticeCountOfContent() 호출");
		
		return ndao.noticeCountOfContent(vo);
	}
	
	@Override
	public int noticeCountOfSC(searchVO vo) throws Exception {

		System.out.println("S : noticeCountOfSC() 호출");
		
		return ndao.noticeCountOfSC(vo);
	}
	
	@Override
	public Map<String, Object> noticefiledown(Map<String, Object> map) throws Exception {
		
		System.out.println("S : noticefiledown() 호출");
		
		return ndao.noticefiledown(map);
		
	}
	
	
	
}
