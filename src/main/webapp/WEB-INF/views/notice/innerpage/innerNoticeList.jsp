<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>

<style>
.page-item.active .page-link{
	z-index: 1!important;
    color: #fff!important;
    background-color: #005b47!important;
    border-color: #005b47!important;
}
.page-link {
    position: relative;
    display: block;
    color: #005b47!important;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #dee2e6;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>

<script type="text/javascript">
var firstPageNoOnPageList = ${pagination.getFirstPageNoOnPageList()};
var lastPageNoOnPageList = ${pagination.getTotalPageCount() eq pagination.getLastPageNoOnPageList() ? pagination.getFirstPageNoOnPageList() + 9 : pagination.getLastPageNoOnPageList()};
var pageSize = ${pagination.getPageSize()};
var maximumPageNum = ${pagination.getTotalPageCount()};
var currentPage = ${pagination.getCurrentPageNo()};

function renderingPage(direction) {
	if (direction != null && direction != undefined && direction == 'minus') {
		firstPageNoOnPageList = firstPageNoOnPageList - pageSize;
		lastPageNoOnPageList = lastPageNoOnPageList - pageSize;

		$('#afterPage').removeClass('disabled');
		
		if (firstPageNoOnPageList == 1) {
			$('#beforePage').addClass('disabled');
		} else if (firstPageNoOnPageList > 1) {
			$('#beforePage').removeClass('disabled');
		}

		let varHtml = "";
		for (let i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
			varHtml += "<li class='page-item pageNum ";
			if (i == currentPage) {
				varHtml += "active";
			}
			varHtml += "'>";
			varHtml += "<a class='page-link' href='#' onclick='selectPage(\"" + i + "\");'>";
			varHtml += i + "</a>";
			varHtml += "</li>";
		}
		
		$('.pageNum').remove();
		
		$('#beforePage').after(varHtml);
	} else if (direction != null && direction != undefined && direction == 'plus') {
		firstPageNoOnPageList = firstPageNoOnPageList + pageSize;
		lastPageNoOnPageList = lastPageNoOnPageList + pageSize;

		$('#beforePage').removeClass('disabled');
		
		if (maximumPageNum > lastPageNoOnPageList) {
			$('#afterPage').removeClass('disabled');
			
			let varHtml = "";
			for (let i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
				varHtml += "<li class='page-item pageNum ";
				if (i == currentPage) {
					varHtml += "active";
				}
				varHtml += "'>";
				varHtml += "<a class='page-link' href='#' onclick='selectPage(\"" + i + "\");'>";
				varHtml += i + "</a>";
				varHtml += "</li>";
			}
			
			$('.pageNum').remove();
			
			$('#beforePage').after(varHtml);
		} else {
			$('#afterPage').addClass('disabled');
			
			let varHtml = "";
			for (let i = firstPageNoOnPageList; i <= maximumPageNum; i++) {
				varHtml += "<li class='page-item pageNum ";
				if (i == currentPage) {
					varHtml += "active";
				}
				varHtml += "'>";
				varHtml += "<a class='page-link' href='#' onclick='selectPage(\"" + i + "\");'>";
				varHtml += i + "</a>";
				varHtml += "</li>";
			}
			
			$('.pageNum').remove();
			
			$('#beforePage').after(varHtml);
		}
	}
}

function selectNotice(seq) {
	$('#notice_no').val(seq);
	
	$("#fromNoticeView").submit();
}
</script>

<form id="fromNoticeView" class="form-horizontal" action="/notice/view" method="post">
	<input type="hidden" id="notice_no" name="noticeno" value=""/>
</form>

<table class="table table-hover text-center">
	<thead>
		<tr>
			<th width="10%">번호</th>
			<th width="15%">분류</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="20%">날짜</th>
		</tr>
	</thead>
	<tbody class="btn-fn">
		<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
			<tr onclick="selectNotice('${noticeList.noticeno}');">
				<td>${noticeList.noticeno}</td>
				<td>${noticeList.noticecode}</td>
				<td>${noticeList.noticetitle}</td>
				<td>${noticeList.noticewriter}</td>
				<td>${fn:substring(noticeList.noticewritetime, 0, 16)}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<li id="beforePage" class="page-item <c:if test="${pagination.getCurrentPageNo() le pagination.getPageSize()}">disabled</c:if>">
			<a class="page-link" onclick="renderingPage('minus');"><i class="bi bi-chevron-left"></i></a>
		</li>
		<c:forEach var="idx" begin="${pagination.getFirstPageNoOnPageList()}" end="${pagination.getLastPageNoOnPageList()}" step="1">
			<li class="page-item pageNum <c:if test="${idx eq pagination.getCurrentPageNo()}">active</c:if>">
				<a class="page-link" href="#" onclick="selectPage('${idx}');">${idx}</a>
			</li>
		</c:forEach>
		<li id="afterPage" class="page-item <c:if test="${pagination.getTotalPageCount() le pagination.getLastPageNoOnPageList()}">disabled</c:if>">
			<a class="page-link" href="#" onclick="renderingPage('plus');"><i class="bi bi-chevron-right"></i></a>
		</li>
	</ul>
</nav>