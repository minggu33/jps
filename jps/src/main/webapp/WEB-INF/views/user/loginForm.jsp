<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>

<link href="/resources/jps/css/loginForm.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>


<div class="loginForm">
<h1>login	</h1>


  <form action="/user/login" method="post">
  <div class="inputdiv">
    
    
    <input type="text" name="user_id" id="user_id" placeholder="아이디를 입력해 주세요." style="text-align: center;"><br>
  
    <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호를 입력해 주세요." style="text-align: center;"><br>
    </div>
    <br>
    
    <div id="search">
    <a href="/user/findId" >아이디 찾기 </a> ㅣ 
    <a href="#"> 비밀번호 찾기 </a>
    </div>
    <button type="submit" id="loginbtn" >로그인</button><br>
    <button type="button" id="joinbtn"
        onclick="location.href='/user/join'">회원가입</button>
  </form>


</div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>