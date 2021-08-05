<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/jps/css/admin.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link href='https://fonts.googleapis.com/css?family=Lato:400,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<section class="app">
	<aside class="sidebar">
		<header> Menu </header>
		<nav class="sidebar-nav">

			<ul>
				<li><a href="#"><i class="ion-bag"></i> <span>회원 관리</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-color-filter-outline"></i>회원 전체 보기</a>
						</li>
						<li><a href="#"><i class="ion-ios-clock-outline"></i>탈퇴 회원 보기</a>
						</li>
					</ul></li>
				<li><a href="#"><i class="ion-ios-settings"></i> <span
						class="">상품 관리</span></a>
					<ul class="nav-flyout">
						<li><a href="/admin/itemlist"><i class="ion-ios-alarm-outline"></i>상품 전체 보기</a>
						</li>
						<li><a href="/admin/insertitem"><i class="ion-ios-alarm-outline"></i>상품 등록</a>
						</li>
						<li><a href="#"><i class="ion-ios-camera-outline"></i>재고 관리</a>
						</li>
					</ul></li>
				<li><a href="#"><i class="ion-ios-briefcase-outline"></i> <span
						class="">게시판 관리</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-flame-outline"></i>전체 게시글</a>
						</li>
						<li><a href="#"><i class="ion-ios-lightbulb-outline"></i>신고 게시글</a>
						</li>
					</ul></li>
				<li><a href="#"><i class="ion-ios-analytics-outline"></i> <span
						class="">주문 관리</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-timer-outline"></i>주문 상품</a>
						</li>
						<li><a href="#"><i class="ion-arrow-graph-down-left"></i>배송중</a></li>
					</ul></li>
				<li><a href="#"><i class="ion-ios-paper-outline"></i> <span
						class="">이벤트 관리</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-filing-outline"></i>쿠폰 관리</a></li>
						<li><a href="#"><i class="ion-ios-information-outline"></i>일정관리</a>
						</li>
					</ul></li>
			</ul>
		</nav>
	</aside>
</section>