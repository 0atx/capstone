<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <title>HJJH Trip</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/map.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/bootstrap-5.0.0-beta3-dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48003175ba9df6daee13eb781dd7ff9d&libraries=services"></script>
</head>
<body>
   <!-- 네비바 MENU 드롭다운 버튼 중 일정창, 장소창 숨기기 기능  -->
   
<div id="wrap_all_Conents" class ="container-fluid">
   <!-- 네비바 MENU 드롭다운 버튼 중 피드백 버튼 클릭시 팝업되는 div  -->
   <div id="light" class="white_content">
   <b>사이트 피드백</b>
   <a href = "javascript:void(0)" style ="visibility: visible !important;" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
   <i class="fas fa-times"></i></a>
   <p style="font-size : 4px;">서비스 이용에 불편이 존재하나요? HJJH TRIP 페이지의 서비스에서 불편을 느끼신 점, 개선할 점 등을 보내주세요.</p>
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
      <button type="button" class="btn btn-outline-primary" style="top:10px;">Submit</button>
   </div>
   </div>          
   <div id="fade" class="black_overlay"></div>
   <!-- 상단 네비게이션 바 부분 -->
   <div class="menu">
   <nav class="navbar navbar-expend-sm  justify-content-end" style="right:1%;">
      <a class="navbar-brand" style ="color:#000000; text-decoration:none;" href="${pageContext.request.contextPath}/"><h5><b>HJJH TRIP</b></h5></a>
      <span class="nav-item" style="font-size:12px">&nbsp;YOUR TRIP ROUTE WITH US&nbsp;</span>
      <div class="dropdown">
         <button class="btn btn-secondary dropdown-toggle" type="button"
            id="dropdownMenuButton1" data-bs-toggle="dropdown"
            aria-expanded="false" style="background-color : #778899; margin : 5px; ">Menu</button>
         <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" onclick="disappearLeft()">일정창</a></li> <!-- 누르면 왼쪽 일정창 hidden -->
            <li><a class="dropdown-item" onclick="disappearRight()">장소창</a></li> <!-- 누르면 오른 장소창 hidden -->
            <li><a class="dropdown-item" href = "javascript:void(0)" 
            onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">FeedBack</a></li> <!-- FEEDBACK 작성 div팝업 호출되게 할것 -->
         </ul>
      </div>
   </nav>
   </div>
<!-- 왼쪽 일정부분 -->
   <div class="leftMap" id="plan_wrap">
      <div class="cal">
         일정선택<br>
         From: <input type="text" id="datepicker" style="width:100px; height:20px;"> <br> 
         To: <input type="text" id="datepicker2" style="width:100px; height:20px;">
      </div>


      <!-- 유저가 선택한 장소 목록 -->
      <div class="selectedSpots">
         <p>선택목록</p>
         <i class="fas fa-stopwatch"></i> 
         <span>총 소요시간 :</span><br>
         <div class="d-grid gap-2">
            <button class="resetplanbtn" onclick="removeLi()"><span style="color:#ffffff; font-weight : bold;">일정 전체 삭제</span></button>
         </div>
         <ul id="spotsList" style="list-style-type: none;"></ul>
            <li id="blank_li" style="display : none;">빈칸</li>
      </div>
