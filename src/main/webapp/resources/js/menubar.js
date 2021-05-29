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
	selectedmarkers = [];
	titles = [];
	addrs = [];
}

function removeLiOne(n) {
	$('li.spot' + n).remove();
}