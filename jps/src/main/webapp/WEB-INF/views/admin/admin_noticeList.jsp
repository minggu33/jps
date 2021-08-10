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
				<td class="notice_num">글 번호</td>
				<td class="notice_name">글 제목</td>
				<td class="notice_category">글 작성일</td>
				<td class="notice_price">글</td>
				<td class="notice_create_date">글</td>
				<td class="notice_readcount">조회수</td>
				<td class="notice_etc">비고</td>
			</tr>
<%-- 		<c:forEach var="NoticeVO" items="${noticelist }"> --%>
<!-- 			<tr> -->
<%-- 				<td class="notice_num">${NoticeVO.item_num }</td> --%>
<%-- 				<td class="notice_name">${NoticeVO.item_name }</td> --%>
<%-- 				<td class="notice_category">${NoticeVO.item_category }</td> --%>
<%-- 				<td class="notice_price">${NoticeVO.item_price }</td> --%>
<%-- 				<td class="notice_create_date"><fmt:formatDate value="${NoticeVO.item_create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
<%-- 				<td class="notice_readcount">${NoticeVO.item_read_count }</td> --%>
<!-- 				<td class="notice_etc"></td> -->
<!-- 			</tr> -->
<%-- 		</c:forEach>  --%>
		</table>
	</div>

</body>
</html>