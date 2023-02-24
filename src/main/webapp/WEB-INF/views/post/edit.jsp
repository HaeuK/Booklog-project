<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<jsp:include page="/include/resource.jsp" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-brush.css" rel="stylesheet">

<style>

[type="radio"] {
  vertical-align: middle;
  border:none !important;
}

[type="radio"] {
  vertical-align: middle;
  border:none !important;
}

#post_form fieldset{
    display: inline-block; 
    border:0;
}
#rating input[type=radio]{
    display: none;
}

#rating img{
    height:30px;
}

#titlecount, #textcount1, #textcount2, #textcount3{
   border:none;
   color:#BEB5B1;
   text-align:right;
   
}

.textcount{
   font-size: 0.5em;
   color:#BEB5B1;
   float:right;
   margin-top:20px;
   vertical-align: bottom;
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
               <div class="row m-3 justify-content-center">
                  <div class="col-sm-10 col-xs-10 mt-5">
                     <h3>포스트 작성</h3>
                     <div class="card my-3">
                        <div class="card-body">
                           <form id="formPost" class="form-horizontal" action="">
                              <input type="hidden" id="post_no" name="postno" value="${postVo.postno}"/>
                              <input type="hidden" id="post_writer" name="userno" value="${loginVo.userno}"/>
                              
                              <input type="hidden" id="post_edit_role" name="edit_role" value=""/>
                              
                              <div class="card" id="bookinfo" style="border:#e1e6ed; background-color:#edf0f2;padding:10px; border-radius: 3px; opacity:1; ">
                                 <div><img id="bookcoverimg" src="${postVo.bookcover}" alt="책표지" style="height:180px; margin: 10px;float: left;">
                                 <div id="bookinfo_text" style="padding: 10px 5px 5px 5px; height:180px;display: inline-block;">
                                      <h5>
                                       <b style="color: rgb(31, 30, 30)">${postVo.booktitle}</b>
                                    </h5>
                                    <h6 style="color: rgb(31, 30, 30)">${postVo.bookauthor}</h6>
                                 </div>
                                 
                                   
                                    <input type="hidden" id="post_key" name="postkey" value="${postVo.postkey}"/>
                                    <input type="hidden" id="bookcase_no" name="bookcaseno" value="${loginVo.userno}"/>
                                    <input type="hidden" id="isbn" name="isbn" value="${postVo.isbn}"/>
                                    <input type="hidden" id="book_title" name="booktitle" value="${postVo.booktitle}"/>
                                    <input type="hidden" id="book_author" name="bookauthor" value="${postVo.bookauthor}"/>
                                    <input type="hidden" id="book_cover" name="bookcover" value="${postVo.bookcover}"/>
                                    <input type="hidden" id="book_content" name="bookcontent" value="${postVo.bookcontent}"/>
                                 </div>
                              </div>
                              <div>
                              <fieldset id="rating"
                                 style="margin-top: 20px;">
                                 <!-- <legend> 평가하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;<span id="rate_value"></span>&nbsp;/ 5 )</legend>  -->
                                 <legend style="color: rgb(31, 30, 30)">&nbsp;&nbsp;
                                 <span
                                       style="font-size: 0.7em; margin-left: 20px; margin-right: 10px; color: rgb(31, 30, 30)">◈</span>평점
                                 </legend>
                                 &nbsp; <label style="margin-left: 20px" class="radio-inline"
                                    for="rate1" onclick="rate1();"> <img id="rate_img1"
                                    src="/resources/images/post/zero.png" alt="평점1">
                                 </label> <input class=" " type="radio" name="rates" value="1"
                                    id="rate1"> <label class="radio-inline" for="rate2"
                                    onclick="rate2();"> <img id="rate_img2"
                                    src="/resources/images/post/zero.png" alt="평점2">
                                 </label> <input class="" type="radio" name="rates" value="2"
                                    id="rate2"> <label class="radio-inline" for="rate3"
                                    onclick="rate3();"> <img id="rate_img3"
                                    src="/resources/images/post/zero.png" alt="평점3">
                                 </label> <input class="" type="radio" name="rates" value="3"
                                    id="rate3"> <label class="radio-inline" for="rate4"
                                    onclick="rate4();"> <img id="rate_img4"
                                    src="/resources/images/post/zero.png" alt="평점4">
                                 </label> <input class=" " type="radio" name="rates" value="4"
                                    id="rate4"> <label class="radio-inline" for="rate5"
                                    onclick="rate5();"> <img id="rate_img5"
                                    src="/resources/images/post/zero.png" alt="평점5">
                                 </label> <input class="" type="radio" name="rates" value="5"
                                    id="rate5">
                                    <input type="hidden" id="rate_input" name="rate" value="${postVo.rate}">
                                    <input type="hidden" id="rate_value" name="rate_value" value="${postVo.rate}">
                              </fieldset>
                           </div>

                              <!-- 독서 기간 설정 -->
                              <div style="margin-top: 20px">
                                 <fieldset id="period">
                                 <legend style="color: rgb(31, 30, 30)"> &nbsp;&nbsp;
                                     <span
                                       style="font-size: 0.7em; margin-left: 20px; margin-right: 10px">◈</span>읽은 기간
                                    </legend>
                                    <span style="color: rgb(31, 30, 30)">
                                    <input type="date" class="date-inline" placeholder="date input" name="periodstart" id="periodstart" style="margin: 10px">부터
                                    <input type="date" class="date-inline" placeholder="date input" name="periodfinish" id="periodfinish" style="margin: 10px">까지
                                    </span>
                                 </fieldset>
                              </div>
                               <div class="row mx-0">
                              <div class="col-sm-12 col-xs-12">
                                 <legend style="color: rgb(31, 30, 30)">
                                    <span
                                       style="font-size: 0.7em; margin-left: 20px; margin-right: 10px">◈</span>제목
                                       <span class="textcount"><input class="input-sm"
                                       type=number id="titlecount" value="0" size="2"
                                       style="margin: 0; padding: 0; width: 35px;"
                                       readonly>/30&nbsp;&nbsp;</span>
                                 </legend>
                                 <input type="text" class="form-control mb-3"
                                    placeholder="제목을 입력해 주세요." id="post_title" name="posttitle" maxlength="30"
                                    value="${postVo.posttitle}" onkeydown="calc();" onkeyup="calc();"
                                         onkeypress="calc();"/>
                              </div>
                              <div class="col-sm-12 col-xs-12 mb-3" style="margin-top: 10px">
                                 <legend style="color: rgb(31, 30, 30)">
                                    <span
                                       style="font-size: 0.7em; margin-left: 20px; margin-right: 10px">◈</span>감상

                                    <span class="textcount"><input class="input-sm"
                                       type=number id="textcount1" value="0" size="1"
                                       style="margin: 0; padding: 0; width: 50px;" readonly></span>
                                 </legend>

                                 <textarea rows="10" class="form-control"
                                    placeholder="감상을 입력하세요." id="post_content1"
                                    name="postcontent1"
                                    onkeydown="calc();" onkeyup="calc();"
                                         onkeypress="calc();">${postVo.postcontent1}</textarea>
                              </div>
                              <div class="col-sm-12 col-xs-12 mb-3" style="margin-top: 10px">
                                 <legend style="color: rgb(31, 30, 30)">
                                    <span
                                       style="font-size: 0.7em; margin-left: 20px; margin-right: 10px">◈</span>인용구절
                                    <span class="textcount"><input class="input-sm"
                                       type=number id="textcount2" value="0" size="2"
                                       style="margin: 0; padding: 0; width: 50px;" readonly>/1000&nbsp;&nbsp;</span>
                                 </legend>

                                 <textarea  rows="5" class="form-control"
                                    placeholder="인용을 입력하세요." id="post_content2"
                                    name="postcontent2"
                                    onkeydown="calc();" onkeyup="calc();"
                                         onkeypress="calc();">${postVo.postcontent2}</textarea>
                              </div>
                              <div>
                                 <span style="float:right; margin-right:10px;float: right; color: rgb(31, 30, 30)">(위치) 
                                 &nbsp;<input
                                    type="text" class="sm" name="postcontent2page"
                                    id="postcontent2page" size="2" maxlength="4"
                                    value="${postVo.postcontent2page}"
                                    >&nbsp;쪽</span>
                              </div>
                              <div class="col-sm-12 col-xs-12 mb-3" style="margin-top: 10px">
                                 <legend style="color: rgb(31, 30, 30)">
                                    <span
                                       style="font-size: 0.7em; margin-left: 20px; margin-right: 10px">◈</span>메모
                                    <span class="textcount"><input class="input-sm"
                                       type=number id="textcount3" value="0" size="2"
                                       style="margin: 0; padding: 0; width: 50px;"
                                       readonly>/2000&nbsp;&nbsp;</span>
                                 </legend>
                                 <textarea rows="7" class="form-control"
                                    placeholder="메모를 입력하세요." id="post_content3"
                                    name="postcontent3"
                                    onkeydown="calc();" onkeyup="calc();"
                                         onkeypress="calc();" >${postVo.postcontent3}</textarea>
                              </div>
                              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                 <button id="registBtn" type="button"
                                    class="btn btn-outline-primary"
                                    onclick="registPost('insert');">등록</button>
                                 <button type="button" class="btn btn-outline-secondary" 
                                    onclick="location.href = ctxPath + '/post/list';">취소</button>
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
   
   var rate = $('#rate_value').val();
      $(document).ready(function() {     
            if (rate == 1) { rate1();} 
            else if (rate == 2) { rate2();} 
            else if (rate == 3) { rate3();} 
            else if (rate == 4) { rate4();} 
            else if (rate == 5) { rate5();}
         });

