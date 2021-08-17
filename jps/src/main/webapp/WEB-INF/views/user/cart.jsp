<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 장바구니 </title>
  <link href="/resources/jps/css/userinfo.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>


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
    	<dd><a href="/user/drop">회원탈퇴</a></dd>
    	
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
	<strong>${mbList.size() }</strong>
	개	
	</div>
	
	 <table class="cart-table">
	 <thead>
		 <tr>
		 	<th>번호</th>
		 	<th style="cursor: pointer;">
		 	<input type="checkbox" id="chk_all" checked="checked">
		 	</th>
		 	<th>상품</th>
		 	<th>상품명(옵션)</th>
		 	<th>판매가</th>
		 	<th>주문금액<br>(적립예정)</th>
		 	<th>수량</th>
		 	<th>주문관리</th>
		 </tr>
	 </thead>
	  <c:forEach var="il" items="${mbList }" varStatus="status" >	  
	 <tr>


	 		<td>${status.count }</td>
			<td>
			<input type="checkbox" id="chk"  name="chk" value="${il.basket_idx}" checked="checked">
			</td>
	 	
	 		<td>
	 	 <img class="img-fluid" style="width:62px; height:75px;" src="/resources/jps/upload/insertItem/${fn:split(il.itemvo.item_img,',')[0]}">
			</td>
			<td style="text-align: left; padding-left:15px; ">
	 		<strong>${il.itemvo.item_name }&nbsp;(${il.item_color})</strong>
	 		<br>
	 		size:${il.item_size }
	 		
	 		</td>
	
	 		<td>
	 		<fmt:formatNumber value="${il.itemvo.item_price }" type="number" />
	 		</td>
	 		<td>
	 			<fmt:formatNumber value="${il.itemvo.item_price*il.item_count }" type="number" />
	 			<br>
	 			<fmt:parseNumber var="point" value="${(il.itemvo.item_price*il.item_count)*5/100 }" integerOnly="true" />
	 			(<fmt:formatNumber value="${point}" type="number" />
	 			p)
	 		</td>
	 		<td>
	 			${il.item_count }
	 		</td>
	 		


	 			<td>
	 			<input type="hidden" value="${il.basket_idx }" name="in" class="basket_item_num">
	 			  <button style="border: none;
                     background-color:rgba( 255, 255, 255, 0.5 );" id="bkd${il.itemvo.item_num }">
	 			  <svg  xmlns="http://www.w3.org/2000/svg" width="16"
                      height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
				  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				  </svg>
				  </button>
				</td>
	 </tr>
	 </c:forEach>
		
	 </table>
	 <div class="cart-del-area">
			<button type="button" class="del-btn" id="del-btn">선택삭제</button>	 
	 </div>
	 	

	<div class="cart-btn">
		<button type="button" onclick="" class="button_order"> 주문하기 </button>
		</div>

	</div>
	</section>
		<script src="/resources/jps/js/userinfo.js"></script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>