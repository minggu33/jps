<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 공지사항 관리</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/adminNotice.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">

</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<fieldset>
			<legend>[공지사항 수정하기]</legend>
			<form action="./updatenotice" method="post" name="fr"
				onsubmit="return check()" enctype="multipart/form-data">
				<input type="hidden" name="notice_num" value="${noticevo.notice_num }">
				제목 : <input type="text" name="notice_subject" class="under_line_solid_gray" value="${noticevo.notice_subject }">
				<input type="checkbox" name="notice_important" value="1" class="noticewrite-important"
					<c:if test="${noticevo.notice_important eq 1}">
						checked
					</c:if>
				>중요<br>
				첨부파일 : <input type="file" name="uploadfile" class="under_line_solid_gray" onclick="return checkUpdateFile()"><br>
				첨부된 파일 : <input type="text" name="notice_file" readonly
					<c:choose>
						<c:when test="${empty noticevo.notice_file }">
							value="첨부된 파일 없음"
						</c:when>
						<c:otherwise>
							value="${noticevo.notice_file }"
						</c:otherwise>
					</c:choose>
				  class="under_line_solid_gray"><input type="button" value="첨부파일 삭제" onclick="resetFile()" class="under_line_solid_gray"> <br>
				내용 <br><textarea rows="20" cols="150" name="notice_content" class="resize_none">${noticevo.notice_content }</textarea>
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