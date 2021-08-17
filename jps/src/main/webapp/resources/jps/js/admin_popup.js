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
