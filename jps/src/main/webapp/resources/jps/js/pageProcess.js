function changePageSize() {
	var pageSize = document.getElementById('pageSize').value;

	document.searchFr.pageSize.value = pageSize;
	document.searchFr.submit();

}

function searchFunc(search){
		document.searchFr.pageNum.value = search;
		document.searchFr.submit();
}