<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/user/findPassword.css">

<jsp:include page="/include/resource.jsp" />

</head>
<body>
<div class="container" style="text-align: center">

		<form id="formFindPassword" class="form-horizontal" action="">
			<h3 class="form-login-heading text-center" style="margin-top: 30px">비밀번호 찾기</h3>
			<hr>
			<div class="col-md-5" style="float: none; margin:0 auto;"id="input_info" >
				<label for="username" class="control-label" style="font-size: 1.2em">&nbsp;◈ 아이디를 입력하세요.</label> 
				<input class="form-control" type="text" id="user_id" name="userid"  style="margin: 20px 0">
				<label for="useremail" class="control-label" style="font-size: 1.2em">&nbsp;◈ 이메일을 입력하세요.</label> 
				<input class="form-control" type="email" id="user_email" name="useremail"  style="margin: 20px 0">
				<button type="button" class="btn btn-sm"
					onclick="emailCheck();" style="color:white; background-color: #005B47;'margin:20px">확인</button>
			</div>
			</form>
			<div class="d-grid gap-3">
				<div id="give_info">
					<p>회원님의 이메일로 비밀번호를 전송했습니다.</p>	
					<!--  버튼 추가하기 성공일 경우 로그인/비밀번호찾기-->		
					<button type="button" class="btn btn-block " id="btn_login"
					style="color:white; background-color: #005B47; margin-right: 20px " onclick = "location.href = '/user/login'">로그인</button>
				</div>
			</div>		
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

	function emailCheck(){
			ajaxCall4Html(ctxPath + '/user/findPasswordAjax', $("#formFindPassword").serialize(), function(data) {
				var rtn = JSON.parse(data);
	 			console.log(rtn);
				
				if (rtn.result == 'YES') {
					console.log('비밀번호 찾기 성공');
					$("#input_info").css({"display":"none"});
		               $("#give_info").css({"display":"block"});
		               
				} else {
					console.log('비밀번호 찾기 실패');
					alert('계정정보가 일치하지 않습니다.');
				}
			});
	}

</script>

</body>
</html>
