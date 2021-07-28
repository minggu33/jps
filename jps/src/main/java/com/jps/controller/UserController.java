package com.jps.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jps.domain.UserVO;
import com.jps.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//http://localhost:8088/user/join

	
	// 서비스 객체 주
	@Inject
	private UserService service;
	
	
	
	// http://localhost:8080/user/login
	// 로그인페이지(get)
	@RequestMapping(value="/login", method= RequestMethod.GET)
	public String loginGET() throws Exception{
		logger.info("C : loginGET() 페이지 호출 ");
		logger.info("C : login view 페이지로 이동 ");
		
		
		return "/user/loginForm";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(UserVO vo, HttpSession session) throws Exception{
		
		logger.info("C : loginPOST() 페이지 호출 ");
		
		
		logger.info("C : 서비스 -loginUser() 호출시도 ");
		logger.info(vo.getUser_id() + "@@@@@" + vo.getUser_pw());
		
		UserVO loginVO = service.loginUser(vo);
		
		if(loginVO == null) {
			// 비회원/비밀번호 오류
			// 다시 로그인 페이지로 이동 
			return "redirect:/user/login";
			
		}
		
		session.setAttribute("user_num", loginVO.getUser_num());
		
		int admin = loginVO.getUser_state();
		if(admin==2) {
			session.setAttribute("admin", "jpsadmin");
		}
		
		System.out.println("로그인 완료!~~~~~~~~~₩");
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@login@@@@@@");
		
		return "redirect:/home";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {
		logger.info("C : joinGET() 페이지 호출 ");
		logger.info("C : join view 페이지로 이동 ");
	}
	
	// 유저 정보 확인 
	@RequestMapping(value = "/info",method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model) throws Exception {
		
		logger.info("C : infoGET() 호출 ");
		
		String use = (String)session.getAttribute("user_num");
		
		int user_num = Integer.parseInt(use);
		
		user_num = 1;
		
		UserVO infoVO = service.infoUser(user_num);
		
		model.addAttribute("infoVO", infoVO);
		
		logger.info("페이지 이동 /user/info.jsp");
		
	}
	
	
	
}
