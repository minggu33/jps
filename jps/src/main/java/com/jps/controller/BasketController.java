package com.jps.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jps.domain.BasketVO;
import com.jps.service.BasketService;

@Controller
@RequestMapping(value = "/basket/*")
public class BasketController {

	@Inject
	private BasketService bservice;
	
	@RequestMapping(value="/basket", method = RequestMethod.POST)
	public void basketPOST(BasketVO bvo, HttpSession session, HttpServletResponse resp) throws Exception {
		String user_num = (String) session.getAttribute("user_num");
		System.out.println("장바구니 회원 번호"+user_num);
		
		bvo.setUser_num(user_num);
		System.out.println("C : basketPOST() 호출");
		bservice.basket(bvo);
		System.out.println("C : 장바구니 담기 완료");
		
	}
	
	
}
