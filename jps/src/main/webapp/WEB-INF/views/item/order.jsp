<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="/resources/jps/css/order.css" rel="stylesheet"/>
    <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    
    <!-- header -->
	<%@ include file="../include/header.jsp" %>
	<!-- header -->
	
	<section class="order-cont" >
	
	
	
	
	<!-- Recipient info -->
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
					<input type="radio" name="deliver-radio" checked="checked" style="vertical-align: -1px;"> ${uvo.user_name}님의 배송지 &nbsp;&nbsp;
					<input type="radio" name="deliver-radio" style="vertical-align: -1px;"> 신규배송지 
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
	<!-- Recipient info -->
	
	<br><br>
	
	
	
	
	<!--  Product Info -->
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
					<td class="product-info2">${vo.item_name }<br>${odvo.order_detail_size} , ${odvo.order_detail_color}
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
		· jps 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 전 지역, 전 상품 무료배송입니다.<br>
		· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>
		· 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.<br>
	</div>
	<!--  Product Info -->

	<br>

	<!--  Coupon / Point -->
	<div class="upper-contents">
		<h1>Coupon / Point</h1>	
		<span>쿠폰 / 포인트</span>
	</div>
	
	<div class="info-cont">
		<ul class="info-ul">
			<li class="info-li">
				상품 금액
			</li>
			<li>
				${vo.item_price }
			</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">보유 포인트</li>
			<li>${uvo.user_point }</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">
					보유 쿠폰 할인				
			</li>
			<li>
				<button type="button" class="btns">
					쿠폰 조회/적용
				</button>
			</li>
		</ul>
		
	</div>
	<div class="pro-info">
		· 보유 적립금 사용 시 총 상품 금액의 7% 이내로 제한됩니다. 일부 상품은 적립금 사용이 불가합니다.<br>
		· 적립 포인트는 구매상품의 5% 금액입니다.<br>
		· 현재 구매하는 상품의 적립되는 포인트는 바로 사용이 불가능합니다.<br>
	</div>
	<!--  Coupon / Point -->




	<br>
	<!-- Payment info / Agreement -->
	<div class="upper-contents">
		<h1>Payment info / Agreement </h1>	
		<span>결제 정보 / 주문자 동의</span>
	</div>
	
	<div class="info-cont">
		<ul class="info-ul">
			<li class="info-li">
				품절 시 처리 방법
			</li>
			<li>
				<input type="radio" name="outoforder" checked="checked"> 환불 <span class="explain">별도의 연락 없이 선택하신 결제 방법으로 환불해 드립니다.</span> <br>
				<input type="radio" name="outoforder"> 교환 <span class="explain">교환을 선택하시면 주문자 정보를 통해 연락드린 후 교환을 도와드리겠습니다.</span>
			</li>
		</ul>
		<ul class="info-ul">
			<li class="info-li">주문자 동의</li>
			<li>
				<input type="checkbox" style="vertical-align: -3px;"> 전체 동의<br>
				<input type="checkbox" style="vertical-align: -3px;"> 개인정보 제3자 제공 동의(필수)
					<span id="toc-toggle" onclick="openCloseToc()">자세히</span>
						<p>
					<span id="toc-content">
				
					jps의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, jps 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 jps 입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.<br>
					1. jps는 귀하께서 무신사 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2(개인정보 공유동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. "개인정보 제3자 공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.<br>
					2. 개인정보를 공유받는자 : jps<br>
					3. 공유하는 개인정보 항목<br>
					- 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보<br>
					- 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소<br>
					4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등<br>
					5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.<br>
					6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.<br>
					
					</span> 
					</p>
				<br>
				<input type="checkbox" style="vertical-align: -3px;"> 위 상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의합니다.(필수)<br>
			</li>
		</ul>
		
		
	</div>
	
	<input type="hidden" id="item_name" value="${vo.item_name }">
	<input type="hidden" id="item_price" value="${vo.item_price}">
	<input type="hidden" id="user_name" value="${uvo.user_name}">
	<input type="hidden" id="user_email" value="${uvo.user_email}">
	<input type="hidden" id="user_phone" value="${uvo.user_phone}">
	<input type="hidden" id="user_addr" value="${uvo.user_addr}">
	
	<button id="check_module">결제 테스트</button>
	
	<!-- Payment info / Agreement -->




	</section>
	
	
	
	<script src="/resources/daum_postcode/js/postcode.js"></script><br>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/jps/js/order.js"></script><br>
    <!-- footer -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer -->