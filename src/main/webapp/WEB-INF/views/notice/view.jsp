<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
<jsp:include page="/include/resource.jsp" />

<style type="text/css">
.notice-subinfo {
	font-size: 0.8rem;
}
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
							<h3>공지사항 조회</h3>
							<div class="card my-3">
								<div class="card-body">
									<div class="row mx-0">
										<form id="formNoticeEdit" class="form-horizontal" action="/notice/edit" method="post">
											<input type="hidden" id="notice_no" name="noticeno" value="${noticeVo.noticeno}"/>
										
											<input type="hidden" id="notice_edit_role" name="edit_role" value=""/>
										</form>
										<div class="col-sm-12 col-xs-12 mb-3">
											<H5 style="color: rgb(31, 30, 30)">${noticeVo.noticetitle}</H5>
											<strong class="notice-subinfo" style="color: rgb(31, 30, 30)">${noticeVo.noticewriter}</strong><br/>
											<small class="text-muted notice-subinfo">${fn:substring(noticeVo.noticewritetime, 0, 16)}</small>
										</div>
										<hr>
										<div class="col-sm-12 col-xs-12 mb-3">
											<% pageContext.setAttribute("newLineChar", "\n"); %>
											<p style="height: 500px; color: rgb(31, 30, 30)">
												${fn:replace(noticeVo.noticecontent, newLineChar, "<br>")}
											</p>
										</div>
										<div class="d-grid gap-2 d-md-flex justify-content-md-end">
											<c:set var="userrole" value="${loginVo.userrole}" />
											<c:if test="${userrole eq 0}">
												<button type="button" class="btn btn-outline-primary" onclick="$('#formNoticeEdit').submit();">수정</button>
												<button type="button" class="btn btn-outline-danger" onclick="editNotice('delete');">삭제</button>
											</c:if>
											<button type="button" class="btn btn-outline-secondary" onclick="location.href = ctxPath + '/notice/list';">글목록</button>
										</div>
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
function editNotice(role) {
	$('#notice_edit_role').val(role);
	
	if (confirm("정말 삭제하시겠습니까?")) {
		ajaxCall4Html(ctxPath + '/notice/editNoticeAjax', $("#formNoticeEdit").serialize(), function(data) {
			var rtn = JSON.parse(data);
//	 		console.log(rtn);
			
			if (rtn.result == 'YES') {
				alert(rtn.messages);
				location.href = ctxPath + '/notice/list';
			} else {
				alert("삭제에 실패했습니다. 확인 후 다시 이용해주세요");
			}
		});
	}
}
</script>

</body>
</html>
