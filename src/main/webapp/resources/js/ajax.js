function postUser(email) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/users', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'post',
		dataType: 'json',
		accept: "aplication/json",
		contentType: "application/json;",
		data: JSON.stringify({
			userId: email
		}),
		async: false,
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function postPlan(email, a, b, diffDays) {
	for (var i = 1; i <= diffDays; i++) {
		var planId = email.split('@');
		planId[0] += "_" + i;
		$.ajax({
			url: 'http://localhost:1000/hansung/api/plans', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
			method: 'post',
			dataType: 'json',
			accept: "aplication/json",
			contentType: "application/json;",
			data: JSON.stringify({
				id: planId[0],
				startDate: a,
				endDate: b,
				planDay: i,
				toTalDate: diffDays
			}),
			async: false,
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		postUserPlan(email, planId[0]);

	}
}

function postSpot(email) {

	for (var i = 0; i < selectedmarkers.length; i++) {

		var title = $("#spot_title" + i).html();
		var addr = $("#spot_addr" + i).html();
		var x = $("#spot_x" + i).html();
		var y = $("#spot_y" + i).html();
		var day = $(".spot_days" + i).val();
		var planId = email.split('@');
		planId[0] += "_" + day;
		var id = i + 1;
		var spotId = planId[0] + "_" + id;

		$.ajax({
			url: 'http://localhost:1000/hansung/api/spots', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
			method: 'post',
			dataType: 'json',
			accept: "aplication/json",
			contentType: "application/json;",
			data: JSON.stringify({
				id: spotId,
				title: title,
				addr: addr,
				mapx: x,
				mapy: y
			}),
			async: false,
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});

		postPlanSpot(planId[0], spotId);

	}
}

function postUserPlan(email, planId) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/users/' + email + '/plans/' + planId, //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'post',
		async: false,
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function postPlanSpot(planId, spotId) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/plans/' + planId + '/spots/' + spotId, //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'post',
		async: false,
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function getUser(email) {
	$.ajax({
		url: 'http://localhost:1000/hansung/api/users/' + email + '/', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			showDupModal();
		},
		error: function(request, status, error) {
			save();
		}
	});
}

function getSpot(email) {
	var id = email.split('@');
	$.ajax({
		url: 'http://localhost:1000/hansung/api/spots/', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
		method: 'get',
		async: false,
		success: function(data) { //DB접근 후 가져온 데이터
			if (data != undefined) {
				for (var i = 0; i < data.length; i++) {
					var spotid = data[i].id.split('_');
					console.log(spotid[0]);
					if (spotid[0] == id[0]) {
						console.log(spotid);
						showDupModal();
						break;
					}
				}
				if (i == data.length)
					save();
			}
			else
				save();
		},
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
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