$(document).ready(function() {
   if (${postVo.postno ne null and postVo.postno != ""}) {
      $('#registBtn').attr("onclick", "registPost('update');");
   }
});

$(document).ready(function() {
    $('#periodstart').attr("value","${fn:substring(postVo.periodstart,0,10)}");
    $('#periodfinish').attr("value","${fn:substring(postVo.periodfinish,0,10)}");
});

$(document).ready(function() {     
	calc();
 });

function editPost(role) {
   $('#post_edit_role').val(role);

   ajaxCall4Html(ctxPath + '/post/editPostAjax', $("#formPost").serialize(), function(data) {
      var rtn = JSON.parse(data);
//       console.log(rtn);
      
      if (rtn.result == 'YES') {
         alert(rtn.messages);
         location.href = ctxPath + '/post/list';
      } else {
         alert("데이터 입력에 실패했습니다. 확인 후 다시 이용해주세요");
      }
   });
}

function registPost(role) {
   if (registValidation()) {
      editPost(role);
   }
}

function registValidation() {
   if ($('#post_title').val() == undefined || $('#post_title').val() == "") {
      alert("제목을 입력해주세요.");
      return false;
   }

   if ($('#post_content1').val() == undefined || $('#post_content1').val() == "") {
      alert("내용을 입력해주세요.");
      return false;
   }
   
   return true;
}

