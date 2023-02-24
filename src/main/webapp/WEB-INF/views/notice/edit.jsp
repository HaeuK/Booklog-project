<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog noticeEdit</title>
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
							<h3>공지사항 작성</h3>
							<div class="card my-3">
								<div class="card-body">
									<form id="formNotice" class="form-horizontal" action="">
										<input type="hidden" id="notice_no" name="noticeno" value="${noticeVo.noticeno}"/>
										<input type="hidden" id="notice_writer" name="noticewriter" value="${loginVo.userno}"/>
										
										<input type="hidden" id="notice_edit_role" name="edit_role" value=""/>
										
										<div class="row mx-0">
											<div class="col-sm-12 col-xs-12">
												<input type="text" class="form-control mb-3" placeholder="제목을 입력해 주세요." id="notice_title" name="noticetitle" value="${noticeVo.noticetitle}"/>
											</div>
											<div class="col-sm-12 col-xs-12">
												<select class="form-control mb-3" id="notice_code" name="noticecode">
													<option value="">선택</option>
													<c:forEach var="noticeCodeList" items="${noticeCodeList}" varStatus="status">
														<option value="${noticeCodeList.code}"
															<c:if test="${noticeCodeList.code eq noticeVo.noticecode}">selected="selected"</c:if>>${noticeCodeList.code_desc}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-sm-12 col-xs-12 mb-3">
												<textarea rows="20" class="form-control" placeholder="내용을 입력하세요." id="notice_content" name="noticecontent">${noticeVo.noticecontent}</textarea>
											</div>
											<div class="d-grid gap-2 d-md-flex justify-content-md-end">
												<button id="registBtn" type="button" class="btn btn-outline-primary" onclick="registNotice('insert');">등록</button>
												<button type="button" class="btn btn-outline-secondary" onclick="location.href = ctxPath + '/notice/list';">취소</button>
											</div>
										</div>
									</form>
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

$(document).ready(function() {
	if (${noticeVo.noticeno ne null and noticeVo.noticeno != ""}) {
		$('#registBtn').attr("onclick", "registNotice('update');");
	}
});

function editNotice(role) {
	$('#notice_edit_role').val(role);

	ajaxCall4Html(ctxPath + '/notice/editNoticeAjax', $("#formNotice").serialize(), function(data) {
		var rtn = JSON.parse(data);
// 		console.log(rtn);
		
		if (rtn.result == 'YES') {
			alert(rtn.messages);
			location.href = ctxPath + '/notice/list';
		} else {
			alert("데이터 입력에 실패했습니다. 확인 후 다시 이용해주세요");
		}
	});
}

function registNotice(role) {
	if (registValidation()) {
		editNotice(role);
	}
}

function registValidation() {
	if ($('#notice_title').val() == undefined || $('#notice_title').val() == "") {
		alert("제목을 입력해주세요.");
		return false;
	}

	if ($('#notice_code').val() == undefined || $('#notice_code').val() == "") {
		alert("공지 유형을 선택해주세요.");
		return false;
	}

	if ($('#notice_content').val() == undefined || $('#notice_content').val() == "") {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	return true;
}
</script>

</body>
</html>
