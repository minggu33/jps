package com.jps.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jps.domain.Item_likeVO;
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
	
	// 
	 @Autowired
	 private JavaMailSender mailSender;
	 
	
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
	public String loginPost(UserVO vo, HttpSession session,HttpServletResponse resp) throws Exception{
		
		logger.info("C : loginPOST() 페이지 호출 ");
		
		
		logger.info("C : 서비스 -loginUser() 호출시도 ");
		logger.info(vo.getUser_id() + "@@@@@" + vo.getUser_pw());
		
		UserVO loginVO = service.loginUser(vo);
		
		
		if(loginVO == null) {
			//비회원/비밀번호 오류
			//다시 로그인 페이지로 이동
			resp.setContentType("text/html; charset=euc-kr");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('아이디/비밀번호가 일치하지않습니다.'); </script>");
			out.flush();
			
			return "/user/loginForm";
		}
		
		
		logger.info("#$###############");
		session.setAttribute("user_num", loginVO.getUser_num());
		
		String user_num = loginVO.getUser_num();
		
		UserVO infoVO = service.infoUser(user_num);
		
		session.setAttribute("userVO", infoVO);
		System.out.println("userinfo@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+infoVO);
		
		// 마지막 접속일 업데이트 
		service.updateLastLogin(user_num);
		
		
		
		
		// 관리자 세션 제어 
		int admin = loginVO.getUser_state();
		if(admin==2) {
			session.setAttribute("admin", "jpsadmin");
			return "redirect:/admin";
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
	
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public void changePwPOST(String user_pw, HttpServletResponse resp, HttpSession session) throws Exception {
		logger.info("C : changePwPOST() 호출");
		
		String user_num = (String)session.getAttribute("user_num");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.changePw(user_num,user_pw));
		out.close();
	}
	@RequestMapping(value = "/changeNick", method = RequestMethod.POST)
	public void changeNickPOST(String user_nickname, HttpServletResponse resp, HttpSession session) throws Exception {
		logger.info("C : changeNickPOST() 호출");
		
		String user_num = (String)session.getAttribute("user_num");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.changeNick(user_num,user_nickname));
		out.close();
		UserVO infoVO = service.infoUser(user_num);
		
		session.setAttribute("userVO", infoVO);
	}
	
	// 좋아요 목록  확인 
		@RequestMapping(value = "/like",method = RequestMethod.GET)
		public void likeGET(HttpSession session, Model model) throws Exception {
			
			logger.info("C : likeGET() 호출 ");
			
			String user_num = (String)session.getAttribute("user_num");
			
			// user_num="1";
			
			/*
			 * UserVO infoVO = service.infoUser(user_num);
			 * 
			 * model.addAttribute("infoVO", infoVO);
			 */
			
			
			model.addAttribute("ilvo", service.like(user_num));
			
			
			
			logger.info("페이지 이동 /user/like.jsp");
			
		}
	
		// 장바구니 페이지 호출
		@RequestMapping(value = "/cart",method = RequestMethod.GET)
		public void cartGET(HttpSession session, Model model) throws Exception {
			
			logger.info("C : cartGET() 호출 ");
			 
			String user_num = (String)session.getAttribute("user_num");
			
			// user_num="1";

			
			// 장바구니 목록 불러오
			model.addAttribute("mbList", service.getmbList(user_num));
			
			
			// 유저 정보 저장 
			model.addAttribute("infoVO", service.infoUser(user_num));
			
			
			
			logger.info("페이지 이동 /user/cart.jsp");
			
		}
		
		// 이메일 변경 인증코드 보내기
	    @ResponseBody
	    @RequestMapping(value = "/changeMailCheck",method = RequestMethod.GET)
		public String changeMailCheck(String email,HttpSession session, Model model) throws Exception {
			
			logger.info("C : changeMailCheck() 호출 ");
			logger.info("이메일 데이터 전송 확인");
	        logger.info("인증번호 : " + email);
			
			String user_num = (String)session.getAttribute("user_num");
			
			
			/* 이메일 인증 번호(난수) 생성 */
			Random random = new Random();
			
			int checkNum = random.nextInt(888888)+111111;
			logger.info("인증번호"+checkNum);
			
			
			/* 이메일 보내기 */
			String setFrom = "jps210713@gmail.com";
	        String toMail = email;
	        String title = "이메일 변경  인증 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			

	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        
	        String e_num = Integer.toString(checkNum);
	        
			// user_num="1";
			
			UserVO infoVO = service.infoUser(user_num);
			
			model.addAttribute("infoVO", infoVO);
			
			return e_num;
			
		}
		
	    
	    
	    @RequestMapping(value = "/changeEmail", method = RequestMethod.POST)
		public void changeEmailPOST(String user_email, HttpServletResponse resp, HttpSession session) throws Exception {
			logger.info("C : changeNickPOST() 호출");
			
			String user_num = (String)session.getAttribute("user_num");
			
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			
			UserVO vo = new UserVO();
			
			vo.setUser_num(user_num);
			vo.setUser_email(user_email);
			
			
			out.print(service.changeEmail(vo));
			out.close();
		}
	    
		 // 아이디찾기 페이지 호출
		@RequestMapping(value = "/findId",method = RequestMethod.GET)
		public void findIdGET(HttpSession session, Model model) throws Exception {
			logger.info("C : findIdGET() 호출");
			
		}
		
		// 회원탈퇴
		@RequestMapping(value = "/drop", method = RequestMethod.GET)
		public void dropGET(HttpSession session, Model model) throws Exception {
			System.out.println("회원탈퇴 페이지 요청");
			String user_num = (String) session.getAttribute("user_num");
			UserVO infoVO = service.infoUser(user_num);
			
			model.addAttribute("infoVO", infoVO);

		}
		
		@RequestMapping(value="/drop", method = RequestMethod.POST)
		public String dropPOST(UserVO vo, HttpSession session, HttpServletResponse resp) throws Exception{
			String user_num = (String) session.getAttribute("user_num");
			
			System.out.println("회원탈퇴 요청 회원번호 : "+user_num);
			vo.setUser_num(user_num);
			
			UserVO loginVO = service.drop(vo);
			
			
			
			if(loginVO == null) {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('아이디/비밀번호가 일치하지않습니다.'); ");
				out.println("location.href='/user/info';</script>");
				out.flush();
				
				return null;
			}
			
			// 유저테이블 user_state값 -10으로 변경
			service.change(user_num);
			// 유저테이블 user_state값 -10으로 변경
			
			System.out.println("실행");
			service.event(user_num);
			
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('한달뒤에 정상처리 됩니다.');");
			out.println("location.href='/home';</script>");
			out.flush();

			
			return null;
		}
		
		@RequestMapping(value="/cancel", method=RequestMethod.POST)
		public void cancelPOST(HttpSession session, HttpServletResponse resp, UserVO vo) throws Exception{
			String user_num = (String) session.getAttribute("user_num");
			
			System.out.println("회원탈퇴취소 요청 회원번호 : "+user_num);
			vo.setUser_num(user_num);
			
			UserVO loginVO = service.drop(vo);
			
			System.out.println("요청정보 : "+loginVO);
			
			if(loginVO == null) {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("1");
				out.flush();
			}else {
			
			service.cancel(vo);
			service.change1(user_num);
			}
		}
		
}
