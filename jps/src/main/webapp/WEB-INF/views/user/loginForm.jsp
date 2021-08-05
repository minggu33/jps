<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<style type="text/css">
.loginForm{
	text-align: center;
	margin-bottom:100px;
}
.inputdiv label{
	width:165px;
	margin: 10px;
}
.loginForm h1{
	margin-bottom:40px;
}
.loginForm button{
	height: 32px;
    line-height: 30px;
    padding-top: 0;
    font-family: "Gulim", "Apple SD Gothic", Auto, sans-serif !important;
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
    color: #000000;
    min-width: 100px;
    margin-right:30px;
}

</style>



</head>
<body>
<%@ include file="../include/header.jsp" %>


<div class="loginForm">
<h1>login	</h1>


  <form action="/user/login" method="post">
  <div class="inputdiv">
    <label>아이디 </label> 
    <input type="text" name="user_id"><br>

  
    <label>비밀번호 </label>
    <input type="password" name="user_pw"><br>
    </div>
    <br>
    
    <button type="submit" >로그인</button>
    <button type="button"
        onclick="location.href='/user/join'">회원가입</button>
    
    
  </form>


</div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>