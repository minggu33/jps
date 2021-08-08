package com.jps.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jps.domain.NoticeVO;
import com.jps.service.NoticeService;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {
	
	// http://localhost:8090/notice/noticelist
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value = "/noticelist", method = RequestMethod.GET)
	public String noticeListGET(Model model, @ModelAttribute("msg") String result, @ModelAttribute("result") String result2) throws Exception {
		
		logger.info("C: noticeListGET() 호출");
		model.addAttribute("noticelist", service.noticelist());
		
		return "/notice/noticelist";
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public void noticeWriteGET() {
		
		logger.info("C: noticeWriteGET() 호출");
		logger.info("C: noticeWriteGET() 페이지 이동");
		
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String noticeWritePOST(NoticeVO vo) throws Exception {
		
		logger.info("C: noticeWritePOST() 호출");
		
		service.noticeWrite(vo);
		
		return "redirect:/notice/noticelist";
	}
	
	@RequestMapping(value = "/noticecontent", method = RequestMethod.GET)
	public String noticeContent(Model model, int notice_num) throws Exception{
		
		logger.info("C: noticeContent() 호출");
		
		NoticeVO vo = service.noticecontent(notice_num);
		model.addAttribute("vo", vo);
		
		return "/notice/noticecontent";
	}
	
	@RequestMapping(value = "/noticemodify", method = RequestMethod.GET)
	public String noticeModifyGET(Model model, int notice_num) throws Exception {
		
		logger.info("C: noticeModifyGET() 호출");
		NoticeVO vo = service.noticemodifyGET(notice_num);
		model.addAttribute("vo", vo);
		
		return "/notice/noticemodify";
		
	}
	
	@RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticeModifyPOST(NoticeVO vo) throws Exception {
		
		logger.info("C: noticeModifyPOST() 호출");
		service.noticemodifyPOST(vo);
		return "redirect:/notice/noticecontent?notice_num="+vo.getNotice_num();
	}
	
	@RequestMapping(value = "/noticedelete", method = RequestMethod.GET)
	public String noticeDelete(NoticeVO vo) throws Exception {
		
		logger.info("C: noticeDelecte(vo) 호출");
		service.noticedelete(vo);
		return "redirect:/notice/noticelist";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
