<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<h1> 공지사항 내용 </h1>
	
	
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>내용</td>
			<td>작성일</td>
		</tr>
		<tr>
			<td>${vo.notice_num }</td>
			<td>${vo.notice_subject }</td>
			<td>${vo.notice_count }</td>
			<td>${vo.notice_content }</td>
			<td>${vo.notice_date }</td>
		</tr>
	</table>
	
	<br>
	<input type="button" value="목록으로" onclick="location.href='./noticelist'">
	<input type="button" value="수정" onclick="location.href='./noticemodify?notice_num=${vo.notice_num}'">
	<input type="button" value="삭제" onclick="location.href='./noticedelete?notice_num=${vo.notice_num}'">
	
	

<%@ include file="../include/footer.jsp" %>
</body>
</html>