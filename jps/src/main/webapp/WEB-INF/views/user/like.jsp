<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 좋아요 목록 </title>
 
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
    	<dd><a href="/user/drop">회원탈퇴</a></dd>
    	</dl>
    </nav>
    <!-- 왼쪽 nav bar -->
	
	<section class="mypage-cont" >
	<header class="mypage-header">
		<h1>좋아요 </h1>
	</header>
	<body>
		<table border="1">
		<c:forEach var="ItemVO" items="${ilvo }">
			<tr>
				<td width="80" style="text-align: center;">${ItemVO.item_category }</td>
				<td width="500" style="text-align: center;">${ItemVO.item_name }</td>
				<td><img class="img-fluid" style="width:62px; height:75px;" src="/resources/jps/upload/insertItem/${fn:split(ItemVO.item_img,',')[0]}"></td>
				<td width="200" style="text-align: center;">${ItemVO.item_price } ￦</td>
				<td><input type="button" value="장바구니"><br><input type="button" value="주문하기"></td>
			</tr>
			
		</c:forEach>
		</table>
	</body>
	
	
	
	</section>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>