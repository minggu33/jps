<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원탈퇴 </title>
  <link href="/resources/jps/css/userinfo.css" rel="stylesheet">
  <link href="/resources/jps/css/loginForm.css" rel="stylesheet">
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
    <!-- 본문 -->
    <div class="loginForm">
	    <h2>Drop</h2>
	    	 <form action="/user/drop" method="post" name="fr">
  				<div class="inputdiv">
				    <input type="text" name="user_id" id="user_id" placeholder="아이디를 입력해 주세요." style="text-align: center;" size="30">
				    <br>
				    <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호를 입력해 주세요." style="text-align: center;" size="30"><br>
			    	<input type="submit" value="탈퇴하기">
			    </div>
			    <br>
			 </form>
    </div>
    
    
    <!-- 본문 -->
    <script src="/resources/jps/js/userinfo.js"></script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>