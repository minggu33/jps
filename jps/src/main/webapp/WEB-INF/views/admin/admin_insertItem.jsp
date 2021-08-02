<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 등록</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/itemInsert.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">

</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<fieldset>
			<legend>[상품 등록하기]</legend>
			<form action="./insertitem" method="post" name="fr"
				onsubmit="return check()">
				
				<input type="text" placeholder="상품명을 작성해주세요" name="item_name" class="under_line_solid_gray"> 
				<select name="item_category" class="under_line_solid_gray">
					<option value="">카테고리를 선택해주세요</option>
					<option value="hat">모자</option>
					<option value="outer">아우터</option>
					<option value="top">상의</option>
					<option value="bottom">하의</option>
					<option value="shoes">신발</option>
				</select> <br>
				<input type="number" placeholder="가격을 작성해주세요" step="100" min="0" name="item_price" class="under_line_solid_gray"> <br>
				<input type="file" name="item_img" class="border_none under_line_solid_gray">
				<input type="button" class="append border_none" value="파일추가"> <br>
				<div class="box" style="display: none"></div>
				<textarea rows="20" cols="160" name="item_content" class="resize_none"></textarea>
				<br> 
				<div id="submit_button">
					<input type="submit" value="등록하기" class="border_none">
				</div>
			</form>
		</fieldset>
	</div>

</body>
</html>