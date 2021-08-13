<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- header -->
	<%@ include file="../include/header.jsp" %>
	<!-- header -->
	<center>
    <h2>주문상세</h2>
    <form action="/item/pay" method="post">
	<c:choose>
	<c:when test="${mbList == null }">
    <input type="hidden" value="${user_num }" name="item_num">
    Color : <input type="text" value="${odvo.order_detail_color }" readonly="readonly" style="text-align: center;" >
    <br>
    Size : <input type="text" value="${odvo.order_detail_size }" readonly="readonly" style="text-align: center;"> 
    <br>
    Count : <input type="number" value="${odvo.order_detail_stock }" readonly="readonly" style="text-align: center;">
	<br>
	Price : <input type="number" value="${vo.item_price*odvo.order_detail_stock }" readonly="readonly" style="text-align: center;" name="order_total_price">
	<br>
	Point : <input type="number" value="0" name="order_total_point" style="text-align: center;">
	</c:when>
	<c:otherwise>
	 <c:forEach var="il" items="${mbList }" varStatus="status" >
	 <!-- 장바구니 아이템 가져오기 -->
		여기 사람 있어요 : <input type="text" value="${il.itemvo.item_price }">
	</c:forEach>
	</c:otherwise>
	</c:choose>
	<br>
	<br>
	<br>
	<h2>추가 정보</h2>
	<br>
	<select name="order_method">
		<option value="">결제 방법을 선택해주세요</option>
		<option value="무통장입금">무통장입금</option>
		<option value="카드결제">카드결제</option>
		<option value="카카오페이">카카오페이</option>
	</select>
	<br>
	<br>
				<input type="text" id="sample4_postcode" name="postcode" readonly placeholder="우편번호" class="under_line_solid_gray" style="text-align: center;">
				<input type="text" id="sample4_roadAddress" name="roadAddress" readonly placeholder="도로명주소" class="under_line_solid_gray" style="text-align: center;">
				<input type="hidden" id="sample4_jibunAddress" name="jibunAddress" readonly placeholder="지번주소" style="text-align: center;">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" class="under_line_solid_gray" style="text-align: center;">
				<input type="text" id="sample4_extraAddress" name="extraAddress" readonly placeholder="참고항목" class="under_line_solid_gray" style="text-align: center;">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="border_none"><br>
				
				<input type="hidden" name="user_addr">	
    	<br>
    	
    	<input type="submit" value="결제하기">
    </form>
    </center>
	<script src="/resources/daum_postcode/js/postcode.js"></script><br>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/jps/js/order.js"></script><br>
    <!-- footer -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer -->