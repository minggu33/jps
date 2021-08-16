<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script>
	function closePopup() {
		if (document.getElementById("check").value) {
			setCookie("popupYN", "N", 1);
			self.close();
		}
	}
	function setCookie(name, value, expiredays) {
		var date = new Date();
		date.setDate(date.getDate() + expiredays);
		document.cookie = escape(name) + "=" + escape(value)
				+ "; path=/; expires=" + date.toUTCString();
	}
</script>
<style type="text/css">
/* .d-block w-100 { */
/* 	width: 300px; */
/* 	height: 400px; */
	
/* } */
</style>
</head>
<body>

	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/img/11.jpg" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="/img/22.jpg" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="/img/33.jpg" class="d-block w-100">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleFade"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleFade"
			role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="sr-only">Next</span>
		</a>
	</div>
	<form>
		<input type="checkbox" id="check" onclick="closePopup();"> 오늘
		더이상 팝업창 띄우지 않기
	</form>
</body>
</html>