function calc(){
   var title = $("#post_title").val();
   var content1 = $("#post_content1").val();
   var content2 = $("#post_content2").val();
   var content3 = $("#post_content3").val();
  
   $("#titlecount").attr("value", title.length);
   $("#textcount1").attr("value", content1.length);
   $("#textcount2").attr("value", content2.length);
   $("#textcount3").attr("value", content3.length);
}

function rate1(){
    $('#rate_img1').attr("src","/resources/images/post/plus.png");
    $('#rate_img2').attr("src","/resources/images/post/zero.png");
    $('#rate_img3').attr("src","/resources/images/post/zero.png");  
    $('#rate_img4').attr("src","/resources/images/post/zero.png");  
    $('#rate_img5').attr("src","/resources/images/post/zero.png");   
    $('#rate_input').attr("value","1");
}

function rate2(){
    rate1();
    $('#rate_img2').attr("src","/resources/images/post/plus.png"); 
    $('#rate_input').attr("value","2");
}

function rate3(){
    rate2();
    $('#rate_img3').attr("src","/resources/images/post/plus.png"); 
    $('#rate_input').attr("value","3");
}

function rate4(){
    rate3();
    $('#rate_img4').attr("src","/resources/images/post/plus.png"); 
    $('#rate_input').attr("value","4");
}

function rate5(){
    rate4();
    $('#rate_img5').attr("src","/resources/images/post/plus.png"); 
    $('#rate_input').attr("value","5");
}

</script>

</body>
</html>