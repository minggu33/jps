package com.jps.persistence;

import java.util.List;

import com.jps.domain.NoticeVO;
import com.jps.domain.searchVO;

public interface NoticeDAO {

	public void noticeWrite(NoticeVO vo);
	
	public List<NoticeVO> noticelist(searchVO vo);
	
	public NoticeVO noticecontent(int notice_num);
	
	public NoticeVO noticemodifyGET(int notice_num); 
	
	public void noticemodifyPOST(NoticeVO vo);
	
	public void noticedelete(NoticeVO vo);
	
	public void addreadcount(int notice_num);
	
	public int noticecount();
	
	public List<NoticeVO> noticeSearchOfSubject(searchVO vo);

	public List<NoticeVO> noticeSearchOfContent(searchVO vo);
	
	public List<NoticeVO> noticeSearchOfSC(searchVO vo);
	
	public int noticeCountOfSubject(searchVO vo);
	
	public int noticeCountOfContent(searchVO vo);
	
	public int noticeCountOfSC(searchVO vo);
	
}
