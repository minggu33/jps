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

function addStock() {
	$(function(){
		var t = '<tr><td><input type="text" name="item_color"></td>'
		+'<td><input type="text" name="item_size"></td>'
		+'<td><input type="number" name="item_stock" min="0"></td>'
		+'<td><input type="button" value="삭제하기" class="deleteStock border_none"></td></tr>';
		
		$('#stock').append(t);
	});
}


$(function(){
	$(document).on('click', '.deleteStock', function(){
		var trCount = $("#stock tr").length;
		if(trCount > 2) {
			var trNum = $(this).closest('tr').prevAll().length + 1;
			$("#stock > tbody:last > tr:nth-child("+trNum+")").remove();
		} else {
			alert("최소 1개 이상의 정보가 필요합니다.");
		}
	});
});
