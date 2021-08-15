/**
 * 회원 가입 유효성 검사 JS 파일
 * 
 * 아이디 : 이메일 형식
 * 닉네임 : 영문,한글 8글자 이내
 * 비밀번호 : 영문,숫자,특수문자 포함 8~20글자
 * 
 */
//이메일 형식 검사 정규식
var verifyEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//닉네임 형식 검사 정규식
var verifyNick = /[0-9]|[a-z]|[A-Z]|[가-힣]/;

var korCheck = /[가-힣]/;
var engCheck = /[a-z]/; 
var numCheck = /[0-9]/; 
var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/;
var pchk1= /^010([0-9]{8})$/;
var pchk2 = /^01([1|6|7|8|9])([0-9]{3})([0-9]{4})$/;


//유효성 체크 Flag
var idFlag = false;
var nickFlag = false;
var pwFlag = false;
var pwFlag1 = false;
var phoneFlag = false;
var addressFlag = false;
var address_plusFlag = false;
var email_Flag = false;

// 이메일 변경 인증 코드 
let E_code = "";



$(document).ready(function() {
		
	
	
	// 비밀번호 변경창 등장 
	$('#changepwbtn').click(function(){
	let currentPw = $('#currentpw');	
	let changePw = $('#changepw');
	if(changePw.css("display")=="none"){
		changePw.show();
		currentPw.hide();
	}else{
		changePw.hide();
		currentPw.show();
	}
	
	});
	
	// 비밀번호 변경창 취소 	
	$('#canclepwbtn').click(function(){
		$('#currentpw').show();
		$('#changepw').hide();
	});
	
	// 현재 비밀번호 확인
	$('#cpw').on('keyup',function(){
		let valcpw=$('#cpw').val();
		let valcpw1 = $('#cpw1').val();
		if(valcpw==valcpw1){
			$('#pwCheckText').html("현재 비밀번호와 일치합니다.");
			$('#pwCheckText').css('color','skyblue');
			pwFlag1 = true;
		}else{
			$('#pwCheckText').html("현재 비밀번호와 불일치합니다.");
			$('#pwCheckText').css('color','red');
			pwFlag1 = false;
		}
				
	});
	

	// 신규 비밀번호 유효성 검사 
	$('#npw').on('keyup',function(){
		let pw = $('#npw').val();
		let pw_check = $('#npw1').val();
		
		if(pw.length ==0){
			  $('#pwCheckText1').css('color','red');
     		 $('#pwCheckText1').html('비밀번호를 입력하여 주세요.');			
			pwFlag = false;			
		}else if(pw.length <8){
			$('#pwCheckText1').html('비밀번호는 8자리 이상이어야 합니다. ');
			$('#pwCheckText1').css('color','red');
			pwFlag = false;
		}
		else if(!engCheck.test(pw) || !numCheck.test(pw) || !specialCheck.test(pw)){
			$('#pwCheckText1').css('color','red');
      		$('#pwCheckText1').html('영문,숫자,특수문자를 포함해야 합니다.');
      		pwFlag = false;
		}else{
		$('#pwCheckText1').css('color','skyblue');
      		$('#pwCheckText1').html('사용가능한 비밀번호 입니다.');
      		}
	});
	
	// 비밀번호 변경 신규 비밀번호 유효성 검사 
	$('#npw1').on('keyup',function(){
		let pw = $('#npw').val();
		let pw_check = $('#npw1').val();
		
		if(pw != pw_check){
			$('#pwCheckText2').css('color','red');
    		  $('#pwCheckText2').html('비밀번호가 다릅니다.');
    		  pwFlag = false;
		}else if(pw == pw_check){
			$('#pwCheckText2').css('color','skyblue');
    		  $('#pwCheckText2').html('사용가능한 비밀번호 입니다. ');
    		  pwFlag = true;
		}
		
		
	});
	
	// 닉네임 변경 창 등장 
	$('#changeNickbtn').click(function(){
				
		let currentNick = $('#currentNick');
		let neweNick = $('#neweNick');
		if(neweNick.css("display")=="none"){
		neweNick.show();
		currentNick.hide();
	}else{
		neweNick.hide();
		currentNick.show();
	}			
});
	
	// 닉네임 유효성 검사
	$('#nNick').on('keyup',function(){
		let nNick = $('#nNick').val();
		
			
		if(nNick.length<1){
			$('#nickCheckText').css('color','red');
			$('#nickCheckText').html('닉네임을 입력해주세요. ');
			nickFlag = false;			
		}else if(nNick.length>15){
			$('#nickCheckText').css('color','red');
			$('#nickCheckText').html('15자 이상의 닉네임은 불가능합니다. ');
			nickFlag = false;	
		}else if(specialCheck.test(nNick)){
			$('#nickCheckText').css('color','red');
			$('#nickCheckText').html('이모티콘, 특수문자 사용 불가능합니다. ');
			nickFlag = false;
		}else{
			$.ajax({
				type : 'post',
				url:'./checkNickname',
				data:{user_nickname:nNick},
				success:function(data){
					if(data ==1){
						$('#nickCheckText').html('이미 사용중인 닉네임 입니다.');
						$('#nickCheckText').css('color','red');
						nickFlag = false;
					}else{
						$('#nickCheckText').html('사용 가능한 닉네임 입니다.');
						$('#nickCheckText').css('color','skyblue');
						nickFlag = true;
					}										
				}								
			});			
		}
		
		
	});
	
	// 닉네임  변경창 취소 	
	$('#cancleNickbtn').click(function(){
		$('#currentNick').show();
		$('#neweNick').hide();
	});
	
	
	// 이메일  변경창 등장 
	$('#changeEmailbtn').click(function(){
	let currentEmail = $('#currentEmail');	
	let newEmail = $('#newEmail');
	
	if(newEmail.css("display")=="none"){
		newEmail.show();
		currentEmail.hide();
	}else{
		newEmail.hide();
		currentEmail.show();
	}
	
	});
	
	// 이메일 변경창 취소 	
	$('#cancleEmailbtn').click(function(){
		$('#currentEmail').show();
		$('#newEmail').hide();
	});
	
	// 이메일 인증 번호 전송
	$('#sendEmailbtn').click(function(){
		let email = $('#nEmail').val();
		
		alert('인증번호가 발송되었습니다. 확인 후 인증코드 란에 적어주세요.');
		$.ajax({
			type:'get',
			url:'./changeMailCheck?email='+ email,
			success:function(data){
				E_code = data;
			}
			
		});
		
		
	});
	
	
	// 이메읿 변경 인증코드 유효성 검사 
	$('#nEmailCode').on('keyup',function(){
		let emailCheckNum = $('#nEmailCode').val();
		let confirmbtn = $('#newMailConfirmbtn');
								
				
				if(E_code != emailCheckNum){
					$('#newMail_warn').css('color','red');
					$('#newMail_warn').html('인증번호가 맞지 않습니다. ');
					confirmbtn.attr("disabled","disabled"); // 맞지않을시 버튼 비활성
					
				}else if(emailCheckNum == null){
					$('#newMail_warn').css('color','red');
					$('#newMail_warn').html('인증번호가 맞지 않습니다. ');
					confirmbtn.attr("disabled","disabled"); // 맞지않을시 버튼 비활성
					
					
				}else if(E_code == emailCheckNum){
					$('#newMail_warn').css('color','skyblue');	
					$('#newMail_warn').html('인증번호가 확인되었습니다. ');
					confirmbtn.removeAttr("disabled");
				}
		
	});
	
	$('#newMailConfirmbtn').click(function(){
		let new_email = $('#nEmail').val();
		let confirmCheck = confirm('이메일을 변경하시겠습니까? ');
		
		if(confirmCheck==true){
			$.ajax({
				type:'post',
				url:'./changeEmail',
				data:{user_email:new_email},
				success:function(data){
					if(data==1){
						alert('이메일 변경 완료 ');
						location.reload(true);
					}else{
						alert('이메일 변경 실패 ');
					}
					
				}
		});
		}else{
			alert('이메일 변경 실패 ');
		}
		
	});
	
	
	
	
});

