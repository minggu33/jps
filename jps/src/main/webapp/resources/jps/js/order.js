
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
	
	
	// 주문번호 생성
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
      	
          if (rsp.success) {// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
       		 // jQuery로 HTTP 요청
             
              jQuery.ajax({
            url:'./pay', // 예: https://www.myservice.com/payments/complete
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: {
                imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid,
                order_idx: order_num,
                order_addr: user_addr1+user_addr2,
                order_method: pay_method,
                order_total_price: item_price 
                
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
	

///////////////////////////////////////////////////////////////////////////////////




// 결제번호, 주문번호 추출하기
app.use(bodyParser.json());
  // "/pay"에 대한 POST 요청을 처리
  app.post("./pay", async (req, res) => {
    try {
      const { imp_uid, merchant_uid } = req.body; // req의 body에서 imp_uid, merchant_uid 추출
    } catch (e) {
      res.status(400).send(e);
    }
  });

///////////////////////////////////////////////////////////////////////////////////



// 결제 정보 조회하기
  app.use(bodyParser.json());
    
    // "/pay"에 대한 POST 요청을 처리
    app.post("./pay", async (req, res) => {
      try {
        const { imp_uid, merchant_uid } = req.body; // req의 body에서 imp_uid, merchant_uid 추출
        
        // 액세스 토큰(access token) 발급 받기
        const getToken = await axios({
          url: "https://api.iamport.kr/users/getToken",
          method: "post", // POST method
          headers: { "Content-Type": "application/json" }, // "Content-Type": "application/json"
          data: {
            imp_key: "6799378740266016", // REST API 키
            imp_secret: "0a426ea6b79ca442bb7642d51c5f73c6276503ec0a921218affe09937f198183a654e5a63e6785ab" // REST API Secret
          }
        });
        const { access_token } = getToken.data.response; // 인증 토큰
        
        // imp_uid로 아임포트 서버에서 결제 정보 조회
        const getPaymentData = await axios({
          url: `https://api.iamport.kr/payments/${imp_uid}`, // imp_uid 전달
          method: "get", // GET method
          headers: { "Authorization": access_token } // 인증 토큰 Authorization header에 추가
        });
        const paymentData = getPaymentData.data.response; // 조회한 결제 정보
        
      } catch (e) {
        res.status(400).send(e);
      }
    });
///////////////////////////////////////////////////////////////////////////////////






  
// 결제 정보 검증 후 저장하기  
  app.use(bodyParser.json());
  
  // "/.pay"에 대한 POST 요청을 처리
  app.post("./pay", async (req, res) => {
    try {
      const { imp_uid, merchant_uid } = req.body; // req의 body에서 imp_uid, merchant_uid 추출
      // 액세스 토큰(access token) 발급 받기
      /* ...중략... */
      // imp_uid로 아임포트 서버에서 결제 정보 조회
      /* ...중략... */
      const paymentData = getPaymentData.data.response; // 조회한 결제 정보
      
      // DB에서 결제되어야 하는 금액 조회
      const order = await Orders.findById(paymentData.merchant_uid);
      const amountToBePaid = order.amount; // 결제 되어야 하는 금액
     
      // 결제 검증하기
      const { amount, status } = paymentData;
      if (amount === amountToBePaid) { // 결제금액 일치. 결제 된 금액 === 결제 되어야 하는 금액
        await Orders.findByIdAndUpdate(merchant_uid, { $set: paymentData }); // DB에 결제 정보 저장
        
        switch (status) {
          case "ready": // 가상계좌 발급
            // DB에 가상계좌 발급 정보 저장
            const { vbank_num, vbank_date, vbank_name } = paymentData;
            await Users.findByIdAndUpdate("/* 고객 id */", { $set: { vbank_num, vbank_date, vbank_name }});
            // 가상계좌 발급 안내 문자메시지 발송
            SMS.send({ text: `가상계좌 발급이 성공되었습니다. 계좌 정보 ${vbank_num} ${vbank_date} ${vbank_name}`});
            res.send({ status: "vbankIssued", message: "가상계좌 발급 성공" });
            break;
          case "paid": // 결제 완료
            res.send({ status: "success", message: "일반 결제 성공" });
            break;
        }
      } else { // 결제금액 불일치. 위/변조 된 결제
        throw { status: "forgery", message: "위조된 결제시도" };
      }
    } catch (e) {
      res.status(400).send(e);
    }
  });
  
  
  
  
  
  
 });


