<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<main id="main">
		<h1>회원가입</h1>
	
		<fieldset>
			<legend>회원가입</legend>
			<form name="fr" method="post" action="./join">
				아이디 : <input type="text" name="user_id" id="id"><br>
				<div id="idCheckText" class="checkText">아이디를 입력해주세요.</div><br>
				비밀번호 : <input type="password" name="user_pw" id="pw"><br>
				비밀번호 확인 : <input type="password" name="user_ch_pw" id="pw2"><br>
				<div id="pwCheckText">확인 비밀번호를 입력해주세요.</div><br>
				이메일 : <input type="email" name="user_email" id="email"><br>
				<div id="emailCheckText" class="checkText">이메일을 입력해주세요.</div><br>
				이름 : <input type="text" name="user_name"><br>
				닉네임 : <input type="text" name="user_nickname"><br>
				<div id="nicknameCheckText" class="checkText">닉네임을 입력해주세요.</div><br>
				
				생년/월/일 : <input type="date" name="user_brith" value="1990-01-01"><br>
				
				성별 : 
				<label><input type="radio" name="gender" value="1">남</label>
				<label><input type="radio" name="gender" value="2">여</label>
				<br>
				
				주소 : 
				<input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				
				<script src="/resources/daum_postcode/js/postcode.js"></script><br>
				
				휴대전화 : <input type="tel" name="user_phone" id="tel" maxlength="13"><br>
				<div id="telCheckText" class="checkText">전화번호 입력해주세요.</div><br>
				
				<hr>
				자주 쓰는 은행 등록 <br>
				은행 : <input type="text" name="user_bank"><br>
				계좌 번호 : <input type="text" name="user_account">
				
				<hr>
				<input type="submit" value="가입하기">
				<input type="reset" value="다시작성하기">
			</form>
		</fieldset>
		
		<script src="/resources/jps/js/userJoin.js"></script><br>
	</main>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>