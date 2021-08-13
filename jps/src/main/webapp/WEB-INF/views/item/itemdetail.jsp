<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
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
			<td>${vo.item_price } </td>
			<td>${vo.item_create_date }</td>
		</tr>
	</table>
		<c:forEach begin="0" end="${fn:length(fn:split(vo.item_img,','))-1}" var="p">
				<img class="img-fluid" src="/resources/jps/upload/insertItem/${fn:split(vo.item_img,',')[p]}">
		</c:forEach>
	<br>
	${vo.item_content }
	<br>
	<br>
	<br>
	<input type="button" class="order" value="주문하기">
	<input type="button" value="장바구니" class="basket">
		<c:if test="${ivo_cnt == 0 }">
				<button class="jjim">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
	  				<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
					</svg>
				</button>
		</c:if>
		<c:if test="${ivo_cnt == 1 }">
		
				<button class="nojjim">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
	  				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
					</svg>
				</button>
		</c:if>
					
			
	
	<br>
	<br>
	<div class="basket_detail" style="display: none">
		<form name="fr2">
		
		<input type="hidden" name="item_num" value="${vo.item_num }">
<!-- 		Color : <select name="basket_color"> -->
<!-- 			<option value="">Choose color</option> -->
<!-- 			<option value="black">Black</option> -->
<!-- 			<option value="white">White</option> -->
<!-- 			<option value="gray'">Gray</option> -->
<!-- 		</select> -->
<!-- 			<br> -->
<!-- 		Size : <select name="basket_size"> -->
<!-- 			<option value="">Choose color</option> -->
<!-- 			<option value="90">90</option> -->
<!-- 			<option value="95">95</option> -->
<!-- 			<option value="100">100</option> -->
<!-- 			<option value="105">105</option> -->
<!-- 		</select> -->
		Option  : <select name="item_detail_idx">
				<option value="">옵션을 선택하세요.</option>
				<c:forEach  var="idL" items="${idL }">
				<option value="${idL.item_detail_idx}">${idL.item_color }[${idL.item_size }] - 수량 : ${idL.item_stock }</option>				
			</c:forEach>
			</select>
			<br>
		Count : <input type="number" id="basket_count" value="1">
		<br><input type="button" class="basket_insert" value="바구니담기">
		</form>
	</div>
	<div class="orderdetail" style="display: none;">
	<form name="fr" action="./order" method="post" onsubmit="return check();">
	Name : ${vo.item_name }
	<br>


		Option  : <select name="option">
				<option value="">옵션을 선택하세요.</option>
				<c:forEach  var="idL" items="${idL }">
				<option value="${idL.item_detail_idx}">${idL.item_color }[${idL.item_size }] - 수량 : ${idL.item_stock }</option>				
			</c:forEach>

			</select>



		<br>
		Count : <input type="number" name="order_detail_stock" id="count" value="1">
		<br>
		<input type="button" class="jjinmak" value="주문신청">
		<input type="hidden" id="item_price" value="${vo.item_price}" name="item_price">
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