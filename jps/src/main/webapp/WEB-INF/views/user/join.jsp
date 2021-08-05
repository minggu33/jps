<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="/resources/jps/css/userjoin.css" rel="stylesheet">
<link href="/resources/jps/css/jps.css" rel="stylesheet">

</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<main id="main">
		
		<fieldset>
			<legend class="mainText"><h1>회원가입</h1></legend>
			<form name="fr" method="post" action="./join" onsubmit="return checkJoin()">
				아이디 : <input type="text" name="user_id" id="id" class="under_line_solid_gray"><br>
				<input type="hidden" name="idCheck">
				<div id="idCheckText" class="checkText">아이디를 입력해주세요.</div>
				비밀번호 : <input type="password" name="user_pw" id="pw" class="under_line_solid_gray"><br>
				비밀번호 확인 : <input type="password" name="user_ch_pw" id="pw2" class="under_line_solid_gray"><br>
				<input type="hidden" name="pwCheck">
				<div id="pwCheckText">확인 비밀번호를 입력해주세요.</div>
				이메일 : <input type="email" name="user_email" id="email" class="under_line_solid_gray"><br>
				<input type="hidden" name="emailCheck">
				<div id="emailCheckText" class="checkText">이메일을 입력해주세요.</div>
				이름 : <input type="text" name="user_name" class="under_line_solid_gray"><br>
				닉네임 : <input type="text" name="user_nickname" id="nickname" class="under_line_solid_gray"><br>
				<input type="hidden" name="nicknameCheck">
				<div id="nicknameCheckText" class="checkText">닉네임을 입력해주세요.</div>
				
				생년/월/일 : <input type="date" name="user_birth" value="1990-01-01" class="under_line_solid_gray"><br>
				
				성별 : 
				<label><input type="radio" name="user_gender" value="1">남</label>
				<label><input type="radio" name="user_gender" value="2">여</label>
				<br>
				
				휴대전화 : <input type="tel" name="user_phone" id="tel" maxlength="13" class="under_line_solid_gray"><br>
				<input type="hidden" name="phoneCheck">
				<div id="phoneCheckText" class="checkText">전화번호 입력해주세요.</div>
				
				주소 : <br>
				<input type="text" id="sample4_postcode" name="postcode" readonly placeholder="우편번호" class="under_line_solid_gray">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="border_none"><br>
				<input type="text" id="sample4_roadAddress" name="roadAddress" readonly placeholder="도로명주소" class="under_line_solid_gray">
				<input type="hidden" id="sample4_jibunAddress" name="jibunAddress" readonly placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" class="under_line_solid_gray">
				<input type="text" id="sample4_extraAddress" name="extraAddress" readonly placeholder="참고항목" class="under_line_solid_gray">
				
				<input type="hidden" name="user_addr">
				
				<script src="/resources/daum_postcode/js/postcode.js"></script><br>
				
				
				
				<hr>
				자주 쓰는 은행 등록 <br>
				은행 : <input type="text" name="user_bank" class="under_line_solid_gray"><br>
				계좌 번호 : <input type="text" name="user_account" class="under_line_solid_gray">
				
				<hr>
				<div id="submit_button">
					<input type="submit" value="가입하기" class="border_none">
					<input type="reset" value="다시작성하기" onclick="resetInfo()" class="border_none">
				</div>
			</form>
		</fieldset>
		
		
		<script src="/resources/jps/js/userJoin.js"></script><br>
	</main>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>