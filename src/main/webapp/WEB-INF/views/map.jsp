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
    
    <!-- 일정생성 -->
    <script language="javascript">
    var today = new Date(); // 오늘 날짜
    var date = new Date();
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }
    
    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
       
        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2) 
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
        }
 
    }
    
</script>
</head>
<body onload="build();">

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
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48003175ba9df6daee13eb781dd7ff9d&libraries=services"></script>
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
	<div id="menu_wrap" class="rightMap">
      <div class="search">
         <form onsubmit="searchPlaces(); return false;">
         <input type="text" data-attrnum="10" data-attrtype="placeholder" id="keyword"
         placeholder="검색어를 입력하세요.">
         <button type="submit"><i class="fas fa-search"></i></button>
         </form>
      </div>
			
		<script>
      //마커를 담을 배열입니다
      var markers = [];

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places();  

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({zIndex:1});

      // 키워드로 장소를 검색합니다
      searchPlaces();

      // 키워드 검색을 요청하는 함수입니다
      function searchPlaces() {

          var keyword = document.getElementById('keyword').value;
          
          if(keyword == '')
             keyword = "한성대학교"

          if (!keyword.replace(/^\s+|\s+$/g, '')) {
              alert('키워드를 입력해주세요!');
              return false;
          }

          // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
          ps.keywordSearch( keyword, placesSearchCB); 
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {
            console.log("성공");
              // 정상적으로 검색이 완료됐으면
              // 검색 목록과 마커를 표출합니다
              displayPlaces(data);

              // 페이지 번호를 표출합니다
              displayPagination(pagination);

          } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            
             console.log("없음");
              alert('검색 결과가 존재하지 않습니다.');
              return;

          } else if (status === kakao.maps.services.Status.ERROR) {
            
             console.log("오류");
              alert('검색 결과 중 오류가 발생했습니다.');
              return;

          }
      }

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {

          var listEl = document.getElementById('placesList'), 
          menuEl = document.getElementById('menu_wrap'),
          fragment = document.createDocumentFragment(), 
          bounds = new kakao.maps.LatLngBounds(), 
          listStr = '';
          
          // 검색 결과 목록에 추가된 항목들을 제거합니다
          removeAllChildNods(listEl);

          // 지도에 표시되고 있는 마커를 제거합니다
          removeMarker();
          
          for ( var i=0; i<places.length; i++ ) {

              // 마커를 생성하고 지도에 표시합니다
              var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                  marker = addMarker(placePosition, i), 
                  itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

              // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
              // LatLngBounds 객체에 좌표를 추가합니다
              bounds.extend(placePosition);

              // 마커와 검색결과 항목에 mouseover 했을때
              // 해당 장소에 인포윈도우에 장소명을 표시합니다
              // mouseout 했을 때는 인포윈도우를 닫습니다
              (function(marker, title) {
                  kakao.maps.event.addListener(marker, 'mouseover', function() {
                      displayInfowindow(marker, title);
                  });

                  kakao.maps.event.addListener(marker, 'mouseout', function() {
                      infowindow.close();
                  });

                  itemEl.onmouseover =  function () {
                      displayInfowindow(marker, title);
                  };

                  itemEl.onmouseout =  function () {
                      infowindow.close();
                  };
              })(marker, places[i].place_name);

              fragment.appendChild(itemEl);
          }

          // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
          listEl.appendChild(fragment);
          menuEl.scrollTop = 0;

          // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
          map.setBounds(bounds);
      }

      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, places) {

          var el = document.createElement('li'),
          itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                      '<div class="info">' +
                      '   <h5>' + places.place_name + '</h5>';

          if (places.road_address_name) {
              itemStr += '    <span>' + places.road_address_name + '</span>' +
                          '   <span class="jibun gray">' +  places.address_name  + '</span>';
          } else {
              itemStr += '    <span>' +  places.address_name  + '</span>'; 
          }
                       
            itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                      '</div>';           

          el.innerHTML = itemStr;
          el.className = 'item';

          return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx, title) {
          var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
              imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
              imgOptions =  {
                  spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                  spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                  offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
              },
              markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                  marker = new kakao.maps.Marker({
                  position: position, // 마커의 위치
                  image: markerImage 
              });

          marker.setMap(map); // 지도 위에 마커를 표출합니다
          markers.push(marker);  // 배열에 생성된 마커를 추가합니다

          return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
          for ( var i = 0; i < markers.length; i++ ) {
              markers[i].setMap(null);
          }   
          markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
          var paginationEl = document.getElementById('pagination'),
              fragment = document.createDocumentFragment(),
              i; 
            console.log("왜안떠");
          // 기존에 추가된 페이지번호를 삭제합니다
          while (paginationEl.hasChildNodes()) {
              paginationEl.removeChild (paginationEl.lastChild);
          }

          for (i=1; i<=pagination.last; i++) {
              var el = document.createElement('a');
              el.href = "#";
              el.innerHTML = i;

              if (i===pagination.current) {
                  el.className = 'on';
              } else {
                  el.onclick = (function(i) {
                      return function() {
                          pagination.gotoPage(i);
                      }
                  })(i);
              }

              fragment.appendChild(el);
          }
          paginationEl.appendChild(fragment);
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
          var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

          infowindow.setContent(content);
          infowindow.open(map, marker);
      }

       // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {   
          while (el.hasChildNodes()) {
              el.removeChild (el.lastChild);
          }
      }
      </script>
      
	<!-- 검색 우측 하단부분 -->
		<div>
      <ul id="placesList"></ul>
      <div id="pagination"></div>
      </div>
   </div>
	
	<!-- 왼쪽 일정부분 -->
   <div class="leftMap"  >
            일정 선택 
    <div class="day">
    <table  id="calendar">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">일</font></td>
            <td align="center"> 월 </td>
            <td align="center"> 화 </td>
            <td align="center"> 수 </td>
            <td align="center"> 목 </td>
            <td align="center"> 금 </td>
            <td align="center"><font color=#7ED5E4>토</font></td>
        </tr>
    </table>
    </div>      
   </div>
   <!-- 왼쪽 멀티 버튼 -->
   <div class="multibtnleft">
   <button class="user_button" onclick="alert('이용방법 나와')">이용방법</button><br>
   <button class="spot_button" onclick="alert('장소나와')" >장소등록</button>
   </div>
   <!-- 오른쪽 멀티 버튼 -->
   <div class="multibtnright">
   <button class="hotel" onclick=" ">추천호텔</button> 
   <button class="spot" onclick=" ">추천장소</button> 
   </div>
	

</body>
</html>