// 비밀번호 변경 function
function pwchange(){
	$(document).ready(function(){
		
		if(pwFlag == true && pwFlag1== true){
			let npw = $('#npw1').val();
			let confirmCheck = confirm('비밀번호를 변경하시겠습니까? ');
			if(confirmCheck==true){
				$.ajax({
					type:'post',
					url:'./changePw',
					data:{user_pw: npw},
					success:function(data){
						if(data==1){
							alert('비밀번호 변경 완료 ');
							location.reload(true);
						}else{
						 	alert('비밀번호 변경 실패 ');
						}
					}
					
				});
			}
		}else{
			alert('비밀번호를 확인해주세요..');
		}
	});
}

// 닉네임 변경 function
function nickChange(){
	$(document).ready(function(){
		if(nickFlag == true){
			let nNick = $('#nNick').val();
			let confirmNick = confirm('닉네임을 변경하시겠습니까? ');
			if(confirmNick == true){
				$.ajax({
					type:'post',
					url:'./changeNick',
					data:{user_nickname:nNick},
					success:function(data){
						if(data==1){
							alert('닉네임 변경 완료 ');
							location.reload(true);
						}else{
							alert('닉네임 변경 실패');
						}
					}
				});
				
			}else{
				alert('닉네임을 확인해주세요. ');
			}
		}
		
		
	});
}


// 장바구니 삭제 ajax
$(function(){
	$(document).on("click","[id*=bkd]",function(){
        	var trNum = $(this).closest('tr').prevAll().length;
        	var inputvalue = document.getElementsByClassName('basket_item_num')[trNum];
  
	  
	  	if(confirm("상품을 삭제하시겠습니까?")){
			$.ajax({
				url:"/basket/basketdelete",
				type:"post",
				data:{"basket_idx":inputvalue.value},
				success:function(){
					alert("장바구니에서 삭제되었습니다.");
					location.reload();
				}
			});
		}else{
			alert("상품삭제가 취소되었습니다.");
		}	
		
	});
});

$(function(){
	$(document).on("click",".cancel", function(){
			$.ajax({
				url:"/user/cancel",
				type:"post",
				data:{"user_id":document.fr.user_id.value, "user_pw":document.fr.user_pw.value},
				success:function(data){
					if(data == 1){
						alert("정보 불일치");
						history.back();
					}else{
					alert("탈퇴 취소 완료.");
					location.href="/user/info";
					}
				}
			});
	});
});

// 체크박스 전체선택 function
$('#chk_all').click(function(){
	if($("input:checkbox[id='chk_all']").prop("checked")){
		$("input[type=checkbox]").prop("checked",true);
	}else{
		$("input[type=checkbox]").prop("checked",false);
	}
});

// 체크된 상품 가져오기
$('#del-btn').click(function(){
	
	$("input[id=chk]:checked").each(function(){
		var test = $(this).val();
		$.ajax({
			url:"/basket/basketdeleteMulti",
			type:"post",
			data:{"basket_idx":test},
			success:function(){
				alert("장바구니에서 삭제되었습니다.");
				location.reload();
				
				}
		});
	});	
	
	
});


