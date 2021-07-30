<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link href="/resources/jps/css/userinfo.css" rel="stylesheet">

</head>
<body>

<%@ include file="../include/header.jsp" %>


  
    <nav class="mypage-nav">
    	<dl class="mypage-menu"> 
    	
    	<dt> 마이 페이지  </dt>
    	<dd><a href="#">내 정보 </a></dd>
    	<dd><a href="#">찜 목록 </a></dd>
    	<dd><a href="#">장바구니 </a></dd>
    	<dd><a href="#">주문내역 </a></dd>
    	   	
    	</dl>
    </nav>
  
  <section class="mypage-cont">
  	<header class="mypage-header"><h1>기본 회원 정보 </h1></header>
  		<table class="mypage-table">
  			<colgroup>
  				<col style="width:190px">
  				<col style="width:*">
  				<col style="width:50%">
  			</colgroup>
  			<tbody>
    <tr>
      <td>아이디</td>
      <td>${infoVO.user_id}</td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td>${infoVO.user_pw }</td>
    </tr>
    <tr>
      <td>이름</td>
      <td>${infoVO.user_name}</td>
    </tr>
 
    <tr>
      <td>생년월일 </td>
      <td>${infoVO.user_birth}</td>
    </tr>
    <tr>
      <td>성별</td>
      
      <td>	
      <c:choose>
      	<c:when test="${infoVO.user_gender ==1}">
      		남자
      	</c:when>
      	<c:otherwise>
      		여
      	</c:otherwise>
      </c:choose>
      </td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>${infoVO.user_email }</td>
    </tr>
    <tr>
      <td>연락처 </td>
      <td>${infoVO.user_phone }</td>
    </tr>
    
   <tr>
      <td>가입일자</td>
      <td>${infoVO.user_join_date }</td>
    </tr>
    </tbody>
  </table>
  
  
 

</section>

<%@ include file="../include/footer.jsp" %>

</body>
</html>