<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 목록</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/itemList.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">
<script type="text/javascript">
	var msg = "${msg }";

	if(msg == "success") {
		alert("등록완료");
	} else if (msg == "update") {
		alert("업데이트 완료");
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
				<td class="item_name" colspan="2">상품명</td>
				<td class="item_category">카테고리</td>
				<td class="item_price">가격</td>
				<td class="item_create_date">상품등록일</td>
				<td class="item_readcount">조회수</td>
				<td class="item_etc">비고</td>
			</tr>
		<c:forEach var="ItemVO" items="${itemlist }">
			<tr>
				<td class="item_num">${ItemVO.item_num }</td>
				<td class="item_img"><img class="img-fluid" style="width:62px; height:75px;" src="/resources/jps/upload/insertItem/${fn:split(ItemVO.item_img,',')[0]}"></td>
				<td class="item_name_sub"><a href="./updateitem?item_num=${ItemVO.item_num }">${ItemVO.item_name }</a></td>
				<td class="item_category">${ItemVO.item_category }</td>
				<td class="item_price"><fmt:formatNumber value="${ItemVO.item_price }" type="number" /></td>
				<td class="item_create_date"><fmt:formatDate value="${ItemVO.item_create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class="item_readcount">${ItemVO.item_read_count }</td>
				<td class="item_etc">
					<input type="hidden" name="item_num" value="${ItemVO.item_num }">
					<input type="hidden" name="item_name" value="${ItemVO.item_name }">
					<input type="button" value="삭제하기" class="deleteItem border_none">
				</td>
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