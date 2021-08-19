<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 팝업 관리</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/jps/js/admin_popup.js"></script>
<link href="/resources/jps/css/jps.css" rel="stylesheet">
<script type="text/javascript">
	var msg = "${msg }";

	if(msg == "success") {
		alert("등록완료");
	} else if (msg == "fail") {
		alert("팝업 등록은 5개까지 가능합니다.");
	}
</script>
</head>
<body>

	<%@ include file="../include/admin_header.jsp"%>

	<div id="adminContent">
		<h1>팝업 목록</h1>
		
		<div id="submit_button">
			<input type="hidden" id="popup_cnt" value="${popupcnt }">
			<input type="button" value="팝업 등록 하기" class="border_none" onclick="insertPopup()">
		</div>
		
		<table class="popupList">
			<tr>
				<td class="popup_num">번호</td>
				<td class="popup_check">사용</td>
				<td class="popup_title">제목</td>
				<td class="popup_img">이미지</td>
				<td class="popup_d">삭제</td>
			</tr>
			
			<c:forEach var="popupvo" items="${popuplist }">
				<tr>
					<td class="popup_num">${popupvo.popup_num }</td>
					<td class="popup_check">
						<input type="radio" value="${popupvo.popup_num }" name="popup_check" class="popupChangeBnt"
							<c:if test="${popupvo.popup_check eq 1 }">
								checked="checked"
							</c:if>
						>
					</td>
					<td class="popup_title"><a href="./updatepopup?popup_num=${popupvo.popup_num }" class="popup_title_a">${popupvo.popup_title }</a></td>
					<td class="popup_img">
					<c:forEach begin="0" end="${fn:length(fn:split(popupvo.popup_img,','))-1}" var="p">
						<img class="img-fluid" width="100px" src="/resources/jps/upload/insertPopup/${fn:split(popupvo.popup_img,',')[p]}">
					</c:forEach>
					</td>
					<td class="popup_d">
						<input type="button" value="삭제하기" class="deletePopup border_none">
					</td>
				</tr>
			</c:forEach>
		
		</table>
	</div>

 
<script src="/resources/jps/js/admin_user.js"></script>

</body>
</html>