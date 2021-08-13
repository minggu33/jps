function changePageSize() {
	var pageSize = document.getElementById('pageSize').value;

	document.searchFr.pageSize.value = pageSize;
	document.searchFr.submit();

}

function searchFunc(search) {
	document.searchFr.pageNum.value = search;
	document.searchFr.submit();
}

function searchCheck() {
	var type = document.searchFr.type.value;
	if(type == 1 || type == 2 || type == 3) {
		if(document.searchFr.search.value == ""){
			alert("검색어를 입력해 주세요.");
			document.searchFr.search.focus();
			return false;
		}
	}
}