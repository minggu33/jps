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

	var checkDetail = "pass";
	var doubleColor = "";
	var doubleSize = "";
	

	$(function() {
		var colorl = $("input[name=item_colors]").length;
		
		var colorarr = new Array(colorl);
		var sizearr = new Array(colorl);
		var stockarr = new Array(colorl);
		for(var i=0; i<colorl; i++){                          
			colorarr[i] = $("input[name=item_colors]").eq(i).val();
			sizearr[i] = $("select[name=item_sizes]").eq(i).val();
			stockarr[i] = $("input[name=item_stocks]").eq(i).val();
			
			if(colorarr[i] == "" || sizearr[i] == "" || stockarr[i] == ""){
				checkDetail = "fail";
				return;
			}
			
			for(var j=i-1; j>=0; j--) {
				if(colorarr[i] == colorarr[j]){
					if(sizearr[i] == sizearr[j]){
						checkDetail = "double";
						doubleColor = colorarr[i];
						doubleSize = sizearr[i];
						return;
					}
				}
			}
		}
		
		document.fr.item_color.value = colorarr;
		document.fr.item_size.value = sizearr;
		document.fr.item_stock.value = stockarr;
	});
	
	if(checkDetail == "fail"){
		alert("비어있는 정보가 있습니다.")
		return false;
	} else if (checkDetail == "double") {
		alert(doubleColor + "/" + doubleSize + "의 정보가 중복으로 입력되었습니다.");
		return false;
	}
}

function addStock() {
	$(function(){
		var t = '<tr><td><input type="text" name="item_colors"></td>'
		+'<td><select name="item_sizes"><option value="">사이즈를 선택해 주세요.</option>'
		+'<option value="S">S</option><option value="M">M</option><option value="L">L</option>'
		+'<option value="XL">XL</option><option value="XXL">XXL</option><option value="Free">Free</option></select></td>'
		+'<td><input type="number" name="item_stocks" min="0"></td>'
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
