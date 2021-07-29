<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- header -->
<%@ include file="../include/header.jsp" %>
<!-- header -->
	<center>
		<table border="1">
			<tr style="text-align: center;">
				<td width="100">상품명</td>
				<td width="100">카테고리</td>
				<td width="100">가격</td>
				<td width="100">상품등록일</td>
				<td width="100">조회수</td>
			</tr>
		<c:forEach var="ItemVO" items="${ItemList }">
			<tr style="text-align: center;">
				<td>${ItemVO.item_name }</td>
				<td>${ItemVO.item_category }</td>
				<td>${ItemVO.item_price }</td>
				<td><fmt:formatDate value="${ItemVO.item_create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${ItemVO.item_read_count }</td>
			</tr>
		</c:forEach>
		</table>
	</center>
<!-- footer -->
<%@ include file="../include/footer.jsp" %>
<!-- footer -->