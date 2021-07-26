package com.jps.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
	
	/*
	AOP개념을 활용한 예외처리
	@ControllerAdvice : 해당클래스가 컨트롤러에 발생하는 모든 예외를 처리하는 클래스이다.
	
	예외처리 동작을 메서드로 구현
	@ExceptionHandler(Exception.class)
	@ExceptionHandler(NullPointerException.class)
	위의 예외가 발생하면 이 메소드로 온다.
	
	
	*/
	/*
	@ExceptionHandler(Exception.class)
	//@ExceptionHandler(NullPointerException.class)
	public void common(Exception e) {
		System.out.println(e.toString());
		return "test";
	}

	*/
	
	
	@ExceptionHandler(Exception.class)
	public ModelAndView common(Exception e) {
		System.out.println(e.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/test"); //예외를 보여주는 view 페이지 이름
		mav.addObject("e", e);
		
		
		return mav;
	}

}
