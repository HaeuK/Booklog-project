<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>
    
<script type="text/javascript">
$(document).ready(function () {
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".nav-item > a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    }); 
});
</script>

<style type="text/css">

.sidebar {
	background-color: #BEB6B1;
	font-family: 'NanumSquareNeoBold'; 
 	background-image: url('../resources/images/mainimg/leaf2.png');

}

.sidebar .nav-link {
	font-weight : 500;
	color: #fff;
}

.nav-item a:visited {
	color:white;
}

.nav-item a:hover{
	color:#ffe9cf;
}
</style>

<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block text-white sidebar collapse">
	<div class="position-sticky pt-3 sidebar-sticky" >
		<ul class="nav flex-column" style="background-color: #005B47">
			<li class="nav-item">
				<a class="nav-link" data-bs-toggle="collapse" href="/">
				<i class="bi bi-book-half"></i>
				내 서재
				</a>
				<ul class="nav flex-column collapse" style="background-color: #005B47; font-size:15px; padding-left: 15px ">
					<li class="nav-item ">
						<a class="nav-link" href="/post/list" >
						<i class="bi bi-folder2-open"></i>
						 책장
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/post/bookSearch">
						<i class="bi bi-pencil-square"></i>
						 작성하기
						</a>
					</li>
				</ul>
				
			</li>
			<li class="nav-item"> <!-- ../WEB-INF/views/search/bookSearch.jsp -->
				<a class="nav-link" href="/search/bookSearch">
				<i class="bi bi-search"></i>
				검색
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/chat/chat">
				<i class="bi bi-chat-dots"></i>
				토론
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/notice/list">
				<i class="bi bi-clipboard-check"></i>
				공지사항
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/setmenu">
				<i class="bi bi-gear"></i>
				설정
				</a>
			</li>
		</ul>
	</div>
</nav>