package com.jps.cotroller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.service.BoardService;


//@RequestMapping("/board/*") 보드로 시작하는 모든 설정을 여기서 처리하겠다.
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	//서비스 객체 생성 >  주입
	@Inject
	private BoardService service;
	
	//http://localhost:8088/board/regist
	//글쓰기 동작 구현(get)
	
	@RequestMapping(value = "/regist",method = RequestMethod.GET)
	public void registGET() throws Exception{
		System.out.println( " C : registGET() 호출 ");
		
	}
	
	
	// 글쓰기 동작 (post)
	@RequestMapping(value = "/regist",method = RequestMethod.POST)
	public String registPOST(BoardVO vo,RedirectAttributes rttr , Model model) throws Exception{
		System.out.println("C : registPOST()호출 ");
		
		// 입력정보를 전달받아서 DB에 정보를 저장 => 서비스동작을 호출
		System.out.println("C : 전달된 정보"+vo);
		
		service.regist(vo);
		
		System.out.println("C : 글쓰기 완료!");
		
		model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");
		
		//return "/board/success";
		return "redirect:/board/listAll";
	}
	
	//http://localhost:8088/board/listAll
	//리스트페이지(get)
	//(@ModelAttribute("result") String result >> 모델 어트리뷰트로 가져온 result를 String result 변수로 저장한다.
	// 리스트 페이지 (get)
		@RequestMapping(value = "/listAll", method = RequestMethod.GET)
		public void listAllGET(Model model,@ModelAttribute("msg") String result,@ModelAttribute("result") String result2) throws Exception{
			System.out.println("C : listAllGET() 호출 ");
			System.out.println("C : 전달정보"+result);
			System.out.println("C : 전달정보"+result2);
			
			// 서비스를 통해서 DB에 있는 모든 글정보 가져오기
			
			//List<BoardVO> boardList = service.listALL();
			//model.addAttribute("boardList", boardList);
			
			//model 객체를 사용해서 view 페이지로 정보 전달
			model.addAttribute("boardList", service.listALL());

		}
		
		// 글 본문보기 (content)
		@RequestMapping(value = "/read",method = RequestMethod.GET)
		public void readGET(@RequestParam("bno") int bno,Model model) throws Exception {
	        // Model : 컨트롤러가 뷰에 정보를 전달하는 객체 (Map 형태로 저장)
			
			// * 전달되는 데이터 받을때 
			// @ModelAttribute : 컨트롤러가 뷰에 정보를 전달하기위해서 사용 객체
			// => DTO/VO 객체를 주로 사용
			// @RequestParam : reqeust.getParameter()의 기능 
			// => 자동으로 형변환 가능(문자열,숫자,날짜)		
			
			
			/*전달되는 데이터를 받을때, 
			 * 객체,DTO면 모델 어트리뷰트
			 * 짧으면 리퀘스트 파람
			 * 
			 * 
			 * @ModelAttribute
				컨트롤러가 뷰에 정보를 전달하기 위해서 사용하는 객체
				>> DTO/VO 객체를 주로 사용
				@ModelAttribute("bno") int bno
				
				
				@RequestParam("bno")
				데이터가 전달될때, DTO 객체가 아닌값만 가지고 다님
				>> request.getparameter()의 기능을 한다
				자동으로 형변환이 가능하다.(문자열,숫자,날짜)
			
				Model 
				컨트롤러가 뷰에 정보를 전달하는 객체(Map 형태로 저장)
				
			*/

			
			System.out.println("C : readGET() 메서드 호출");
			// 전달정보 bno 저장
			System.out.println("C : bno = "+bno);

			// 서비스에 글본문 내용을 가져오는 메서드
			BoardVO vo = service.read(bno);
			
			System.out.println("C : "+vo);
			
			System.out.println("C : view페이지로 정보를 전달");
			
			model.addAttribute("vo",vo);
			
			System.out.println("C : /board/read.jsp");

			// 페이지 이동(컨트롤러 동작)
			// /board/read.jsp 페이지로 이동
			
			
		}

		
		//글정보 수정 (update)
		@RequestMapping(value = "/modify",method = RequestMethod.GET)
		public void updateGET(@RequestParam("bno") int bno, Model model) throws Exception{
			System.out.println("C : updateGET() 메서드 호출");
			System.out.println("C : /read 주소에서 수정동작 호출");
			//전달받은 정보 (글번호)
			System.out.println("C : 수정 글 번호" + bno);
			
			// 서비스에 글번호에 해단하는 글정보를 가져오는 동작
			//model 객체에 저장
			model.addAttribute("uvo",service.read(bno));
			
			
			
			//페이지 이동(/board/modify)
			System.out.println("C : 정보 저장후 페이지 이동 /board/modify.jsp");
			
			
		}
	
		// 글정보 수정하기(post)
		@RequestMapping(value = "/modify",method = RequestMethod.POST)
		public String updatePOST(BoardVO vo, RedirectAttributes rttr) throws Exception{
			System.out.println("C : 정보 수정처리 updatePOST() 호출");
			
			System.out.println("C : 수정할 정보 "+vo);
			
			// 서비스에 있는 정보 수정 메서드 호출
			service.modify(vo);	
			
			rttr.addFlashAttribute("msg", "success");		
			
			// /board/listAll 페이지로 이동		
			return "redirect:/board/listAll";
		}
		
		
		//글삭제 처리(post)
		@RequestMapping(value="/delete",method = RequestMethod.POST)
		public String deletePOST(@RequestParam("bno") int bno,RedirectAttributes rttr) throws Exception{
		
			System.out.println("C : view 페이지에서 deletePOST() 호출");

			
			//서비스 동작중에서 글 삭제 동작 호출
			service.remove(bno);
			rttr.addFlashAttribute("msg","success");
			
			
			//페이지 이동
			return "redirect:/board/listAll";
		}
	
}
