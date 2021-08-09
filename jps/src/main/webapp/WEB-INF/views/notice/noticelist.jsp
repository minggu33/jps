<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<h3 class="noticelist-h3"> 공지사항 </h3>

	<input type="submit" class="noticelist-write" value="글쓰기" onclick="location.href='./noticeWrite'" >
	
	<table class="table" style="width: 1300px; text-align: center;">
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
	<c:forEach var="NoticeVO" items="${noticelist }">
		<tr>
			<td width="100px;">${NoticeVO.notice_num }</td>
			<td><a href="./noticecontent?notice_num=${NoticeVO.notice_num }">${NoticeVO.notice_subject }</a></td>
			<td>${NoticeVO.notice_date }</td>
			<td>${NoticeVO.notice_count }</td>
		</tr>
	</c:forEach>	
	</table>
	
	<c:if test="${searchVO.startRow } > ${searchVO.pageBlock }">
		<a href="./noticelist?pageNum=${searchVO.startPage- searchVO.pageBlock }  " >[이전]</a>
	</c:if>
	
	<c:forTokens var="searchVO" items="${searchVO.pageCount }" delims=" ">
		<a href="./noticelist?pageNum=${searchVO.pageCount }">[ ${searchVO.pageCount } ]</a>
	</c:forTokens>
	
	
	
	<br>
	공지사항 총개수 : ${searchVO.cnt }<br>
	페이지 카운트 : ${searchVO.pageCount }

<%@ include file="../include/footer.jsp" %>
</body>
</html>