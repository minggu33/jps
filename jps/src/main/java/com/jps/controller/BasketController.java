package com.jps.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jps.domain.BasketVO;
import com.jps.domain.Item_detailVO;
import com.jps.service.BasketService;
import com.jps.service.ItemService;

@Controller
@RequestMapping(value = "/basket/*")
public class BasketController {

	@Inject
	private BasketService bservice;
	
	@Inject
	private ItemService itservice;
	
	@RequestMapping(value="/basket", method = RequestMethod.POST)
	public void basketPOST(BasketVO bvo,Item_detailVO idvo, HttpSession session, HttpServletResponse resp) throws Exception {
		String user_num = (String) session.getAttribute("user_num");
		System.out.println("장바구니 회원 번호"+user_num);
		
		System.out.println();
		
		System.out.println("@@@@@@@아이템디테일 인덱스 "+idvo.getItem_detail_idx());
		
		int idx = idvo.getItem_detail_idx();
		
		Item_detailVO idVO = new Item_detailVO();
		
		idVO = itservice.getItemSC(idx);
		
		bvo.setItem_color(idVO.getItem_color());
		bvo.setItem_size(idVO.getItem_size());
		bvo.setUser_num(user_num);
		System.out.println("C : basketPOST() 호출");
		bservice.basket(bvo);
		System.out.println("C : 장바구니 담기 완료");
		
	}
	
	@RequestMapping(value="/basketdelete", method = RequestMethod.POST)
	public void basketdeletePOST(BasketVO bvo, HttpSession session, HttpServletResponse resp) throws Exception{
		String user_num = (String) session.getAttribute("user_num");
		System.out.println(user_num+"장바구니 목록 삭제");
		bvo.setUser_num(user_num);
		
		bservice.basketdelete(bvo);
	}
	
	
}
