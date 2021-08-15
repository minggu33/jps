<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jps.domain.UserVO"%>


<html>
<head>
  <meta charset="utf-8">
  <title>JPS Market</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="/resources/tmp/img/favicon.png" rel="icon">
  <link href="/resources/tmp/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
    rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="/resources/tmp/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/tmp/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/resources/tmp/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="/resources/tmp/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/tmp/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/tmp/css/style.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: MyPortfolio
    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com/
  ======================================================= -->	
  
  <%
  	String user_num = (String)session.getAttribute("user_num");
  %>
 
  
</head>
<body>

  <div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
    <div class="container py-2 py-md-5">
      <div class="row align-items-start">
        <div class="col-md-2">
          <ul class="custom-menu">
            <li class="active"><a href="/home">Home</a></li>
            <li><a href="/notice/noticelist">Notice</a></li>
            <li><a href="/item/itemlist">Shopping</a></li>
            <li><a href="works.html">Works</a></li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-6 d-none d-md-block  mr-auto">
          <div class="tweet d-flex">
            <span class="icofont-twitter text-white mt-2 mr-3"></span>
            <div>
              <p><em>jps스토어에서 판매되는 모든 브랜드 제품은 정식제조, 정식수입원을 통해 유통되는 100% 정품임을 보증합니다. <br>
              일부 상품의 경우 주식회사 무신사는 통신판매의 당사자가 아닌 통신판매중개자로서
				상품, 상품정보, 거래에 대한 책임이 제한될 수 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.
              </em></p>
            </div>
          </div>
        </div>
        <div class="col-md-4 d-none d-md-block">
          <h3>고객 센터</h3>
          <p>[ FAQ1:1질문하기이메일문의 ] <br>

			대표전화 1544-0000 전화문의 <br>
			
			1번 : 배송 / 교환 / 환불관련 <br>
			
			2번 : 결제 / 회원 관련 <br>
			
			ㄴ상품 문의 > 각 상품 Q&A 이용 <br>
			
			오전9시-오후6시(토,일, 공휴일 휴무) </p>
        </div>
      </div>

    </div>
  </div>
  <%
  if(user_num == null){
  %>
  	<div class="userinfo">
  		<a href="/user/login">login</a>
  		<a href="/user/join">join</a>
  	</div>
  <%
  }else{
  %>
    <div class="userinfo">
      Welcome!  
      <a href="/user/info">${userVO.user_nickname} </a>님 |
      <a href="/user/info">내 정보 </a> |
      <a href="/user/like">좋아요 </a> |
      <a href="/user/cart">장바구니 </a> |
      <a href="/user/logout">로그아웃 </a>

    </div>
   <%
  }
   %>
 
  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="/home">JPS Market</a>

      <a href="#" class="burger" data-toggle="collapse" data-target="#main-navbar">
        <span></span>
      </a>

    </div>
  </nav>

</body>
  

 </html>