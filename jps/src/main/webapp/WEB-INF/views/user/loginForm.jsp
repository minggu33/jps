<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<h1>login	</h1>


  <form action="/user/login" method="post">
    아이디 : <input type="text" name="user_id"><br>
    비밀번호 : <input type="password" name="user_pw"><br>
    
    <input type="submit" value="로그인"> 
    <input type="button" value="회원가입" 
        onclick="location.href='/user/join'"
    >  
    
  </form>





<%@ include file="../include/footer.jsp" %>
</body>
</html>