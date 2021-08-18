
  function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '자세히';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '닫기';
    }
  }
  
  

  // 결제 iamport 모듈 초기 설정 및 들고올 변수 값 설정
  var IMP = window.IMP;
  IMP.init("imp83171229")
  var item_name = document.getElementById('item_name').value;
  var item_price = document.getElementById('item_price').value;
  var user_email = document.getElementById('user_email').value;
  var user_name = document.getElementById('user_name').value;
  var user_phone = document.getElementById('user_phone').value;
  var user_addr = document.getElementById('user_addr').value;
  var user_addr1 = user_addr.substring(1,6); // postcode
  var user_addr2 = user_addr.substring(7); // postcode 제외한 나머지 주소
 
  $(document).ready(function() {
	
	var order_num = "";
	
	$('#check_module').click(function(){
		
		$.ajax({
				type:'post',
				url:'./orderNum',
				success:function(data){
					order_num = data;
					
				}
		});
	
		
	 // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: order_num,
          name: item_name,
          amount: item_price,
          buyer_email: user_email,
          buyer_name: user_name,
          buyer_tel: user_phone,
          buyer_addr: user_addr2,
          buyer_postcode: user_addr1
          
          
      }, function (rsp) { // callback
      	
      	alert(order_num);
          if (rsp.success) {// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
       		 // jQuery로 HTTP 요청
             
              jQuery.ajax({
            url:'./pay', // 예: https://www.myservice.com/payments/complete
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: {
                imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid
            }
        }).done(function (data) {
          // 가맹점 서버 결제 API 성공시 로직
        });
          } else {
               alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
              // 결제 실패 시 로직,
              
          }
      });
		
		
	});
	
});
  
  
 


