<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href="/resources/jps/css/itemdetail.css" rel="stylesheet">		


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

	<br>
	<br>
	<br>
	<button type="button" class="order btns">주문하기</button>
	<button type="button" class="basket btns">장바구니</button>
	
		<c:if test="${ivo_cnt == 0 }">
				<button class="jjim">
					<img src="/resources/jps/img/like.png" style="width:20; height:20;">
				</button>
		</c:if>
		<c:if test="${ivo_cnt == 1 }">
		
				<button class="no_jjim">
					<img src="/resources/jps/img/heart.png" style="width:20; height:20;">					
				</button>
		</c:if>
					
			
	
	<br>
	<br>
	
	<!-- 장바구니  -->
	<div class="basket_detail" style="display: none">
		<form name="fr2">
		
		<input type="hidden" name="item_num" value="${vo.item_num }">

		Option  : <select name="item_detail_idx1" class="item_detail_idx1">
				<option value="">옵션을 선택하세요.</option>
				<c:forEach  var="idL" items="${idL }">
				<option value="${idL.item_detail_idx}">${idL.item_color }[${idL.item_size }] - 수량 : ${idL.item_stock }</option>				
			</c:forEach>
			</select>
			<br>
		Count : <input type="number" name="basket_count" id="basket_count" value="1" min="1"><br>
		<span id="price1"></span>
		<br><input type="button" class="basket_insert btns" value="바구니담기">
		</form>
	</div>
		<!-- 장바구니  -->
	
	
	
		<!-- 주문하기  -->	
	<div class="orderdetail" style="display: none;">
		
	<form id="fr" name="fr" action="./order" method="post" onsubmit="return check();">
	Name : ${vo.item_name }
	<input type="hidden" name="item_num" value="${vo.item_num }">
	<br>


		Option  : <select name="item_detail_idx" class="item_detail_idx">
				<option value="">옵션을 선택하세요.</option>
				<c:forEach  var="idL" items="${idL }">
				<option value="${idL.item_detail_idx}">${idL.item_color }[${idL.item_size }] - 수량 : ${idL.item_stock }</option>				
			</c:forEach>

			</select>



		<br>
		Count : <input type="number" class="order_detail_stock" name="order_detail_stock" id="count" value="1" min="1">
		
		<br>
		<input type="hidden" id="item_price" value="${vo.item_price}" name="item_price">
		<div class="ni" >
			<span id="price"></span>
			<br>
			<button type="submit" class="btns">주문하기</button>
			
			
		</div>
		</form>	
	</div>
	<!-- 주문하기  -->
	
	
    </center>
    
    
    
<!-- footer -->
<%@ include file="../include/footer.jsp" %>
<!-- footer -->

<script src="/resources/jps/js/itemdetail.js"></script><br>