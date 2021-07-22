package com.itwillbs.cotroller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"} 
		)
public class BoardDAOTest {
	
		@Inject
		private BoardDAO dao;
		
		@Test
		public void testCreate() throws Exception{
			//글쓰기 테스트
			BoardVO vo = new BoardVO();
			vo.setTitle("1번글 테스트");
			vo.setContent("내용 111");
			vo.setWriter("sleeping");
			
			dao.create(vo);
			
		}
	
	
	
}
