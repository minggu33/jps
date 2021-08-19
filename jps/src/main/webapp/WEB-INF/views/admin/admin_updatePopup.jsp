<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 팝업 등록</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/insertPopup_img.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">

</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<fieldset>
			<legend>[팝업 이미지 수정하기]</legend>
			<form action="./updatepopup" method="post" name="fr" enctype="multipart/form-data" onsubmit="return updateCheck()">
				<input type="hidden" name="popup_num" value="${popupvo.popup_num }">
				<input type="hidden" name="popup_img" value="${popupvo.popup_img }">
				제목 : <input type="text" name="popup_title" class="under_line_solid_gray" value="${popupvo.popup_title }"><br>
				<table id="file">
					<tr>
						<td><input type="file" name="uploadfile" class="border_none under_line_solid_gray"></td>
						<td><input type="button" value="삭제하기" class="deleteFile border_none"></td>
					</tr>
				</table>
				<input type="button" class="insertImg border_none" value="파일추가">
				<div class="preImg">
					<c:forEach begin="0" end="${fn:length(fn:split(popupvo.popup_img,','))-1}" var="p">
						<a>
							<label class="delete">
								<svg  xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</label>
							<img class="img-fluid" width="100px" src="/resources/jps/upload/insertPopup/${fn:split(popupvo.popup_img,',')[p]}">
							<input type="hidden" name="popup_imgs" value="${fn:split(popupvo.popup_img,',')[p]}">
						</a>
					</c:forEach>
				</div>
				<hr> 
				<div id="submit_button">
					<input type="button" value="목록으로" class="border_none" onclick="checkReset()">
					<input type="submit" value="등록하기" class="border_none">
				</div>
			</form>
		</fieldset>
	</div>

</body>
</html>