<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog Login</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/user/login.css">

<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<div class="container">
		<form id="formLogin" class="form-login form-horizontal" action="">
			<h3 class="form-login-heading text-center" style="margin-top: 30px">로그인</h3>
			<hr>

			<div class="form-group">
				<label for="username" class="control-label">아이디</label>
				 <input class="form-control" type="text" placeholder="ID" id="user_id" name="userid">
				 <label for="password" class="control-label">비밀번호</label>
				<input class="form-control" type="password" placeholder="Password" id="user_pw" name="userpassword" style="margin-bottom: 10px;">
			</div>

			<!-- 			<div class="d-grid gap-2 d-md-flex justify-content-md-end"> -->
			<!-- 				<a href="/findUser" class="p-2 text-link">ID/PW 찾기</a> -->
			<!-- 			</div> -->

			<div class="d-grid gap-2">
				<button type="button" class="btn btn-success btn-block"
					onclick="loginCheck();" style="margin-top: 20px; background-color: #005B47">로 그 인</button>
				<button type="button" class="btn btn-success btn-block"
					onclick="signup();" style="margin-top: 10px; background-color: #005B47">회 원 가 입</button>
				<div class="find_info">
					<p>
						<a herf="" class="text-decoration-none" style="color: #BEB5B1" onclick = "location.href = 'findID'">아이디</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="findPassword" class="text-decoration-none" style="color: #BEB5B1">비밀번호 찾기</a>
					</p>
				</div>
			</div>
		</form>
	</div>

<script type="text/javascript">
$(document).ready(function() {
	$('.form-control').keydown(function(e) {
		if (e.keyCode == 13) {
			loginCheck();
			return;
		}
    });
});


function loginCheck() {
	if (loginValidation()) {
		ajaxCall4Html(ctxPath + '/user/loginChkAjax', $("#formLogin").serialize(), function(data) {
			var rtn = JSON.parse(data);
// 			console.log(rtn);
			
			if (rtn.result == 'YES') {
				console.log('로그인 성공');
				location.href = ctxPath + "/" + rtn.messages;
			} else {
				console.log('로그인 실패');
				alert('계정정보가 일치하지 않습니다.');
			}
		});
	}
}

function loginValidation() {
	if ($('#user_id').val() == undefined || $('#user_id').val() == "") {
		alert("ID를 입력해주세요.");
		return false;
	}

	if ($('#user_pw').val() == undefined || $('#user_pw').val() == "") {
		alert("암호를 입력해주세요.");
		return false;
	}
	
	return true;
}

function signup() {
	location.href = ctxPath + "/user/signup";
}
</script>

</body>
</html>