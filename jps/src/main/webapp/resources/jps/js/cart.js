
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

// 체크박스 전체선택 function 선택시 주문 총합 가격 표시
$('#boxall').click(function(){
	if($("input:checkbox[id='boxall']").prop("checked")){
		$("input:checkbox[id='chk']").prop("checked",true);	
		var chkl = $("input[id=chk]:checked").length;
		var total_price = 0;			
		
		for(var i=0; i<chkl; i ++) {
		var price = document.getElementsByClassName('item_price')[i].innerHTML;
		var cnt = document.getElementsByClassName('item_count')[i].innerHTML;
		
			console.log(price);
			console.log(cnt);
			total_price += parseInt(price.replace(",","")) * parseInt(cnt);
			
		}
		console.log("총합 : " + total_price);
		
		$("#total_price").html(total_price + "원");
		
		
	}else{
		$("input:checkbox[id='chk']").prop("checked",false);
		$("#total_price").html("");
		
		
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

// 체크된 상품 가격 합계 주문하기에 보여주기
$(function(){
	
		var chkl = $("input[id=chk]:checked").length;
		var total_price = 0;
		
	
		
		for(var i=0; i<chkl; i ++) {
		var price = document.getElementsByClassName('item_price')[i].innerHTML;
		var cnt = document.getElementsByClassName('item_count')[i].innerHTML;
		
			console.log(price);
			console.log(cnt);
			total_price += parseInt(price.replace(",","")) * parseInt(cnt);
			
		}
		console.log("총합 : " + total_price);
		
		$("#total_price").html(total_price + "원");
	
});

// 체크한 상품 총합가격 추가 제거 
$(function(){
	$(document).on("click","[id*=chk]",function(){
			var total_price = document.getElementById("total_price").innerHTML;
			total_price = total_price.replace("원","");
			
			
        	var trNum = $(this).closest('tr').prevAll().length;
        	var price = document.getElementsByClassName('item_price')[trNum].innerHTML;
  			var cnt = parseInt(document.getElementsByClassName('item_count')[trNum].innerHTML);
	  		
	  		price = price.replace(",","")
	  		price = parseInt(price);
	  		
	  		var ced = $(this).is(':checked');
	  		
	  	if(ced){
			
			total_price = total_price+(price*cnt);
			$("#total_price").html(total_price + "원");

		}else{
			total_price = total_price-(price*cnt);
			$("#total_price").html(total_price + "원");
		}
	  			
	});
});
	
	



