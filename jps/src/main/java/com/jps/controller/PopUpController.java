package com.jps.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/popup/*")
public class PopUpController {

	private static final Logger logger = LoggerFactory.getLogger(PopUpController.class);

	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String popup() {

		logger.info("C: popup() 호출");
		
		System.out.println("... 팝업 호출됨...");

		return "popup/popup";
	}

}
