$(function(){
	$('.deleteItem').on('click', function(){
		var trNum = $(this).closest('tr').prevAll().length + 1;
		var item_num = document.getElementsByName('item_num')[trNum-2].value;
		var item_name = document.getElementsByName('item_name')[trNum-2].value;
		if(confirm("상품명 : "+item_name+"\n정말 삭제 하시겠습니까?")) {
			$.ajax({
				type: 'post',
				url: './deleteItem',
				data: { item_num: item_num},
				success: function(data) {
					if (data == 1) {
						alert("삭제가 완료 되었습니다.");
						$(".itemList > tbody:last > tr:nth-child("+trNum+")").remove();
					} else {
						alert("삭제에 실패 하였습니다.");
					}
				}
			});
		}
	});
});