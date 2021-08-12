<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<body>
<div id="listCnt">
	<input type="hidden" value="${searchVO.pageNum }" id="pageNum">
	<input type="hidden" value="${searchVO.type }" id="type">
	<input type="hidden" value="${searchVO.search }" id="search">
	<select name="pageSize" id="pageSize" onchange="changePageSize()">
		<option value="5"
			<c:if test="${searchVO.pageSize == 5}">
				selected
			</c:if>
		>5개씩 보기</option>
		<option value="10"
			<c:if test="${searchVO.pageSize == 10}">
				selected
			</c:if>
		>10개씩 보기</option>
		<option value="15"
			<c:if test="${searchVO.pageSize == 15}">
				selected
			</c:if>
		>15개씩 보기</option>
		<option value="20"
			<c:if test="${searchVO.pageSize == 20}">
				selected
			</c:if>
		>20개씩 보기</option>
	</select>
</div>
	
	<script src="/resources/jps/js/pageProcess.js"></script>

</body>
