<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    <!-- header -->
	<%@ include file="../include/header.jsp" %>
	<!-- header -->
	<center>
    <h2>주문상세</h2>
    <input type="text" value="${user_num }">
    색상 : <input type="text" value="${odvo.order_detail_color }" readonly="readonly" style="text-align: center;">
    <br>
    사이즈 : <input type="text" value="${odvo.order_detail_size }" readonly="readonly" style="text-align: center;"> 
    </center>
    
   
    
    <!-- footer -->
	<%@ include file="../include/footer.jsp" %>
	<!-- footer -->