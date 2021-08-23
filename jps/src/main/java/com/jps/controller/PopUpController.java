package com.jps.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jps.domain.PopupVO;
import com.jps.service.PopupService;

@Controller
@RequestMapping(value = "/popup/*")
public class PopUpController {

	private static final Logger logger = LoggerFactory.getLogger(PopUpController.class);

	private static final String UPLOAD_PATH = "/resources/jps/upload";

	@Inject
	private PopupService service;

	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String popup(Model model) throws Exception {

		logger.info("C: popup() 호출");

		System.out.println("... 팝업 호출됨...");

		PopupVO vo = service.getPopup_img();

		model.addAttribute("vo", vo);

		return "popup/popup";
	}

	// @RequestMapping(value = "/insertPopup_img", method = RequestMethod.GET)
	public void insertPopup_img() {

		logger.info("C: insertPopup_img() 호출");

	}

	// @RequestMapping(value = "/insertPopup_img", method = RequestMethod.POST)
	public String insertPopup_imgPOST(PopupVO vo, MultipartFile[] uploadfile, HttpServletRequest req) throws Exception {

		logger.info("C: insertPopup_imgPOST() 호출");

		String img = "";

		for (int i = 0; i < uploadfile.length; i++) {

			if (uploadfile[i].getOriginalFilename() == "") {
				continue;
			}

			img += saveFile(uploadfile[i], req.getRealPath("/"), "/insertPopup");

			if (i == (uploadfile.length - 1)) {
				break;
			}

			img += ",";
		}
		
		vo.setPopup_img(img);

		service.insertPopup_img(vo);

		return "redirect:/popup/insertPopup_img";
	}

	private String saveFile(MultipartFile file, String realpath, String mainpath) {

		UUID uuid = UUID.randomUUID();

		// 파일 이름 변경
		String saveName = uuid + "_" + file.getOriginalFilename();

		logger.info("saveName: {}", saveName);
		logger.info(realpath + UPLOAD_PATH);

		// 저장할 File 객체를 생성(껍데기 파일)
		File saveFile = new File(realpath + UPLOAD_PATH + mainpath, saveName); // 저장할 폴더 이름, 저장할 파일 이름

		try {
			file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return saveName;
	}

}
