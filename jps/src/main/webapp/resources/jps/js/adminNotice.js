function check() {
	
	if(document.fr.notice_subject.value == "") {
		alert("제목을 입력해 주세요.");
		document.fr.notice_subject.focus();
		return false;
	}
	
	if(document.fr.notice_content.value == "") {
		alert("내용을 입력해 주세요.");
		document.fr.notice_content.focus();
		return false;
	}
	
}

function checkReset() {
	if(confirm("변경하신 내용이 초기화 됩니다. 그래도 목록으로 돌아가시겠습니까?")) {
		location.href='/admin/noticelist'		
	}
}

function checkUpdateFile() {
	if(!confirm("첨부파일을 새로 선택하시면 기존에 있던 첨부파일은 삭제 됩니다.\n첨부파일을 새로 추가하시겠습니까?")){
		return false;		
	}
}

function resetFile() {
	if(confirm("해당 첨부 파일을 삭제 하시겠습니까?")) {
		document.fr.notice_file.value = "";
	}
}

$(function(){
	$('.deleteNotice').on('click', function(){
		var trNum = $(this).closest('tr').prevAll().length + 1;
		var notice_num = document.getElementsByName('notice_num')[trNum-2].value;
		var notice_subject = document.getElementsByName('notice_subject')[trNum-2].value;
		if(confirm("글제목 : "+notice_subject+"("+notice_num+"번 글)\n정말 삭제 하시겠습니까?")) {
			$.ajax({
				type: 'post',
				url: './deletenotice',
				data: { notice_num: notice_num},
				success: function(data) {
					if (data == 1) {
						alert("삭제가 완료 되었습니다.");
						$(".noticeList > tbody:last > tr:nth-child("+trNum+")").remove();
					} else {
						alert("삭제에 실패 하였습니다.");
					}
				}
			});
		}
	});
});