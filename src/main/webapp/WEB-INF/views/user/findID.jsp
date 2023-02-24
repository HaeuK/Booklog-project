<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/user/findID.css">

<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<div class="container" style="text-align: center">
		<form id="formFindID" class="form-horizontal" action="">
			<h3 class="form-login-heading text-center" style="margin-top: 30px">아이디 찾기</h3>
			<hr>
			<div class="col-md-5" style="float: none; margin:0 auto;" id="input_email">
				<label for="username" class="control-label" style="font-size: 1.2em">&nbsp;◈ 이메일을 입력하세요.</label> 
				<input class="form-control" type="email" id="user_email" name="useremail"  style="margin: 20px 0">
				<button type="button" class="btn btn-sm"
					onclick="emailCheck();" style="color:white; background-color: #005B47;'margin:20px">확인</button>
			</div>
			</form>
			<div class="d-grid gap-4">
				<div id="give_info">			
					<p class="msg_out"></p>	
					<!--  버튼 추가하기 성공일 경우 로그인/비밀번호찾기-->		
					<button type="button" class="btn btn-sm " id="btn_login"
					style="color:white; background-color: #005B47; margin-right: 20px;margin-top:20px " onclick = "location.href = '/user/login'">로그인</button>
					<button type="button" class="btn btn-sm" id="btn_password"
					style="color:white; background-color: #005B47;;margin-top:20px " onclick = "location.href = 'findPassword'">비밀번호 찾기</button>
				</div>
			</div>		
	</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
			
			$.ajax({
				url: ctxPath+'/user/findIdAjax',
				type: 'post',
				data: $('#formFindID').serialize(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType : "json",
		        success: function (data){
		        	var userid = data.userid;
		        	console.log(userid);
		        	$("#input_email").css({"display":"none"});
		            $("#give_info").css({"display":"block"});
		        	
		        	$('.msg_out').append("회원님의 ID는 [ "+userid+" ] 입니다." )
		        	},
	           error: function (XMLHttpRequest, textStatus, errorThrown){
	        	alert('일치하는 정보가 없습니다.' );
	        }

		        	
			});
			
		 
	}

</script>

</body>
</html>
