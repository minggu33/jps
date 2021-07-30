<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 </title>

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
      <td><button>비밀번호 변경</button></td>
    </tr>
     <!-- 비밀번호 변경  -->
     <tr style="display: none;">
     	<td>present password</td>
     	
     	
     </tr>
    <tr>
      <td>이름</td>
      <td>${infoVO.user_name}</td>
      <td><button>이름 변경</button></td>
    </tr>
 
    <tr>
      <td>생년월일 </td>
      <td>${infoVO.user_birth}</td>
      <td><button>생년월일 변경</button></td>
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
      <td><button>이메일 변경</button></td>
    </tr>
    <tr>
      <td>연락처 </td>
      <td>${infoVO.user_phone }</td>
      <td><button>연락처 변경</button></td>	
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