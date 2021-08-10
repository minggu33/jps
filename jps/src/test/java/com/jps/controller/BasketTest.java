package com.jps.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jps.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
      locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"} 
      )
public class BasketTest {

	@Inject
	private UserDAO udao;
	
	@Test
	public void basketTest(String user_num) {
		System.out.println("테스트 시작");
	}
}
