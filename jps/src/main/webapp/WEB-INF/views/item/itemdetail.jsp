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
	<input type="button" value="찜">
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