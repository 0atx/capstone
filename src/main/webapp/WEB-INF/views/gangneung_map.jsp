<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<title>HJJH Trip</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/map.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48003175ba9df6daee13eb781dd7ff9d&libraries=services"></script>
</head>
<body>
   <!-- 네비바 MENU 드롭다운 버튼 중 일정창, 장소창 숨기기 기능  -->

	<div id="defaultKeyword" style="display: none;">강릉</div>
   <div id="wrap_all_Conents" class="container-fluid">
      <!-- 네비바 MENU 드롭다운 버튼 중 피드백 버튼 클릭시 팝업되는 div  -->
      <div id="light" class="white_content">
         <b>사이트 피드백</b> <a href="javascript:void(0)"
            style="visibility: visible !important;"
            onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
            <i class="fas fa-times"></i>
         </a>
         <p style="font-size: 4px;">서비스 이용에 불편이 존재하나요? HJJH TRIP 페이지의
            서비스에서 불편을 느끼신 점, 개선할 점 등을 보내주세요.</p>
         <div class="row">
            <form class="col-sm-12">
               <div class="row">
                  <input id="feedbackUser" type="text" value="이름">
               </div>
               <div class="row">
                  <input id="feedbackEmail" type="email" value="이메일">
               </div>
               <div class="row">
                  <input id="feedback" type="text" value="피드백 내용">
               </div>
            </form>
            <button type="button" class="btn btn-outline-primary"
               style="top: 10px;">Submit</button>
         </div>
      </div>
      <div id="fade" class="black_overlay"></div>
      <!-- 상단 네비게이션 바 부분 -->
      <div class="menu">
         <nav class="navbar navbar-expend-sm  justify-content-end"
            style="right: 1%;">
            <a class="navbar-brand"
               style="color: #000000; text-decoration: none;"
               href="${pageContext.request.contextPath}/"><h5>
                  <b>HJJH TRIP</b>
               </h5></a> <span class="nav-item" style="font-size: 12px">&nbsp;YOUR
               TRIP ROUTE WITH US&nbsp;</span>
            <div class="dropdown">
               <button class="btn btn-secondary dropdown-toggle" type="button"
                  id="dropdownMenuButton1" data-bs-toggle="dropdown"
                  aria-expanded="false"
                  style="background-color: #778899; margin: 5px;">Menu</button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" onclick="disappearLeft()">일정창</a></li>
                  <!-- 누르면 왼쪽 일정창 hidden -->
                  <li><a class="dropdown-item" onclick="disappearRight()">장소창</a></li>
                  <!-- 누르면 오른 장소창 hidden -->
                  <li><a class="dropdown-item" href="javascript:void(0)"
                     onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">FeedBack</a></li>
                  <!-- FEEDBACK 작성 div팝업 호출되게 할것 -->
               </ul>
            </div>
         </nav>
      </div>

      <!-- 왼쪽 일정부분 -->
      <div class="leftMap" id="plan_wrap">
         <div class="cal">
               <h6 style="padding-top:8px;">
                  <b>일정 선택</b>
               </h6>
                    <div class="ui-grid-b">
             <div class="ui-block-a" style="text-align : left;  margin-left:15px;">
           <span style="padding-right:5px;">출발</span> <input type="text" id="datepicker" readonly="readonly" style="width:110px; height : 25px; 
           margin-bottom:10px;"><i class="fas fa-plane-departure" style="margin-left:10px;"></i>
             </div>
             <div class="ui-block-b" style="text-align : left;  margin-left:15px;" >
            <span style="padding-right:5px;">도착</span> <input type="text" id="datepicker2" readonly="readonly" style="width:110px; height : 25px; 
             margin-bottom:10px;"><i class="fas fa-plane-departure" style="margin-left:10px;  
             -ms-transform: rotate(-18deg); /* IE 9 */ transform: rotate(90deg);
              -moz-transform: scaleX(-1); -o-transform: scaleX(-1); -webkit-transform: scaleX(-1); transform: scaleX(-1); "></i>
            </div>
         </div>
         </div>

    <!-- 유저가 선택한 장소 목록 -->
     <div class="selectedSpots">
            <h6 style="padding : 10px"><b>선택목록</b></h6>
            <div style="margin-bottom: 10px">
               <i class="fas fa-stopwatch"></i> <span class="totalDay"><span>총 여행일수 : </span></span><br>
            </div>
            <div class="d-grid gap-2">
               <button class="resetplanbtn" onclick="removeLi()">
                  <span style="color: #ffffff; font-weight: bold;">일정 전체 삭제</span>
               </button>
            </div>
            <ul id="spotsList" style="list-style-type: none;"></ul>
            <li id="blank_li" style="display: none;">빈칸</li>
         </div>
      </div>
      <!-- 일정생성버튼 -->
      <div class="makePlanBtn">
         <button class="make_button" onclick="showModal()">
            <b>일정생성</b>
         </button>
      </div>

      <!-- 이메일 입력 MODAL -->
      <div id="modal" class="emailModal">
         <div class="email-modal-content">
            <div class="page-header">
               <h1 class="nanum">HJJH TRIP</h1>
            </div>
            <hr>
            <label class="position-left">
               <h7>
                  <b data-langnum="53">이메일</b>
                  <!-- 메일 다중 전송 설정 버튼 -->
                  <!--
                  <img class="s-smallbutton" src="+이미지" id="addEmailbutton" alt="ADD">
                  <img class="s-smallbutton" src="-이미지" id="removeEmailbutton" alt="DELETE">
                  <hs>&nbsp;(최대 n명까지 전송 가능)</hs>
                  -->         
               </h7>
            </label> 
            <br>
            <div class="emailForm">
              <input type="email" id="email" name="emailAddress" data-attrnum="21" maxlength="100" autocomplete="off" required>
              <label for="email"><span>Email-address</span></label>
            </div> 
            <div class="modalSaveBtn d-grid gap-2">
            <div class="row" style="margin : 8px 5px 8px 5px;">
                  <button class="btn btn-primary" onclick="checkEmail()" id="savePlanBtn" >
                     <div><i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">일정 저장하기</h7></div>
                  </button>
               </div>
                 <div class="row" style="margin : 8px 5px 8px 5px;">
                  <button class="btn btn-danger" onclick="closeModal()" id="returnPlanBtn">
                     <div><i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">이전 화면으로 돌아가기</h7></div>
                  </button>
              </div>
            </div>
         </div>
      </div>
      
      <!-- 이메일 중복 처리 MODAL -->
      <div id="dupModal" class="emailDupModal">
         <div class="email-dup-modal-content">
            <div class="page-header">
               <h1 class="nanum">HJJH TRIP</h1>
            </div>
            <hr>
            <label class="position-left">
               <h7>
                  <b data-langnum="53">이미 일정이 존재하는 이메일입니다. 기존 일정을 삭제 후 저장하거나 다른 이메일을 입력해주세요.</b>       
               </h7>
            </label> 
            <br>        
            <div class="modalSaveBtn d-grid gap-2">
            <div class="row" style="margin : 8px 5px 8px 5px;">
                  <button class="btn btn-primary" onclick="deleteAndSave()" id="savePlanBtn" >
                     <div><i class="far fa-envelope"></i><br>
                     <h7 data-langnum="54">기존 일정 삭제 후 저장</h7></div>
                  </button>
               </div>
                 <div class="row" style="margin : 8px 5px 8px 5px;">
                  <button class="btn btn-danger" onclick="returnShowModal()" id="returnPlanBtn">
                     <div><i class="fas fa-sign-out-alt"></i><br>
                     <h7 data-langnum="54">다른 이메일 입력하기</h7></div>
                  </button>
              </div>
            </div>
         </div>
      </div>
      

      <!-- 지도 부분 -->
      <div id="map" style="width: 100vw; height: 100vh;"></div>

      <!-- 검색 우측 상단부분 -->
      <div id="menu_wrap" class="rightMap">
         <div class="search">
            <form onsubmit="searchPlaces(); return false;">
               <input type="text" data-attrnum="10" data-attrtype="placeholder"
                  id="keyword" placeholder="검색어를 입력하세요.">
               <button type="submit" class="searchbtn">
                  <i class="fas fa-search"></i>
               </button>
            </form>
         </div>

         <!-- 검색 우측 하단부분 -->
         <div>
            <ul id="placesList" style="list-style-type: none;"></ul>
            <div style="left: 50%; text-align: center;" id="pagination"></div>
         </div>
      </div>

      <!-- 일정선택 -->

   </div>
   <script src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/menubar.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/searchplace.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/myplace.js"></script>
</body>
</html>