<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link href="/resources/jps/css/notice.css" rel="stylesheet">
<script src="/resources/jps/js/notice.js"></script>
</head>
<body>

<%@ include file="../include/header.jsp" %>

	<h3 class="noticecontent-h3"> 공지사항 </h3>
	
	 <form name="readForm" role="form" method="post">
          <input type="hidden" id="notice_file" name="notice_file" value="${vo.notice_file }"> 
      </form>
	
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
			<th>첨부파일</th>
			<td colspan="3">
					<a href="#" onclick="fn_fileDown('${vo.notice_file }'); return false;">${fn:substringAfter(vo.notice_file, '_') }</a>
			</td>
		</tr>
		<tr>
			<td colspan="4" rowspan="2" style="height: 200px;" id="noticecontent-td">${vo.notice_content }</td>
		</tr>
	</table>
	
	
	<br>
	<input type="button" value="목록으로" onclick="location.href='./noticelist'" class="noticecontent-btn">

	

<%@ include file="../include/footer.jsp" %>
</body>
</html>