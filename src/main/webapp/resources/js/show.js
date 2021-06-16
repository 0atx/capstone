console.log(email);
var id = email.split('@');
var plans = [];
var spots = [];
var cnt = 0;
var num;

$.ajax({
	url: 'http://localhost:1000/hansung/api/plans/',
	method: "get",
	dataType: "json",
	contentType: "application/json",
	async: false,
	success: function(data) {
		for (var i = 0; i < data.length; i++) {
			var pid = data[i].id.split('_');
			if (pid[0] == id[0]) {
				plans[cnt] = data[i];
				cnt++;
			}
		}
	},
	error: function(data) {
		console.log("code:" + request.status + "\n" + "message:"
			+ request.responseText + "\n" + "error:" + error);
	}
});
cnt = 0;
$.ajax({
	url: 'http://localhost:1000/hansung/api/spots', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
	method: 'get',
	async: false,
	success: function(data) { //DB접근 후 가져온 데이터
		for (var i = 0; i < data.length; i++) {
			var sid = data[i].id.split('_');
			if (sid[0] == id[0]) {
				spots[cnt] = data[i];
				cnt++;
			}
		}

	},
	error: function(request, status, error) {
		console.log("code:" + request.status + "\n" + "message:"
			+ request.responseText + "\n" + "error:" + error);
	}
});

var count = plans[0].toTalDate;

var startDate = plans[0].startDate;
var endDate = plans[0].endDate;

var caption = document.getElementById('caption');
caption.innerHTML = startDate + " ~ " + endDate;

var tBody = document.getElementById('plan_tbody'), fragment = document.createDocumentFragment();

$("plan_tbody").empty();

for (var i = 1; i <= plans.length; i++) {

	var planId = plans[i - 1].id;

	var spotLength = plans[i - 1].spots.length;

	var daySpots = plans[i - 1].spots;

	var elStr = '';

	var tr = document.createElement('tr'), tbodyStr = '<th>' + i + "일차"
		+ '</th><td><ol>';

	for (var j = 0; j < spotLength; j++) {
		var toTitle = daySpots[j].title.replace(/(\s*)/g, "");

		var src = "https://map.kakao.com/link/to/" + toTitle + ","
			+ daySpots[j].mapx + "," + daySpots[j].mapy;
		if (j != 0) {
			var fromTitle = daySpots[j - 1].title.replace(/(\s*)/g, "");
			src += "/from/" + fromTitle + "," + daySpots[j - 1].mapx
				+ "," + daySpots[j - 1].mapy;

		}
		elStr += '<li style="margin:5px;">' + daySpots[j].title + '</br><button type="button" style="background-color: #15d2c5 !important; border : none !important; border-radius : 10px;"><a href="' + src + '" target="_blank" >' + " <span style='color:#ffffff'>경로 보기</span> " + '</a></button></li>';

	}

	tbodyStr += elStr;
	tbodyStr += '</ol></td>'

	tr.innerHTML = tbodyStr;
	tr.className = 'plan_tr';

	fragment.appendChild(tr);

}
tBody.appendChild(fragment);

tBody.scrollTop = 0

function deleteModal() {
	$("#modal2").show();
}
function closeModal2() {
	$("#modal2").hide();
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

function showFinishModal() {
	$("#modal2").hide();
	$("#finishModal").show();
}

function closeFinishModal() {
	$("#finishModal").hide();
	location.replace("home");
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


function removeData() {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/spots', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			for (var i = 0; i < data.length; i++) {
				var sid = data[i].id.split('_');
				if (sid[0] == id[0]) {
					deleteSpot(data[i].id);
				}
			}
		},
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});

	$.ajax({
		url: 'http://localhost:1000/hansung/api/plans', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			for (var i = 0; i < data.length; i++) {
				var pid = data[i].id.split('_');
				if (pid[0] == id[0]) {
					deletePlan(data[i].id);
				}
			}
		},
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});

	$.ajax({
		url: 'http://localhost:1000/hansung/api/users', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			for (var i = 0; i < data.length; i++) {
				var uid = data[i].userID;
				if (uid == email) {
					deleteUser(data[i].userID);
				}
			}
		},
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});

	showFinishModal();

}

function deleteSpot(id) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/spots/' + id + '/', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'delete',
		async: false,
		error: function(request, status, error) {
			console.log("spot 삭제 실패");
		}
	});
}

function deletePlan(id) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/plans/' + id + '/', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'delete',
		async: false,
		error: function(request, status, error) {
			console.log("plan 삭제 실패");
		}
	});
}

function deleteUser(email) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/users/' + email + '/', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'delete',
		async: false,
		error: function(request, status, error) {
			console.log("user 삭제 실패");
		}
	});
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