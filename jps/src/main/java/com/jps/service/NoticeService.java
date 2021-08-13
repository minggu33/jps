package com.jps.service;

import java.util.List;
import java.util.Map;

import com.jps.domain.NoticeVO;
import com.jps.domain.searchVO;

public interface NoticeService {

	public void noticeWrite(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> noticelist(searchVO vo) throws Exception;
	
	public NoticeVO noticecontent(int notice_num) throws Exception;
	
	public NoticeVO noticemodifyGET(int notice_num) throws Exception;
	
	public void noticemodifyPOST(NoticeVO vo) throws Exception;
	
	public void noticedelete(NoticeVO vo) throws Exception;
	
	public void addreadcount(int notice_num) throws Exception;
	
	public int noticecount() throws Exception;
	
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticeSearchOfContent(searchVO vo) throws Exception;
	
	public List<NoticeVO> noticeSearchOfSC(searchVO vo) throws Exception;
	
	public int noticeCountOfSubject(searchVO vo) throws Exception;
	
	public int noticeCountOfContent(searchVO vo) throws Exception;
	
	public int noticeCountOfSC(searchVO vo) throws Exception;
	
	public Map<String, Object> noticefiledown(Map<String, Object> map) throws Exception;
	
}
