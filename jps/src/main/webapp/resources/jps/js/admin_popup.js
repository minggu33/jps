$(function(){
	$(".popupChangeBnt").on("click", function() {
		var trNum = $(this).closest('tr').prevAll().length;
		var popup_num = document.getElementsByClassName('popup_num')[trNum].innerHTML;
		var popup_title = document.getElementsByClassName('popup_title')[trNum].innerHTML;
		if(confirm(popup_title + " 팝업을 사용하시겠습니까?")) {
			$.ajax({
				type: 'post',
				url: './changepopup',
				data: { popup_num: popup_num},
				success: function(data) {
					if (data == 1) {
						alert("변경이 완료 되었습니다.");
					} else {
						alert("변경에 실패 하였습니다.");
						return false;
					}
				}
			});
		} else {
			return false;
		}
	});
});

function insertPopup() {
	if(document.getElementById("popup_cnt").value < 5) {
		location.href='/admin/insertpopup';
	} else {
		alert('팝업은 5개 까지 등록이 가능합니다.');
	}
}

$(function(){
	$('.deletePopup').on('click', function(){
		var trNum = $(this).closest('tr').prevAll().length;
		var popup_num = document.getElementsByClassName('popup_num')[trNum].innerHTML;
		var popup_title = document.getElementsByClassName('popup_title_a')[trNum-1].innerHTML;
		var popup_check = document.getElementsByName('popup_check')[trNum-1];
		console.log(popup_check);
		if(popup_check.checked) {
			alert("현재 사용중인 팝업은 삭제할 수 없습니다.");
		} else {
			if(confirm("제목 : "+popup_title+"\n정말 삭제 하시겠습니까?")) {
				$.ajax({
					type: 'post',
					url: './deletepopup',
					data: { popup_num: popup_num},
					success: function(data) {
						if (data == 1) {
							alert("삭제가 완료 되었습니다.");
							$(".popupList > tbody:last > tr:nth-child("+(trNum+1)+")").remove();
							document.getElementById("popup_cnt").value--;
						} else {
							alert("삭제에 실패 하였습니다.");
						}
					}
				});
			}
		}
	});
});