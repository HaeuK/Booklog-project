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
.post-subinfo {
   font-size: 0.8rem;
}

#rating input[type=radio]{
    display: none;
}

#rating img{
    height:30px;
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
				<div>
            <!-- <div style="overflow: auto; min-height: 1700px; max-height: 1700px;"> -->
               <div class="row m-3 justify-content-center">
                  <div class="col-sm-10 col-xs-10 mt-5">
                     <h3>포스트 조회</h3>
                     <div class="card my-3">
                        <div class="card-body">
                           <div class="row mx-0">
                              <form id="formPostEdit" class="form-horizontal" action="/post/edit" method="post">
                                 <input type="hidden" id="post_no" name="postno" value="${postVo.postno}"/>
                              
                                 <input type="hidden" id="post_edit_role" name="edit_role" value=""/>
                              </form>
                              
                              <%-- <div style="text-align: center;margin-top:20px; " >
                                 <h4 id="postwriter">${postVo.userno}님의 북로그 </h4>
                              </div> --%>
                              <div id="bookinfo">
                                 <img id="bookcoverimg" src="${postVo.bookcover}" alt="책표지" style="height:180px; margin: 10px; margin-bottom:30px;float: left;">
                                 <div id="bookinfo_text" style="padding: 10px 5px 5px 5px; height:200px; overflow: auto;">
                                    <h3>
                                       <b style="color: rgb(31, 30, 30)">${postVo.posttitle}</b>
                                       <%-- <b>책 제목: ${postVo.booktitle}</b> --%>
                                    </h3>
                                    <strong class="post-subinfo" style="color: rgb(31, 30, 30);font-size: 0.8em">작성자: ${postVo.userno}</strong>
                                    <small class="text-muted post-subinfo" style="margin-left:10px;">(${fn:substring(postVo.postwritedate, 0, 16)} 작성)</small><br>
                                    <br>
                                    <div style="display:inline-block; border:#e1e6ed; background-color:#edf0f2;padding:10px; border-radius: 3px"> 
                                       <strong class="post-subinfo" style="color: rgb(31, 30, 30)">·&nbsp;도서 정보</strong><br/>
                                       <strong class="post-subinfo" style="color: rgb(31, 30, 30)">제목: ${postVo.booktitle}</strong><br/>
                                       <strong class="post-subinfo" style="color: rgb(31, 30, 30)">작가: ${postVo.bookauthor}</strong><br/>
                                    </div>
                                    
                                 </div>
                              </div>
                              <hr>
                              <div class="col-sm-12 col-xs-12 mb-3">
                              <div>
                                   <h4 style="color: rgb(31, 30, 30)"><img id="icon" src="/resources/images/post/book4.png" alt="책아이콘" width="30px" style="vertical-align: top">평점</h4>
                                 </legend>
                                 <fieldset id="rating" style="margin-top: 20px;">
                                 <!-- <legend> 평가하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;<span id="rate_value"></span>&nbsp;/ 5 )</legend>  -->
                                    &nbsp;
                                    <label class="radio-inline" for="rate1" stylw="margin-left: 30px">
                                       <img id="rate_img1" src="/resources/images/post/zero.png" alt="평점1">
                                    </label>
                                    <input class=" " type="radio" name="rates" value="1" id="rate1">
                                    <label class="radio-inline" for="rate2">
                                       <img id="rate_img2" src="/resources/images/post/zero.png" alt="평점2">
                                    </label>
                                    <input class="" type="radio" name="rates" value="2" id="rate2">
                                    <label class="radio-inline" for="rate3">
                                       <img id="rate_img3" src="/resources/images/post/zero.png" alt="평점3">
                                    </label>
                                    <input class="" type="radio" name="rates" value="3" id="rate3">
                                    <label class="radio-inline" for="rate4">
                                       <img id="rate_img4" src="/resources/images/post/zero.png" alt="평점4">
                                    </label>
                                    <input class=" " type="radio" name="rates" value="4" id="rate4">
                                    <label class="radio-inline" for="rate5">
                                       <img id="rate_img5" src="/resources/images/post/zero.png" alt="평점5">
                                    </label>
                                    <input class="" type="radio" name="rates" value="5" id="rate5">
                                 </fieldset>
                                 <hr>
                              </div>
                              
                           
                        <h4 style="color: rgb(31, 30, 30)"><img id="icon" src="/resources/images/post/book5.png"
                           alt="책아이콘" width="30px" style="vertical-align: top">&nbsp;읽은 기간</h4>
                     <p style="margin-left: 30px; color: rgb(31, 30, 30)">${fn:substring(postVo.periodstart,0,10)} ~ ${fn:substring(postVo.periodfinish,0,10)}</p>
                     <hr>
                              <h4 style="color: rgb(31, 30, 30)"><img id="icon" src="/resources/images/post/book6.png" alt="감상" width="23px" style="vertical-align:center">&nbsp;감상</h4>
                                 <% pageContext.setAttribute("newLineChar", "\n"); %>
                                 <p style="min-height: 300px; color: rgb(31, 30, 30);margin-left: 30px;margin-right: 30px">
                                    ${fn:replace(postVo.postcontent1, newLineChar, "<br>")}
                                 </p>
                                 <hr>
                              <h4 style="color: rgb(31, 30, 30)"><img id="icon" src="/resources/images/post/book7.png" alt="인용" width="20px" style="vertical-align:center">&nbsp;인용구절</h4>
                                 <p style="min-height: 150px; color: rgb(31, 30, 30);margin-left: 30px;margin-left: 30px">
                                 <img id="icon" src="/resources/images/post/quote02.png" alt="인용" width="10px">&nbsp;&nbsp;
                                    ${fn:replace(postVo.postcontent2, newLineChar, "<br>")}&nbsp;&nbsp;
                                    <img id="icon" src="/resources/images/post/quote01.png" alt="인용" width="10px"><br>
                                    <p style="text-align:right !important; margin-right:50px; fontsize: 0.4em;float:bottom; color:rgb(31, 30, 30); ">
                                    (위치) ${postVo.postcontent2page} 페이지 
                                 </p>
                                 </p>
                                 <hr>
                              <h4 style="color: rgb(31, 30, 30)"><img id="icon" src="/resources/images/post/book8.png" alt="메모" width="20px" style="vertical-align:center">&nbsp;메모</h4>   
                                 <p style="min-height: 200px; color: rgb(31, 30, 30);margin-left: 30px;margin-left: 30px">
                                    ${fn:replace(postVo.postcontent3, newLineChar, "<br>")}
                                 </p>
                           
                              </div>
                              <hr>
                              <div class="d-grid gap-2 d-md-flex justify-content-md-end" id="forwriter" style="display: none">
                                <c:if test="${loginVo.userno eq postVo.bookcaseno}">
                                    <button type="button" class="btn btn-outline-primary" onclick="$('#formPostEdit').submit();">수정</button>
                                    <button type="button" class="btn btn-outline-danger" onclick="editPost('delete');">삭제</button>
                                    <button type="button" class="btn btn-outline-secondary" onclick="location.href = ctxPath + '/post/list';">글목록</button>
                                 </c:if>
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

