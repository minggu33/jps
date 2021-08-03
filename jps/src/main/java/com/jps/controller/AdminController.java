package com.jps.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	//http://localhost:8088/admin
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminGET() {
		logger.info("C : adminGET() 호출");
		return "/admin/admin";
	}
	
	@RequestMapping(value = "/insertitem", method = RequestMethod.GET)
	public String adminInsertItemGET() {
		logger.info("C : adminInsertItemGET() 호출");
		return "/admin/admin_insertItem";
	}
	
	@RequestMapping(value = "/insertitem", method = RequestMethod.POST)
	public String adminInsertItemPOST(ItemVO vo, @RequestParam(value = "item_color") String item_color,
			@RequestParam(value = "item_size") String item_size, @RequestParam(value = "item_stock") String item_stock,
			RedirectAttributes rttr) throws Exception {
		
		logger.info("C : adminInsertItemPOST() 호출");
		
		List<Item_detailVO> dtlList = new ArrayList<Item_detailVO>();
		String item_colors[] = item_color.split(",");
		String item_sizes[] = item_size.split(",");
		String item_stocks[] = item_stock.split(",");
		
		
		for(int i=0; i<item_colors.length; i++) {
			Item_detailVO dtlvo = new Item_detailVO();
			dtlvo.setItem_color(item_colors[i]);
			dtlvo.setItem_size(item_sizes[i]);
			dtlvo.setItem_stock(Integer.parseInt(item_stocks[i]));
			
			dtlList.add(dtlvo);
		}
		
		logger.info("C : dtlList - "+ dtlList);
		
		service.item(vo, dtlList);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/itemlist";
	}
	
	@RequestMapping(value = "/itemlist", method = RequestMethod.GET)
	public String adminItemListGET(Model model, @ModelAttribute("msg") String result,@ModelAttribute("result") String result2) throws Exception {
		logger.info("C : adminItemListGET() 호출");
		model.addAttribute("itemlist", service.itemlist());
		return "/admin/admin_itemList";
	}

}
