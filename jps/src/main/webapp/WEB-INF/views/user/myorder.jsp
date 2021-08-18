<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>
  <link href="/resources/jps/css/userinfo.css" rel="stylesheet">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta charset="UTF-8">
<title>JPS</title>
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
    	<dd><a href="/user/myorder">주문내역 </a></dd>
    	<dd><a href="/user/drop">회원탈퇴</a></dd>
    	   	
    	</dl>
    </nav>
    <!-- 왼쪽 nav bar -->
  <section class="mypage-cont" style="margin-bottom:100px;"> 
  	<header class="mypage-header"><h1>My order</h1></header>


	<table class="mypage-table" style="text-align: center;">
			<tr>
			<td>주문 일자</td> 
			<td>결제 방식</td>
			<td>결제 금액</td>
			</tr>
		<c:forEach var="OrderVO" items="${orderVo }">
			<tr>
				<!-- 주문정보 -->
					<td width="150">${fn:split(OrderVO.order_date, ' ')[0] }</td>
					<td width="150">
					${OrderVO.order_method }
					</td>
					<td width="150">${OrderVO.order_total_price }</td>
				<!-- 주문정보 -->
			</tr>
		</c:forEach>
	</table>
	</section>
	<%@ include file="../include/footer.jsp" %>

</body>
</html>