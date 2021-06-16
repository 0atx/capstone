//스크롤 시, 상단 네비게이션 바 색상변경 함수
$(function() {
	var $header = $('header');
	var $page = $('.page-start');
	var $window = $(window);
	var pageOffsetTop = $page.offset().top;

	$window.resize(function() {
		pageOffsetTop = $page.offset().top;
	});

	$window.on('scroll', function() {
		var scrolled = $window.scrollTop() >= pageOffsetTop;
		$header.toggleClass('down', scrolled);
	});
});

//지정한 태그위치로 클릭시 스크롤자동이동
function fnMove(seq) {
	var offset = $("#" + seq).offset();
	$('html, body').animate({
		scrollTop: offset.top
	}, 300);
}

//carousel 조정 스크립트
$(function() {
	$('#carousel-example-generic').carousel({
		interval: false, //자동순환 X
		wrap: true,
		keyboard: true
	});
});

function newchange() {
	alert("사이트 변경사항 안내");
}

function showModal() {
	$("#modal").show();
}

function closeModal() {
	$("#modal").hide();
}

function showErrorModal() {
	$("#errorModal").show();
	$("#modal").hide();
}

function returnEmailModal() {
	$("#errorModal").hide();
	$("#modal").show();
}

function closeErrorModal() {
	$("#errorModal").hide();
}

function checkEmail() {

	var email = $("#email").val();

	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if (!email) {
		alert("이메일을 입력하세요.");
		$("#email").focus();
		return;
	}
	else {
		if (!reg_email.test(email)) {
			alert("이메일 형식이 잘못되었습니다.");
			$("#email").focus();
			return;
		}
		else {
			closeModal();
			getUser(email);
		}
	}
}

function getUser(email) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/users/' + email + '/', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			location.replace("show?email=" + email);
		},
		error: function(request, status, error) {
			showErrorModal();
		}
	});
}