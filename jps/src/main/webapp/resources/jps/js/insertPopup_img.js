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






