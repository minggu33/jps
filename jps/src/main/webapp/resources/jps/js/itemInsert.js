$(function() {
	$(".append").on("click", function() {
		var t = "<input type='file' name='item_img'>";
		$(".box").html(t);
		$(".box").fadeToggle();
	});
});

function check() {
	if (document.fr.item_category.value == "") {
		alert("카테고리를 선택해주세요.");
		return false;
	}
	if (document.fr.item_name.value == "") {
		alert("상품명을 등록해주세요.");
		document.fr.item_name.focus();
		return false;
	}
	if (document.fr.item_price.value == "") {
		alert("상품가격을 등록해주세요.");
		document.fr.item_price.focus();
		return false;
	}
	if (document.fr.item_content.value == "") {
		alert("상품 설명을 작성해주세요.");
		document.fr.item_content.focus();
		return false;
	}
}