<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/commonHead.jsp" %>

<%@ include file="/include/resource.jsp" %>
    
<script type="text/javascript">
$(document).ready(function () {
	
});

function logout() {
	$('#formLogout').submit();
}
</script>
<form id="formLogout" action="/logout" method="post"></form>

<header class="navbar navbar-dark sticky-top flex-md-nowrap p-0 shadow " style="background-color: #005B47; font-family: 'NanumSquareNeoBold'; ">
	<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 text-center" href="/">
		<!-- <i class="bi bi-book"></i> Booklog -->
		<img alt="logo" src="../resources/images/mainimg/logo1.png" style="width:170px; height:70px;">
	</a>
	<a class="nav-link px-2" href="/setmenu" style="color: white; font-size: 15px; ">
		<%@ page import="com.vos.web.MemberVo" %>
	<%
		session = request.getSession();
		Object obj = session.getAttribute("login");
		com.vos.web.MemberVo loginVo = null;
		if (obj != null && obj.getClass().getSimpleName().equals("MemberVo")) {
			loginVo = (com.vos.web.MemberVo) obj;
		}
	%>
	<%= loginVo.getUsernickname()%> 님 환영합니다</a>
	<div class="navbar-nav " ><!-- style="float: right;" -->
		<div class="nav-item text-nowrap" ><!-- 1.5rem -->
			<a class="nav-link px-3" href="#" onclick="logout();" style="color: white; font-size: 25px; margin-right: 10px;">
				 <i class="bi bi-door-open"></i>
			</a>
		</div>
	</div>
</header>