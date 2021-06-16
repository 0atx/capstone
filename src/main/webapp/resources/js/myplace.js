function displaySpots(selectedmarkers, titles, addrs) {
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

		if (titles[i] != undefined) {

			var el = document.createElement('li'), itemStr = '<div id="li_wrap"><span class="markerbg marker_'
				+ (i + 1)
				+ '" ></span>'
				+ '<div class="info" style="margin : 0.4em;"><div><span style="display: inline-block; height: .90em;">'
				+ '<h6 id="spot_title' + i + '" >' + titles[i] + '</h6></span></div>'
				+ '<div>DAY : <input type="number" min="1" max="' + diffDays + '" value="1" class="spot_days' + i + '"/></div></div>'
				+ '<div id="spot_addr' + i + '" style="display: none;">' + addrs[i] + '</div>'
				+ '<div id="spot_x' + i + '" style="display: none;">' + selectedmarkers[i].getPosition().getLat() + '</div>'
				+ '<div id="spot_y' + i + '" style="display: none;">' + selectedmarkers[i].getPosition().getLng() + '</div>';


			el.innerHTML = itemStr;
			el.className = 'spot';

		}

		fragment.appendChild(el);

	}
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

}
