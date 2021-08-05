<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/itemInsert.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">
<script type="text/javascript">
	var msg = "${msg }";

	if(msg == "success") {
		alert("등록완료");
	}
</script>
</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<h1>상품 목록</h1>
		
		<table class="userList">
			<tr>
				<td class="user_num">회원 번호</td>
				<td class="user_id">ID</td>
				<td class="user_pw">PW</td>
				<td class="user_name">이름</td>
				<td class="user_email">Email</td>
				<td class="user_nickname">닉네임</td>
				<td class="user_birth">생년월일</td>
				<td class="user_gender">성별</td>
				<td class="user_addr">주소</td>
				<td class="user_phone">전화번호</td>
				<td class="user_point">포인트</td>
				<td class="user_bank">은행</td>
				<td class="user_account">계좌번호</td>
				<td class="user_create_date">회원 가입일</td>
				<td class="user_readcount">마지막 로그인</td>
				<td class="user_etc">비고</td>
			</tr>
		<c:forEach var="ItemVO" items="${itemlist }">
			<tr>
				<td class="item_num">${ItemVO.item_num }</td>
				<td class="item_name">${ItemVO.item_name }</td>
				<td class="item_category">${ItemVO.item_category }</td>
				<td class="item_price">${ItemVO.item_price }</td>
				<td class="item_create_date"><fmt:formatDate value="${ItemVO.item_create_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class="item_readcount">${ItemVO.item_read_count }</td>
				<td class="item_etc"></td>
			</tr>
		</c:forEach> 
		</table>
	</div>

</body>
</html>