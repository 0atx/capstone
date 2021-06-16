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
      <b style="font-size:18px;">사이트 이용방법</b> <a href="javascript:void(0)"
         style="visibility: visible !important;"
         onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
         <i class="fas fa-times"></i>
      </a>
      <p style="font-size: 14px;">HJJH TRIP 페이지의 이용방법을 안내해드립니다.</p>
      <div style="width: 400px; margin-left: 300px;">
         <!-- carousel 구성영역 -->
         <div id="carousel-example-generic" class="carousel slide"
            data-bs-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <img
                     src="https://drive.google.com/uc?export=view&amp;id=1WuLpuotk5oz8Qp-etYVswThFBYQnbxAZ"
                     class="d-block w-100">
               </div>
               <div class="carousel-item">
                  <img
                     src="https://drive.google.com/uc?export=view&amp;id=14rTpOyYbDuoG8oFJUPzPqQXv5Pm8o45g"
                     class="d-block w-100">
               </div>
               <div class="carousel-item">
                  <img
                     src="https://drive.google.com/uc?export=view&amp;id=1c5irWpYozxPT9-OlL5WsVAQCyLNtNpui"
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

   <!-- 이메일 입력 MODAL -->
   <div id="modal" class="emailModal">
      <div class="email-modal-content">
         <div class="page-header">
            <h1 class="nanum">HJJH TRIP</h1>
         </div>
         <hr>
         <br>
         <div class="emailForm">
            <input type="email" id="email" name="emailAddress" data-attrnum="21"
               maxlength="100" autocomplete="off" required> <label
               for="email"><span>Email-address</span></label>
         </div>
         <div class="modalShowBtn d-grid gap-2">
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-primary" onclick="checkEmail()"
                  id="showPlanBtn">
                  <div>
                     <i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">일정 불러오기</h7>
                  </div>
               </button>
            </div>
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-danger" onclick="closeModal()"
                  id="returnBtn">
                  <div>
                     <i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">이전 화면으로 돌아가기</h7>
                  </div>
               </button>
            </div>
         </div>
      </div>
   </div>
   <!-- 일정 불러오기 이메일 입력 오류 MODAL -->
   <div id="errorModal" class="emailErrorModal">
      <div class="email-error-modal-content">
         <div class="page-header">
            <h1 class="nanum">HJJH TRIP</h1>
         </div>
         <hr>
         <label class="position-left"> <h7> <b data-langnum="53">입력하신
               이메일은 일정이 존재하지 않습니다. 일정을 새로 만들거나 이메일을 바르게 입력했는지 확인해주세요.</b> </h7>
         </label> <br>
         <div class="modalShowBtn d-grid gap-2">
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-primary" onclick="returnEmailModal()"
                  id="returnModalBtn">
                  <div>
                     <i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">이메일 다시 입력하기</h7>
                  </div>
               </button>
            </div>
            <div class="row" style="margin: 8px 5px 8px 5px;">
               <button class="btn btn-danger" onclick="closeErrorModal()"
                  id="returnBtn">
                  <div>
                     <i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">창 닫기</h7>
                  </div>
               </button>
            </div>
         </div>
      </div>
   </div>

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
                  <!-- 일정 불러오기 추가 -->

                  <li class="nav-item" id="nav-lists"><a class="nav-link"
                     style="cursor: pointer;" onclick="showModal();">일정 불러오기</a></li>

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
      <div class="home-img" style="background-image : url('https://drive.google.com/uc?export=view&amp;id=18kF5bODKmi8i2WtTokoy3M6WBlHk9x7E');">
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
         <h5>여행지를 목록에서 골라주세요</h5>
         <br>
   </div>
   <!--City 목록 div -->
   <div class="container-fluid">
      <div class="row" id="cityList">
         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreabusan대한민국 부산">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/busan.jpg" alt="city"
                     onclick="location.replace('map?keyword=부산');"
                     style="cursor: pointer" />
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
                        class="fas fa-cloud"></i></a> <a
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
                        aria-labelledby="list-profile-list">
                        <a href="https://www.visitbusan.net/kr/index.do" target="_blank"
                           style="cursor: pointer">대한민국 부산 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=부산날씨"
                           target="_blank" style="cursor: pointer">대한민국 부산 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 부산여행"
                           target="_blank" style="cursor: pointer">대한민국 부산여행 YouTube영상
                           검색</a>
                     </div>

                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreaandong대한민국 안동">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/andong.jpg"
                     alt="city" onclick="location.replace('map?keyword=안동');"
                     style="cursor: pointer" />
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
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings2" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home2"
                        role="tabpanel" aria-labelledby="list-home-list">안동
                        하회마을,도산서원,부용대</div>
                     <div class="tab-pane fade" id="list-profile2" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://www.tourandong.com/public/" target="_blank"
                           style="cursor: pointer">대한민국 안동 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages2" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=안동날씨"
                           target="_blank" style="cursor: pointer">대한민국 안동 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings2" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 안동여행"
                           target="_blank" style="cursor: pointer">대한민국 안동여행 YouTube영상
                           검색</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreagangneung대한민국 강릉">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/gangneung.jpg"
                     alt="city" onclick="location.replace('map?keyword=강릉');"
                     style="cursor: pointer" />
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
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings3" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home3"
                        role="tabpanel" aria-labelledby="list-home-list">강릉
                        정동진,경포대,강릉커피거리</div>
                     <div class="tab-pane fade" id="list-profile3" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://www.gn.go.kr/tour/index.do" target="_blank"
                           style="cursor: pointer">대한민국 강릉 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages3" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=강릉날씨"
                           target="_blank" style="cursor: pointer">대한민국 강릉 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings3" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 강릉여행"
                           target="_blank" style="cursor: pointer">대한민국 강릉여행 YouTube영상
                           검색</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreajeonju대한민국 전주">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/jeonju.jpg"
                     alt="city" onclick="location.replace('map?keyword=전주');"
                     style="cursor: pointer" />
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
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings4" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home4"
                        role="tabpanel" aria-labelledby="list-home-list">전주
                        한옥마을,객리단길,덕진공원</div>
                     <div class="tab-pane fade" id="list-profile4" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://tour.jeonju.go.kr/index.9is" target="_blank"
                           style="cursor: pointer">대한민국 전주 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages4" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=전주날씨"
                           target="_blank" style="cursor: pointer">대한민국 전주 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings4" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 전주여행"
                           target="_blank" style="cursor: pointer">대한민국 전주여행 YouTube영상
                           검색</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreamokpo대한민국 목포">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/mokpo.jpg" alt="city"
                     onclick="location.replace('map?keyword=목포');"
                     style="cursor: pointer" />
               </div>
               <div class="card-content" style="margin: 0px; padding: 5px;">
                  <span class="card-title">
                     <div class="citynamefront">
                        <b id="size">MOKPO</b> <br>
                        <p id="localname">대한민국 목포</p>
                     </div>
                  </span>
                  <div class="list-group list-group-horizontal" id="list-tab"
                     role="tablist">
                     <a class="list-group-item list-group-item-action active"
                        id="list-home-list" data-bs-toggle="list" href="#list-home5"
                        role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
                     <a class="list-group-item list-group-item-action"
                        id="list-profile-list" data-bs-toggle="list"
                        href="#list-profile5" role="tab" aria-controls="profile"><i
                        class="fas fa-info-circle"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-messages-list" data-bs-toggle="list"
                        href="#list-messages5" role="tab" aria-controls="messages"><i
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings5" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home5"
                        role="tabpanel" aria-labelledby="list-home-list">목포 유달산
                        조각공원,목포케이블카,목포대교</div>
                     <div class="tab-pane fade" id="list-profile5" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://www.mokpo.go.kr/tour" target="_blank"
                           style="cursor: pointer">대한민국 목포 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages5" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=목포날씨"
                           target="_blank" style="cursor: pointer">대한민국 목포 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings5" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 목포여행"
                           target="_blank" style="cursor: pointer">대한민국 목포여행 YouTube영상
                           검색</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreajeju대한민국 제주">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/jeju.jpg" alt="city"
                     onclick="location.replace('map?keyword=제주');"
                     style="cursor: pointer" />
               </div>
               <div class="card-content" style="margin: 0px; padding: 5px;">
                  <span class="card-title">
                     <div class="citynamefront">
                        <b id="size">JEJU</b> <br>
                        <p id="localname">대한민국 제주</p>
                     </div>
                  </span>
                  <div class="list-group list-group-horizontal" id="list-tab"
                     role="tablist">
                     <a class="list-group-item list-group-item-action active"
                        id="list-home-list" data-bs-toggle="list" href="#list-home6"
                        role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
                     <a class="list-group-item list-group-item-action"
                        id="list-profile-list" data-bs-toggle="list"
                        href="#list-profile6" role="tab" aria-controls="profile"><i
                        class="fas fa-info-circle"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-messages-list" data-bs-toggle="list"
                        href="#list-messages6" role="tab" aria-controls="messages"><i
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings6" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home6"
                        role="tabpanel" aria-labelledby="list-home-list">제주
                        성산일출봉,섭지코지,새별오름</div>
                     <div class="tab-pane fade" id="list-profile6" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://www.visitjeju.net/kr" target="_blank"
                           style="cursor: pointer">대한민국 제주 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages6" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=제주날씨"
                           target="_blank" style="cursor: pointer">대한민국 제주 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings6" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 제주여행"
                           target="_blank" style="cursor: pointer">대한민국 제주여행 YouTube영상
                           검색</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreagyeongju대한민국 경주">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img src="https://myro.co.kr/myro_image/city/gyeongju.jpg"
                     alt="city" onclick="location.replace('map?keyword=경주');"
                     style="cursor: pointer" />
               </div>
               <div class="card-content" style="margin: 0px; padding: 5px;">
                  <span class="card-title">
                     <div class="citynamefront">
                        <b id="size">GYEONGJU</b> <br>
                        <p id="localname">대한민국 경주</p>
                     </div>
                  </span>
                  <div class="list-group list-group-horizontal" id="list-tab"
                     role="tablist">
                     <a class="list-group-item list-group-item-action active"
                        id="list-home-list" data-bs-toggle="list" href="#list-home7"
                        role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
                     <a class="list-group-item list-group-item-action"
                        id="list-profile-list" data-bs-toggle="list"
                        href="#list-profile7" role="tab" aria-controls="profile"><i
                        class="fas fa-info-circle"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-messages-list" data-bs-toggle="list"
                        href="#list-messages7" role="tab" aria-controls="messages"><i
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings7" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home7"
                        role="tabpanel" aria-labelledby="list-home-list">경주
                        불국사,석굴암,안압지</div>
                     <div class="tab-pane fade" id="list-profile7" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://www.gyeongju.go.kr/tour/index.do"
                           target="_blank" style="cursor: pointer">대한민국 경주 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages7" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=경주날씨"
                           target="_blank" style="cursor: pointer">대한민국 경주 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings7" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 경주여행"
                           target="_blank" style="cursor: pointer">대한민국 경주여행 YouTube영상
                           검색</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-sm-12 col-md-6 col-lg-3" name="asia"
            style="padding: 0.3em;">
            <input type="hidden" value="koreaseoul대한민국 서울">
            <div class="card hoverable z-depth-2"
               style="margin: 0; overflow: hidden;">
               <div class="card-image imgbox">
                  <img
                     src="https://drive.google.com/uc?export=view&amp;id=1yegZwwyolq8K2A5_wUhN8pv39JUnEORO"
                     alt="city" onclick="location.replace('map?keyword=서울');"
                     style="cursor: pointer" />

               </div>
               <div class="card-content" style="margin: 0px; padding: 5px;">
                  <span class="card-title">
                     <div class="citynamefront">
                        <b id="size">SEOUL</b> <br>
                        <p id="localname">대한민국 서울</p>
                     </div>
                  </span>
                  <div class="list-group list-group-horizontal" id="list-tab"
                     role="tablist">
                     <a class="list-group-item list-group-item-action active"
                        id="list-home-list" data-bs-toggle="list" href="#list-home8"
                        role="tab" aria-controls="home"><i class="far fa-compass"></i></a>
                     <a class="list-group-item list-group-item-action"
                        id="list-profile-list" data-bs-toggle="list"
                        href="#list-profile8" role="tab" aria-controls="profile"><i
                        class="fas fa-info-circle"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-messages-list" data-bs-toggle="list"
                        href="#list-messages8" role="tab" aria-controls="messages"><i
                        class="fas fa-cloud"></i></a> <a
                        class="list-group-item list-group-item-action"
                        id="list-settings-list" data-bs-toggle="list"
                        href="#list-settings8" role="tab" aria-controls="settings"><i
                        class="fab fa-youtube"></i></a>
                  </div>
                  <div class="tab-content" id="nav-tabContent">
                     <div class="tab-pane fade show active" id="list-home8"
                        role="tabpanel" aria-labelledby="list-home-list">서울
                        경복궁,서울N타워,낙산공원</div>
                     <div class="tab-pane fade" id="list-profile8" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <a href="https://korean.visitseoul.net/index" target="_blank"
                           style="cursor: pointer">대한민국 서울 정보 더보기</a>
                     </div>
                     <div class="tab-pane fade" id="list-messages8" role="tabpanel"
                        aria-labelledby="list-messages-list">
                        <a href="https://search.naver.com/search.naver?query=서울날씨"
                           target="_blank" style="cursor: pointer">대한민국 서울 날씨 정보</a>
                     </div>
                     <div class="tab-pane fade" id="list-settings8" role="tabpanel"
                        aria-labelledby="list-settings-list">
                        <a href="https://www.youtube.com/results?search_query=대한민국 서울여행"
                           target="_blank" style="cursor: pointer">대한민국 서울여행 YouTube영상
                           검색</a>
                     </div>
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
   <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>