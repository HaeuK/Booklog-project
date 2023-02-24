<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<meta
   content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
   name='viewport'>
<link
   href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
   rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/admin/admin.css">

<jsp:include page="/include/resource.jsp" />

</head>
<body>
   <jsp:include page="/include/header.jsp"></jsp:include>

   <div></div>

   <div class="container-fluid">
      <div class="row">
         <jsp:include page="/include/sidebar.jsp"></jsp:include>
         <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
         <div>
            <div class="row m-3 justify-content-center">
               <div class="col-sm-10 col-xs-10 mt-5">
                  <h3>
                     <span> <b>${memberInfo.usernickname}</b>님의
                     </span> 회원정보 수정
                  </h3>
                  <div class="card my-3">
                     <div class="card-body">

                        <form action="userList" class="form-horizontal"
                           style="padding: 20px" name="update" id="update" method="post">

                           <div class="form-group row">
                              <label class="contral-label col-sm-2">회원번호</label>
                              <div class="col-sm-5">
                                 <input type="text" class="form-control input-width"
                                    name="userno" readonly value="${memberInfo.userno}">
                              </div>
                           </div>

                           <br>

                           <div class="form-group row">
                              <label class="contral-label col-sm-2">권한</label>
                              <div class="col-sm-5">
                                 <label for="admin"> <input type="radio"
                                    name="userrole" value='0' id="admin"
                                    <c:if test ="${memberInfo.userrole eq '0'}">checked="checked"</c:if> />
                                    <span>관리자</span>
                                 </label> &nbsp;&nbsp;&nbsp; <label for="member"> <input
                                    type="radio" name="userrole" value='1' id="member"
                                    <c:if test ="${memberInfo.userrole eq '1'}">checked="checked"</c:if> />
                                    
                                    회원
                                 </label>
                              </div>
                           </div>

                           <br>

                           <div class="form-group row">
                              <label class="contral-label col-sm-2">아이디</label>
                              <div class="col-sm-5">
                                 <input type="text" class="form-control" name="userid"
                                    value="${memberInfo.userid}">
                              </div>
                           </div>

                           <br>

                           <div class="form-group row">
                              <label class="contral-label col-sm-2">비밀번호</label>
                              <div class="col-sm-5">
                                 <input type="text" class="form-control" name="userpassword"
                                    value="${memberInfo.userpassword}">
                              </div>
                           </div>

                           <br>

                           <div class="form-group row">
                              <label class="contral-label col-sm-2">별명</label>
                              <div class="col-sm-5">
                                 <input type="text" class="form-control" name="usernickname"
                                    value="${memberInfo.usernickname}">
                              </div>
                           </div>

                           <br>

                           <div class="form-group row">
                              <label class="control-lable col-sm-2">이메일</label>
                              <div class="col-sm-5">
                                 <input type="text" name="useremail" class="form-control"
                                    maxlength="320" value="${memberInfo.useremail}">
                              </div>
                           </div>

                           <br>

                           <div class="form-group row">

                              <label for="update"> <input
                                 class="btn col-sm-4 btn-submit" type="submit" style="width:40%"
                                 onclick="updateInfo();" value="수정하기">
                              </label>
                               <label> <input class="btn btn-secondary col-sm-4"
                                 style="width:40%" onclick="backpage();" value="뒤로가기">
                              </label>
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
      function backpage() {
         if (confirm("회원정보 수정을 취소하시겠습니까?")) {
            location.href = "userList";
         }
      }

      function updateInfo() {
         alert("회원정보를 수정하였습니다.");
      }
   </script>


</body>
</html>