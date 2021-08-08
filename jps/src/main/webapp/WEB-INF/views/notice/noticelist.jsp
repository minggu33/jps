<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>

<h1> 공지사항 </h1>

	<input type="submit" value="글쓰기" onclick="location.href='./noticeWrite'" >
	
	<table>
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성날짜</td>
		</tr>
	<c:forEach var="NoticeVO" items="${noticelist }">
		<tr>
			<td>${NoticeVO.notice_num }</td>
			<td><a href="./noticecontent?notice_num=${NoticeVO.notice_num }">${NoticeVO.notice_subject }</a></td>
			<td>${NoticeVO.notice_count }</td>
			<td>${NoticeVO.notice_date }</td>
		</tr>
	</c:forEach>	
	</table>

<%@ include file="../include/footer.jsp" %>
</body>
</html>