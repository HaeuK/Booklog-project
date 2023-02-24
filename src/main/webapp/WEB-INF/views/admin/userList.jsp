<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 리스트</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/admin/admin.css">
<style>
table, th, td {
	font-size: 14px;
}
</style>
<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	
	<div>
		<c:set var="userrole" value="${loginVo.userrole}" />
		<c:if test="${userrole eq 1}">
			<script>
				alert("관리자 권한 없음");
				location.href = "/home";
			</script>
		</c:if>
	</div>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div style="min-height:1000px">
				<div class="row m-3 justify-content-center">
					<div class="col-sm-10 col-xs-10 mt-5">
						<h3>회원 정보</h3>
						<div class="card my-3">
							<div class="card-body">

								<jsp:include page="innerpage/innerUserInfoList.jsp"></jsp:include>

							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

	<script>
	
	var arr = new Array();
	
	
	<c:forEach items="${memberList}" var="list">
	   arr.push({
	      userno: "${list.userno}",
	      userrole: "${list.userrole}",
	      usernickname: "${list.usernickname}",
	      userid: "${list.userid}",
	      userpassword: "${list.userpassword}",
	      useremail: "${list.useremail}",
	      userregisterdate: "${fn:substring(list.userregisterdate, 0, 10)}" 
	      
	   });
	</c:forEach>
	
	let totalData = '${fn:length(memberList)}'; //총 데이터 개수
	const limit = 10; //최대 데이터
	let totalPage = Math.ceil(totalData / limit); //총 페이지수
	let currentPage = 1; //현재 페이지

	const numbers = document.querySelector('.pagenation');
	

 
	function makePagenation(totalPage){
	   for(let i=1; i<=totalPage; i++){
	      let button = document.createElement("button");
	      button.innerHTML = i;
	      button.setAttribute('onClick','makeList()');
	      numbers.appendChild(button);
	   }
	}


	let memberList = document.querySelector('.memberList');


	function makeList(){
		
	   memberList.innerText = ''; //원래 안에 있던거 지움   
	   currentPage = event.target.textContent*1; //String 숫자로 바꾸려고 1곱해서 자동형변환함
	   let lastNumber = currentPage*limit-1; //현재 페이지의 첫번째 숫자
	   let firstNumber = (currentPage-1)*limit; //현재 페이지의 마지막 숫자

	   
	   for(let i=firstNumber; i<=lastNumber; i++){
	      if(i>totalData){
	         return;
	      }    
	      
	      //tr
	      let tr = document.createElement("tr");
	      tr.className = "member";
	      
	      
	      let userNumber = document.createElement("td");
	      userNumber.className="userNumber";
	      userNumber.innerHTML = arr[i].userno;
	      
	      let userRole = document.createElement("td");
	      userRole.className="userRole";
	      if(arr[i].userrole ==0){
	    	  userRole.innerHTML = "관리자";
	      }else{
	    	  userRole.innerHTML = "회원";
	      }
	      
	      let userNickname = document.createElement("td");
	      userNickname.className="userNickname";
	      userNickname.innerHTML = arr[i].usernickname;
	      
	      let userId = document.createElement("td");
	      userId.className="userId";
	      userId.innerHTML = arr[i].userid;
	      
	      let userPassword = document.createElement("td");
	      userPassword.className="userPassword";
	      userPassword.innerHTML = arr[i].userpassword;
	      
	      let userEmail = document.createElement("td");
	      userEmail.className="userEmail";
	      userEmail.innerHTML = arr[i].useremail;
	      
	      let userRegisterdate = document.createElement("td");
	      userRegisterdate.className="userRegisterdate";
	      userRegisterdate.innerHTML = arr[i].userregisterdate;
	      
	      let editButton = document.createElement("td");
	      editButton.className="editButton";
		  editButton.innerHTML = "<button class='btn page-link' onClick='submit(this.id);' id='"+arr[i].userno+"'></button>";
	      

	      tr.append(userNumber, userRole, userNickname, userId, userPassword, userEmail, userRegisterdate, editButton);
	      

	      
	      memberList.appendChild(tr);
		}
	}
	
	
	makePagenation(totalPage); //페이지네이션 만듦
	
	$('button').addClass('page-link');
	

	</script>

</body>
</html>
