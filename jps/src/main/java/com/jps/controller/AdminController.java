package com.jps.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jps.domain.ItemVO;
import com.jps.domain.Item_detailVO;
import com.jps.domain.NoticeVO;
import com.jps.domain.UserVO;
import com.jps.domain.searchVO;
import com.jps.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private static final String UPLOAD_PATH = "/resources/jps/upload";
	
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
	public String adminInsertItemPOST(ItemVO vo, MultipartFile[] uploadfile, @RequestParam(value = "item_color") String item_color,
			@RequestParam(value = "item_size") String item_size, @RequestParam(value = "item_stock") String item_stock,
			RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		
		logger.info("C : adminInsertItemPOST() 호출");
		
		String item_img = "";
		
		for(int i=0; i<uploadfile.length; i++) {
			
			if(uploadfile[i].getOriginalFilename() == "") {
				continue;
			}
			
			item_img += saveFile(uploadfile[i], req.getRealPath("/"), "/insertItem");
			
			if(i == (uploadfile.length - 1)) {
				break;
			}
			
			item_img += ",";
		}
		
		vo.setItem_img(item_img);
		
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
	
	private String saveFile(MultipartFile file, String realpath, String mainpath){
		
		UUID uuid = UUID.randomUUID();
		
	    // 파일 이름 변경
	    String saveName = uuid + "_" + file.getOriginalFilename();

	    logger.info("saveName: {}",saveName);
	    logger.info(realpath+UPLOAD_PATH);

	    // 저장할 File 객체를 생성(껍데기 파일)
	    File saveFile = new File(realpath+UPLOAD_PATH+mainpath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	}
	
	@RequestMapping(value = "/itemlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminItemList(Model model, searchVO vo) throws Exception {
		logger.info("C : adminItemListGET() 호출");
		
		if(vo.getType() == 1) {

			vo.setPageInfo(vo, service.itemCountOfSubject(vo));
			model.addAttribute("itemlist", service.itemSearchOfSubject(vo));
			
			model.addAttribute("type", "search");
		} else if(vo.getType() == 2) {
			
			vo.setPageInfo(vo, service.itemCountOfContent(vo));
			model.addAttribute("itemlist", service.itemSearchOfContent(vo));
		
			model.addAttribute("type", "search");
		} else if(vo.getType() == 3) {
			
			vo.setPageInfo(vo, service.itemCountOfSC(vo));
			model.addAttribute("itemlist", service.itemSearchOfSC(vo));
		
			model.addAttribute("type", "search");
		} else {
			
			vo.setPageInfo(vo,service.itemCount());
			model.addAttribute("itemlist", service.itemlist(vo));
		}
		
		model.addAttribute("searchVO", vo);
		
		return "/admin/admin_itemList";
	}
	
	@RequestMapping(value = "/userlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminUserList(Model model, searchVO vo) throws Exception {
		logger.info("C : adminUserList() 호출");
		
		vo.setPageInfo(vo, service.getUserCnt());
		
		model.addAttribute("userlist", service.userlist(vo));
		model.addAttribute("searchVO", vo);
		return "/admin/admin_userList";
	}
	
	@RequestMapping(value = "/updatePoint", method = RequestMethod.POST)
	public void adminUpdatePointPOST(UserVO vo, HttpServletResponse resp) throws Exception {
		logger.info("C : adminUpdatePointPOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.updatePoint(vo));
		out.close();
	}

	@RequestMapping(value = "/resetPw", method = RequestMethod.POST)
	public void resetPwPOST(String user_num, HttpServletResponse resp) throws Exception  {
		logger.info("C : resetPwPOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.resetPW(user_num));
		out.close();
	}
	
	@RequestMapping(value = "/updateState", method = RequestMethod.POST)
	public void updateStatePOST(UserVO vo, HttpServletResponse resp) throws Exception {
		logger.info("C : updateStatePOST() 호출");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(service.updateState(vo));
		out.close();
	}
	
	@RequestMapping(value = "/noticelist", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeListGET(Model model, searchVO vo) throws Exception {
		logger.info("C : adminNoticeListGET() 호출");
		
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
			
			vo.setPageInfo(vo, service.getNoticeCnt());
			model.addAttribute("noticelist", service.noticelist(vo));
		}
		
		model.addAttribute("searchVO", vo);
		
		return "/admin/admin_noticeList";
	}
	
	@RequestMapping(value = "/insertnotice", method = RequestMethod.GET)
	public String adminInsertNoticeGET() {
		logger.info("C : adminInsertNoticeGET() 호출");
		return "/admin/admin_insertNotice";
	}
	
	@RequestMapping(value = "/insertnotice", method = RequestMethod.POST)
	public String adminInsertNoticePOST(NoticeVO vo, MultipartFile uploadfile,
			RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		logger.info("C : adminInsertNoticePOST() 호출");
		
		vo.setNotice_file(saveFile(uploadfile, req.getRealPath("/"), "/insertNotice"));
		
		service.insertNotice(vo);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/noticelist";
	}
	
	@RequestMapping(value = "/updateItem", method = RequestMethod.GET)
	public String adminUpdateItemGET(String item_num, Model model) throws Exception {
		logger.info("C : adminUpdateItemGET() 호출");
		
		logger.info("C : join 결과 {}", service.readItemInfo(item_num));
		
		model.addAttribute("itemlist", service.readItemInfo(item_num));
		
		return "/admin/admin_updateItem";
	}
}
