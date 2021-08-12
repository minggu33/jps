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
	$(".nojjim").on("click",function(){
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
				data:{"item_num":document.fr2.item_num.value, "item_color":document.fr2.basket_color.value, "item_size":document.fr2.basket_size.value, "item_count":document.fr2.basket_count.value},
				success:function(data){
					alert("장바구니 담기 완료");
					location.reload();						
				}
			});
		});
	});


// 주문
function check(){
	if(document.fr.color.value==""){
		alert("색상을 선택해주세요.");
		return false;
	}
	if(document.fr.size.value==""){
		alert("사이즈를 선택해주세요.");
		return false;
	}
}

// 주문상세정보 입력칸
$(function(){
	$(".order").on("click",function(){
		$(".orderdetail").fadeToggle();
	});
});
// 주문하기 유효성
$(function(){
	$(document).on("click", ".jjinmak", function(){
		if(document.fr.order_detail_color.value == ""){
		alert("색상을 선택해주세요.");
		return false;
			}else if(document.fr.order_detail_size.value==""){
				alert("사이즈를 선택해주세요.");
				return false;
			}else if(document.fr.count.value==""){
				alert("수량을 작성해주세요.");
				return false;
				}else{
				$(".ni").fadeToggle();
				$("#price").html(document.fr.count.value * $("#item_price").val() + "원");
				document.getElementById("count").readOnly = true;
			}
		});
	});	
	

