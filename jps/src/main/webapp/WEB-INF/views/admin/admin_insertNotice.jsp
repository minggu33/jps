<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 공지사항 등록</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script src="/resources/jps/js/itemInsert.js"></script> -->
<link href="/resources/jps/css/jps.css" rel="stylesheet">

</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<fieldset>
			<legend>[공지사항 등록하기]</legend>
			<form action="./insertnotice" method="post" name="fr"
				onsubmit="return check()" enctype="multipart/form-data">
				제목 : <input type="text" name="notice_subject" class="under_line_solid_gray">
				<input type="checkbox" name="notice_important" value="1" class="noticewrite-important">중요<br>
				첨부파일 : <input type="file" name="uploadfile" class="under_line_solid_gray"><br>
				내용 <br><textarea rows="20" cols="150" name="notice_content" class="resize_none"></textarea>
				<hr>
				<div id="submit_button">
					<input type="submit" value="글쓰기" class="border_none">
				</div>
			</form>
		</fieldset>
	</div>

</body>
</html>