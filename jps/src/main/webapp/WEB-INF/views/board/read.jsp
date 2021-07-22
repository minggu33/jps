<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<h1>views/board/read.jsp</h1>
<h2>글 본문 보기</h2>

  <form role="form" action="" method="post">
      <!-- 글번호 정보만 전달 -->
      <input type="hidden" name="bno" value="${vo.bno }">
  </form>
  
      <div class="box-body">
         <div class="form-group">
          <label for="exampleInputEmail1">글번호</label>
          <input type="text" class="form-control" id="exampleInputEmail1"
            readonly="readonly" value="${vo.bno }"
          >
        </div>
      
        <div class="form-group">
          <label for="exampleInputEmail1">제목</label>
          <input type="text" class="form-control" id="exampleInputEmail1" 
             readonly="readonly" value="${vo.title }"
          >
        </div>
        
        <div class="form-group">
          <label for="exampleInputEmail1">글쓴이</label>
          <input type="text" class="form-control" id="exampleInputEmail1" 
            readonly="readonly" value="${vo.writer }"
          >
        </div>
        
        <div class="form-group">
          <label for="exampleInputEmail1">글 내용</label>
          <textarea class="form-control" rows="3" 
            readonly="readonly" 
          >${vo.content }</textarea>
        </div>
        
        
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-warning">수정하기</button>
        <button type="submit" class="btn btn-danger">삭제하기</button>
        <button class="btn btn-primary">목록으로</button>
      </div>
	
	<script>
		$(document).ready(function(){
			
			//폼태그 정보를 가져오기
			var formObj = $("form[role='form']");
			//alert(formObj);
			console.log(formObj);
			
			//목록으로 버튼 클릭시
			$(".btn-primary").click(function(){
				location.href="/board/listAll";
			});
			
			//수정하기 버튼 클릭시
			$(".btn-warning").on("click",function(){
				// /board/modify 주소로 이동 (get방식) >>  submit()
				formObj.attr("action","/board/modify");
				formObj.attr("method","get");
				formObj.submit();
				//위의 코드가 있으면 폼태그 안에 서브밋이 없어도 이동한다. 타입이 서브밋이 아니어도 됨
				
			});
			
			 // 삭제하기 버튼 클릭시
	    	 $(".btn-danger").click(function(){
	    		 formObj.attr("action","/board/delete");
	    		 formObj.submit();
	    	 });
			
			
			
			
		});
	
	
	</script>



<%@include file="../include/footer.jsp"%>