$(document).ready(function() {
   var rate = ${postVo.rate};
   if (rate == 1) { rate1();} 
   else if (rate == 2) { rate2();} 
   else if (rate == 3) { rate3();} 
   else if (rate == 4) { rate4();} 
   else if (rate == 5) { rate5();}
});

function rate1(){
    $('#rate_img1').attr("src","/resources/images/post/plus.png");
    $('#rate_img2').attr("src","/resources/images/post/zero.png");
    $('#rate_img3').attr("src","/resources/images/post/zero.png");  
    $('#rate_img4').attr("src","/resources/images/post/zero.png");  
    $('#rate_img5').attr("src","/resources/images/post/zero.png");   
}

function rate2(){
    rate1();
    $('#rate_img2').attr("src","/resources/images/post/plus.png"); 
}

function rate3(){
    rate2();
    $('#rate_img3').attr("src","/resources/images/post/plus.png"); 
}

function rate3(){
    rate2();
    $('#rate_img3').attr("src","/resources/images/post/plus.png"); 
}

function rate4(){
    rate3();
    $('#rate_img4').attr("src","/resources/images/post/plus.png"); 
}

function rate5(){
    rate4();
    $('#rate_img5').attr("src","/resources/images/post/plus.png"); 
}


function editPost(role) {
   $('#post_edit_role').val(role);
   
   if (confirm("정말 삭제하시겠습니까?")) {
      ajaxCall4Html(ctxPath + '/post/editPostAjax', $("#formPostEdit").serialize(), function(data) {
         var rtn = JSON.parse(data);
//          console.log(rtn);
         
         if (rtn.result == 'YES') {
            alert(rtn.messages);
            location.href = ctxPath + '/post/list';
         } else {
            alert("삭제에 실패했습니다. 확인 후 다시 이용해주세요");
         }
      });
   }
}
</script>


</body>
</html>
