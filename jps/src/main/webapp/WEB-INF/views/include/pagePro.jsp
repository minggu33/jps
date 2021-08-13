<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<link href="/resources/jps/css/pagePro.css" rel="stylesheet">
<body>
	<div id="pageProcess">
		<div class="pageNum">
			<c:if test="${searchVO.startPage > searchVO.pageBlock}">
				<a onclick="searchFunc(${searchVO.startPage - searchVO.pageBlock });" >[이전]</a>
			</c:if>
			
			<c:forEach begin="${searchVO.startPage }" end="${searchVO.endPage }" var="p">
				<a onclick="searchFunc(${p });">[${p }]</a>
			</c:forEach>
			
			<c:if test="${searchVO.endPage < searchVO.pageCount}">
				<a onclick="searchFunc(${searchVO.startPage + searchVO.pageBlock });">[다음]</a>
			</c:if>
		</div>
			<form name="searchFr" method="post" onsubmit="return searchCheck()">
				<input type="hidden" name="pageNum" value="${searchVO.pageNum }">
				<input type="hidden" name="pageSize" value="${searchVO.pageSize }">
			
				<select name="type">
					<option value="0"
						<c:if test="${searchVO.type == 0}">
							selected
						</c:if>
					>전체 보기</option>
					<option value="1"
						<c:if test="${searchVO.type == 1}">
							selected
						</c:if>
					>제목</option>
					<option value="2"
						<c:if test="${searchVO.type == 2}">
							selected
						</c:if>
					>내용</option>
					<option value="3"
						<c:if test="${searchVO.type == 3}">
							selected
						</c:if>
					>제목+내용</option>
				</select>
				
				<input type="search" name="search" value="${searchVO.search }"><input type="submit" value="검색하기">
			</form>


	<script src="/resources/jps/js/pageProcess.js"></script>
	
	
	</div>


</body>
