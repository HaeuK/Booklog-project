<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>


<style type="text/css">
body {
	background-color: rgb(246, 245, 239);
	font-family: 'NanumSquareNeo';
}

.setmenu {
	margin-top: 30px;
	padding-top: 20px;
	justify-content: center;
}

.setmenu .card {
	padding: 10px;
	opacity: 0.9;
	margin: auto;
}

.card .list-group li a {
	color: black;
}

.card .list-group li a:hover {
	color: #ffe9cf;
}
</style>

<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
				style="text-align: center;">
			<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
				<div class="setmenu">
					<h3>설정</h3>
					<div class="card" style="width: 18rem;">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><a class="nav-link" id="EditButton">
									<i class="bi bi-credit-card-2-front"></i> 회원정보 수정
							</a></li>
							<form id="goToEdit" method="post" action="/user/beforeEdit">
					           <input type="hidden" >
					        </form>
							<li class="list-group-item"><a class="nav-link"
								href="/qna/list"> <i class="bi bi-patch-question"> </i> 문의
									게시판
							</a></li>
							<li class="list-group-item"><a class="nav-link" href="/user/userFirelogin">
									<i class="bi bi-emoji-frown"></i> 회원정보 탈퇴
							</a></li>
							<!-- <li class="list-group-item"> -->
							<c:set var="userrole" value="${loginVo.userrole}" />
							<c:if test="${userrole eq 0}">
								<li class="list-group-item"><a class="nav-link"
									href="/admin/main"> <i class="bi bi-person-workspace"></i>
										관리자 페이지
								</a></li>
							</c:if>

						</ul>
					</div>

				</div>

			</div>

			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		
		$('#EditButton').on("click",function(){

			 $( '#goToEdit' ).submit(); 
		});	

	})
	
	
	</script>

</body>
</html>