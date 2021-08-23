package com.jps.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jps.domain.NoticeVO;
import com.jps.domain.searchVO;
import com.jps.service.NoticeService;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {
	
	// http://localhost:8090/notice/noticelist
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	private static final String UPLOAD_PATH = "/resources/jps/upload";
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value = "/noticelist", method = {RequestMethod.GET,RequestMethod.POST})
	public String noticeList(Model model, searchVO vo, HttpServletRequest req) throws Exception {
		
		logger.info("C: noticeList() 호출");
		
		List<NoticeVO> noticelist = null;
		
		if(vo.getType() == 1) {

			vo.setPageInfo(vo, service.noticeCountOfSubject(vo));
			model.addAttribute("noticelist", service.noticeSearchOfSubject(vo));
			
			model.addAttribute("type", "search");
		} else if(vo.getType() == 2) {
			
			vo.setPageInfo(vo, service.noticeCountOfContent(vo));
			model.addAttribute("noticelist", service.noticeSearchOfContent(vo));
		
			model.addAttribute("type", "search");
		} else if(vo.getType() == 3) {
			
			vo.setPageInfo(vo, service.noticeCountOfSC(vo));
			model.addAttribute("noticelist", service.noticeSearchOfSC(vo));
		
			model.addAttribute("type", "search");
		} else {
			
			vo.setPageInfo(vo,service.noticecount());
			noticelist = service.noticelist(vo);
			model.addAttribute("noticelist", noticelist);
			System.out.println("검색안함...");
		}
		

		model.addAttribute("searchVO", vo);
		
		System.out.println("C : "+vo);
		
		return "/notice/noticelist";
	}
	
	
	// @RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public void noticeWriteGET() {
		
		logger.info("C: noticeWriteGET() 호출");
		logger.info("C: noticeWriteGET() 페이지 이동");
		
	}
	
	// @RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String noticeWritePOST(NoticeVO vo) throws Exception {
		
		logger.info("C: noticeWritePOST() 호출");
		
		service.noticeWrite(vo);
		
		return "redirect:/notice/noticelist";
	}
	
	@RequestMapping(value = "/noticecontent", method = RequestMethod.GET)
	public String noticeContent(Model model, int notice_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		logger.info("C: noticeContent() 호출");
		
		int count = 0;
		
		Cookie[] cookies = request.getCookies();
		
		// IP 조회 : request.getRemoteAddr()
		if(cookies != null) {
			for(int i=0;i<cookies.length;i++) {
				//if(cookies[i].getName().equals(pDTO.getProd_num()+"")) {
				if(cookies[i].getName().equals("notice_count"+notice_num) && cookies[i].getValue().equals(request.getRemoteAddr())) {
					count = 0;
					break;
				}else {
					Cookie cookie = new Cookie("notice_count"+notice_num,
												request.getRemoteAddr());
												//String.valueOf(pDTO.getProd_num()+""));
					cookie.setMaxAge(60*60*24);
					//cookie.setPath("/");
					response.addCookie(cookie);
					count += 1;
				}
			}
		}
	
		if(count > 0) {
			service.addreadcount(notice_num);
		}
		
		NoticeVO vo = service.noticecontent(notice_num);
		model.addAttribute("vo", vo);
		
		return "/notice/noticecontent";
	}
	
	// @RequestMapping(value = "/noticemodify", method = RequestMethod.GET)
	public String noticeModifyGET(Model model, int notice_num) throws Exception {
		
		logger.info("C: noticeModifyGET() 호출");
		NoticeVO vo = service.noticemodifyGET(notice_num);
		model.addAttribute("vo", vo);
		
		return "/notice/noticemodify";
		
	}
	
	// @RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticeModifyPOST(NoticeVO vo) throws Exception {
		
		logger.info("C: noticeModifyPOST() 호출");
		service.noticemodifyPOST(vo);
		return "redirect:/notice/noticecontent?notice_num="+vo.getNotice_num();
	}
	
	// @RequestMapping(value = "/noticedelete", method = RequestMethod.GET)
	public String noticeDelete(NoticeVO vo) throws Exception {
		
		logger.info("C: noticeDelecte(vo) 호출");
		service.noticedelete(vo);
		return "redirect:/notice/noticelist";
	}
	
	@RequestMapping(value = "/noticefiledown")
	public void noticefiledown(@RequestParam Map<String, Object> map, HttpServletResponse response, HttpServletRequest req) throws Exception {
		
		logger.info("C: noticefiledown(map) 호출");
		 Map<String, Object> resultMap = service.noticefiledown(map);

	        String notice_file = (String) resultMap.get("notice_file");
	        
	        // 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.

	        byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(req.getRealPath("/")+UPLOAD_PATH+"/insertNotice/"+notice_file));

	        response.setContentType("application/octet-stream");
	        response.setContentLength(fileByte.length);
	        response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(notice_file, "UTF-8")+"\";");
	        response.getOutputStream().write(fileByte);
	        response.getOutputStream().flush(); //flush() 메소드는 데이터를 비워주는 역할
	        response.getOutputStream().close(); //close() 메소드는 닫아주는 역할

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
