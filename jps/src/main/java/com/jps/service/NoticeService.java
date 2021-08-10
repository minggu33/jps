package com.jps.service;

import java.util.List;

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
	
}
