package com.jps.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jps.domain.BasketVO;
import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.Item_likeVO;
import com.jps.service.BasketService;
import com.jps.service.ItemService;
import com.jps.service.Item_likeService;

@Controller
@RequestMapping(value = "/item/*")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	
	@Inject
	private ItemService service;
	private Item_likeService ilservice;
	
	@RequestMapping(value = "/item", method = RequestMethod.GET) 
	public void itemGET() throws Exception { System.out.println("C : itemGET() 호출"); }
	
	@RequestMapping(value ="/item", method=RequestMethod.POST)
	public String itemPOST(ItemVO vo, RedirectAttributes rttr, Model model, HttpSession session) throws Exception {
		String user_num = (String) session.getAttribute("user_num");
		
		System.out.println("세션으로 가져온 회원번호"+user_num);
		service.item(vo);
		
		model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/item/itemlist";
	}
	
	@RequestMapping(value = "/itemlist", method = RequestMethod.GET)
	public String itemlistGET(Model model, @ModelAttribute("msg") String result,@ModelAttribute("result") String result2) throws Exception { 
		System.out.println("C : itemListGET() 호출");
		model.addAttribute("itemlist", service.itemlist());
		return "/item/itemlist";
	}
	
	@RequestMapping(value = "/itemdetail", method = RequestMethod.GET)
	public void itemdetailGET(Model model, Model model2, @RequestParam("item_num") int item_num ) throws Exception {
		
		System.out.println(item_num);
		ItemVO vo = service.read(item_num);
		// Item_likeVO ivo = ilservice.read(item_num);
		
		model.addAttribute("vo", vo);
		// model2.addAttribute("ivo", ivo);
	}	
	
	@RequestMapping(value="/itemdetail", method = RequestMethod.POST)
	public String itemdetailPOST(Item_detailVO dvo, RedirectAttributes rttr, Model model) throws Exception {
		
		
		return "redirect:/item/order";
	}
	
	
}
