<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>

<h1> 공지사항 작성 </h1>

	<fieldset style="margin-left: 30px;">
	
		<form action="./noticeWrite" method="post">
			<a>중요</a> <input type="checkbox" name="notice_important" value="1"> <br>
			<a>제목</a>  <br><br><input type="text" name="notice_subject" size="100;" style="margin: auto;"> <br><br>
			<a>첨부파일</a>  <br><br><input type="file" name="notice_file" size="100;" style="margin: auto;"> <br><br>
			<a>내용</a>  <br><br><textarea rows="10" cols="105" name="notice_content"></textarea>
			<hr>
			<input type="submit" value="글쓰기">
		</form>
	</fieldset>	

<%@ include file="../include/footer.jsp" %>
</body>
</html>