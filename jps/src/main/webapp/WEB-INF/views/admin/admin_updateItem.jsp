<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 수정</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/itemInsert.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">

</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<fieldset>
			<legend>[상품 등록하기]</legend>
			<form action="./updateitem" method="post" name="fr"
				onsubmit="return updateCheck()" enctype="multipart/form-data">
				<input type="hidden" name="item_num" value="${itemlist[0].item_num }" id="item_num">
				<input type="text" placeholder="상품명을 작성해주세요" name="item_name" value="${itemlist[0].item_name }" class="under_line_solid_gray"> 
				<select name="item_category" class="under_line_solid_gray">
					<option value="">카테고리를 선택해주세요</option>
					<option value="hat"
						<c:if test="${itemlist[0].item_category eq 'hat' }">
							selected
						</c:if>
					>모자</option>
					<option value="outer"
						<c:if test="${itemlist[0].item_category eq 'outer' }">
							selected
						</c:if>
					>아우터</option>
					<option value="top"
						<c:if test="${itemlist[0].item_category eq 'top' }">
							selected
						</c:if>
					>상의</option>
					<option value="bottom"
						<c:if test="${itemlist[0].item_category eq 'bottom' }">
							selected
						</c:if>
					>하의</option>
					<option value="shoes"
						<c:if test="${itemlist[0].item_category eq 'hat' }">
							selected
						</c:if>
					>신발</option>
				</select> <br>
				<input type="number" placeholder="가격을 작성해주세요" step="100" min="0" name="item_price" class="under_line_solid_gray" value="${itemlist[0].item_price }"> <br>
				<table id="file">
					<tr>
						<td><input type="file" name="uploadfile" class="border_none under_line_solid_gray"></td>
						<td><input type="button" value="삭제하기" class="deleteFile border_none"></td>
					</tr>
				</table>
				<input type="button" class="insertImg border_none" value="파일추가"><br>
				<input type="hidden" name="item_img" value="${itemlist[0].item_img }">
				<div class="preImg">
					<c:forEach begin="0" end="${fn:length(fn:split(itemlist[0].item_img,','))-1}" var="p">
						<a>
							<label class="delete">
								<svg  xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</label>
							<img class="img-fluid" width="100px" src="/resources/jps/upload/insertItem/${fn:split(itemlist[0].item_img,',')[p]}">
							<input type="hidden" name="item_imgs" value="${fn:split(itemlist[0].item_img,',')[p]}">
						</a>
					</c:forEach>
				</div>
				<hr>
				<table id="stock">
					<tr>
						<td>색상</td>
						<td>사이즈</td>
						<td>수량</td>
					</tr>
					
					<c:forEach var="ItemList" items="${itemlist }">
						<tr>
							<td><input type="text" name="item_colors" value="${ItemList.item_color }">
								<input type="hidden" name="item_detail_idxs" value="${ItemList.item_detail_idx }">
								<input type="hidden" name="item_nums" value="${ItemList.item_num }">
							</td>
							<td>
								<select name="item_sizes">
									<option value="">사이즈를 선택해 주세요.</option>
									<option value="S"
										<c:if test="${ItemList.item_size eq 'S' }">
											selected
										</c:if>
									>S</option>
									<option value="M"
										<c:if test="${ItemList.item_size eq 'M' }">
											selected
										</c:if>
									>M</option>
									<option value="L"
										<c:if test="${ItemList.item_size eq 'L' }">
											selected
										</c:if>
									>L</option>
									<option value="XL"
										<c:if test="${ItemList.item_size eq 'XL' }">
											selected
										</c:if>
									>XL</option>
									<option value="XXL"
										<c:if test="${ItemList.item_size eq 'XXL' }">
											selected
										</c:if>
									>XXL</option>
									<option value="Free"
										<c:if test="${ItemList.item_size eq 'Free' }">
											selected
										</c:if>
									>Free</option>
								</select>
							</td>
							<td><input type="number" name="item_stocks" min="0" value="${ItemList.item_stock }"></td>
							<td><input type="button" value="삭제하기" class="deleteStock border_none"></td>
						</tr>
					</c:forEach>
				</table>
				<input type="hidden" name="item_color">
				<input type="hidden" name="item_size">
				<input type="hidden" name="item_stock">
				<input type="hidden" name="item_detail_idx">
				<input type="hidden" name="detail_item_num">
				<input type="button" value="추가하기" id="addItem" class="border_none" onclick="addStock()"> 
				<hr>
				<textarea rows="20" cols="150" name="item_content" class="resize_none">${itemlist[0].item_content }</textarea>
				<hr>
				<div id="submit_button">
					<input type="button" value="목록으로" class="border_none" onclick="location.href='/admin/itemlist'">
					<input type="submit" value="등록하기" class="border_none">
				</div>
			</form>
		</fieldset>
	</div>

</body>
</html>