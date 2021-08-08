package com.jps.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jps.domain.NoticeVO;
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
	public List<NoticeVO> noticelist() throws Exception {
		
		System.out.println("S : noticelist() 호출");
		
		return ndao.noticelist();
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}
