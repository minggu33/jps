<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<legend>[팝업 이미지 등록하기]</legend>
			<form action="./insertpopup" method="post" name="fr" enctype="multipart/form-data" onsubmit="return check()">
				제목 : <input type="text" name="popup_title" class="under_line_solid_gray"><br>
				<table id="file">
					<tr>
						<td><input type="file" name="uploadfile" class="border_none under_line_solid_gray"></td>
						<td><input type="button" value="삭제하기" class="deleteFile border_none"></td>
					</tr>
				</table>
				<input type="button" class="insertImg border_none" value="파일추가">
				<hr> 
				<div id="submit_button">
					<input type="submit" value="등록하기" class="border_none">
				</div>
			</form>
		</fieldset>
	</div>

</body>
</html>