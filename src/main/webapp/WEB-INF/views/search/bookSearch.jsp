<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>	
<jsp:include page="/include/resource.jsp" />
<style>

</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid" style="max-height:550px;">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="padding:0px;">
				<div style="overflow: auto;  /*  min-height: 1200px; max-height: 1200px; */">
					<div id="listLoader" style="height: 1200px; width: 100%;">
						<jsp:include page="/WEB-INF/views/search/innerBookSearch.jsp"></jsp:include>
					</div>
				
				</div>
			</main>
	<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>
	
	 <script>

	
        //http://yoonbumtae.com/?p=2858 무한 스크롤 참고 사이트     
        let currentPage = 1;
        const DATA_PER_PAGE = 6
        const LAST_PAGE = 9;
        
        
     // IntersectionObeserver 부분
        const observerOption = {
            rootMargin: "0px 0px 30px 0px",
            threshold: 0.5
        }

        
       //.done, .fail 방식도 고려 . 비동기라서 순서 문제가 있음
      function searchFunction(){
    	 
    	 
        $.ajax({
            method: 'GET', // 요청방식
            url: 'bookSearch.do',
/*             async : false, */
            data: {keyword: $('.bookSearchInput').val()} ,
            dataType: "json",
            timeout: 1000,
            success: function(data){
               
                //데이터 추가 함수
                function addData(currentPage){
                   
                    let total = data.total;
                    let str = "";

                  if(data.total>=1){
                           //리스트 동적 추가 z
                           
                           for(let i = (currentPage-1)*DATA_PER_PAGE; i <= currentPage*DATA_PER_PAGE-1; i++){
                        	  
                              str  = "<li class='suggestedBook'><a class='bookLink' href='";
                              str += "http://localhost:8181/search/postSearch?query="+data.items[i].isbn+"'>";
                              str += "<div class='bookImage'><img src='"+data.items[i].image+"'/></div>";
                              str += "<div class='leftInformation'><div class='bookTitle'><p><strong>"+data.items[i].title+"</strong></p></div>";
                              str += "<div class='bookAuthorAndPublisher'><p>"+data.items[i].author+" / "+data.items[i].publisher+"</p></div>";
                              str += "<div class='bookDescription'><p>"+data.items[i].description.substring(0,300)+"</p></div>";
                              str += "</div></a></li>";
                                $('#suggestedBookList').append(str); 
                           
                           }
                        }
              
                }
                
                // IntersectionObserver 갱신 함수
                function observerLastChild(intersectionObserver){
                              
                   const listChildren = $('.suggestedBook');
                   
                   for(i=0; i<listChildren.length; i++){

                      if(!listChildren[i].nextSibling && currentPage < LAST_PAGE ){
                         intersectionObserver.observe(listChildren[i])  // el에 대하여 관측 시작
                      }else if (currentPage >= LAST_PAGE ){
                         intersectionObserver.disconnect();
                      }
                      
                      
                   }
           
                   
                }

                // IntersectionObserver 인스턴스 생성
                const io = new IntersectionObserver(function(entries, observer){
                    entries.forEach(function(entry){

                        // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
                        if (entry.isIntersecting) {
                           
                            // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                            setTimeout( function() {
                                addData(++currentPage);
                                observer.unobserve(entry.target);
                                observerLastChild(observer);

                            }, 1000)
                        }
                    })
                }, observerOption)
                     
               
               $('#suggestedBookList').empty();
               addData(currentPage);   //초기데이터      
               observerLastChild(io);

            }
            })
        }
      
      
</script>
</body>
</html>