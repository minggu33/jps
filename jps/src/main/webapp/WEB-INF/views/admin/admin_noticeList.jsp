<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 목록</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/itemInsert.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">
<script type="text/javascript">
	var msg = "${msg }";

	if(msg == "success") {
		alert("등록완료");
	}
</script>
</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<h1>공지사항 목록</h1>
		
		<table class="noticeList">
			<tr>
				<td class="notice_num">번호</td>
				<td class="notice_subject">글 제목</td>
				<td class="notice_date">글 작성일</td>
				<td class="notice_count">조회수</td>
				<td class="notice_d">신고 횟수</td>
				<td class="notice_delete">삭제</td>
				<td class="notice_etc">비고</td>
			</tr>
		<c:forEach var="NoticeVO" items="${noticelist }">
			<tr>
				<td class="notice_num">${NoticeVO.notice_num }</td>
				<td class="notice_subject">${NoticeVO.notice_subject }</td>
				<td class="notice_date">${NoticeVO.notice_date }</td>
				<td class="notice_count">${NoticeVO.notice_count }</td>
				<td class="notice_d"></td>
				<td class="notice_delete"></td>
				<td class="notice_etc"></td>
			
			</tr>
		</c:forEach> 
		</table>
	</div>

</body>
</html>