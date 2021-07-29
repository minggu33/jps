$(document).ready(function() {

	$('#id').on('keyup', function() {
		var valueOfId = $('#id').val();
		var lengthOfId = $('#id').val().length;
		if (lengthOfId < 1) {
			$('#idCheckText').html("아이디를 입력해 주세요.");
			$('#idCheckText').css('color', 'red');
			document.fr.idCheck.value = 0;
		} else {
			$.ajax({
				type: 'post',
				url: './checkId',
				data: { user_id: valueOfId },
				success: function(data) {
					if (data == 1) {
						$('#idCheckText').html("이미 사용중인 아이디 입니다.");
						$('#idCheckText').css('color', 'red');
						document.fr.idCheck.value = 0;
					} else {
						$('#idCheckText').html("사용 가능한 아이디 입니다.");
						$('#idCheckText').css('color', 'green');
						document.fr.idCheck.value = 1;
					}
				}
			});
		}
	});

	$('#pw2').on('keyup', function() {
		var valueOfPw = $('#pw').val();
		var valueOfPw2 = $('#pw2').val();
		var lengthOfPw2 = $('#pw2').val().length;
		if (lengthOfPw2 < 1) {
			$('#pwCheckText').html("확인 비밀번호를 입력해 주세요.");
			$('#pwCheckText').css('color', 'red');
			document.fr.pwCheck.value = 0;
		} else {
			if (valueOfPw == valueOfPw2) {
				$('#pwCheckText').html("확인이 완료 되었습니다.");
				$('#pwCheckText').css('color', 'green');
				document.fr.pwCheck.value = 1;
			} else {
				$('#pwCheckText').html("확인 비밀번호가 다릅니다.");
				$('#pwCheckText').css('color', 'red');
				document.fr.pwCheck.value = 0;
			}
		}
	});

	$('#email').on('keyup', function() {
		var valueOfEmail = $('#email').val();
		var lengthOfEmail = $('#email').val().length;
		if (lengthOfEmail < 1) {
			$('#emailCheckText').html("이메일을 입력해 주세요.");
			$('#emailCheckText').css('color', 'red');
			document.fr.emailCheck.value = 0;
		} else {
			$.ajax({
				type: 'post',
				url: './checkEmail',
				data: { user_email: valueOfEmail },
				success: function(data) {
					if (data == 1) {
						$('#emailCheckText').html("이미 사용중인 이메일 입니다.");
						$('#emailCheckText').css('color', 'red');
						document.fr.emailCheck.value = 0;
					} else {
						$('#emailCheckText').html("사용 가능한 이메일 입니다.");
						$('#emailCheckText').css('color', 'green');
						document.fr.emailCheck.value = 1;
					}
				}
			});
		}
	});
	
	$('#nickname').on('keyup', function() {
		var valueOfNickname = $('#nickname').val();
		var lengthOfNickname = $('#nickname').val().length;
		if (lengthOfNickname < 1) {
			$('#nicknameCheckText').html("닉네임을 입력해 주세요.");
			$('#nicknameCheckText').css('color', 'red');
			document.fr.nicknameCheck.value = 0;
		} else {
			$.ajax({
				type: 'post',
				url: './checkNickname',
				data: { user_nickname: valueOfNickname },
				success: function(data) {
					if (data == 1) {
						$('#nicknameCheckText').html("이미 사용중인 닉네임 입니다.");
						$('#nicknameCheckText').css('color', 'red');
						document.fr.nicknameCheck.value = 0;
					} else {
						$('#nicknameCheckText').html("사용 가능한 닉네임 입니다.");
						$('#nicknameCheckText').css('color', 'green');
						document.fr.nicknameCheck.value = 1;
					}
				}
			});
		}
	});

	$('#tel').on('keyup', function() {
		var valueOfTel = $('#tel').val();
		var lengthOfTel = $('#tel').val().length;
		if (lengthOfTel < 1) {
			$('#phoneCheckText').html("전화번호를 입력해 주세요.");
			$('#phoneCheckText').css('color', 'red');
			document.fr.phoneCheck.value = 0;
		} else {
			$.ajax({
				type: 'post',
				url: './checkPhone',
				data: { user_phone: valueOfTel },
				success: function(data) {
					if (data == 1) {
						$('#phoneCheckText').html("이미 사용중인 전화번호 입니다.");
						$('#phoneCheckText').css('color', 'red');
						document.fr.phoneCheck.value = 0;
					} else {
						$('#phoneCheckText').html("사용 가능한 전화번호 입니다.");
						$('#phoneCheckText').css('color', 'green');
						document.fr.phoneCheck.value = 1;
					}
				}
			});
		}
	});

	var preLengthOfTel = $('#tel').val().length;
	$('#tel').on('keyup', function() {
		var lengthOfTel = $('#tel').val().length;

		console.log($('#tel').on('keyup'));
		
		if (preLengthOfTel == 4 || preLengthOfTel == 9) {
		} else {
			if (lengthOfTel == 3) {
				document.fr.tel.value += "-";
			}
			if (lengthOfTel == 8) {
				document.fr.tel.value += "-";
			}
		}
		preLengthOfTel = $('#tel').val().length;
	});
});

