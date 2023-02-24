<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog chat</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<jsp:include page="/include/resource.jsp" />

<style type="text/css">
.btn-outline-primary {
	color: #005b47!important;
	border-color: #005b47!important;
}
.btn-outline-primary:hover {
	color: #fff!important;
	background-color: #005b47!important;
	border-color: #005b47!important;
</style>

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
					<div class="row m-3 justify-content-center">
						<div class="col-sm-10 col-xs-10 mt-5">
							<h3>토론</h3>
							<div class="card my-3">
								<div class="card-body">
									
									<div id="chatList" style="height: 100%; width: 100%;">
										<form action="/chat/chatRoom" method="post">
											<button type="submit" class="btn btn-outline-primary">토론하러 가기</button>
											<!-- <a href="chatRoom">토론하러 가기</a> -->
										</form>
									</div>

								</div>
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