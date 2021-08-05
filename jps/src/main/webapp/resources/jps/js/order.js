

$(function(){
	$(".basket").on("click", function(){
		$(".basket_detail").fadeToggle();
	});
});	
	
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


$(function(){
	$(".order").on("click",function(){
		$(".orderdetail").fadeToggle();
	});
});

$(function(){
	$(document).on("click", ".jjinmak", function(){
		if(document.fr.color.value == ""){
		alert("색상을 선택해주세요.");
		return false;
			}else if(document.fr.size.value==""){
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
	

