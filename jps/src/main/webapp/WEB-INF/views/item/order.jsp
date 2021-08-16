<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="/resources/jps/css/order.css" rel="stylesheet"/>
    
    <!-- header -->
	<%@ include file="../include/header.jsp" %>
	<!-- header -->
	
		<section class="order-cont" >
	<header class="order-header">
		<h1>Order / Payment </h1>
		<span>주문 / 결제 </span>
		<div class="upper-contents"> 
		<div class="cart-process">
		<span class="cart-pagenation">장바구니</span>
		<span class="back-arrow"></span>
		<span class="cart-pagenation_on">주문서 작성</span>
		<span class="back-arrow"></span>
		<span class="cart-pagenation">주문 완료</span>
		</div>		
		</div>
	</header>
	<div class="upper-contents">	
	<h1>Recipient Info</h1>	
	<span>주문자 정보</span>
	</div>
	<div class="info-cont">
		<ul class="info-ul">
			<li class="info-li">
				배송지 선택
			</li>
			<li>
				<div class="box-choice">
					<input type="radio"> ${uvo.user_name}님의 배송지 |
					<input type="radio"> 신규배송지 
				</div>
			</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">수령인</li>
			<li>${uvo.user_name }</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">전화번호</li>
			<li>${uvo.user_phone }</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">배송지 주소</li>
			<li>${uvo.user_addr}</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">배송 메모</li>
			<li>
				<select class="d-memo">
					<option value="">배송 시 요청사항을 선택해주세요.</option>
					<option value="">부재 시 경비실에 맡겨주세요.</option>
					<option value="">부재 시 택배함에 넣어주세요.</option>
					<option value="">부재 시 집 앞에 놔둬주세요.</option>
					<option value="">배송 전 연락바랍니다.</option>
					<option value="">파손의 위험이 있는 제품입니다. 주의 바랍니다.</option>
					<option value="">직접 입력</option>
				</select> 
			</li>
		</ul>
	
	
	
	</div>
	<br><br>
	<div class="upper-contents">
		<h1>Product Info</h1>	
		<span>상품 정보</span>
	</div>
	
	<table class="order-table" border="1">
		<thead>
			<tr>
				<th class="product-infos" colspan="2">
					상품 정보
				</th>
				<th>
					수량
				</th>
				<th>
					포인트(적립)
				</th>
				<th>
					배송비
				</th>
				<th>
					주문금액
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			
				<td class="product-info">
					<img src="/resources/jps/upload/insertItem/${fn:split(vo.item_img,',')[0]}" style="width:62px; height:75px;">
					</td>
					<td class="product-info2">
					<div class="prodiv">
						${vo.item_name } <br>
					${odvo.order_detail_size} , ${odvo.order_detail_color} 
					</div>
					</td>					
				
				<td>
					${odvo.order_detail_stock }
				</td>
				<td>
					${(vo.item_price*odvo.order_detail_stock)*5/100 }
				</td>
				<td>
					무료
				</td>
				<td>
					${vo.item_price }
				</td>
				
			</tr>
		</tbody>
	</table>
	
	<div class="pro-info">
		· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.<br>
		· 무신사 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 전 지역, 전 상품 무료배송입니다.<br>
		· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>
		· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.<br>
	</div>
	
	</section>
	
	
	
	
	
	
	
	
	
<!-- 	</section> -->
<!--     <h2>주문상세</h2> -->
<!--     <form action="/item/pay" method="post"> -->
<%-- 	<c:choose> --%>
<%-- 	<c:when test="${mbList == null }"> --%>
<%--     <input type="hidden" value="${user_num }" name="item_num"> --%>
<%--     Color : <input type="text" value="${odvo.order_detail_color }" readonly="readonly" style="text-align: center;" > --%>
<!--     <br> -->
<%--     Size : <input type="text" value="${odvo.order_detail_size }" readonly="readonly" style="text-align: center;">  --%>
<!--     <br> -->
<%--     Count : <input type="number" value="${odvo.order_detail_stock }" readonly="readonly" style="text-align: center;"> --%>
<!-- 	<br> -->
<%-- 	Price : <input type="number" value="${vo.item_price*odvo.order_detail_stock }" readonly="readonly" style="text-align: center;" name="order_total_price"> --%>
<!-- 	<br> -->
<%-- 	Point : <input type="text" value="${(vo.item_price*odvo.order_detail_stock)*5/100 }" name="order_total_point" style="text-align: center;"> --%>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<%-- 	 <c:forEach var="il" items="${mbList }" varStatus="status" > --%>
<!-- 	 <!-- 장바구니 아이템 가져오기 --> -->
<%-- 		여기 사람 있어요 : <input type="text" value="${il.itemvo.item_price }"> --%>
<%-- 	</c:forEach> --%>
<%-- 	</c:otherwise> --%>
<%-- 	</c:choose> --%>
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<h2>추가 정보</h2> -->
<!-- 	<br> -->
<!-- 	<select name="order_method"> -->
<!-- 		<option value="">결제 방법을 선택해주세요</option> -->
<!-- 		<option value="무통장입금">무통장입금</option> -->
<!-- 		<option value="카드결제">카드결제</option> -->
<!-- 		<option value="카카오페이">카카오페이</option> -->
<!-- 	</select> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 				<input type="text" id="sample4_postcode" name="postcode" readonly placeholder="우편번호" class="under_line_solid_gray" style="text-align: center;"> -->
<!-- 				<input type="text" id="sample4_roadAddress" name="roadAddress" readonly placeholder="도로명주소" class="under_line_solid_gray" style="text-align: center;"> -->
<!-- 				<input type="hidden" id="sample4_jibunAddress" name="jibunAddress" readonly placeholder="지번주소" style="text-align: center;"> -->
<!-- 				<span id="guide" style="color:#999;display:none"></span> -->
<!-- 				<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" class="under_line_solid_gray" style="text-align: center;"> -->
<!-- 				<input type="text" id="sample4_extraAddress" name="extraAddress" readonly placeholder="참고항목" class="under_line_solid_gray" style="text-align: center;"> -->
<!-- 				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="border_none"><br> -->
				
<!-- 				<input type="hidden" name="user_addr">	 -->
<!--     	<br> -->
    	
<!--     	<input type="submit" value="결제하기"> -->
<!--     </form> -->
<%--     </center> --%>
	<script src="/resources/daum_postcode/js/postcode.js"></script><br>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/jps/js/order.js"></script><br>
    <!-- footer -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer -->