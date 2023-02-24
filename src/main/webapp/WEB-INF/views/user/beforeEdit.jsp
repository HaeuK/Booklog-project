<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
<jsp:include page="/include/resource.jsp" />
<style type="text/css">
.passwordCheckContainer{
	text-align: center;
	margin-top: 200px;
}

#identifyBttn{
	background-color: transparent;
	border:1px solid #005B47;
	border-radius: 6px;
	padding:5px;
	color: #005B47;
	transition: 0.5s ease;
}
#identifyBttn:hover{
   color: rgb(246, 245, 239);
   background-color: #005B47;
}
#userpwd{
  margin-right: 15px;
  padding:2px;
  text-indent: 6px;
  border-radius: 5px;
}

#userpwd:focus{
	outline: 3px solid #CEECF5;
	border:none;
}


</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
				
				<div class="passwordCheckContainer">
					<h3>비밀번호 확인</h3>
					<p>고객님의 안전한 정보보호를 위하여 비밀번호를 다시 한 번 확인합니다.<br>비밀번호가 타인에게 노출되지 않도록 주의하여 주세요.</p>
					<form id="pwdCheckForm" action="/user/editMemberInfo" method="post">
						<input type="hidden" value="${loginVo.userno}" name="userno">
						<input type="password" id="userpwd" name="userpassword">
						<button id="identifyBttn">확인</button>
					</form>
				</div>
				
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">
$(document).ready(function(){
	
	$('#identifyBttn').on("click",function(event){
		event.preventDefault();
		if(pwdCheck()==true){	
			 $('#pwdCheckForm').submit(); 
		}else{
			alert("비밀번호가 불일치합니다.");
		}
		
	});	

})


function pwdCheck(){
	
	if($('#userpwd').val()== ${loginVo.userpassword}){
		return true;
	}return false;
	
}
</script>

</body>
</html>
