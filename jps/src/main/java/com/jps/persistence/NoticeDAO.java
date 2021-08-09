package com.jps.persistence;

import java.util.List;

import com.jps.domain.NoticeVO;

public interface NoticeDAO {

	public void noticeWrite(NoticeVO vo);
	
	public List<NoticeVO> noticelist();
	
	public NoticeVO noticecontent(int notice_num);
	
	public NoticeVO noticemodifyGET(int notice_num); 
	
	public void noticemodifyPOST(NoticeVO vo);
	
	public void noticedelete(NoticeVO vo);
	
}
