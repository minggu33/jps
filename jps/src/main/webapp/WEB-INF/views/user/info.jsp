<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>user/info.jsp</h1>
  
  <h2> 회원정보 조회  </h2>
  <%
    //DB에서 전달받은 정보를 저장(request 영역)
 	
    //컨트롤러에서 저장한 정보
    //model.addAttribute("infoVO", infoVO); 가져오기 el표현식 사용

    
    %>
  
  
  <table border="1">
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
      <td>${infoVO.user_gender }</td>
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
  </table>
  
  
  <h3><a href="./logout">로그아웃 </a></h3>
  
  <h3><a href="../home">메인페이지로</a></h3>  


</body>
</html>