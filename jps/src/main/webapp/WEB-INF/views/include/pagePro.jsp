<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<body>

	<div id="pageProcess">
	
	<c:choose>

		<c:when test="${type eq 'search'}">
			
			<c:if test="${searchVO.startPage > searchVO.pageBlock}">
				<a href="?pageNum=${searchVO.startPage - searchVO.pageBlock }&pageSize=${searchVO.pageSize }&type=${searchVO.type }&search=${searchVO.search }" >[����]</a>
			</c:if>
			
			<c:forEach begin="${searchVO.startPage }" end="${searchVO.endPage }" var="p">
				<a href="?pageNum=${p }&pageSize=${searchVO.pageSize }&type=${searchVO.type }&search=${searchVO.search }">[${p }]</a>
			</c:forEach>
			
			<c:if test="${searchVO.endPage < searchVO.pageCount}">
				<a href="?pageNum=${searchVO.startPage + searchVO.pageBlock }&pageSize=${searchVO.pageSize }&type=${searchVO.type }&search=${searchVO.search }" >[����]</a>
			</c:if>
			
			<form name="searchFr" method="post">
				<select name="type">
					<option value="1">����</option>
					<option value="2">����</option>
					<option value="3">����+����</option>
				</select>
				
				<input type="search" name="search" value=""><input type="submit" value="�˻��ϱ�">
			</form>
		</c:when>
		
		<c:otherwise>
			<c:if test="${searchVO.startPage > searchVO.pageBlock}">
				<a href="?pageNum=${searchVO.startPage - searchVO.pageBlock }&pageSize=${searchVO.pageSize }" >[����]</a>
			</c:if>
			
			<c:forEach begin="${searchVO.startPage }" end="${searchVO.endPage }" var="p">
				<a href="?pageNum=${p }&pageSize=${searchVO.pageSize }">[${p }]</a>
			</c:forEach>
			
			<c:if test="${searchVO.endPage < searchVO.pageCount}">
				<a href="?pageNum=${searchVO.startPage + searchVO.pageBlock }&pageSize=${searchVO.pageSize }" >[����]</a>
			</c:if>
			
			<form name="searchFr" method="post">
				<select name="type">
					<option value="1">����</option>
					<option value="2">����</option>
					<option value="3">����+����</option>
				</select>
				
				<input type="search" name="search"><input type="submit" value="�˻��ϱ�">
			</form>
		</c:otherwise>
	
	</c:choose>



	
	
	
	</div>


</body>
