<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog home</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<style type="text/css">
	
body {
	/* background-color: #F6EEE9; */
	font-family: 'NanumSquareNeo';
}

.carousel-inner ul{
	float: left;
	/* margin-left: 30px; */ 
}
ul li{
	list-style: none;
}
/* .carousel slide{

} */

.card{
	float: left;
	/* background-color: #F6EEE9 */
	margin: 0px;
	opacity:0.9;
}


.notice-subinfo {
	font-size: 0.8rem;
}


.noticeroll{
	margin-top: 20px;

}
.carousel-item{
	margin-top: 15px;
	margin-bottom: 15px;

}


.homepostview .card{
	box-shadow: 0 3px 3px rgb(141, 141, 141);
}

/*도서관*/

#LonedListArea{
	margin:0px;
	padding: 0px;
}

.bestCheckedoutList1 {	
	height: 180px;
 	display: grid;
	grid-template-columns: repeat(5,200px); 

}

#mainTitle2{
	font-size: 1.5em;
	margin:0px;
	padding: 0px;
}

.more small a {

color: gray;	
text-decoration: none; 
}
.bookImage {
	/* text-align: center; */
}

.bookImage img{
 height: 180px;
 border: 0.3px solid #EAEAEA;
}


.bestCheckedoutList2 {

	height: 180px;
 	display: grid;
	grid-template-columns: repeat(5,200px); 
}
#postImg{
	text-align: center;

}
#postTitle{
   width: 160px;	
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}

.card{
cursor: pointer;
transition: all 0.2s linear;
}

.card:hover{
 transform: scale(1.05);
}

</style>



<jsp:include page="/include/resource.jsp" />

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid" style="font-family: 'NanumSquareNeo';">
		<div class="row ">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div  style="overflow: auto; min-height: 1200px; max-height: 1200px;">
					<div class="noticeroll">
						<h4>최신 공지사항</h4>
						<jsp:include page="/WEB-INF/views/mainnerNoticeList.jsp"></jsp:include>
					</div>
					<img alt="deck" src="../resources/images/mainimg/deck1.png" style="width:100%; height: 30px;">
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="padding-top: 30px" >
						<div class="carousel-inner">
							<h4>최신 독후감</h4>
   							<div class="carousel-item active" data-bs-interval="9000">
      							<c:forEach var="postHome" items="${postHome}" varStatus="status" begin="0" end="4">
									<ul>
										<%-- <a href="http://localhost:8181/post/view?postno=${postHome.postno}"> --%>
										<div class="card-group" style="color: black;">
											<div class="card" id="${postHome.postno}" onclick="gotopost(this.id);">
												<div class="card-header" id="postImg" style="font-size: 15px;"><img src="${postHome.bookcover}" width="100px" height="135px"></div>
												<div class="card-body" id="postTitle"style="font-size: 15px;">${postHome.posttitle}</div>
												<div class="card-footer" style="font-size: 3px;">${fn:substring(postHome.postwritedate, 0, 16)}</div>
											</div>
										</div>
										<!-- </a> -->
									</ul>
								</c:forEach>
    						</div>
						</div>
					</div>
					<img alt="deck" src="../resources/images/mainimg/deck1.png" style="width:100%; height: 30px;">
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="padding-top: 30px" >
					<div class="carousel-inner" id="LonedListArea">
						<p><span id="mainTitle2">도서관 대출 순위</span> <span class="more"><small><a href="/mostCheckedoutBookList"> &nbsp;more ></a></small></span></p>
							<div class="carousel-item active"  data-bs-interval="2000">
								<ul class="bestCheckedoutList1">
								</ul>

							</div>
							<div class="carousel-item" data-bs-interval="2500">
								<ul class="bestCheckedoutList2">
								</ul>

							</div>
					</div>
					<img alt="deck" src="../resources/images/mainimg/deck1.png" style="width:100%; height: 30px;">
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">
document.cookie = "crossCookie=bar; SameSite=None; Secure"; //samesite 오류 때문에 붙여줌 
const url = "https://openapi.gg.go.kr/Poplitloanbook?Key=${key}&Type=xml&pIndex=2&pSize=91";
$.ajax({
    type: "GET",
    url: url,
    data: {},
    success: function(response){
        let xmlData = $(response).find("row");
        let listLength = xmlData.length;

        if(listLength>=1){
                let str = "";
                xmlData.each(function(index,item){
                    if ($(this).find("RKI_NO").text() > 10 ) {
                        return;
                    }
                    
                    if ($(this).find("RKI_NO").text()<=5){
                        str  = "<li class='bestLonedBook'>";
                        str += "<div class='bookImage'><img src='"+$(this).find("BOOK_IMAGE_URL").text()+"'/></div>";
                        str += "</li>";

                     $('.bestCheckedoutList1').append(str);
                     str="";  
                     
                    }
                    if($(this).find("RKI_NO").text()>5){
                        str  = "<li class='bestLonedBook'>";
                        str += "<div class='bookImage'><img src='"+$(this).find("BOOK_IMAGE_URL").text()+"'/></div>";
                        str += "</li>";

                     $('.bestCheckedoutList2').append(str);
                     str="";                    	
                    	
                    }
                }
                )
                
        }      
        
    }
});
  
  function gotopost(id){
	 
	  location.href= "http://localhost:8181/post/view?postno="+id;
  }
  
  
  
</script>

</body>
</html>
