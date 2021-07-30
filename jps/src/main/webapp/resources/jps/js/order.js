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
		$(".ni").fadeToggle();
		$("#price").html(document.fr.count.value * $("#item_price").val() + "원");
		$("#count").css("style", readonly);
	});
});
