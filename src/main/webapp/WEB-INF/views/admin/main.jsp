<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/admin/admin.css">
<jsp:include page="/include/resource.jsp" />

</head>
<body style="overflow:hidden">
	<jsp:include page="/include/header.jsp"></jsp:include>

	<div>
		<c:set var="userrole" value="${loginVo.userrole}" />
		<c:if test="${userrole eq 1}">
			<script>
				alert("관리자 권한 없음");
				location.href = "/home";
			</script>
		</c:if>
	</div>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
				<div class="row m-3 justify-content-center">
				<h3 style="text-align: center; margin-bottom:0px">관리자 페이지</h3>
				<div class="card my-3">
					<div id="card">
						<ul class="ul-height d-grid gap-2 col-6 mx-auto">
							<li>
								<div>
									<a href="userList">
										<button class="btn button-custom" type="button">회원 정보
											조회</button>
									</a>
								</div>
							</li>
							<li>
								<div>
									<a href="../qna/list">
										<button class="btn button-custom" type="button">문의글
											답변</button>
									</a>
								</div>
							</li>
						</ul>
					</div>
					</div>
				</div>
			</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

	<script type="text/javascript">
		
	</script>

</body>
</html>
