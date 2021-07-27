package com.jps.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jps.domain.ItemVO;
import com.jps.service.ItemService;

@Controller
@RequestMapping(value = "/item/*")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Inject
	private ItemService service;
	
	
	
	@RequestMapping(value = "/item", method = RequestMethod.GET) public void
	itemGET() throws Exception { System.out.println("C : itemGET() 호출"); }
	 
	
	@RequestMapping(value ="/iteminsert", method=RequestMethod.POST)
	public String itemPOST(ItemVO vo, RedirectAttributes rttr, Model model) throws Exception {
		
		service.item(vo);
		
		model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/item/listAll";
	}
}
