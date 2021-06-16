function save() {

	var email = $("#email").val();

	var a = $("#datepicker").datepicker({ dateFormat: 'yyyymmdd' }).val();
	var b = $("#datepicker2").datepicker({ dateFormat: 'yyyymmdd' }).val();

	alert("출발: " + a + " 도착:" + b + " 총 여행일수: " + diffDays);

	postUser(email);
	postPlan(email, a, b, diffDays);
	postSpot(email);

	// 다음 페이지 만들어지면 그 넘어갈 페이지 작업으로 변경
	location.replace("show?email=" + email);

};

function deleteAndSave() {
	var email = $("#email").val();
	var planId = email.split('@');

	$.ajax({
		url: 'http://localhost:1000/hansung/api/spots', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			for (var i = 0; i < data.length; i++) {
				var sid = data[i].id.split('_');
				if (sid[0] == planId[0]) {
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
				if (pid[0] == planId[0]) {
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

	closeDupModal();
	save();

}

function showModal() {
	$("#modal").show();
}

function closeModal() {
	$("#modal").hide();
}

function showDupModal() {
	$("#dupModal").show();
	$("#modal").hide();
}

function returnShowModal() {
	$("#dupModal").hide();
	$("#modal").show();
}

function closeDupModal() {
	$("#dupModal").hide();
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
			getSpot(email);
		}
	}
}
