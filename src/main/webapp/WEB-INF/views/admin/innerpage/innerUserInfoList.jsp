<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp"%>



<table class="table text-center"
	style="table-layout: fixed;">
	<thead style="border-bottom: 1px solid black">
		<tr>
			<th width="10%">회원번호</th>
			<th width="8%">분류</th>
			<th width="8%">닉네임</th>
			<th width="15%">아이디</th>
			<th width="12%">비밀번호</th>
			<th width="18%">이메일</th>
			<th width="18%">가입일</th>
			<th width="*%"></th>
		<tr>
	</thead>

	<!-- 유저 정보 -->
	<tbody class="memberList">

		<c:forEach begin="0" end="9" var="memberlist" items="${memberList}">
			<tr >
				<td>${memberlist.userno}</td>
				<td><c:if test="${memberlist.userrole eq '0'}">관리자</c:if> 
					<c:if test="${memberlist.userrole eq '1'}">회원</c:if></td>
				<td>${memberlist.usernickname}</td>
				<td>${memberlist.userid}</td>
				<td>${memberlist.userpassword}</td>
				<td>${memberlist.useremail}</td>
				<td>${fn:substring(memberlist.userregisterdate, 0, 10)}</td>
				<td><button class="btn" onClick="submit(this.id);" id="${memberlist.userno}"></button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
					<form name="infoList" class="form-horizontal" method="post"
						action="userEdit" id="memberForm">
						<input type="hidden" id="infoList" name="userno">
					</form>
					
		<script>
				
			function submit(id) {
				
				$("#infoList").attr("value", id);
				$("#memberForm").submit();
				
			}
		
		</script>

<div class="wrap">
	<!-- 페이지네이션 -->
	<div class="pagenation pagination"></div>

</div>