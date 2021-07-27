<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../include/header.jsp" %>
<!-- header -->
<fieldset>
<legend>[상품 등록하기]</legend>
	<select>
		<option>카테고리를 선택해주세요</option>
		<option value="hat">모자</option>
		<option value="outer">아우터</option>
		<option value="shirts">셔츠</option>
		<option value="half-t">반팔 티셔츠</option>
		<option value="long-t">긴팔 티셔츠</option>
		<option	value="pants">바지</option>
		<option value="denim">데님</option>
		<option value="slacks">슬랙스</option>
		<option value="half-pants">반바지</option>
		<option value="lopper">구두</option>
		<option value="shoes">운동화</option>
		<option value="sliper">슬리퍼</option>
	</select>
	<input type="text" placeholder="상품명을 작성해주세요" name="item_name">
	<input type="text" placeholder="가격을 작성해주세요" name="item_price">
	<input type="file" name="item_img">
	<input type="text" placeholder="상품 설명을 작성해주세요" name="item_content">
</fieldset>



<!-- footer -->
<%@ include file="../include/footer.jsp" %>
<!-- footer -->