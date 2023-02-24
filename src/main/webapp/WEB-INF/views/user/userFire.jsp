<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
<link rel="stylesheet" href="${path}/resources/css/user/signup.css">	
<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
					<form id="userFirech" action="" method="post">
						<input type="hidden" value="${loginVo.userno}" name="userno">
					</form>
					<div class="passwordCheckContainer">
						<div class="container">
							<div id="agreement_signup">
								<h3 style="text-align: center; padding-top: 50px; margin-bottom: 20px">
									회원 탈퇴</h3>
								<div id="agreementcontent"
									style="margin-bottom: 30px; text-align: center; opacity: 0.9;">
									<p style="color: black;">
										<br> <br> 정말 탈퇴 하시겠습니까? <br>
										<br> 탈퇴 하시면 모든 독후감 및 문의 게시글 등 개인정보가 없어집니다 <br>
									<h6 style="color: red;">※ 탈퇴시 복구가 불가능 합니다 ※</h6>
									<br> <br> <br>
									<h4 style="color: red;">정말 탈퇴하실 건가요?</h4>
									</p>
									<i class="bi bi-heartbreak-fill"></i>
								</div>

								<button type="button" class="btn btn-outline-danger"
									id="userDelete"
									style="color: white; background-color: #005B47; margin-top: 10px; font-size: 13px;"
									onclick="userFire('delete');">누르면 바로 탈퇴합니다</button>
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
			</div>
		</div>
<script type="text/javascript">


function userFire() {
	
	if (confirm("정말 삭제하시겠습니까?")) {
		ajaxCall4Html(ctxPath + '/user/deleteMemberAjax', $("#userFirech").serialize(), function(data) {
			var rtn = JSON.parse(data);
			
			if (rtn.result == 'YES') {
				alert(rtn.messages);
				location.href = ctxPath + '/user/login';
			} else {
				alert("삭제에 실패했습니다. 확인 후 다시 이용해주세요");
			}
		});
	}
}





	
</script>
</body>
</html>