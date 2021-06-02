function disappearLeft() {
	if ($('#plan_wrap').css('display') == 'none') {
		$('#plan_wrap').show();
	}
	else {
		$('#plan_wrap').hide();
	}
}

function disappearRight() {
	if ($('#menu_wrap').css('display') == 'none') {
		$('#menu_wrap').show();
	}
	else {
		$('#menu_wrap').hide();
	}
}

function removeLi() {
	$('li').remove('.spot');
	
	var clickImage = new daum.maps.MarkerImage(
			'http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png',
			new daum.maps.Size(24, 35), new daum.maps.Point(13,
				37));
	
	for (var i = 0; i < selectedmarkers.length; i++) {
		selectedmarkers[i].setImage(clickImage);
		selectedmarkers[i].setMap(null);
	}
	
	selectedmarkers = [];
	titles = [];
	addrs = [];
}

function removeLiOne(n) {
	$('li.spot' + n).remove();
}