function checkJoin() {
	if(document.fr.user_id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.fr.user_id.focus();
		return false;
	}
	
	if(document.fr.idCheck.value == 0) {
		alert("사용하실수 없는 아이디 입니다.");
		document.fr.user_id.focus();
		return false;
	}
	
	
	if(document.fr.user_pw.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.fr.user_pw.focus();
		return false;
	}
	
	if(document.fr.user_ch_pw.value == "") {
		alert("확인 비밀번호를 입력해 주세요.");
		document.fr.user_ch_pw.focus();
		return false;
	}
	
	if(document.fr.pwCheck.value == 0) {
		alert("비밀번호를 확인해 주세요.");
		document.fr.user_pw.focus();
		return false;
	}
	
	if(document.fr.user_email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.fr.user_email.focus();
		return false;
	}
	
	if(document.fr.emailCheck.value == 0) {
		alert("사용하실수 없는 이메일 입니다.");
		document.fr.user_email.focus();
		return false;
	}
	
	if(document.fr.user_name.value == "") {
		alert("이름을 입력해 주세요.");
		document.fr.user_name.focus();
		return false;
	}
	
	if(document.fr.user_nickname.value == "") {
		alert("닉네임을 작성해 주세요.");
		document.fr.user_nickname.focus();
		return false;
	}
	
	if(document.fr.nicknameCheck.value == 0) {
		alert("사용하실수 없는 닉네임 입니다.");
		document.fr.user_nickname.focus();
		return false;
	}
	
	if(!(document.fr.user_gender.value == 1 || document.fr.user_gender.value == 2)) {
		alert("성별을 선택해 주세요.");
		return false;
	}
	
	if(document.fr.user_phone.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.fr.user_phone.focus();
		return false;
	}
	
	if(document.fr.phoneCheck.value == 0) {
		alert("사용하실수 없는 전화번호 입니다.");
		document.fr.user_nickname.focus();
		return false;
	}
	
	if(document.fr.postcode.value == "") {
		alert("주소를 입력해 주세요.");
		return false;
	}
	
	if(document.fr.detailAddress.value == "") {
		alert("상세 주소를 입력해 주세요.");
		document.fr.detailAddress.focus();
		return false;
	}
	
	document.fr.user_addr.value
	 = "(" + document.fr.postcode.value + ")"
	 + document.fr.roadAddress.value + ", "
	 + document.fr.detailAddress.value +
	 document.fr.extraAddress.value;
}

function resetInfo() {
	document.fr.idCheck.value = 0;
	document.fr.pwCheck.value = 0;
	document.fr.emailCheck.value = 0;
	document.fr.nicknameCheck.value = 0;
	document.fr.phoneCheck.value = 0;
}