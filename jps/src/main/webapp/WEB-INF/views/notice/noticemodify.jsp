<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link href="/resources/jps/css/notice.css" rel="stylesheet">
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<h3 class="noticemodify-h3"> 공지사항 수정 </h3>
	
	<form class="noticemodify-form" method="post">
		<input type="checkbox" id="noticemodify-important" name="notice_important" value="1"> 중요 <br>
		제목 : <input type="text" class="noticemodify-subject" name="notice_subject" value="${vo.notice_subject }">
		<br><br>
		내용 : <br>
		<textarea rows="10" cols="80" name="notice_content">${vo.notice_content }</textarea> 
		
		<input type="hidden" name="notice_num" value="${vo.notice_num }"><br>
		<input type="submit" class="noticemodify-button" value="수정하기" onclick="location.href='./noticemodify'">
	</form>
	
	
	

<%@ include file="../include/footer.jsp" %>
</body>
</html>