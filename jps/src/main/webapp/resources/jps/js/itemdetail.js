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
		let basket = $(".basket_detail");
		let order = $(".orderdetail");
		if(basket.css("display")=="none"){
			basket.show();
			order.hide();
		}else{
			order.hide();
			basket.hide();
		}
	
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


// 주문하기 버튼 클릭 -> 주문페이지 이동
function check(){
	
	let rtn;
	
	let lgncheck = document.fr.user_num12.value;	
	
	if(lgncheck==""){
		
	let lgnmsg = confirm('로그인이 필요한 페이지입니다. 로그인하시겠습니까?');	
		if(lgnmsg==true){
	
		window.location.href="/user/login";
		
		return false;
			
		}else{
			return false;
		}
	}else{
	
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
}


// 옵션정보 입력칸 나타나기
$(function(){
	$(".order").on("click",function(){
		let basket = $(".basket_detail");
		let order = $(".orderdetail");
		if(order.css("display")=="none"){
			order.show();
			basket.hide();
		}else{
			order.hide();
			basket.hide();
		}
	});
});

// 주문하기 유효성(수량에 따른 가격 표시)
$(function(){
	
	$(document).on("change",".item_detail_idx",function(){
		if(document.fr.item_detail_idx.value != ""){
			$("#price").html("Price : "+document.fr.count.value * $("#item_price").val() + "원");

		}
	});
	
	
	
	$(document).on("change", ".order_detail_stock", function(){
		if(document.fr.item_detail_idx.value == ""){
		alert("옵션을 선택해주세요.");
		document.fr.order_detail_stock.value = '1';
		return false;
			
			}else if(document.fr.count.value==""){
				alert("수량을 작성해주세요.");
				return false;
				}else{
				$("#price").html("Price : "+document.fr.count.value * $("#item_price").val() + "원");
				
			}
		});
	});	
	
// 장바구니 유효성(수량에 따른 가격 표시)

$(function(){
	
	$(document).on("change",".item_detail_idx1",function(){
		if(document.fr2.item_detail_idx1.value != ""){
			
			$("#price1").html("Price : "+document.fr2.basket_count.value * $("#item_price").val() + "원");

		}
	});
	
	
	
	$(document).on("change", "#basket_count", function(){
		if(document.fr2.item_detail_idx1.value == ""){
		alert("옵션을 선택해주세요.");
		document.fr2.basket_count.value = '1';
		return false;
			
			}else if(document.fr2.basket_count.value==""){
				alert("수량을 작성해주세요.");
				return false;
				}else{
				$("#price1").html("Price : "+document.fr2.basket_count.value * $("#item_price").val() + "원");
				
			}
		});
	});	
	
