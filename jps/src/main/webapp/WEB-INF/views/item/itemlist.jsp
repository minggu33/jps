<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- header -->
<%@ include file="../include/header.jsp" %>
<!-- header -->

	
	<main id="main">
      
    <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>What do you want?</h2>
            <p class="mb-0">Select your style</p>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="#" data-filter="*" class="active">All</a>
              <a href="#" data-filter=".hat">Hat</a>
              <a href="#" data-filter=".outer">Outer</a>
              <a href="#" data-filter=".top">Top</a>
              <a href="#" data-filter=".bottom">Bottom</a>
              <a href="#" data-filter=".shoes">Shoes</a>
            </div>
          </div>
        </div>
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
        <c:forEach var="ItemVO" items="${itemlist }">
          
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4 ${ItemVO.item_category }">
            <a href="./itemdetail?item_num=${ItemVO.item_num }" class="item-wrap fancybox">
              <div class="work-info">
                <h3>${ItemVO.item_name }</h3>
                <span>${ItemVO.item_category }</span><br>
                <span>${ItemVO.item_price }</span>
              </div>
              <img class="img-fluid" src="/resources/jps/upload/insertItem/${fn:split(ItemVO.item_img,',')[0]}">
            </a>
          </div>
        </c:forEach>
        </div>
      </div>
    </div>
    
    <input type="button" onclick="reStart()" value="재정렬">
    
    <div class="pagination"></div>
    </main>
    
<!-- footer -->
<%@ include file="../include/footer.jsp" %>
<!-- footer -->
   <script src="/resources/jps/js/itemList.js"></script>