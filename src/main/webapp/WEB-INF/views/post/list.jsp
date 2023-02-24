<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog postList</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
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
					<div class="row m-3 justify-content-center">
						<div class="col-sm-10 col-xs-10 mt-5">
							<h3>책장</h3>
							<div class="card my-3">
								<div class="card-body">
									<form id="formPostList" class="form-horizontal" action="">
										<input type="hidden" id="post_list_pagingEnable" name="pagingEnable" value="${paginationVo.pagingEnable}"/>
										<input type="hidden" id="post_list_pageIndex" name="pageIndex" value="${paginationVo.pageIndex}"/>
										<input type="hidden" id="post_list_pageSize" name="pageSize" value="${paginationVo.pageSize}"/>
										<input type="hidden" id="post_list_recordCountPerPage" name="recordCountPerPage" value="${paginationVo.recordCountPerPage}"/>
										
										<input type="hidden" id="post_list_condOrder" name="condOrder" value="${paginationVo.condOrder}"/>
										<input type="hidden" id="post_list_condAlign" name="condAlign" value="${paginationVo.condAlign}"/>
										
										<input type="hidden" id="post_list_userno" name="userno" value="${paginationVo.userno}"/>
									</form>
									<div id="postListLoader" style="height: 100%; width: 100%;">
										<jsp:include page="/WEB-INF/views/post/innerpage/innerPostList.jsp"></jsp:include>
									</div>
								</div>
							</div>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<!-- 								<button type="button" id="btn_writePost" class="btn btn-sm btn-secondary" onclick="writePost();">글쓰기</button> -->
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">
function selectPage(page) {
	$('#post_list_pageIndex').val(page);
	
	$('#postListLoader').ajaxload(
		'blockLoad',
		ctxPath+'/post/innerpage/innerPostList',
		"POST",
		"html",
		$("#formPostList").serialize()
	);
}

// function writePost() {
// 	location.href = ctxPath + "/post/edit";
// }

</script>

</body>
</html>
