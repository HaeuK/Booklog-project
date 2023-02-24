<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog qnaList</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<style>
	.tableWrapper{
		width: 100%;
		border: 0.5px solid #D8D8D8;
		border-radius: 7px;
		padding: 13px 13px 0 13px;
		margin-top: 20px;
	}
	.qnaListTable{
		width: 100%;
	}
	
	table tbody tr {
      height: 40px;
     }
	thead tr{
		border-bottom: 0.7px solid black;
		font-size: 0.9em;
		text-align: center;
		line-height: 40px;
	}
	tbody tr{
		text-align: center;
		border-bottom: 0.5px solid #D8D8D8;
	    transition: 0.25s ease-in-out;
	    cursor: pointer;
	    font-size:0.8em;
	}
	tbody tr:hover{
		background-color: #EAEAEA;
	}
	
	.ReplyCount{
	font-size: 0.8em;
	color: gray;
	}
	
	.pageInfoWrap{
	   margin: 0 auto;
	}
	
	.pageInfoArea{
	/* 	padding-top: 5px; */
	 /* 	margin-left: -160px;  */
	}
	
	.pageInfoArea ul {
    list-style: none;
    width: 100%;
    height: 100%;
    text-align : center;
    padding-top: 15px;
    padding-right: 100px;
    }
    
    .activel {
     background-color:	#005B47;
    }
    
    .pageInfoWrap li {
    display: inline;
    padding: 2px 5px 2px 5px;
    border-radius: 5px;
    transition: 0.3s ease;
    }
    
    .pageInfoWrap li:not(.activel) :hover {
    font-weight: bold;
    }
    
	.pageInfoWrap li a{
	text-decoration: none;
	font-size: 1em;
	color: black;
	font-weight: 1.5em;
	}
	
	.buttonWrapper {
		margin-top: 15px;
		
	}
	
	.buttonWrapper button{
		float: right;
		border: none;
		border-radius: 3px;
		padding:5px;
		background-color: #BDBDBD;
		transition: 0.25s ease-in-out;
		font-size: 0.9em;
	}
	
	.buttonWrapper button:hover {
	    background-color: #D8D8D8;
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
				<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
					<div class="row m-3 justify-content-center">
						<div class="col-sm-10 col-xs-10 mt-5">
							<h3>문의 게시판</h3>
								<div class="tableWrapper">
									<table class="qnaListTable">
										<thead>
											<tr>
												<th width="10%">번호</th>
												<th width="15%">분류</th>
												<th width="*">제목</th>
												<th width="15%">작성자</th>
												<th width="20%">날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="qnalist" items="${qnaList}">
												<tr onclick="selectQna('${qnalist.qnaNo}');">
													<td>${qnalist.qnaNo}</td>
													<td>${qnalist.qnaCode}</td>
													<td>${qnalist.qnaTitle} <span class="ReplyCount">[${qnalist.qnaReplyCount}]</span>
													<c:if test="${qnalist.qnaIsPublic eq 'false'}">
													<img src="/resources/images/qna/lock.png" width="10px">
													</c:if>
													</td>
													<td>${qnalist.qnaWriterNickname}</td>
													<td>${fn:substring(qnalist.qnaWriteTime,0,16)}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="pageInfoWrap">
										<div class="pageInfoArea">
											<ul>
											<!-- 이전페이지 버튼 -->
											<c:if test="${pageMaker.prev}">
												<li class="pageInfoBtnPrevious"><a href="${pageMaker.startPage-1}">Prev</a></li>
											</c:if>
											<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
												<li class="pageInfoBtn ${pageMaker.cri.pageNum == num ? "activel":""}" ><a href="/qna/list?pageNum=${num}&amount=10" style="color: gray;">${num}</a></li>
											</c:forEach>
											<c:if test="${pageMaker.next}">
												<li class="pageInfoBtnNext"><a href="${pageMaker.endPage+1}">Previus</a></li>
											</c:if>
										    </ul>
										</div>
									</div>
									<form id="moveForm" method="get" action="/qna/list">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
										<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
									</form>
								</div>
							<div class="buttonWrapper">
								<button type="button" onclick="writeQna();">글쓰기</button>
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">
    
    


	function selectQna(qnaNo){
	
	location.href= ctxPath + "/qna/view?qnaNo="+qnaNo;
	}

   function writeQna() {
	location.href = ctxPath + "/qna/enroll";
    } 

function selectPage(page) {
	$('#notice_list_pageIndex').val(page);
	
	$('#noticeListLoader').ajaxload(
		'blockLoad',
		ctxPath+'/notice/innerpage/innerNoticeList',
		"POST",
		"html",
		$("#formNoticeList").serialize()
	); 
}

</script>

</body>
</html>
