<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
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
#img { 
 	width: 380px; 
 	height: 450px; 
	
 } 
input#check {
	margin: auto;
}
</style>
</head>
<body>
	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" id="img" src="/resources/jps/upload/insertPopup/${fn:split(vo.popup_img,',')[0]}">
			</div>
			<c:forEach begin="1" end="${fn:length(fn:split(vo.popup_img,','))-1}" var="p">
			<div class="carousel-item">
				<img id="img" src="/resources/jps/upload/insertPopup/${fn:split(vo.popup_img,',')[p]}" class="d-block w-100">
			</div>
			</c:forEach>
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