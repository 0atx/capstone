<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/map.css" />
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<!-- 상단 네비게이션 바 부분 -->
	<div class="menu">
	<nav>
		<a href="${pageContext.request.contextPath}/" class="m1"><!-- 홈페이지 부분 URL 추가해 연결 -->
		<b>HJJH TRIP</b>
		<span class="m1"><h6>&nbsp;YOUR TRIP ROUTE WITH US&nbsp;</h6></span></a>
		<span id="blank">ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㅁㄴㅇㄻㄴㅇㄻ</span>
		<ul class="m1" id="menulist">
			<li>
				MENU &nbsp;&nbsp;<i class="fas fa-caret-down"></i>
			</li>
		</ul>
	</nav>
	</div>
	<!-- 지도 부분 -->
	<div id="map" style="width:100vw;height:100vh;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48003175ba9df6daee13eb781dd7ff9d"></script>
	<script>
		var mapContainer = document.getElementById('map');
		var mapOptions = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(mapContainer, mapOptions);
		
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		      });
		    
		    function displayMarker(locPosition, message) {
		        // 마커를 생성합니다
		        var marker_present = new kakao.maps.Marker({  
		            map: map, 
		            position: locPosition
		        }); 
		            
		        // 지도 중심좌표를 접속위치로 변경합니다
		        map.setCenter(locPosition);      
		    }    
		}
	</script>
	<!-- 검색 우측 상단부분 -->
	<div class="rightMap">
		<div class="search">
			<input type="text" data-attrnum="10" data-attrtype="placeholder" id="keyword"
			placeholder="검색어를 입력하세요.">
			<button onclick="searchKeyword()"><i class="fas fa-search"></i></button>
		</div>
		
		<script>
		function searchKeyword() {
			var keyword = document.getElementById("keyword").innerText;
			
			var xhr = new XMLHttpRequest();
			var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
			var queryParams = '?' + encodeURIComponent('ServiceKey') + '=VNaqzDwNJ%2FOM63fE4jF24L%2Bjmj59Bi%2FUtih0EOI0rGttlzFNccoDOGBf2oJl7y7vdy%2B1AWZPVvEYcVEFgn%2FTUA%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
			queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
			queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
			queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /**/
			queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /**/
			queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent("'"+keyword+"'"); /**/
			queryParams += '&_' + encodeURIComponent('type') + '=' + encodeURIComponent('json');
			xhr.open('GET', url + queryParams);
			xhr.setRequestHeader('Accept', 'application/json');
			xhr.onreadystatechange = function () {
			    if (this.readyState == 4) {
			        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
			    }
			};

			xhr.send('');

	</script>
	<!-- 검새 우측 하단부분 -->
		<div>
		여기에 검색결과 리스트
		</div>
	</div>
	<!-- 왼쪽 일정부분 -->
	<div class="leftMap">
		일정들어갈부분
	</div>
</body>
</html>