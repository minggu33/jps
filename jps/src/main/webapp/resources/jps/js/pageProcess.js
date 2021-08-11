function changePageSize() {
	var pageSize = document.getElementById('pageSize').value;
	var pageNum = document.getElementById('pageNum').value;
	var type = document.getElementById('type').value;
	var search = document.getElementById('search').value;
	
	if (type == 1 || type == 2 || type == 3) {
		location.href = "?pageNum="+pageNum+"&pageSize="+pageSize+"&type="+type+"&search="+search;
	} else {
		location.href = "?pageNum="+pageNum+"&pageSize="+pageSize;
	}
}