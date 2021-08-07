<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			


<!-- header -->
<%@ include file="../include/header.jsp" %>
<!-- header -->

	
	<center>
	<table border="1" style="text-align: center;">
		<tr>
			<td colspan="3" width="500">${vo.item_name }</td>
		</tr>
		<tr>
			<td>${vo.item_category }</td>
			<td>${vo.item_price } ₩</td>
			<td>${vo.item_create_date }</td>
		</tr>
	</table>
	${vo.item_img }
	<br>
	${vo.item_content }
	<br>
	<br>
	<br>
	<input type="button" class="order" value="주문하기">
	<input type="button" value="장바구니" class="basket">
		<c:choose>
			<c:when test="${ivo.likecheck == 0 }">
				<button class="jjim">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-neutral" viewBox="0 0 16 16">
		 		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		  		<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
				</svg></button>
				</c:when>
			<c:when test="${ivo.likecheck == 1 }"> 
				<button class="nojjim"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
		  		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		 		<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
				</svg></button>
			</c:when>
		</c:choose>
	
	<br>
	<br>
	<div class="basket_detail" style="display: none">
		<form name="fr2">
		
		<input type="hidden" name="item_num" value="${vo.item_num }">
		Color : <select name="basket_color">
			<option value="">Choose color</option>
			<option value="black">Black</option>
			<option value="white">White</option>
			<option value="gray'">Gray</option>
		</select>
			<br>
		Size : <select name="basket_size">
			<option value="">Choose color</option>
			<option value="90">90</option>
			<option value="95">95</option>
			<option value="100">100</option>
			<option value="105">105</option>
		</select>
			<br>
		Count : <input type="number" id="basket_count" value="1">
		<br><input type="button" class="basket_insert" value="바구니담기">
		</form>
	</div>
	<div class="orderdetail" style="display: none;">
	<form name="fr" action="./itemdetail" method="post" onsubmit="return check();">
	Name : ${vo.item_name }
	<br>
		Color : <select name="color">
				<option value="">Choose color</option>
				<option value="black">Black</option>
				<option value="white">White</option>
				<option value="gray">Gray</option>
			</select>
			<br>
		Size : <select name="size">
			<option value="">Choose size</option>
			<option value="90">90</option>
			<option value="95">95</option>
			<option value="100">100</option>
			<option value="105">105</option>
		</select>
		<br>
		Count : <input type="number" name="count" id="count" value="1">
		<br>
		<input type="button" class="jjinmak" value="주문신청">
		<input type="hidden" id="item_price" value="${vo.item_price}">
		<div class="ni" style="display: none;">
			Price : <content id="price"></content>
			<br>
			<input type="submit" value="상세정보입력">
		</div>
		</form>
	</div>
    </center>
<!-- footer -->
<%@ include file="../include/footer.jsp" %>
<!-- footer -->

<script src="/resources/jps/js/order.js"></script><br>