// Get the modal
var modal = document.getElementsByClassName('myModal')[0];

// Get the button that opens the modal
var btn = document.getElementsByClassName("myBtn")[0];

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var user_num;
var user_point;

var user_state;

var modall = 0;

$(function(){
	$(document).on('click', '.myBtn', function(){
		
		// Get the modal
		modall = $(this).closest('tr').prevAll().length/2 - 1;
		modal = document.getElementsByClassName('myModal')[modall];
		
		// Get thevar button that opens the modal
		btn = document.getElementsByClassName("myBtn")[modall];
		
		// Get the <span> element that closes the modal
		span = document.getElementsByClassName("close")[modall];
		
		user_nickname = document.getElementsByClassName("modal_user_nickname")[modall];
		
		user_num = document.getElementsByClassName("modal_user_num")[modall];
		
		user_point = document.getElementsByClassName("modal_user_point")[modall];
		
		// When the user clicks on the button, open the modal
		// $(".myModal:nth-child("+modall+")").css("display","block");
		modal.style.display = "block";
	});
	
	// When the user clicks on <span> (x), close the modal
	$('.close').on("click", function(){
		modal.style.display = "none";
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	$(".updatePoint").on("click",function(){
		var check = confirm(user_nickname.value + " 님에게 " + user_point.value + "포인트를 지급하시겠습니까?");
		if(check){		
			$.ajax({
				type: 'post',
				url: './updatePoint',
				data: { user_num: user_num.value, user_point: user_point.value},
				success: function(data) {
					if (data == 1) {
						alert("지급이 완료 되었습니다.");
						location.reload();
					} else {
						alert("지급에 실패 하였습니다.");
						document.getElementsByClassName("modal_user_point")[modall].value = 0;
					}
				}
			});
		} else {
			alert('취소 되었습니다.');
			document.getElementsByClassName("modal_user_point")[modall].value = 0;
		}
	});
	
	$(".resetPW").on("click", function(){
		modall = $(this).closest('tr').prevAll().length/2 - 1;
		user_nickname = document.getElementsByClassName("modal_user_nickname")[modall];
		user_num = document.getElementsByClassName("modal_user_num")[modall];
		
		var check = confirm(user_nickname.value+" 님의 비밀번호를 초기화 하시겠습니까?");
		if(check) {
			$.ajax ({
				type: 'post',
				url: './resetPw',
				data: {user_num: user_num.value},
				success: function(data) {
					if (data == 1) {
						alert(user_nickname.value+" 님의 비밀번호가 초기화 되었습니다.");
					} else {
						alert("비밀번호가 초기화에 실패 하였습니다.");
					}
				}
			});
		} else {
			alert("취소 되었습니다.");
		}
	});

	$(document).on('click', '.userStateBtn', function(){
		
		// Get the modal
		modall = $(this).closest('tr').prevAll().length/2 - 1;
		modal = document.getElementsByClassName('state_modal')[modall];
		
		// Get thevar button that opens the modal
		btn = document.getElementsByClassName("userStateBtn")[modall];
		
		// Get the <span> element that closes the modal
		span = document.getElementsByClassName("state_close")[modall];
		
		user_nickname = document.getElementsByClassName("modal_user_nickname")[modall];
		
		user_num = document.getElementsByClassName("modal_user_num")[modall];
		
		user_point = document.getElementsByClassName("modal_user_point")[modall];
		
		user_state = document.getElementsByClassName("update_state")[modall];
		
		// When the user clicks on the button, open the modal
		// $(".myModal:nth-child("+modall+")").css("display","block");
		modal.style.display = "block";
	});
	
	// When the user clicks on <span> (x), close the modal
	$('.state_close').on("click", function(){
		modal.style.display = "none";
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	$(".updateUserState").on("click",function(){
		var updateStateText = "";
		switch(user_state.value) {
			case "0":
				updateStateText = "일반 회원(이메일 미인증)";
				break;
			case "1":
				updateStateText = "일반 회원";
				break;
			case "2":
				updateStateText = "관리자";
				break;
			case "-10":
				updateStateText = "탈퇴 유예";
				break;
			default :
				updateStateText = "알 수 없음";
		}
		
		var check = confirm(user_nickname.value + " 님의 회원등급을 "+ updateStateText +"(으)로 변경하시겠습니까?");
		if(check){		
			$.ajax({
				type: 'post',
				url: './updateState',
				data: { user_num: user_num.value, user_state: user_state.value},
				success: function(data) {
					if (data == 1) {
						alert("변경이 완료 되었습니다.");
						location.reload();
					} else {
						alert("변경에 실패 하였습니다.");
					}
				}
			});
		} else {
			alert('취소 되었습니다.');
		}
	});
});