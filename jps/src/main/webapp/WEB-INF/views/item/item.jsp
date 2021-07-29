<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    $(function(){
    $(".append").on("click", function(){
    	var t = "<input type='file' name='item_img'>";
    	$(".box").html(t);
    	$(".box").fadeToggle();
    });
   });
    </script>
    <script type="text/javascript">
	function check(){
		if(document.fr.item_category.value == ""){
			alert("카테고리를 선택해주세요.");
			return false;
		}
		if(document.fr.item_name.value == ""){
			alert("상품명을 등록해주세요.");
			document.fr.item_name.focus();
			return false;
		}
		if(document.fr.item_price.value == ""){
			alert("상품가격을 등록해주세요.");
			document.fr.item_price.focus();
			return false;
		}
		if(document.fr.item_content.value == ""){
			alert("상품 설명을 작성해주세요.");
			document.fr.item_content.focus();
			return false;
		}
	}
	</script>
<!-- header -->
<%@ include file="../include/header.jsp" %>
<!-- header -->
<center>
<fieldset>
<legend>[상품 등록하기]</legend>
<form action="./item" method="post" name="fr" onsubmit="return check()">
	<select name="item_category">
		<option value="">카테고리를 선택해주세요</option>
		<option value="hat">모자</option>
		<option value="outer">아우터</option>
		<option value="shirts">셔츠</option>
		<option value="pants">바지</option>
		<option value="shoes">신발</option>
	</select>
	<br>
	<input type="text" placeholder="상품명을 작성해주세요" name="item_name">
	<br>
	<input type="text" placeholder="가격을 작성해주세요" name="item_price">
	<br>
	<input type="file" name="item_img">
	<input type="button" class="append" value="파일추가">
	<br>
	<div class="box" style="display: none"></div>
	<br>
	<textarea rows="10" cols="30" name="item_content"></textarea>
	<br>
	<input type="submit" value="등록하기">
	</form>
</fieldset>
</center>
<!-- footer -->
<%@ include file="../include/footer.jsp" %>
<!-- footer -->