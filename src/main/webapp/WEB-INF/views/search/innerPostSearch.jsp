<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>
<style>
/* 	body{
	display: flex;
    background-color: #f6eee9;
    font-family: 'NanumSquareNeo';
	height: 100%;
	}
 */
   .result ul{
   list-style:none;
	padding-left:0px;
   }
   .result li{
   list-style:none;
   
   }
   
	.postList a {
  text-decoration: none;
  color: #333332;
	}
	.postList a:hover{
	color: #333332;
	}

	.backImg{
	float:left;
	margin: 0 auto;
	margin-top: 2px;
	margin-left: 10px;
	width: 30px;
	height: 30px;
	cursor:pointer;
	
	}
	
	.containerl{
	padding-left:0px;
	width: 100%;
	float:left;
	display: grid;
	grid-template-columns: 100%;
	grid-template-rows: 10% 80% 5%;
	color: #333332;
	}
	
	.title{
	padding: 5px;
	padding-top: 15px;
	text-align:center;
	vertical-align: middle;
	align-items : center;
	border-bottom:1px solid #2C8B25;
	/* border:1px solid #e6c1aa;
	background-color:#fae9de;
 */	
	}
	
	.noList{
	margin: 20px 20px 0px 50px;
	padding-top: 30px; 
	}
	
	.postList{
	display: grid;
	grid-template-columns: 100%;
    grid-template-rows: repeat(5,100px);
   /* grid-gap: 1px;*/
	}
	
	.postLink{
	width:100%;
	border-bottom:1px solid #2C8B25;
	transition: all 0.3s ease-in-out;
	}
	
	.postLink:hover{
	  background-color: #fffbfa;
	  /* border: 4.5px solid #f1d3c1b7;
	  border-radius: 5px; */
	}
	
	.postLink li{
	list-style: none;
	left-padding: 0px;
	}
	
	.post{
	display: grid;
	width:100%;
	height: 90%;
	grid-template-columns: 100%;
	grid-template-rows: 35px 15px 40px;
	/* padding: 10px; */
	}
	
	
	.userNickname{
	margin-top:2px;
	font-size : 0.7em;
    /*  margin-bottom: 3px;*/
	}
	
	.postTitle{
	margin-top: 5px;
	font-weight: bold;
	font-size: 1.1em;
	}
	
	.postContent1{
	margin-top: 7px;
	font-size: 0.9em;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	line-height: 1.2;
	height: 2.4em;
	}
	
	.pagenation{
	text-align: center;
	margin: 5px;
	}
	
	.pagenation span{
	  font-size: 1.5em;
	  font-weight: bold;
	  margin-right: 10px;
	  padding: 5px;
	  cursor:pointer;
	}

</style>
<div class="containerl">
		<div class="title">
		   <img class="backImg" src="/resources/images/search/back.png" onclick = "window.history.go(-1);" >	
			<h4>검색 결과</h4>
		</div> 
		
		<div class="result">  
 			<c:if test="${fn:length(postList)==0}" > 
 				<h6 class="noList">검색 결과가 없습니다.</h6>
 			</c:if>
			<ul class="postList">
 				<c:forEach items="${postList}" var="list" varStatus="status" begin="0" end="4">
	  			<a class="postLink" href="http://localhost:8181/post/view?postno=${list.postNo}">				
					<li class="post">
						<div class="postTitle"><strong><c:out value="${list.postTitle}"/></strong></div>
					    <div class="userNickname"><c:out value="${list.userNickname}"/></div>
						<div class="postContent1"><c:out value="${list.postContent1}"/></div>
					</li>
				</a>
				</c:forEach>
			</ul>
	    </div>
	    <div class="pagenation">
	    </div>
</div>	
	<script type="text/javascript">
	

	var arr = new Array();
	<c:forEach items="${postList}" var="list">
		arr.push({
			postkey: "http://localhost:8181/post/view?postno=${list.postNo}",
			nickname: "${list.userNickname}",
			posttitle: "${list.postTitle}",
			postContent1: "${list.postContent1}"
		});
	</c:forEach> 
	//가져온 거 다시 arr로 만듦
	
	
	let totalData = '${fn:length(postList)}'; //총 데이터 개수
	const limit = 5; //최대 데이터
	let totalPage = Math.ceil(totalData/limit); //총 페이지수
	let currentPage = 1; //현재 페이지
	
	const numbers = document.querySelector('.pagenation');
	
	
	function makePagenation(totalPage){
		for(let i=1; i<=totalPage; i++){
			let span = document.createElement("span");
			span.innerHTML = i;
			span.setAttribute('onClick','makeList()');
			numbers.appendChild(span);

		}
	}
	
	let postList = document.querySelector('.postList');
	
	function makeList(){
		
		postList.innerText = ''; //원래 안에 있던거 지움	
		currentPage = event.target.textContent*1; //String 숫자로 바꾸려고 1곱해서 자동형변환함
		let lastNumber = currentPage*limit-1; //현재 페이지의 첫번째 숫자
		let firstNumber = (currentPage-1)*limit; //현재 페이지의 마지막 숫자
		
		for(let i=firstNumber; i<=lastNumber; i++){
			if(i>totalData){
				return;
			} 	
			let a = document.createElement("a");
			a.setAttribute('href',arr[i].postkey);
			a.className = "postLink";
			let li = document.createElement("li");
			li.className = "post";
			let nickNameDiv = document.createElement("div");
			nickNameDiv.className="userNickname";
			nickNameDiv.innerHTML = arr[i].nickname;
			let titleDiv = document.createElement("div");
			titleDiv.className="postTitle";
			titleDiv.innerHTML = arr[i].posttitle;
			let contentDiv = document.createElement("div");
			contentDiv.className ="postContent1";
			contentDiv.innerHTML = arr[i].postContent1;
			
			li.append(titleDiv,nickNameDiv,contentDiv);
			a.appendChild(li);
			postList.appendChild(a);
			
		}
	}
	
	
	makePagenation(totalPage); //페이지네이션 만듦
	
	
	
	 function goBack(){
			history.back(); return false;
		} 
		
		
	 
</script>