<!-- li의 X버튼누르면 요소 삭제 -->

   </div>
   <!-- 왼쪽 멀티 버튼 -->
   <div class="multibtnleft">
      <button class="user_button" onclick="alert('이용방법 나와')">이용방법</button>
      <br>
      <button class="spot_button" onclick="alert('장소나와')">장소등록</button>
   </div>
   <!-- 오른쪽 멀티 버튼 -->
   <div class="multibtnright">
      <button class="hotel" onclick=" ">추천호텔</button>
      <button class="spotrecommend" onclick=" ">추천장소</button>
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
      <script>
   $(function() {
       fn_default_datepicker();
   });
       
   function fn_default_datepicker()
   {
      var start = $( "#datepicker" ).datepicker({
          dateFormat: 'yy-mm-dd' //Input Display Format 변경
          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
          ,changeYear: true //콤보박스에서 년 선택 가능
          ,changeMonth: true //콤보박스에서 월 선택 가능                
          //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
          //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
          //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
          ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
          ,maxDate: "+7D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
      });
          
   var end = $( "#datepicker2" ).datepicker({
       dateFormat: 'yy-mm-dd' //Input Display Format 변경
       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
       ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
       ,changeYear: true //콤보박스에서 년 선택 가능
       ,changeMonth: true //콤보박스에서 월 선택 가능                
       //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
       //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
       //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
       ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
       ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
       ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
       ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
       ,minDate: "+D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
       ,maxDate: "+10D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
          ,defaultDate: "+1w"
     });
   
   //초기값을 오늘 날짜로 설정
   $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   $('#datepicker2').datepicker('setDate', '+3D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
}

   function getDate( element ) {
      var date;
      var dateFormat = "yy-mm-dd";
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
      return date;
   }

   $(document).ready(function(){
         
         $("#datepicker").on("click",function(){
             
         });
   
          $("#datepicker").on("change",function(e){
              var end = $( "#datepicker2" ).datepicker( "option", "minDate", getDate( e.target ) );
          });
          
          $("#datepicker2").on("change",function(e){
              
          });
          
          $("#date_search").on("click",function(){
              var start = $("#datepicker").val();
              var end = $("#datepicker2").val();
          });    
      });


      function displaySpots(selectedmarkers, titles, addrs, leftindex) {
         var n = [];
         var mk = [];
         var tt = [];
         var adr = [];
         var idx = [];
         var scnt = 0;
         var mcnt = 0;
         var sl = selectedmarkers.length;
         var listEl = document.getElementById('spotsList'), menuEl = document.getElementById('plan_wrap'), 
            fragment = document.createDocumentFragment(), 
            bounds = new kakao.maps.LatLngBounds(), listStr = '';
         var clickImage = new daum.maps.MarkerImage(
                 'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png',
                 new daum.maps.Size(24, 35), new daum.maps.Point(13,
                       37));

         removeAllChildNods(listEl);

         for (let i = 0; i < selectedmarkers.length; i++) {
        	 
			if(titles[i] != undefined) {
            console.log("title" + i + " : " + titles[i]);
            
            var el = document.createElement('li'), itemStr = '<div id="li_wrap"><span class="markerbg marker_'
                 + (i + 1)
                 + '" ></span>'
                 + '<div class="info" style="margin : 0.4em;"><div><span style="display: inline-block; height: .90em;">'
                 + '   <h6>' + titles[i] + '</h6></span></div>'
                 + '<div><input type="number" min="0" max="24" value="2"/>시간'
                 + '<input type="number" min="0" max="59" value="0" style="width:40px; height:20px;"/>분</div></div>'
                 + '<div><button id="removebtn" stlye="display : inline-block;">X</button></div>';
                 
                  

//          itemStr += '    <br><span style="font-size: .80em;">'
//                + addrs[i] + '</span><br>';

//          itemStr += '  <span class="position" style="font-size: .80em; display:none;">'
//                + selectedmarkers[i].getPosition() + '</span>' +  '</div>';
            
            n[scnt] = leftindex[i]; //이 n 초기화를 어떠헥 해결할 것인가???? ??scnt를 초기화한다? n을 초기화 한다?
            scnt++;

            
            el.innerHTML = itemStr;
            el.className = 'spot' + (i+1);
            console.log(el.className);
			}
            //var btn = document.getElementById("removebtn");
            //console.log(btn.innerHTML);
            
         (function(marker, title) {
            el.onclick = function() {
            //btn.onclick = function() {    

                     //삭제 처리 해야 함
                     
                
                     var index = n[i];
                     console.log("start i" + i);
                     console.log( "flag[" + index +  "]: " + flag[index]);
                     if(flag[index] == 1) { 
                        
                    	 for (var b = 0; b < sl; b++) {
                             var bool = markers[index].getPosition().equals(selectedmarkers[b].getPosition());
                             if (bool || titles[b] == "undefined")  {
                                selectedmarkers[b].setMap(null);
                                console.log( "titles[" + b +  "]: " + titles[b] + "삭제");
                                markers[index].setImage(clickImage);
                                markers[index].setMap(null);
                                removeLiOne(i+1);
                             } else { 
                                mk[mcnt] = selectedmarkers[b];
                                tt[mcnt] = titles[b];
                                adr[mcnt] = addrs[b];
                                mcnt++;
                             }
                        	 } 

                      selectedmarkers = [];
                      titles = [];
                      addrs = [];
                      console.log(selectedmarkers.length);
                      
                      selectedmarkers = mk;
                  		sl = mk.length;
                        console.log(selectedmarkers.length);
                        console.log("next");
                        titles = tt;
                        addrs = adr;
                        tt = [];
                        adr = [];
                        mk = [];
                        mcnt = 0;
                 		 smarkers = [];
                 		 stt = [];
                 		 sadr = [];
                 		 smarkers = selectedmarkers;
                 		 stt = titles;
                 		 sadr = addrs;

                        console.log("클릭 삭제 : selectedmarkers.length " + selectedmarkers.length);
                
                         flag[index] = 0;
                          //el.remove();
                         
                  }
                     
                  };


               })(marker, titles[i]);
            
            fragment.appendChild(el);
         
         }  
         listEl.appendChild(fragment);
         menuEl.scrollTop = 0;
         
      }
   </script>
   
   
</div>
	<script src="${pageContext.request.contextPath}/resources/js/menubar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/searchplace.js"></script>
</body>
</html>