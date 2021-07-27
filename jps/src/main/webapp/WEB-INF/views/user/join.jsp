<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<h1>회원가입</h1>

	<fieldset>
		<legend>회원가입</legend>
		<form>
			아이디 : <input type="text" name="user_id"><br>
			비밀번호 : <input type="password" name="user_pw"><br>
			비밀번호 확인 : <input type="password" name="user_ch_pw"><br>
			이메일 : <input type="email" name="user_email"><br>
			이름 : <input type="text" name="user_name"><br>
			닉네임 : <input type="text" name="user_nickname"><br>
			
			생년/월/일 : <input type="date" name="user_brith" value="1990-01-01"><br>
			
			성별 : 
			<label><input type="radio" name="gender" id="gender" value="1">남</label>
			<label><input type="radio" name="gender" id="gender" value="2">여</label>
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
			
			휴대전화 : <input type="tel" name="user_phone">
			
			<hr>
			자주 쓰는 은행 등록 <br>
			은행 : <input type="text" name="user_bank">
			
			<hr>
			<input type="submit" value="가입하기">
			<input type="reset" value="다시작성하기">
		</form>
	</fieldset>





	<%@ include file="../include/footer.jsp"%>
</body>
</html>