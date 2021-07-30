package com.jps.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
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
	
	// 로그인페이지(post)
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
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UserVO vo) throws Exception {
		
		logger.info("C : joinPOST() 페이지 호출");
		
		service.inserUser(vo);
		
		return "redirect:/user/login";
	}
	
	// 유저 정보 확인 
	@RequestMapping(value = "/info",method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model) throws Exception {
		
		logger.info("C : infoGET() 호출 ");
		
		String user_num = (String)session.getAttribute("user_num");
		
		// user_num="1";
		
		UserVO infoVO = service.infoUser(user_num);
		
		model.addAttribute("infoVO", infoVO);
		
		logger.info("페이지 이동 /user/info.jsp");
		
	}
	
	//로그아웃기능(get)
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) throws Exception{
		
		logger.info("C : logoutGET() 호출 > /home.jsp 이동");
		
		
		//세션 정보 초기화
		session.invalidate();
		
		//페이지 이동
		return "redirect:/home";
	}
	
	
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public void checkIdPOST(String user_id, HttpServletResponse resp) throws Exception {
		logger.info("C : checkIdPOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.checkId(user_id));
		out.close();
	}
	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public void checkEmailPOST(String user_email, HttpServletResponse resp) throws Exception {
		logger.info("C : checkEmailPOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.checkEmail(user_email));
		out.close();
	}
	
	@RequestMapping(value = "/checkNickname", method = RequestMethod.POST)
	public void checkNicknamePOST(String user_nickname, HttpServletResponse resp) throws Exception {
		logger.info("C : checkNicknamePOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.checkNickname(user_nickname));
		out.close();
	}
	
	@RequestMapping(value = "/checkPhone", method = RequestMethod.POST)
	public void checkPhonePOST(String user_phone, HttpServletResponse resp) throws Exception {
		logger.info("C : checkPhonePOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.checkPhone(user_phone));
		out.close();
	}
}
