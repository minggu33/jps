<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link href="/resources/jps/css/notice.css" rel="stylesheet">
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<h3 class="noticecontent-h3"> 공지사항 </h3>
	
	
	<table class="table" style="width: 1000px;">
		<tr>	
			<th>작성일</th>
			<td id="noticecontent-td">${vo.notice_date }</td>
			<th>조회수</th>
			<td id="noticecontent-td">${vo.notice_count }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" id="noticecontent-td">${vo.notice_subject }</td>
		</tr>
		<tr>
			<th colspan="4">공지사항 내용</th>
		</tr>
		<tr>
			<td colspan="4" rowspan="2" style="height: 200px;" id="noticecontent-td">${vo.notice_content }</td>
		</tr>
	</table>
	
	
	<br>
	<input type="button" value="목록으로" onclick="location.href='./noticelist'" class="noticecontent-btn">
	<form action="./noticemodify" class="noticecontent-form">
		<input type="submit" value="수정" onclick="return confirm('공지사항을 수정하시겠습니까?')">
		<input type="hidden" name="notice_num" value="${vo.notice_num}">
	</form>
	<form action="./noticedelete" class="noticecontent-form">
		<input type="button" value="삭제" onclick="return confirm('공지사항을 삭제하시겠습니까?')">
		<input type="hidden" name="notice_num" value="${vo.notice_num}">
	</form>
	

<%@ include file="../include/footer.jsp" %>
</body>
</html>