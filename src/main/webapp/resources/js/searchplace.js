//마커를 담을 배열입니다
var markers = []; // 검색시 출력되는 마커 배열
var addrs = []; // 주소 정보 배열
var titles = []; // 장소 이름 정보 배열
var selectedmarkers = []; // 검색목록에서 클릭시 담길 마커 배열
//var selectedtitles = []; // 검색목록에서 클릭시 담길 장소 이름 정보 배열
//var selectedaddrs = []; // 검색목록에서 클릭시 담길 주소 정보 배열
//var index = []; // 주소 태그 id 구분할 떄 쓰임
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
	zIndex: 1
});
// 키워드로 장소를 검색합니다
searchPlaces();
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	var keyword = document.getElementById('keyword').value;
	var defaultKeyword = $("#defaultKeyword").html();

	if (keyword == '')
		keyword = defaultKeyword;
	if (!keyword.replace(/^\s+|\s+$/g, '')) {
		alert('키워드를 입력해주세요!');
		return false;
	}
	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	ps.keywordSearch(keyword, placesSearchCB);
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {

		// 정상적으로 검색이 완료됐으면
		// 검색 목록과 마커를 표출합니다
		displayPlaces(data);
		// 페이지 번호를 표출합니다
		displayPagination(pagination);
	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		alert('검색 결과가 존재하지 않습니다.');
		return;
	} else if (status === kakao.maps.services.Status.ERROR) {

		alert('검색 결과 중 오류가 발생했습니다.');
		return;
	}
}
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
	var listEl = document.getElementById('placesList'), menuEl = document
		.getElementById('menu_wrap'), fragment = document
			.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

	// 검색 결과 목록에 추가된 항목들을 제거합니다
	removeAllChildNods(listEl);
	// 지도에 표시되고 있는 마커를 제거합니다
	//removeMarker();

	for (let i = 0; i < places.length; i++) {
		//index[i] = i + 1;
		// 마커를 생성하고 지도에 표시합니다
		var placePosition = new kakao.maps.LatLng(places[i].y,
			places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
				i, places[i]); // 검색 결과 항목 Element를 생성합니다
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);
		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
		var clickImage = new daum.maps.MarkerImage(
			'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
			new daum.maps.Size(24, 35), new daum.maps.Point(13,
				37));

		(function(marker, title) {
			kakao.maps.event.addListener(marker, 'mouseover',
				function() {
					//marker.setMap(map);
					displayInfowindow(marker, title);
				});
			kakao.maps.event.addListener(marker, 'mouseout',
				function() {

					infowindow.close();
				});

			itemEl.onmouseover = function() {
				marker.setMap(map);
				markers.push(marker);
				displayInfowindow(marker, title);

			};

			itemEl.onmouseout = function() {
				if (selectedmarkers.length > 0) {
					marker.setMap(null);
					infowindow.close();

					for (var j = 0; j < selectedmarkers.length; j++)
						selectedmarkers[j].setMap(map);

				} else
					marker.setMap(null);
				infowindow.close();

			};

			itemEl.onclick = function() {
				//중복 처리
				var bool = 0;
				for(var i = 0; i < titles.length; i++) {
					if(titles[i] == title)
						bool = 1;
				}
				if (bool == 0) {

					marker.setMap(map);
					marker.setImage(clickImage);

					selectedmarkers.push(marker);

					var s = 'spotaddr' +  i;
					
					if (title != "undefined") {
						addrs.push(document.getElementById(s).innerHTML);
						titles.push(title);
						console.log(title);

						displaySpots(selectedmarkers, titles, addrs);

					}
				};

			}

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

	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
		+ (index + 1)
		+ '" ></span>'
		+ '<div class="info"><span style="display: inline-block; height: .90em;">'
		+ '   <h6>' + places.place_name + '</h6></span>';

	itemStr += ' <br><span id="spotaddr'+ index +'" style="font-size: .80em;">'
		+ places.address_name + '</span><br>';

	itemStr += '  <span class="tel" style="font-size: .80em;">'
		+ places.phone + '</span>' + '</div>';
	el.innerHTML = itemStr;

	el.className = 'item';

	return el;
}
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new daum.maps.Size(24, 35) // 마커 이미지의 크기
	imgOptions = {
		spriteSize: new daum.maps.Size(24, 35), // 스프라이트 이미지의 크기
		offset: new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표,
	}, markerImage = new kakao.maps.MarkerImage(imageSrc,
		imageSize, imgOptions), marker = new kakao.maps.Marker(
			{
				position: position, // 마커의 위치
				image: markerImage
			});
	//marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다
	return marker;
}
// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}
// 특정 마커 삭제
function deleteMarker(index) {
	var mk = [];
	for (var i = 0; i < markers.length; i++) {
		if (markers[i].position == position) {
			markers[i].setMap(null);
			i--;
		} else
			mk[i] = markers[i];
	}
}
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'), fragment = document
		.createDocumentFragment(), i;
	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}
	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i + "  ";
		if (i === pagination.current) {
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
	var content = '<div style="padding:5px;z-index:1;">' + title
		+ '</div>';
	infowindow.setContent(content);
	infowindow.open(map, marker);
}
// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}
