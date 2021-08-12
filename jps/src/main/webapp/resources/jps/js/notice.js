function fn_fileDown(notice_file){
	var formObj = $("form[name='readForm']");
	$("#notice_file").attr("value", notice_file);
	formObj.attr("action", "./noticefiledown");
	formObj.submit();
}