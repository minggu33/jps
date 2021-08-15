// 좋아요 기능
$(function(){
	$(".jjim").on("click", function(){
		$.ajax({
			url:"/item/like",
			type:"post",
			data:{"item_num":document.fr2.item_num.value},
			success:function(data){
				location.reload();
			}
		});
	});
});
// 좋아요 취소
$(function(){
	$(".no_jjim").on("click",function(){
		$.ajax({
			url:"/item/unlike",
			type:"post",
			data:{"item_num":document.fr2.item_num.value},
			success:function(data){
				location.reload();
			}
		});
	});
});
// 장바구니 디테일칸
$(function(){
	$(".basket").on("click", function(){
		$(".basket_detail").fadeToggle();
	});
});	
// 장바구니 담기
$(function(){
	$(document).on("click",".basket_insert", function(){
			$.ajax({
				url:"/basket/basket",
				type:"post",
				data:{"item_num":document.fr2.item_num.value, "item_detail_idx":document.fr2.item_detail_idx.value, "item_count":document.fr2.basket_count.value},
				success:function(data){
					alert("장바구니 담기 완료");
					location.reload();						
				}
			});
		});
	});


// 주문
function check(){
	
	let rtn;
	
	rtn = confirm('주문하시겠습니까?');
	
	if(rtn){
		
		if(document.fr.item_detail_idx.value==""){
		alert("옵션을 선택해 주세요.");
		return false;
	} 
	
		document.getElementById('fr').submit();
		
	}else{
		return false;
	}
	
	
}

// 주문상세정보 입력칸
$(function(){
	$(".order").on("click",function(){
		$(".orderdetail").fadeToggle();
	});
});
// 주문하기 유효성(수량에 따른 가격 표시)
$(function(){
	$(document).on("change", ".order_detail_stock", function(){
		if(document.fr.item_detail_idx.value == ""){
		alert("옵션을 선택해주세요.");
		document.fr.order_detail_stock.value = '1';
		return false;
			
			}else if(document.fr.count.value==""){
				alert("수량을 작성해주세요.");
				return false;
				}else{
//				$(".ni").fadeToggle();
				$("#price").html("Price : "+document.fr.count.value * $("#item_price").val() + "원");
				
			}
		});
	});	
	
// 주문하기 페이지

