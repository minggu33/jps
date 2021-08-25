function YesScroll() {
	const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
	const fullContent = document.querySelector('#main'); // 전체를 둘러싼 컨텐츠 정보획득
	const footer = document.querySelector(".footer");
	const screenHeight = screen.height; // 화면 크기
	let oneTime = false; // 일회용 글로벌 변수
	document.addEventListener('scroll', OnScroll, { passive: true }) // 스크롤 이벤트함수정의
	function OnScroll() { //스크롤 이벤트 함수
		const fullHeight = fullContent.clientHeight; // infinite 클래스의 높이
		const footerHeigth = footer.clientHeight;
		const scrollPosition = pageYOffset; // 스크롤 위치
		if (fullHeight - footerHeigth - screenHeight / 2 <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
			oneTime = true; // oneTime 변수를 true로 변경해주고,
			madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
			alert("바닥");
		}
	}

	function madeBox() {
		$.ajax({
			type: 'get',
			url: './itemlistinfi',
			// data: { item_num: item_num },
			dataType: "json",
			async: false,
			success: function(data) {
				console.log(data);
				
				$.each(data, function(idx, item){
					var t = "";
					t += '<div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4 '+item.item_category+'">';
					t += '<a href="./itemdetail?item_num='+item.item_num+'" class="item-wrap fancybox">';
					t += '<div class="work-info">';
					t += '<h3>'+item.item_name+'</h3>';
					t += '<span>'+item.item_category+'</span><br>';
					t += '<span>'+item.item_price+'</span>';
					t += '</div>';
					t += '<img class="img-fluid" src="/resources/jps/upload/insertItem/'+item.item_img.split(",")[0]+'">';
					t += '</a>';
					t += '</div>';
					
					$("#portfolio-grid").append(t);
				});
				// oneTime = false;
			},
			error:function(request,status,error){
    	    	console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       	}
		});
	}
}
YesScroll()

function reStart() {
	alert('재정렬');
	(function ($) {
	  "use strict";
	
	  var siteIstotope = function() {
		  var $container = $('#portfolio-grid').isotope({
		    itemSelector : '.item',
		    isFitWidth: true
		  });
	
		  $(window).resize(function(){
		    $container.isotope({
		      columnWidth: '.col-sm-3'
		    });
		  });
		  
		  $container.isotope({ filter: '*' });
	
		  $('#filters').on( 'click', 'a', function(e) {
		  	e.preventDefault();
		    var filterValue = $(this).attr('data-filter');
		    $container.isotope({ filter: filterValue });
		    $('#filters a').removeClass('active');
		    $(this).addClass('active');
		  });
	  }
	  $(window).on('load', function () {
	    siteIstotope();
	  });
	
	
	  var siteOwlCarousel = function() {
	  	$('.testimonial-carousel').owlCarousel({
			  center: true,
		    items: 1,
		    loop: true,
		    margin: 0,
		    autoplay: true,
		    smartSpeed: 1000,
			});
	  };
	  siteOwlCarousel();
	
	
	})(jQuery);
	
	AOS.init({
		easing: 'ease',
		duration: 1000,
		once: true
	});
}


