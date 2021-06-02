<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html>
<head>
<title>HJJH Trip Home</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/home.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"> -->
<!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
</head>
<body>
	<!-- 네비바 이용방법 클릭시 나타날 div 팝업  -->
	<div id="light" class="white_content">
		<bs>사이트 이용방법</b> <a href="javascript:void(0)"
			style="visibility: visible !important;"
			onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
			<i class="fas fa-times"></i>
		</a>
		<p style="font-size: 4px;">HJJH TRIP 페이지의 이용방법을 안내해드립니다.</p>
		<div style="width: 400px; margin-left: 300px;">
			<!-- carousel 구성영역 -->
			<div id="carousel-example-generic" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/resources/img/desc1.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/img/desc2.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/img/desc3.jpg"
							class="d-block w-100">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carousel-example-generic" data-bs-slide="prev">
					<i class="fas fa-chevron-left"></i>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carousel-example-generic" data-bs-slide="next">
					<i class="fas fa-chevron-right"></i>
				</button>
			</div>
		</div>
	</div>
<body>
	<!-- 네비바 이용방법 클릭시 나타날 div 팝업  -->
	<div id="light" class="white_content">
		<bs>사이트 이용방법</b> <a href="javascript:void(0)"
			style="visibility: visible !important;"
			onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
			<i class="fas fa-times"></i>
		</a>
		<p style="font-size: 4px;">HJJH TRIP 페이지의 이용방법을 안내해드립니다.</p>
		<div style="width: 400px; margin-left: 300px;">
			<!-- carousel 구성영역 -->
			<div id="carousel-example-generic" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/resources/img/desc1.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/img/desc2.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/img/desc3.jpg"
							class="d-block w-100">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carousel-example-generic" data-bs-slide="prev">
					<i class="fas fa-chevron-left"></i>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carousel-example-generic" data-bs-slide="next">
					<i class="fas fa-chevron-right"></i>
				</button>
			</div>
		</div>
	</div>
	<div id="fade" class="black_overlay"></div>
	<script>
		//스크롤 시, 상단 네비게이션 바 색상변경 함수
		$(function() {
			var $header = $('header');
			var $page = $('.page-start');
			var $window = $(window);
			var pageOffsetTop = $page.offset().top;

			$window.resize(function() {
				pageOffsetTop = $page.offset().top;
			});

			$window.on('scroll', function() {
				var scrolled = $window.scrollTop() >= pageOffsetTop;
				$header.toggleClass('down', scrolled);
			});
		});
	</script>
	<script>
		//지정한 태그위치로 클릭시 스크롤자동이동
		function fnMove(seq) {
			var offset = $("#" + seq).offset();
			$('html, body').animate({
				scrollTop : offset.top
			}, 300);
		}
	</script>
	<script>
	<!-- carousel 조정 스크립트-->
		$(function() {
			$('#carousel-example-generic').carousel({
				interval : false, //자동순환 X
				wrap : true,
				keyboard : true
			});
		});
	</script>
	<script>
		function newchange() {
			alert("사이트 변경사항 안내");
		}
	</script>
	<header>
		<div>
			<!-- 상단 네비게이션 바 -->
			<nav class="navbar navbar-expand-sm fixed-top justify-content-end">
				<a class="navbar-brand"
					style="color: #FFFFFF; text-decoration: none;"
					href="${pageContext.request.contextPath}/"><h5>
						<b>HJJH TRIP</b>
					</h5></a>
				<div class="main-nav">
					<ul class="navbar-nav ml-auto mr-1">
						<li class="nav-item" id="nav-lists"><a class="nav-link"
							onclick="fnMove('searchpage')">여행지</a></li>
						<li class="nav-item" id="nav-lists"><a class="nav-link"
							style="cursor: pointer;" onclick="window.scrollTo(0,0);">TOP
								PAGE</a></li>
						<li class="nav-item" id="nav-lists"><a class="nav-link"
							href="javascript:void(0)"
							onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
								이용방법</a></li>
						<li class="nav-item" id="nav-lists"
							style="padding-left: 4px; padding-right: 4px;"><a
							class="nav-link" onclick="newchange()"><i class="fas fa-bell"></i></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<!-- 시작 하늘 사진 박스-->
	<div class="page-start">
		<div class="home-img">
			<div class="home-text">
				<h1 style="font-size: 45px;">HJJH TRIP</h1>
				<h5>당신의 여행 우리와 함께 계획 신나는 여행</h5>
				<button class="start-button" style="vertical-align: middle"
					onclick="fnMove('searchpage')">
					<a style="text-decoration: none; color: #FFFFFF">시작하기</a>
				</button>
			</div>
		</div>
	</div>
	<!-- 여행지 검색 및 선택-->
	<div class="header-search" id="searchpage">
		<h1>
			여행지
			</h>
			<h5>여행지를 검색하거나 목록에서 골라주세요</h5>
			<input type="text" id="search-destination" class="search">
			<button onclick="searchKeyword()">
				<i class="fas fa-search"></i>
			</button>
			<br>
			<br>
			<div id="recommand-city">
				<ul id="worldlist">
					<li id="lists"><a href="#" onclick="leftClickFnc('all')">전체</a></li>
					<li id="lists">국내</li>
					<li id="lists">동아시아</li>
					<li id="lists">유럽</li>
					<li id="lists">아메리카</li>
				</ul>
			</div>
	</div>
	<!--City 목록 div -->
	<div class="container-fluid">
		<div class="row" id="cityList">
			<div class="col-sm-12 col-md-6 col-lg-3" name="asia"
				style="padding: 0.3em;">
				<input type="hidden" value="koreabusan대한민국 부산">
				<div class="card hoverable z-depth-2" style="margin: 0;">
					<div class="card-image imgbox">
						<a href="${pageContext.request.contextPath}/busan_map"> <img
							src="https://myro.co.kr/myro_image/city/busan.jpg" alt="city"
							onclick="" style="cursor: pointer">
						</a>
					</div>
					<div class="card-content" style="margin: 0px; padding: 5px;">
						<span class="card-title">
							<div class="citynamefront">
								<b id="size">BUSAN</b> <br>
								<p id="localname">대한민국 부산</p>
							</div>
						</span>
						<div class="list-group list-group-horizontal" id="list-tab"
							role="tablist">
							<a class="list-group-item list-group-item-action active"
								id="list-home-list" data-bs-toggle="list" href="#list-home"
								role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
							<a class="list-group-item list-group-item-action"
								id="list-profile-list" data-bs-toggle="list"
								href="#list-profile" role="tab" aria-controls="profile"><i
								class="fas fa-info-circle"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-messages-list" data-bs-toggle="list"
								href="#list-messages" role="tab" aria-controls="messages"><i
								class="far fa-clock"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-settings-list" data-bs-toggle="list"
								href="#list-settings" role="tab" aria-controls="settings"><i
								class="fab fa-youtube"></i></a>
						</div>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="list-home"
								role="tabpanel" aria-labelledby="list-home-list">부산
								해운대,광안리해수욕장,태종대</div>
							<div class="tab-pane fade" id="list-profile" role="tabpanel"
								aria-labelledby="list-profile-list">220V 이용</div>
							<div class="tab-pane fade" id="list-messages" role="tabpanel"
								aria-labelledby="list-messages-list">시차없음</div>
							<div class="tab-pane fade" id="list-settings" role="tabpanel"
								aria-labelledby="list-settings-list">유투브 이동</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-12 col-md-6 col-lg-3" name="asia"
				style="padding: 0.3em;">
				<input type="hidden" value="koreaandong대한민국 안동">
				<div class="card hoverable z-depth-2" style="margin: 0;">
					<div class="card-image imgbox">
						<a href="${pageContext.request.contextPath}/andong_map"> <img
							src="https://myro.co.kr/myro_image/city/andong.jpg" alt="city"
							onclick="" style="cursor: pointer">
						</a>
					</div>
					<div class="card-content" style="margin: 0px; padding: 5px;">
						<span class="card-title">
							<div class="citynamefront">
								<b id="size">ANDONG</b> <br>
								<p id="localname">대한민국 안동</p>
							</div>
						</span>
						<div class="list-group list-group-horizontal" id="list-tab"
							role="tablist">
							<a class="list-group-item list-group-item-action active"
								id="list-home-list" data-bs-toggle="list" href="#list-home2"
								role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
							<a class="list-group-item list-group-item-action"
								id="list-profile-list" data-bs-toggle="list"
								href="#list-profile2" role="tab" aria-controls="profile"><i
								class="fas fa-info-circle"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-messages-list" data-bs-toggle="list"
								href="#list-messages2" role="tab" aria-controls="messages"><i
								class="far fa-clock"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-settings-list" data-bs-toggle="list"
								href="#list-settings2" role="tab" aria-controls="settings"><i
								class="fab fa-youtube"></i></a>
						</div>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="list-home2"
								role="tabpanel" aria-labelledby="list-home-list">안동찜닭 먹고싶다</div>
							<div class="tab-pane fade" id="list-profile2" role="tabpanel"
								aria-labelledby="list-profile-list">220V 이용2</div>
							<div class="tab-pane fade" id="list-messages2" role="tabpanel"
								aria-labelledby="list-messages-list">시차없음2</div>
							<div class="tab-pane fade" id="list-settings2" role="tabpanel"
								aria-labelledby="list-settings-list">유투브 이동2</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-12 col-md-6 col-lg-3" name="asia"
				style="padding: 0.3em;">
				<input type="hidden" value="koreagangneung대한민국 강릉">
				<div class="card hoverable z-depth-2" style="margin: 0;">
					<div class="card-image imgbox">
						<a href="${pageContext.request.contextPath}/gangneung_map"> <img
							src="https://myro.co.kr/myro_image/city/gangneung.jpg" alt="city"
							onclick="" style="cursor: pointer">
						</a>
					</div>
					<div class="card-content" style="margin: 0px; padding: 5px;">
						<span class="card-title">
							<div class="citynamefront">
								<b id="size">GANGNEUNG</b> <br>
								<p id="localname">대한민국 강릉</p>
							</div>
						</span>
						<div class="list-group list-group-horizontal" id="list-tab"
							role="tablist">
							<a class="list-group-item list-group-item-action active"
								id="list-home-list" data-bs-toggle="list" href="#list-home3"
								role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
							<a class="list-group-item list-group-item-action"
								id="list-profile-list" data-bs-toggle="list"
								href="#list-profile3" role="tab" aria-controls="profile"><i
								class="fas fa-info-circle"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-messages-list" data-bs-toggle="list"
								href="#list-messages3" role="tab" aria-controls="messages"><i
								class="far fa-clock"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-settings-list" data-bs-toggle="list"
								href="#list-settings3" role="tab" aria-controls="settings"><i
								class="fab fa-youtube"></i></a>
						</div>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="list-home3"
								role="tabpanel" aria-labelledby="list-home-list">꼬막비빔밥
								먹고싶다</div>
							<div class="tab-pane fade" id="list-profile3" role="tabpanel"
								aria-labelledby="list-profile-list">220V 이용3</div>
							<div class="tab-pane fade" id="list-messages3" role="tabpanel"
								aria-labelledby="list-messages-list">시차없음3</div>
							<div class="tab-pane fade" id="list-settings3" role="tabpanel"
								aria-labelledby="list-settings-list">유투브 이동3</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-12 col-md-6 col-lg-3" name="asia"
				style="padding: 0.3em;">
				<input type="hidden" value="koreajeonju대한민국 전주">
				<div class="card hoverable z-depth-2" style="margin: 0;">
					<div class="card-image imgbox">
						<a href="${pageContext.request.contextPath}/jeonju_map"> <img
							src="https://myro.co.kr/myro_image/city/jeonju.jpg" alt="city"
							onclick="" style="cursor: pointer">
						</a>
					</div>
					<div class="card-content" style="margin: 0px; padding: 5px;">
						<span class="card-title">
							<div class="citynamefront">
								<b id="size">JEONJU</b> <br>
								<p id="localname">대한민국 전주</p>
							</div>
						</span>
						<div class="list-group list-group-horizontal" id="list-tab"
							role="tablist">
							<a class="list-group-item list-group-item-action active"
								id="list-home-list" data-bs-toggle="list" href="#list-home4"
								role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
							<a class="list-group-item list-group-item-action"
								id="list-profile-list" data-bs-toggle="list"
								href="#list-profile4" role="tab" aria-controls="profile"><i
								class="fas fa-info-circle"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-messages-list" data-bs-toggle="list"
								href="#list-messages4" role="tab" aria-controls="messages"><i
								class="far fa-clock"></i></a> <a
								class="list-group-item list-group-item-action"
								id="list-settings-list" data-bs-toggle="list"
								href="#list-settings4" role="tab" aria-controls="settings"><i
								class="fab fa-youtube"></i></a>
						</div>
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="list-home"
								role="tabpanel" aria-labelledby="list-home-list">전주비빔밥은 좀
								안땡기네</div>
							<div class="tab-pane fade" id="list-profile4" role="tabpanel"
								aria-labelledby="list-profile-list">220V 이용4</div>
							<div class="tab-pane fade" id="list-messages4" role="tabpanel"
								aria-labelledby="list-messages-list">시차없음4</div>
							<div class="tab-pane fade" id="list-settings4" role="tabpanel"
								aria-labelledby="list-settings-list">유투브 이동4</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 페이지 설명 부분 -->
	<div>
		<div>
			<h5>
				쉽고 간편한 여행계획 <b>HJJH TRIP</b>
			</h5>
		</div>
	</div>
	<footer>
		<p>© HJJH TEAM 2021</p>
	</footer>

</body>
</html>