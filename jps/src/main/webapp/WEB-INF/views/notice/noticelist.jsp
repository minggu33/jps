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
	
	<!-- 리스트 갯수 -->
	<jsp:include page="../include/listCntPro.jsp">
		<jsp:param value="${searchVO }" name="searchVO"/>
	</jsp:include>
	<!-- 리스트 갯수 -->
	
	<table class="table" >
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
	<c:forEach var="NoticeVO" items="${noticelist }">
		<tr>
			<td width="100px;">${NoticeVO.notice_num }</td>
			<td><a href="./noticecontent?notice_num=${NoticeVO.notice_num }&page_Num=${searchVO.pageNum}">${NoticeVO.notice_subject }</a></td>
			<td>${NoticeVO.notice_date }</td>
			<td>${NoticeVO.notice_count }</td>
		</tr>
	</c:forEach>	
	</table>
	
	<!-- 페이징처리 -->
	<jsp:include page="../include/pagePro.jsp">
		<jsp:param value="${searchVO }" name="searchVO"/>
		<jsp:param value="${type }" name="type"/>
	</jsp:include>
	<!-- 페이징처리 -->
	

<%@ include file="../include/footer.jsp" %>
</body>
</html>