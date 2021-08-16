<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>

<script>
	window.onload = openPopup();

	
	function getCookie(name) {
		var cookie = document.cookie;
		
		if (document.cookie != "") {
			var cookie_array = cookie.split("; ");
			for ( var index in cookie_array) {
				var cookie_name = cookie_array[index].split("=");
				if (cookie_name[0] == "popupYN") {
					return cookie_name[1];
				}
			}
		}
	
		return;
	}
	
	function openPopup(url) {
		var cookieCheck = getCookie("popupYN");
		if (cookieCheck != "N"){
			window.open("/popup/popup", "popup", "width=400, height=500, history=no, resizable=no, status=no, scrollbars=yes, menubar=no")
		}
	}
</script>


</head>
<body>

	<%@ include file="include/header.jsp"%>


	<main id="main">

		<div class="site-section site-portfolio">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
						<h2>Hi, it's our Best Items.</h2>
						<p class="mb-0">Creative &amp; Reliable Goods Provided</p>
					</div>
					<div class="col-md-12 col-lg-6 text-left text-lg-right"
						data-aos="fade-up" data-aos-delay="100">
						<div id="filters" class="filters">
							<a href="#" data-filter="*" class="active"
								onclick="return openPopUp()">All</a> <a href="#"
								data-filter=".web">Top</a> <a href="#" data-filter=".design">Bottom</a>
							<a href="#" data-filter=".branding">Outer</a> <a href="#"
								data-filter=".photography">Shoes</a> <a href="#"
								data-filter=".hat">Hat</a>
						</div>
					</div>
				</div>
				<div id="portfolio-grid" class="row no-gutter" data-aos="fade-up"
					data-aos-delay="200">
					<div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
						<a href="work-single.html" class="item-wrap fancybox">
							<div class="work-info">
								<h3>Boxed Water</h3>
								<span>Web</span>
							</div> <img class="img-fluid" src="/resources/tmp/img/img_1.jpg">
						</a>
					</div>
					<div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
						<a href="work-single.html" class="item-wrap fancybox">
							<div class="work-info">
								<h3>Build Indoo</h3>
								<span>Photography</span>
							</div> <img class="img-fluid" src="/resources/tmp/img/img_2.jpg">
						</a>
					</div>
					<div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
						<a href="work-single.html" class="item-wrap fancybox">
							<div class="work-info">
								<h3>Cocooil</h3>
								<span>Branding</span>
							</div> <img class="img-fluid" src="/resources/tmp/img/img_3.jpg">
						</a>
					</div>
					<div class="item design col-sm-6 col-md-4 col-lg-4 mb-4">
						<a href="work-single.html" class="item-wrap fancybox">
							<div class="work-info">
								<h3>Nike Shoe</h3>
								<span>Design</span>
							</div> <img class="img-fluid" src="/resources/tmp/img/img_4.jpg">
						</a>
					</div>
					<div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
						<a href="work-single.html" class="item-wrap fancybox">
							<div class="work-info">
								<h3>Kitchen Sink</h3>
								<span>Photography</span>
							</div> <img class="img-fluid" src="/resources/tmp/img/img_5.jpg">
						</a>
					</div>
					<div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
						<a href="work-single.html" class="item-wrap fancybox">
							<div class="work-info">
								<h3>Amazon</h3>
								<span>brandingn</span>
							</div> <img class="img-fluid" src="/resources/tmp/img/img_6.jpg">
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row justify-content-center text-center mb-4">
					<div class="col-5">
						<h3 class="h3 heading">My Clients</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
							explicabo inventore.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4 col-sm-4 col-md-2">
						<a href="#" class="client-logo"><img
							src="/resources/tmp/img/logo-adobe.png" alt="Image"
							class="img-fluid"></a>
					</div>
					<div class="col-4 col-sm-4 col-md-2">
						<a href="#" class="client-logo"><img
							src="/resources/tmp/img/logo-uber.png" alt="Image"
							class="img-fluid"></a>
					</div>
					<div class="col-4 col-sm-4 col-md-2">
						<a href="#" class="client-logo"><img
							src="/resources/tmp/img/logo-apple.png" alt="Image"
							class="img-fluid"></a>
					</div>
					<div class="col-4 col-sm-4 col-md-2">
						<a href="#" class="client-logo"><img
							src="/resources/tmp/img/logo-netflix.png" alt="Image"
							class="img-fluid"></a>
					</div>
					<div class="col-4 col-sm-4 col-md-2">
						<a href="#" class="client-logo"><img
							src="/resources/tmp/img/logo-nike.png" alt="Image"
							class="img-fluid"></a>
					</div>
					<div class="col-4 col-sm-4 col-md-2">
						<a href="#" class="client-logo"><img
							src="/resources/tmp/img/logo-google.png" alt="Image"
							class="img-fluid"></a>
					</div>

				</div>
			</div>
		</div>


		<div class="site-section">
			<div class="container">
				<div class="row justify-content-center text-center mb-4">
					<div class="col-5">
						<h3 class="h3 heading">My Services</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
							explicabo inventore.</p>
					</div>
				</div>
				<div class="row">

					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<span class="la la-cube la-3x mb-4"></span>
						<h4 class="h4 mb-2">Web Design</h4>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
							explicabo inventore.</p>
						<ul class="list-unstyled list-line">
							<li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
							<li>Non pariatur nisi</li>
							<li>Magnam soluta quod</li>
							<li>Lorem ipsum dolor</li>
							<li>Cumque quae aliquam</li>
						</ul>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<span class="la la-mobile la-3x mb-4"></span>
						<h4 class="h4 mb-2">Mobile Applications</h4>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
							explicabo inventore.</p>
						<ul class="list-unstyled list-line">
							<li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
							<li>Non pariatur nisi</li>
							<li>Magnam soluta quod</li>
							<li>Lorem ipsum dolor</li>
							<li>Cumque quae aliquam</li>
						</ul>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<span class="la la-image la-3x mb-4"></span>
						<h4 class="h4 mb-2">Graphic Design</h4>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
							explicabo inventore.</p>
						<ul class="list-unstyled list-line">
							<li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
							<li>Non pariatur nisi</li>
							<li>Magnam soluta quod</li>
							<li>Lorem ipsum dolor</li>
							<li>Cumque quae aliquam</li>
						</ul>
					</div>
					<div class="col-12 col-sm-6 col-md-6 col-lg-3">
						<span class="la la-search la-3x mb-4"></span>
						<h4 class="h4 mb-2">SEO</h4>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit
							explicabo inventore.</p>
						<ul class="list-unstyled list-line">
							<li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
							<li>Non pariatur nisi</li>
							<li>Magnam soluta quod</li>
							<li>Lorem ipsum dolor</li>
							<li>Cumque quae aliquam</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section pt-0">
			<div class="container">

				<div class="owl-carousel testimonial-carousel">

					<div class="testimonial-wrap">
						<div class="testimonial">
							<img src="/resources/tmp/img/person_1.jpg" alt="Image"
								class="img-fluid">
							<blockquote>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Quisquam necessitatibus incidunt ut officiis explicabo
									inventore.</p>
							</blockquote>
							<p>&mdash; Jean Hicks</p>
						</div>
					</div>

					<div class="testimonial-wrap">
						<div class="testimonial">
							<img src="/resources/tmp/img/person_2.jpg" alt="Image"
								class="img-fluid">
							<blockquote>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Quisquam necessitatibus incidunt ut officiis explicabo
									inventore.</p>
							</blockquote>
							<p>&mdash; Chris Stanworth</p>
						</div>
					</div>

				</div>

			</div>
		</div>
	</main>



	<%@ include file="include/footer.jsp"%>
</body>
</html>
