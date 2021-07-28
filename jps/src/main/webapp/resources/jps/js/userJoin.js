$(document).ready(function() {

	$('#id').on('keyup', function() {
		var valueOfId = $('#id').val();
		var lengthOfId = $('#id').val().length;
		if (lengthOfId < 1) {
			$('#idCheckText').html("아이디를 입력해 주세요.");
			$('#idCheckText').css('color', 'red');
			document.fr.idcheck.value = 0;
		} else {
			$.ajax({
				type: 'post',
				url: '',
				data: { valueOfId: valueOfId },
				success: function(data) {
					if (data == 1) {
						$('#idCheckText').html("이미 사용중인 아이디 입니다.");
						$('#idCheckText').css('color', 'red');
						document.fr.idcheck.value = 0;
					} else {
						$('#idCheckText').html("사용 가능한 아이디 입니다.");
						$('#idCheckText').css('color', 'green');
						document.fr.idcheck.value = 1;
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
			document.fr.pwcheck.value = 0;
		} else {
			if (valueOfPw == valueOfPw2) {
				$('#pwCheckText').html("확인이 완료 되었습니다.");
				$('#pwCheckText').css('color', 'green');
				document.fr.pwcheck.value = 1;
			} else {
				$('#pwCheckText').html("확인 비밀번호가 다릅니다.");
				$('#pwCheckText').css('color', 'red');
				document.fr.pwcheck.value = 0;
			}
		}
	});

	$('#email').on('keyup', function() {
		var valueOfEmail = $('#email').val();
		var lengthOfEmail = $('#email').val().length;
		if (lengthOfEmail < 1) {
			$('#emailCheckText').html("아이디를 입력해 주세요.");
			$('#emailCheckText').css('color', 'red');
			document.fr.emailcheck.value = 0;
		} else {
			$.ajax({
				type: 'post',
				url: '',
				data: { valueOfEmail: valueOfEmail },
				success: function(data) {
					if (data == 1) {
						$('#emailCheckText').html("이미 사용중인 이메일 입니다.");
						$('#emailCheckText').css('color', 'red');
						document.fr.emailcheck.value = 0;
					} else {
						$('#emailCheckText').html("사용 가능한 이메일 입니다.");
						$('#emailCheckText').css('color', 'green');
						document.fr.emailcheck.value = 1;
					}
				}
			});
		}
	});

	$('#tel').on('keyup', function() {
		var valueOfTel = $('#tel').val();
		var lengthOfTel = $('#tel').val().length;
		if (lengthOfTel < 1) {
			$('#telCheckText').html("전화번호를 입력해 주세요.");
			$('#telCheckText').css('color', 'red');
		} else {
			$.ajax({
				type: 'post',
				url: 'tel_check2.jsp',
				data: { valueOfTel: valueOfTel },
				success: function(data) {
					if (data == 1) {
						$('#telCheckText').html("이미 사용중인 전화번호 입니다.");
						$('#telCheckText').css('color', 'red');
					} else {
						$('#telCheckText').html("사용 가능한 전화번호 입니다.");
						$('#telCheckText').css('color', 'green');
					}
				}
			});
		}
	});

	var preLengthOfTel = $('#tel').val().length;
	$('#tel').on('keyup', function() {
		var valueOfTel = $('#tel').val();
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