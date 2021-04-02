<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

  
<!DOCTYPE html>
<html>
<head>
   <title>HJJH Trip Home</title>
   <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css">
   <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/bootstrap-5.0.0-beta3-dist/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/bootstrap-5.0.0-beta3-dist/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<!-- 타이틀 네비바-->
<div>
</div>
<!-- 시작 하늘 사진 박스-->
<div class="home-img">
   <div class="home-text">
      <h1 style="font-size:45px">HJJH TRIP</h1>
      <h5>당신의 여행 우리와 함께 계획 신나는 여행</h5>
      <button class="start-button" style="vertical-align:middle">
      <a href="${pageContext.request.contextPath}/map" style="text-decoration:none; color:#FFFFFF">시작하기</a></button>
   </div>
</div>
<!-- 여행지 검색 및 선택-->
<div class="header-search">
   <h1>여행지</h>
   <h5>여행지를 검색하거나 목록에서 골라주세요</h5>
   <input type="text" id="search-destination" class="search">
   <button onclick="searchKeyword()"><i class="fas fa-search"></i></button>
   <br><br>
   <div id="recommand-city">
      <ul id="worldlist">
         <li id="lists"><a href="#" onclick="leftClickFnc('all')">전체</a></li>
         <li id="lists">부산</li>
         <li id="lists">안동</li>
         <li id="lists">강릉</li>
         <li id="lists">전주</li>
      </ul>
   </div>
</div>
<!--City 목록 div -->
<div class="container-fluid">
   <div class="row" id="cityList">
      <div class="col-sm-12 col-md-6 col-lg-3" name="asia" style="padding:0.3em;">
      <input type="hidden" value="koreabusan대한민국 부산">
      <div class="card hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
      <a href="${pageContext.request.contextPath}/map">
      <img src="https://myro.co.kr/myro_image/city/busan.jpg" alt="city" onclick="" style="cursor:pointer" >
      </a>
      </div>
      <div class="card-content" style="margin: 0px; padding: 5px;">
         <span class ="card-title">
            <div class="citynamefront">
            <b id="size">BUSAN</b>
            <br>
            <p id="localname">대한민국 부산</p>
            </div>
         </span>
         <div>
            <ul class="list-group list-group-horizontal">
               <li class="list-group-item">
                  <a><i class="far fa-compass"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fas fa-info-circle"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="far fa-clock"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fab fa-youtube"></i></a>
               </li>
            </ul>
         </div>
         <div>
            <div class="cardActive" id="tab1" style="display : block;">
            해운대 광안리 해수욕장 태종
            </div>
         </div>
      </div>
      </div>
      </div>
   
      <div class="col-sm-12 col-md-6 col-lg-3" name="asia" style="padding:0.3em;">
      <input type="hidden" value="koreaandong대한민국 안동">
      <div class="card hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
      <a href="${pageContext.request.contextPath}/map">
      <img src="https://myro.co.kr/myro_image/city/andong.jpg" alt="city" onclick="" style="cursor:pointer" >
      </a>
      </div>
      <div class="card-content" style="margin: 0px; padding: 5px;">
         <span class ="card-title">
            <div class="citynamefront">
            <b id="size">ANDONG</b>
            <br>
            <p id="localname">대한민국 안동</p>
            </div>
         </span>
         <div>
            <ul class="list-group list-group-horizontal">
               <li class="list-group-item">
                  <a><i class="far fa-compass"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fas fa-info-circle"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="far fa-clock"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fab fa-youtube"></i></a>
               </li>
            </ul>
         </div>
      </div>
      </div>
      </div>
      
      <div class="col-sm-12 col-md-6 col-lg-3" name="asia" style="padding:0.3em;">
      <input type="hidden" value="koreagangneung대한민국 강릉">
      <div class="card hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
      <a href="${pageContext.request.contextPath}/map">
      <img src="https://myro.co.kr/myro_image/city/gangneung.jpg" alt="city" onclick="" style="cursor:pointer" >
      </a>
      </div>
      <div class="card-content" style="margin: 0px; padding: 5px;">
         <span class ="card-title">
            <div class="citynamefront">
            <b id="size">GANGNEUNG</b>
            <br>
            <p id="localname">대한민국 강릉</p>
            </div>
         </span>
         <div>
            <ul class="list-group list-group-horizontal">
               <li class="list-group-item">
                  <a><i class="far fa-compass"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fas fa-info-circle"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="far fa-clock"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fab fa-youtube"></i></a>
               </li>
            </ul>
         </div>
      </div>
      </div>
      </div>
      
      <div class="col-sm-12 col-md-6 col-lg-3" name="asia" style="padding:0.3em;">
      <input type="hidden" value="koreajeonju대한민국 전주">
      <div class="card hoverable z-depth-2" style="margin:0;">
      <div class="card-image imgbox">
      <a href="${pageContext.request.contextPath}/map">
      <img src="https://myro.co.kr/myro_image/city/jeonju.jpg" alt="city" onclick="" style= "cursor:pointer" >
      </a>
      </div>
      <div class="card-content" style="margin: 0px; padding: 5px;">
         <span class ="card-title">
            <div class="citynamefront">
            <b id="size">JEONJU</b>
            <br>
            <p id="localname">대한민국 전주</p>
            </div>
         </span>
         <div>
            <ul class="list-group list-group-horizontal">
               <li class="list-group-item">
                  <a><i class="far fa-compass"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fas fa-info-circle"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="far fa-clock"></i></a>
               </li>
               <li class="list-group-item">
                  <a><i class="fab fa-youtube"></i></a>
               </li>
            </ul>
         </div>
      </div>
      </div>
   </div>
   </div>
</div>
<footer>
   <p>© HJJH TEAM 2021</p>
</footer>
</body>
</html>