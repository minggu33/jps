<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 장바구니 </title>

  <link href="/resources/jps/css/userinfo.css" rel="stylesheet">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>

<%@ include file="../include/header.jsp" %>


  <!-- 왼쪽 nav bar -->
    <nav class="mypage-nav">
    	<dl class="mypage-menu"> 
    	
    	<dt> 마이 페이지  </dt>
    	<dd><a href="/user/info">내 정보 </a></dd>
    	<dd><a href="/user/like">좋아요 </a></dd>
    	<dd><a href="/user/cart">장바구니 </a></dd>
    	<dd><a href="#">주문내역 </a></dd>
    	   	
    	</dl>
    </nav>
    <!-- 왼쪽 nav bar -->
	
	<section class="mypage-cont" >
	<header class="mypage-header">
		<h1>Order / Payment </h1>
		<div class="upper-contents"> 
		<div class="cart-process">
		<span class="cart-pagenation_on">장바구니</span>
		<span class="back-arrow"></span>
		<span class="cart-pagenation">주문서 작성</span>
		<span class="back-arrow"></span>
		<span class="cart-pagenation">주문 완료</span>
		</div>		
		</div>
	</header>
	<div class="cart-cont">
	<div class="cart-count">
	전체 
	<strong>${BasketList.size() }</strong>
	개	
	</div>
	
	 <table border="1">
	 <thead>
		 <tr>
		 	<th>번호</th>
		 	<th>checkbox</th>
		 	<th>상품명(옵션)</th>
		 	<th>판매가</th>
		 	<th>회원 할인</th>
		 	<th>수량</th>
		 	<th>주문금액<br>(적립예정)</th>
		 	<th>주문관리</th>
		 	<th>배송비/ 배송형태</th>
		 </tr>
	 </thead>
	  <c:forEach var="BasketVO" items="${BasketList }">
	 <tr>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 		<td></td>
	 </tr>
	 </c:forEach>
	 </table>
	 
	${BasketVO.user_num}
	${BasketVO.item_num }
	
	
	
	
	</div>
	</section>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>