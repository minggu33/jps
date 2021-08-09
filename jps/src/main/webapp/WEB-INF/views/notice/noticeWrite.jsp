<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link href="/resources/jps/css/notice.css" rel="stylesheet">
</head>
<body>

<%@ include file="../include/header.jsp" %>

<h3 class="noticewrite-h3"> 공지사항 작성 </h3>

	<form class="noticewrite-form" action="./noticeWrite" method="post">
		<br>
		<input type="checkbox" name="notice_important" value="1" class="noticewrite-important"><a> 중요</a>  <br><br>
		<b>제목 : </b> <input type="text" name="notice_subject" class="noticewrite-subject"><br>
		<b>첨부파일 : </b> <input type="file" name="notice_file"> <br><br>
		<b>내용</b>  <br><textarea rows="10" cols="105" name="notice_content"></textarea>
		<hr>
		<input type="submit" value="글쓰기" class="noticewrite-write">
	</form>

<%@ include file="../include/footer.jsp" %>
</body>
</html>