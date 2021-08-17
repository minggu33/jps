<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 </title>

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
    	<dd><a href="/user/myorder">주문내역 </a></dd>
    	<dd><a href="/user/drop">회원탈퇴</a></dd>
    	   	
    	</dl>
    </nav>
    <!-- 왼쪽 nav bar -->
    
    <!-- 마이페이지 기본 회원 정보  -->
  <section class="mypage-cont" style="margin-bottom:100px;">
 
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
      <td><strong>${infoVO.user_id}</strong></td>
    </tr>
    <tr id="currentpw">
      <td>비밀번호</td>
      <td><strong>******</strong><input type="hidden"  id="cpw1" value="${infoVO.user_pw}"></td>     
      <td><button id="changepwbtn">비밀번호 변경</button></td>
    </tr>
     <!-- 비밀번호 변경  -->
     
     <tr id="changepw" style="display:none;">
     
     	<td>비밀번호 </td>
     	
     	<td>
     		<div class="divpw">
		     	<label><strong>현재 비밀번호</strong> </label>
		     	<input type="password" id="cpw">
		     	<span id="pwCheckText" style="margin-left:20px;"></span>	
	    	 </div>	
	    	 <div class="divpw">
		     	<label><strong>신규 비밀번호 </strong> </label>
		     	<input type="password" id="npw">
		     	<span id="pwCheckText1" style="margin-left:20px;"></span>
	     	</div>
	     	<div class="divpw">
		     	<label><strong>신규 비밀번호 재확인 </strong> </label>
		     	<input type="password" id="npw1">
		     	<span id="pwCheckText2" style="margin-left:20px;"></span>
	     	</div>
	     	<br>
	     	<button id="confirmpwbtn" style="margin:0 50px;" onclick="pwchange()">변경</button>
     		<button id="canclepwbtn">취소 </button>
     	</td>
     	
     	
     </tr>
     
    <tr>
      <td>이름</td>
      <td><strong>${infoVO.user_name}</strong></td>
   
    </tr>
    
 	<tr id="currentNick">
      <td>닉네임</td>
      <td><strong>${infoVO.user_nickname}</strong></td>
      <td><button  id="changeNickbtn">닉네임 변경</button></td>
    </tr>
    <!--  닉네임 변경  -->
     <tr id="neweNick" style="display:none;">
     	<td> 닉네임 </td>
     	<td colspan="2"> 
	     	길이는 최대 15자 이내로 작성해주세요. <br>
			중복 닉네임 불가합니다.<br>
			이모티콘 및 일부 특수문자 사용 불가합니다. &<>()'/"<br>
			<input type="text" id="nNick" style="min-width:200px; margin:20px 0;">
			<span style="margin-left:20px;" id="nickCheckText"></span><br>
			<button id="confirmNickbtn" onclick="nickChange()">변경</button>
			<button id="cancleNickbtn">취소</button>
     	</td>
     
     
     
    <tr>
      <td>생년월일 </td>
      <td><strong>${infoVO.user_birth}</strong></td>
      
    </tr>
    <tr>
      <td>성별</td>
      
      <td>	<strong>
      <c:choose>
      	<c:when test="${infoVO.user_gender ==1}">
      		남자
      	</c:when>
      	<c:otherwise>
      		여
      	</c:otherwise>
      </c:choose>
      </strong>
      </td>
    </tr>
    <tr id="currentEmail">
      <td>이메일</td>
      <td><strong>${infoVO.user_email }</strong></td>
      <td><button id="changeEmailbtn">이메일 변경</button></td>
    </tr>
    <tr id="newEmail" style="display:none;">
    	<td>이메일</td>
    	<td colspan="2">
    		<input type="text" id="nEmail" placeholder="이메일 입력"><button id="sendEmailbtn">인증</button><br>
    		<input type="text" id="nEmailCode" placeholder="인증번호 입력"> 
    		<span id="newMail_warn"></span><br>
    		<button id="newMailConfirmbtn" style="margin-right:15px;">변경</button>
    		<button id="cancleEmailbtn">취소</button>
    	</td>
    </tr>
    <tr>
      <td>연락처 </td>
      <td><strong>${infoVO.user_phone }</strong></td>
      <td><button>연락처 변경</button></td>	
    </tr>
    
   <tr>
      <td>가입일자</td>
      <td><strong>${infoVO.user_join_date }</strong></td>
    </tr>
    
    </tbody>
  </table>
  
</section>
   <!-- 마이페이지 기본 회원 정보  -->
  
  
  




 
	<script src="/resources/jps/js/userinfo.js"></script>

<%@ include file="../include/footer.jsp" %>

</body>
</html>