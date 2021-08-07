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
		<h1>회원 목록</h1>
		
		<table class="userList">
			<tr>
				<td class="user_num" rowspan="2">회원<br>번호</td>
				<td class="user_id">ID</td>
				<td class="user_pw">PW</td>
				<td class="user_name">이름</td>
				<td class="user_email">Email</td>
				<td class="user_addr" rowspan="2">주소</td>
				<td class="user_point" rowspan="2">포인트</td>
				<td class="user_bank">은행</td>
				<td class="user_join_date">회원 가입일</td>
				<td class="user_state" rowspan="2">회원 등급</td>
				<td class="user_etc" rowspan="2">비고</td>
			</tr>
			<tr>
				<td class="user_gender">성별</td>
				<td class="user_birth">생년월일</td>
				<td class="user_nickname">닉네임</td>
				<td class="user_phone">전화번호</td>
				<td class="user_account">계좌번호</td>
				<td class="user_late_login">마지막 로그인</td>
			</tr>
		<c:forEach var="UserVO" items="${userlist }">
			<tr class="user_num_${UserVO.user_num }">
				<td class="user_num" rowspan="2">${UserVO.user_num }</td>
				<td class="user_id">${UserVO.user_id }</td>
				<td class="user_pw">********</td>
				<td class="user_name">${UserVO.user_name }</td>
				<td class="user_email"><div class="slideText">${UserVO.user_email }</div></td>
				<td class="user_addr" rowspan="2"><div class="slideText">${UserVO.user_addr }</div></td>
				<td class="user_point" rowspan="2">${UserVO.user_point }<br>
					<button class="myBtn">포인트<br>추가하기</button>
				    <!-- The Modal -->
				    <div class="myModal">
				      <!-- Modal content -->
				      <div class="modal-content">
				        <span class="close">&times;</span>                                                               
				        <p>${UserVO.user_nickname }(${UserVO.user_name })
				        <input type="hidden" class="modal_user_nickname" value="${UserVO.user_nickname }">
				        <input type="hidden" class="modal_user_num" value="${UserVO.user_num }"><br>
				        보유 포인트 : ${UserVO.user_point }<br>
				        지급 포인트 : <input type="number" step="10" class="modal_user_point" value="0"><button class="updatePoint">지급하기</button>
				        </p>
				      </div>
				    </div>
				</td>
				<td class="user_bank">${UserVO.user_bank }</td>
				<td class="user_join_date">${UserVO.user_join_date }</td>
				<td class="user_state" rowspan="2">
					<c:if test="${UserVO.user_state eq 0}">
						일반 회원
					</c:if>
					<c:if test="${UserVO.user_state eq 1}">
						일반 회원
					</c:if>
					<c:if test="${UserVO.user_state eq 2}">
						관리자
					</c:if>
					<c:if test="${UserVO.user_state eq -10}">
						탈퇴 유예
					</c:if>
				</td>
				<td class="user_etc" rowspan="2">
					<button class="resetPW">비밀번호<br>초기화</button>
				</td>
			</tr>
			<tr class="user_num_${UserVO.user_num }">
				<td class="user_gender">
					<c:if test="${UserVO.user_gender eq 1}">
						남
					</c:if>
					<c:if test="${UserVO.user_gender eq 2}">
						여
					</c:if>
				</td>
				<td class="user_birth">${UserVO.user_birth }</td>
				<td class="user_nickname">${UserVO.user_nickname }</td>
				<td class="user_phone">${UserVO.user_phone }</td>
				<td class="user_account"><div class="slideText">${UserVO.user_account }</div></td>
				<td class="user_late_login">${UserVO.user_late_login }</td>
			</tr>
		</c:forEach> 
		</table>
	</div>

 
<script src="/resources/jps/js/admin_user.js"></script>

</body>
</html>