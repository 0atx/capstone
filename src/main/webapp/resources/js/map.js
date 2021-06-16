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