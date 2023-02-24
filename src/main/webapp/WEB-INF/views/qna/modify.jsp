<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 작성</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<style>

	input:focus , select:focus, textarea:focus {
	 outline: 4px solid #CEECF5;
	}
	
	.row main {
		overflow:
	
	}
 	.contentBorder{
		margin-top: 15px;
		width: 100%;
		height: 100%;
		border: 0.5px solid #D8D8D8;
		border-radius: 7px;
	}
	
	#qnaForm{
		width: 100%;
		height: 100%;
		padding: 15px;
	}
	
	.titleDiv input{
		width: 100%;
		padding: 7px;
		margin-bottom: 10px;
		border: 0.5px solid #D8D8D8;
		border-radius: 7px;
	}
	
	
	#qnaCode{
		-o-appearance: none;
		width: 100%;
		padding: 7px;
		margin-bottom: 10px;
		border: 0.5px solid #D8D8D8;
		border-radius: 7px;
	}
	
	.qnaContentDiv textarea{
		width: 100%;
		height: 200px;
		padding: 7px;
		margin-bottom: 5px;
		border: 0.5px solid #D8D8D8;
		border-radius: 7px;
	}
	
	.publicCheckDiv{
		display: flex;
		
	}
	
	.publicCheck{
		foat: left;
	}
	.publicCheck{
		padding: 6px;
		padding-left: 10px;
		background-color:#ebe6e6;
		border: 0.5px solid #D8D8D8;
		border-radius: 7px 0 0 7px;
	}
	.passwordInput{
		foat: left;
	}
	.passwordInput input{
	   padding: 6px;
	   border: 0.5px solid #D8D8D8;
	   border-radius: 0 7px 7px 0;
	}
	
	.buttonDiv{
		text-align: center;
		padding-top: 35px;
		
	}
	
	.buttonDiv button{
		padding: 6px;
		margin-right:5px;
		margin-top: 10px;
		border: none;
		border-radius: 7px;
		transition: 0.3s ease-in-out;
	}
	
	
	.buttonDiv button:hover{
		background-color:#5D5D5D;
		color: white;
	}
	
	.buttonDiv button:first-child:hover{
		background-color:#6799FF;
		color: white;
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
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
					<div class="row m-3 justify-content-center">
						<div class="col-sm-10 col-xs-10 mt-5">
							<h3>문의사항 작성</h3>
								<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
									<div class="contentBorder">
										<form id="qnaForm" action="">
											<input type="hidden"  name="qnaNo" value="${qnaVo.qnaNo}"/>
											<div class="titleDiv">
												<input type="text" id="qnatitle" name="qnaTitle" placeholder="제목을 입력하세요" value="${qnaVo.qnaTitle}"> 
											</div>
											<div class="qnaCodeDiv">
												<select id="qnaCode" name="qnaCode" >
													<option value="">선택</option>
													<c:forEach var="qnaCode" items="${qnaCodeList}" varStatus="status">
														<option value="${qnaCode.code}" <c:if test="${qnaVo.qnaCode eq qnaCode.code}"> selected</c:if> >
															${qnaCode.code_desc}
														</option>
													</c:forEach>
												</select>
											</div>
											<div class="qnaContentDiv">
												<textarea row=20 id="qnacontent" name="qnaContent">${qnaVo.qnaContent}</textarea>
											</div>
											<div class="publicCheckDiv">
												<div class="publicCheck">
													<span>비밀글 선택</span>
													<c:choose>
														<c:when test="${qnaVo.qnaIsPublic eq 'false'}">
															<input type="checkbox" name="qnaIsPublic" checked="checked">
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="qnaIsPublic">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="passwordInput" >
													<input type="password" name="qnaPassword" placeholder="비밀번호입력" value=${qnaVo.qnaPassword}>
												</div>
											</div>
											<div class="buttonDiv">
												<button  id="modifyBtn" type="button" onclick="modifyQna();">수정완료</button>
												<button  id="quitBtn" type="button" onclick="location.href = ctxPath + '/qna/list';">취소</button>
											</div>
										</form>
								</div>
							</div>	
						</div>	
					</div>
			</main>
 			<%-- <jsp:include page="/include/footer.jsp"></jsp:include> --%> 
		</div>
	</div>
	
	<script>
	
	function modifyQna(){
		
		if(qnaValidation()){
			checkboxValChange();
			putQna();
		}
		
	}
	
	function qnaValidation(){
		if ($(".titleDiv input").val() == undefined || $(".titleDiv input").val() == "" ){
			alert("제목을 입력하세요");
			return false;
		}
		if ($('#qnaCode option:selected').val() == undefined || $('#qnaCode option:selected').val() == "" ){
			alert("QnA유형을 선택하세요");
			return false;
		}
		if ($(".qnaContentDiv textarea").val() == undefined || $(".qnaContentDiv textarea").val() =="" ){
			alert("문의 내용을 입력하세요");
			return false;
		}
		if ($('input:checkbox[name="qnaIsPublic"]').is(":checked")== true){
			if($('.passwordInput input').val() == undefined || $('.passwordInput input').val()=="" ){
				alert("비밀번호를 입력하세요");
				return false;
			}
		}
		return true;
	} 
	
	function checkboxValChange(){
		
		if($('input:checkbox[name="qnaIsPublic"]').is(":checked")== true){
			$('input:checkbox[name="qnaIsPublic"]').val('false');
			return;
		}
			$('input:checkbox[name="qnaIsPublic"]').val('true');	

	}
	
	function putQna(){
		ajaxCall4Html(ctxPath + '/qna/modifyAjax.do', $("#qnaForm").serialize(), function(data) {
			var retrn = JSON.parse(data);
	 		console.log(retrn);
			
			if (retrn.result == 'YES') {
				alert(retrn.messages);
				location.href = ctxPath + '/qna/list';
			} else {
				alert(retrn.messages);
			}
		});
		
	}
	
	</script>
</body>
</html>