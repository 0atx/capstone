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
	<script src="https://code.jquery.com/jquery-3.6.0.js" 
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
			<button id="search"><i class="fas fa-search"></i></button>
		</div>
		
		<script>
			

		$( document ).ready(function() {
			$("#search").click(function(){
				var keyword = document.getElementById("keyword").value;
				var urlstr = 
		    		"http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?" +
		            "ServiceKey=VNaqzDwNJ%2FOM63fE4jF24L%2Bjmj59Bi%2FUtih0EOI0rGttlzFNccoDOGBf2oJl7y7vdy%2B1AWZPVvEYcVEFgn%2FTUA%3D%3D" +
		            "&pageNo=1" +
		            "&numOfRows=10" +
		            "&MobileOS=ETC" +
		            "&MobileApp=AppTest" +
		            "&listYN=Y" +
		            "&arrange=A" +
		            "&keyword=" + keyword +
		            "&type=json";
		    	$.ajax({
		        	url: urlstr, // apitest
		        	type:'GET',
		        	data: {
		            	Name:'ajax',
		            	Keyword: "'" + keyword + "'"
		        	},
		        	dataType:'json', // 리턴해주는 타입을 지정해줘야함
		        	beforeSend:function(jqXHR) {
		            	console.log("ajax호출전");
		        	},// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
		        	success: function(data) {
		        		$('#list > tbody').remove();
		            	console.log("호출성공");
		            	console.log(data);
		            	var item = data.response.body.items.item
		            	$("#img").append("<img src='" + item[0].firstimage2 + "'/>");
                    	$("#title").append(item[0].title);
                    	
                    	$('#list').append("<tbody>");
                    	for(var i = 0; item.length; i++) {
                    		var output ='';
                    		output += "<tr><td rowspan='2'><div id='img'><img src='" + item[i].firstimage2 + "' height='150' width='150'/></div></td>";
                    		output += "<td colspan='2'><div id='title'>" + item[i].title + "</div></td></tr>";
                    		output += "<tr><td>+</td><td>돋보기</td></tr>";
                    		$('#list').append(output);
                    	}
                    	$('#list').append("</tbody>");
		        	},// 요청 완료 시
		        	error:function(jqXHR) {
		            	console.log("실패입니다.");
		        	}// 요청 실패.
		    	});
			});
		});



		</script>
	<!-- 검색 우측 하단부분 -->
		<div>
		<table id="list" border="0">	
		<tbody>여기에 검색결과 리스트</tbody>
		</table>
		</div>
	</div>
	<!-- 왼쪽 일정부분 -->
	<div class="leftMap">
		일정들어갈부분
	</div>
</body>
</html>