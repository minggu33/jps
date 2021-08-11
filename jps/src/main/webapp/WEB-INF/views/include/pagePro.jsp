<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<body>

	<div id="pageProcess">
	
			<c:if test="${searchVO.startPage > searchVO.pageBlock}">
				<a onclick="searchFunc(${searchVO.startPage - searchVO.pageBlock });" >[����]</a>
			</c:if>
			
			<c:forEach begin="${searchVO.startPage }" end="${searchVO.endPage }" var="p">
				<a onclick="searchFunc(${p });">[${p }]</a>
			</c:forEach>
			
			<c:if test="${searchVO.endPage < searchVO.pageCount}">
				<a onclick="searchFunc(${searchVO.startPage + searchVO.pageBlock });">[����]</a>
			</c:if>
			
			<form name="searchFr" method="post">
				<input type="hidden" name="pageNum" value="${searchVO.pageNum }">
				<input type="hidden" name="pageSize" value="${searchVO.pageSize }">
			
				<select name="type">
					<option value="1"
						<c:if test="${searchVO.type == 1}">
							selected
						</c:if>
					>����</option>
					<option value="2"
						<c:if test="${searchVO.type == 2}">
							selected
						</c:if>
					>����</option>
					<option value="3"
						<c:if test="${searchVO.type == 3}">
							selected
						</c:if>
					>����+����</option>
				</select>
				
				<input type="search" name="search" value="${searchVO.search }"><input type="submit" value="�˻��ϱ�">
			</form>


	<script src="/resources/jps/js/pageProcess.js"></script>
	
	
	</div>


</body>
