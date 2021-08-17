$(function() {
	$(".insertImg").on("click", function() {
		var t = "<tr><td><input type='file' name='uploadfile'></td>"
				+"<td><input type='button' value='삭제하기' class='deleteFile border_none'></td></tr>";
		$("#file").append(t);
	});
	$(document).on('click', '.deleteFile', function(){
		var trCount = $("#file tr").length;
		if(trCount > 1) {
			var trNum = $(this).closest('tr').prevAll().length+1;
			$("#file > tbody:last > tr:nth-child("+trNum+")").remove();
		} else {
			alert("최소 1개 이상의 정보가 필요합니다.");
		}
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
		var item_num = document.getElementById('item_num').value;
		
		var t = '<tr><td><input type="text" name="item_colors">'
		+'<input type="hidden" name="item_detail_idxs" value="0">'
		+'<input type="hidden" name="item_nums" value="'+item_num+'"></td>'
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

$(function(){
	$('.delete').hover(function(){
		$(this).parent().css('opacity', '0.5');
	},function(){
		$(this).parent().css('opacity', '1');
	});
	
	$('.delete').on('click', function(){
		if(confirm("해당 이미지를 삭제하시겠습니까?")) {
			var trNum = $(this).closest('a').prevAll().length+1;
			$(".preImg > a:nth-child("+trNum+")").remove();
		}
	});
});

function updateCheck() {
	
	
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
		var idxarr = new Array(colorl);
		var item_numarr = new Array(colorl);
		
		for(var i=0; i<colorl; i++){                          
			colorarr[i] = $("input[name=item_colors]").eq(i).val();
			sizearr[i] = $("select[name=item_sizes]").eq(i).val();
			stockarr[i] = $("input[name=item_stocks]").eq(i).val();
			idxarr[i] = $("input[name=item_detail_idxs]").eq(i).val();
			item_numarr[i] = $("input[name=item_nums]").eq(i).val();
			
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
		document.fr.item_detail_idx.value = idxarr;
		document.fr.detail_item_num.value = item_numarr;
	});
	
	if(checkDetail == "fail"){
		alert("비어있는 정보가 있습니다.")
		return false;
	} else if (checkDetail == "double") {
		alert(doubleColor + "/" + doubleSize + "의 정보가 중복으로 입력되었습니다.");
		return false;
	}
	
	$(function(){
		var imgl = $("input[name=item_imgs]").length;

		var imgStr = "";

		for(var i=0; i<imgl; i++) {
			imgStr += $("input[name=item_imgs]").eq(i).val();
			if(i == imgl-1) {
				break;
			}
			imgStr += ",";
		}
		
		document.fr.item_img.value = imgStr;
	});
	
}

function checkReset() {
	if(confirm("변경하신 내용이 초기화 됩니다. 그래도 목록으로 돌아가시겠습니까?")) {
		location.href='/admin/itemlist'		
	}
}
