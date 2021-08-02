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
		
		<table border="1">
			<tr style="text-align: center;">
				<td width="100">상품명</td>
				<td width="100">카테고리</td>
				<td width="100">가격</td>
				<td width="100">상품등록일</td>
				<td width="100">조회수</td>
			</tr>
		<c:forEach var="ItemVO" items="${itemlist }">
			<tr style="text-align: center;">
				<td>${ItemVO.item_name }</td>
				<td>${ItemVO.item_category }</td>
				<td>${ItemVO.item_price }</td>
				<td><fmt:formatDate value="${ItemVO.item_create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ItemVO.item_read_count }</td>
			</tr>
		</c:forEach> 
		</table>
	</div>

</body>
</html>