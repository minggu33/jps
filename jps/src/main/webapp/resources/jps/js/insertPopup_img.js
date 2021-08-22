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

function checkReset() {
	if(confirm("변경하신 내용이 초기화 됩니다. 그래도 목록으로 돌아가시겠습니까?")) {
		location.href='/admin/popup'		
	}
}

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


function check() {
	
	if(document.fr.popup_title.value == "") {
		alert("제목을 작성해 주세요.");
		document.fr.popup_title.focus();
		return false;
	}
	var cnt = 0;
	
	$(function() {
		var uploadfilel = $("input[name=uploadfile]").length;
		
		var uploadfilearr = new Array(uploadfilel);
		
		for(var i=0; i<uploadfilel; i++){                          
			uploadfilearr[i] = $("input[name=uploadfile]").eq(i).val();
			
			if(uploadfilearr[i] != "") {
				cnt++;
			}
			
		}
		
	});
	
	if(cnt < 1) {
		alert("팝업이미지는 1개 이상 등록해야 합니다.");
		return false;
	}	
}

function updateCheck() {
	
	if(document.fr.popup_title.value == "") {
		alert("제목을 작성해 주세요.");
		document.fr.popup_title.focus();
		return false;
	}
	var cnt = 0;
	
	$(function() {
		var uploadfilel = $("input[name=uploadfile]").length;
		
		var uploadfilearr = new Array(uploadfilel);
		
		for(var i=0; i<uploadfilel; i++){                          
			uploadfilearr[i] = $("input[name=uploadfile]").eq(i).val();
			
			if(uploadfilearr[i] != "") {
				cnt++;
			}
			
		}
		
	});
	

	
	$(function(){
		var imgl = $("input[name=popup_imgs]").length;

		var imgStr = "";

		for(var i=0; i<imgl; i++) {
			imgStr += $("input[name=popup_imgs]").eq(i).val();
			cnt++;
			if(i == imgl-1) {
				break;
			}
			imgStr += ",";
		}
		
		document.fr.popup_img.value = imgStr;
	});
	
	if(cnt < 1) {
		alert("팝업이미지는 1개 이상 등록해야 합니다.");
		return false;
	}
}

