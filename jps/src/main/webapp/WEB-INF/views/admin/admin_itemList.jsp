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
		<h1>상품 목록</h1>
		
		<!-- 리스트 갯수 -->
		<jsp:include page="../include/listCntPro.jsp">
			<jsp:param value="${searchVO }" name="searchVO"/>
		</jsp:include>
		<!-- 리스트 갯수 -->
		
		<table class="itemList clear">
			<tr>
				<td class="item_num">상품 번호</td>
				<td class="item_name">상품명</td>
				<td class="item_category">카테고리</td>
				<td class="item_price">가격</td>
				<td class="item_create_date">상품등록일</td>
				<td class="item_readcount">조회수</td>
				<td class="item_etc">비고</td>
			</tr>
		<c:forEach var="ItemVO" items="${itemlist }">
			<tr>
				<td class="item_num">${ItemVO.item_num }</td>
				<td class="item_name">${ItemVO.item_name }</td>
				<td class="item_category">${ItemVO.item_category }</td>
				<td class="item_price">${ItemVO.item_price }</td>
				<td class="item_create_date"><fmt:formatDate value="${ItemVO.item_create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class="item_readcount">${ItemVO.item_read_count }</td>
				<td class="item_etc"></td>
			</tr>
		</c:forEach> 
		</table>
		
		<!-- 페이징처리 -->
		<jsp:include page="../include/pagePro.jsp">
			<jsp:param value="${searchVO }" name="searchVO"/>
			<jsp:param value="${type }" name="type"/>
		</jsp:include>
		<!-- 페이징처리 -->
	</div>

</body>
</html>