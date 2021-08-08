<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<h1> 공지사항 수정 </h1>
	
	<form method="post">
		제목 : <input type="text" name="notice_subject" value="${vo.notice_subject }">
		<br><br>
		내용 : <br>
		<textarea rows="10" cols="80" name="notice_content">
			${vo.notice_content }
		</textarea> 
		<input type="hidden" name="notice_num" value="${vo.notice_num }">
		<br>
		<input type="submit" value="수정하기" onclick="location.href='./noticemodify'">
	</form>
	
	
	

<%@ include file="../include/footer.jsp" %>
</body>
</html>