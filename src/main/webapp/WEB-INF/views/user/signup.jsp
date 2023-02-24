<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/user/signup.css">

<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<div class="container">
		 <div id="agreement_signup">
	            <h3 style="text-align: center; padding-top: 50px; margin-bottom: 30px">◈ 개인정보의 수집 및 이용에 대한 동의(필수) </h3>
	            
	            <div id="agreementcontent">
	                <p>
	                    북로그 서비스 (이하 '북로그') 이용을 위한 개인정보 수집 · 이용 동의서<br><br><br><br>
	                    ■ 개인정보의 수집 이용 목적<br><br>
	                    북로그는 개인정보 보호법에 따라 서비스의 제공을 위하여 사용자 개인정보를 수집하며, 필요 목적 외 다른 용도로 사용하지 않습니다. 
	                    개인정보 수집 및 이용은 정보주체의 동의를 통해서만 이루어지며, 제 3자가 무단으로 열람 및 사용할 수 없습니다. 사용 목적이 상실된 경우 해당 정보는 즉시 파기됩니다.
	                    <br><br><br>
	                    ■ 수집하려는 개인정보의 항목<br><br>
	                    - 아이디, 비밀번호, 이메일
	                    <br><br><br>
	                    ■ 개인정보의 보유 및 이용 기간<br><br>
	                    1) 개인정보 이용 기간 : 서비스 이용 기간과 동일<br>
	                    2) 보유기간 : 회원 탈퇴 후 1년<br>
	                    3) 보유근거 : 정보주체의 동의를 받은 경우<br>
	                    <br><br><br>
	                    ■ 동의를 거부할 권리 및 동의 거부에 따른 불이익<br><br>
	                    북로그 회원가입에 필요한 개인정보 수집 및 이용에 대하여 동의를 거부할 수 있으며, 거부할 경우 가입에 제한을 받을 수 있습니다.
	                    <br><br><br><br>
	
	                    위 내용에 동의하실 경우 동의 버튼을 누르시면 회원가입이 진행됩니다.
	               
	                </p>
	            </div>
	            <input type="checkbox" id="agreementchk" > <span style="font-size: 1.0em; vertical-align:2px; font-weight: 600; ">약관에 동의합니다.</span>
	        </div>
	        <div id=signup>
				<form id="formSignup" class="form-login form-horizontal" action="">
					<h3 class="form-login-heading text-center">회원가입</h3>
					<hr>
					
					<div class="form-group">
						<label for="user_id" class="control-label">아이디</label>
						<div class="input-group mb-3 has-validation"> <!-- validation은 bootstrap 라이브러리의 validation을 사용하였다. -->
							<input class="form-control" type="text" placeholder="ID" id="user_id" name="userid">
							<button class="btn btn-outline-secondary" type="button" id="duplChkButton" style="color:white; background-color: #005B47;" onclick="userDuplChk();">중복확인</button>
							<div id="invalidIDFeedback" class="invalid-feedback">
								중복검사를 진행해주세요.
							</div>
						</div>
				
						<label for="password" class="control-label"> 비밀번호</label>
						<input class="form-control mb-2 form-password" type="password" placeholder="Password" id="user_pw" name="userpassword">
						<input class="form-control form-password" type="password" placeholder="재입력" id="user_pw_rp">
						<div id="invalidPWFeedback" class="invalid-feedback">
							입력한 비밀번호가 일치하지 않습니다.
						</div>
						
						<label for="user_nickname" class="control-label mt-3">닉네임</label>
						<input class="form-control mb-3" type="text" placeholder="별명 입력" id="user_nickname" name="usernickname">
						
						<label for="user_email" class="control-label">이메일</label>
						<input type="hidden" id="user_email" name="useremail"> <!-- 실제 입력 input -->
						<div class="input-group">
							<input type="text" class="form-control" placeholder="메일 아이디 입력" id="user_email_front">
							<span class="input-group-text">@</span>
						</div>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="메일 서버 입력" id="user_email_back">
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
						<button type="button" class="btn" style="color:white; background-color: #005B47;" onclick="signup();">가입</button>
						<button type="button" class="btn" style="color:white; background-color: #005B47; opacity:0.8;" onclick="location.href = ctxPath + '/user/login';">취소</button>
					</div>
				</form>
		</div>
	</div>

<script type="text/javascript">
var idDuplicateFlag = false;
var pwSaneFlag = false;

$(document).ready(function(){
    $('input:checkbox[id="agreementchk"]').click(function(){
       $("#agreement_signup").css({"display":"none"});
       $("#signup").css({"display":"block"});
    })
})

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


function signup() {
	//나눠진 이메일 값 합쳐서 저장
	if (isValidEmail($('#user_email_front').val() + "@" + $('#user_email_back').val())) {
		$('#user_email').val($('#user_email_front').val() + "@" + $('#user_email_back').val());
	}
	
	if (signupValidation()) {
		ajaxCall4Html(ctxPath + '/user/signupAjax', $("#formSignup").serialize(), function(data) {
			var rtn = JSON.parse(data);
// 			console.log(rtn);
			
			if (rtn.result == 'YES') {
				alert("데이터 입력이 완료되었습니다. 등록한 계정으로 로그인 후 이용해주세요.");
				location.href = ctxPath + '/user/login';
			} else {
				alert("데이터 입력에 실패했습니다. 확인 후 다시 이용해주세요");
			}
		});
	}
}

function signupValidation() {
	if ($('#user_id').val() == undefined || $('#user_id').val() == "") {
		alert("ID를 입력해주세요.");
		return false;
	}
	if (!idDuplicateFlag) {
		alert("ID중복체크를 진행해주세요.");
		return false;
	}

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

function userDuplChk() {
	if (duplChkValidation()) {
		/* ajaxCall4Html은 resources/common_js/common.js에서 확인 가능 ajax 콜을 필요한 데이터만 받아서 처리하도록 만든 function
		*  데이터를 form DOM객체로 받아 serialize() 처리하는 건 jquery 라이브러리. form에 속한 input데이터를 요청에 적합한 형태로 바꿔주는 역할을 담당.
		*/
		ajaxCall4Html(ctxPath + '/user/userDuplChkAjax', $("#formSignup").serialize(), function(data) {
			var rtn = JSON.parse(data);
// 			console.log(rtn);
			if (rtn.result == 'YES') {
				alert("사용 가능한 ID입니다.");
				idDuplicateFlag = true;
				$('#user_id').removeClass('is-invalid');
				$('#user_id').addClass('is-valid');
			} else {
				alert("이미 존재하는 ID입니다.");
			}
		});
	}
}

function duplChkValidation() {
	if ($('#user_id').val() == undefined || $('#user_id').val() == "") {
		alert("ID를 입력해주세요.");
		return false;
	}
	
	return true;
}
</script>
</body>
</html>