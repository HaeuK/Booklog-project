<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<jsp:include page="/include/resource.jsp" />
<link rel="stylesheet" href="${path}/resources/css/user/signup.css">
<style type="text/css">
.editTotalContainer{
	text-align: center;
	margin-top: 30px;
}

</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="/* overflow: auto;  */min-height: 1200px; max-height: 1200px;">
				<div>
					<div class= "editTotalContainer" style="height: 1200px; width: 100%;">
					<h3>회원 정보 수정</h3>
					<form id="formEdit" class="form-login form-horizontal" action="">
					
					<div class="form-group">
						<label for="user_id" class="control-label">아이디</label>
						<div class="input-group mb-3 has-validation"> <!-- validation은 bootstrap 라이브러리의 validation을 사용하였다. -->
							<input class="form-control" type="text" placeholder="ID" id="user_id" name="userid" value="${loginVo.userid}" disabled>
						</div>
				
						<label for="password" class="control-label"> 비밀번호</label>
						<input class="form-control mb-2 form-password" type="password" placeholder="Password" id="user_pw" name="userpassword">
						<input class="form-control form-password" type="password" placeholder="재입력" id="user_pw_rp">
						<div id="invalidPWFeedback" class="invalid-feedback">
							입력한 비밀번호가 일치하지 않습니다.
						</div>
						
						<label for="user_nickname" class="control-label mt-3">닉네임</label>
						<input class="form-control mb-3" type="text" placeholder="별명 입력" value="${loginVo.usernickname}" id="user_nickname" name="usernickname">
						
						<label for="user_email" class="control-label">이메일</label>
						<input type="hidden" id="user_email" name="useremail"> <!-- 실제 입력 input -->
						<div class="input-group">
							<input type="text" class="form-control" placeholder="메일 아이디 입력" id="user_email_front" value="${fn:substringBefore(loginVo.useremail, '@') }">
							<span class="input-group-text">@</span>
						</div>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="메일 서버 입력" id="user_email_back" value="${fn:substringAfter(loginVo.useremail, '@') }">
							<select class="form-select" id="user_email_back_select">
								<option value="" selected>직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
					</div>
					
					<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
						<button type="button" class="btn" style="color:white; background-color: #005B47;" onclick="edit();">수정</button>
						<button type="button" class="btn" style="color:white; background-color: #005B47; opacity:0.8;" onclick="location.href = ctxPath + '/home';">취소</button>
					</div>
				</form>
				<form id="logout" action="http://localhost:8181/logout" method="post">
               			<input type="hidden" >
            	</form>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>
   
<script type="text/javascript">
var idDuplicateFlag = false;
var pwSaneFlag = false;


$(document).ready(function() {
	$('.login-input').keydown(function(e) {
		if (e.keyCode == 13) {
			loginCheck();
			return;
		}
    });
	
	$('#user_id').keydown(function(e) {
		if (e.keyCode == 9) {
			return;
		}
		idDuplicateFlag = false;
		$('#user_id').addClass('is-invalid');
		if (e.keyCode == 13) {
			userDuplChk();
			return;
		}
    });
	
	$('.form-password').keyup(function(e) {
		if ($('#user_pw').val() == $('#user_pw_rp').val()) {
			pwSaneFlag = true;
			$('.form-password').removeClass('is-invalid');
			$('.form-password').addClass('is-valid');
		} else {
			pwSaneFlag = false;
			$('.form-password').removeClass('is-valid');
			$('.form-password').addClass('is-invalid');
		}
		if (e.keyCode == 13) {
			signup();
			return;
		}
    });
	
	$('#user_email_back_select').change(function() {
		$('#user_email_back').val($(this).val());
	});
});


function edit() {
	//나눠진 이메일 값 합쳐서 저장
	if (isValidEmail($('#user_email_front').val() + "@" + $('#user_email_back').val())) {
		$('#user_email').val($('#user_email_front').val() + "@" + $('#user_email_back').val());
	}
	
	if (signupValidation()) {
		ajaxCall4Html(ctxPath + '/user/editAjax', $("#formEdit").serialize(), function(data) {
			var rtn = JSON.parse(data);
// 			console.log(rtn);
			
			if (rtn.result == 'YES') {
				alert(rtn.messages);
				$('#logout').submit();
			} else {
				alert(rtn.messages);
			}
		});
	}
}

function signupValidation() {

	if ($('#user_pw').val() == undefined || $('#user_pw').val() == "") {
		alert("암호를 입력해주세요.");
		return false;
	}
	if (!pwSaneFlag) {
		alert("입력된 두 비밀번호가 서로 일치하지 않습니다.");
		return false;
	}
	
	if ($('#user_nickname').val() == undefined || $('#user_nickname').val() == "") {
		alert("닉네임을 입력해주세요.");
		return false;
	}
	
	if ($('#user_email').val() == undefined || $('#user_email').val() == "") {
		alert("이메일을 입력해주세요.");
		return false;
	}
	if (!isValidEmail($('#user_email').val())) {
		alert("올바른 이메일 주소를 입력해주세요.");
		return false;
	}
	
	return true;
}



</script>

</body>
</html>