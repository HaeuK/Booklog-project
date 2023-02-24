<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>	
<jsp:include page="/include/resource.jsp" />
<style>
/*        * {
            box-sizing: border-box;
            margin: 0px;
            padding: 0px;
            color: #333332;
        } */
        
        ul{
            list-style:none;
        }

        body{
            background-color: #f6eee9;
            font-family: 'NanumSquareNeo';
        }
         /*그리드*/
        .container {
            display: grid;
            grid-template-columns: 100%;
        }

        .title {
            margin: 30px;
        }
        /*그리드*/
        .mostCheckedoutList {
            display: grid;
            grid-template-columns: 95%;
            grid-template-rows: 180px;
            margin-left: 20px;
            
        }
       /*플렉스*/
        .chekedoutBook {
            display: flex;
            grid-template-columns: 30% 60%;
            border-bottom: solid 1px rgb(196, 195, 195);
            background-color: rgba(255, 192, 203, 0.262);
        }

        .bookImage {
	       margin: 15px;
           float: left;
       }

       .bookImage img {
        width:  100px;
        overflow: hidden;
        display: block;
        margin: auto;
       }

       .bookInfo {
        margin: 15px;
        float: left;
        display: grid;
        grid-template-columns: 100%;
        grid-template-rows: 20% 30% 20%;
       }

       .mostCheckedoutList li:first-child .bookInfo .bookRank {
        background-color:  #4dac27;

       }

       .bookRank{
        color: white;
        border-radius: 5px 0px 5px 0px;
        background-color: #005c48;
        text-align: center;
        width: 25px;
        margin-bottom: 5px;
        font-family: sans-serif;
       }
       

       .bookTitle {
        font-size: 1.1em;
        margin-top: 10px;
       }

       .bookWriterAndPublisher{
        font-size: 0.8em;

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
 					 	<div class="container">
       						 <div class="title"><h1>도서관 인기대출도서 TOP 30</h1></div>
        						<ul class="mostCheckedoutList">

        						</ul>
    					</div> 
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>
	   <script>
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
                            if ($(this).find("RKI_NO").text() == 31 ) {
                                return;
                            }
                                str  = "<li class='chekedoutBook'>";
                                str += "<div class='bookImage'><img src='"+$(this).find("BOOK_IMAGE_URL").text()+"'/></div>";
                                str += "<div class='bookInfo'>";
                                str += "<div class='bookRank'>"+$(this).find("RKI_NO").text()+"</div>";
                                str += "<div class='bookTitle'><p><strong>"+ $(this).find("BOOK_NM_INFO").text()+"</strong></p></div>";
                                str += "<div class='bookWriterAndPublisher'><p>"+$(this).find("AUTHOR_NM_INFO").text()+" / "+$(this).find("PUBLSHCMPY_NM").text()+"</p></div>";
                                str += "</div></li>";
     
                             $('.mostCheckedoutList').append(str);
                             str="";  
                        }
                        )
                        
                }      
                
            }
        })
    </script>
</body>
</html>