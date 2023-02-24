<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<style>
 body{
	box-sizing: border-box;
    margin: 0px;
    padding: 0px;
    /* color: #333332; */
   /*  background-color: #f6eee9; */
    font-family: 'NanumSquareNeo';
	height: 100%;
} 

.SearchAndResultBox{
	height: 100%;
	/* color: #333332; */
}

.SearchBarBox{
    text-align: center;
    width: 100%;

}


/*input search x버튼 없애는 것까진 했는데 x버튼 커스텀 못함*/
input[type=search]::-webkit-search-cancel-button{
   -webkit-appearance: none;
    position:relative;
    right:20px; 
}

.bookSearchInput {
    width:350px;
    height:40px;
    border: 1px solid #2C8B25;
    border-radius:30px;
    font-size: 0.9em;
    background-image: url('/resources/images/search/searchIcon.png');
    background-repeat: no-repeat;
    background-position: 5% 50%; /*아이콘 위치 가로세로 */
    background-size: 6%;
    text-indent: 15%; /*들여쓰기*/
    outline: none; /*하이라이트 선 없앰*/
}
ul{
   list-style:none;

   }

.SearchBarBox{
   padding: 10px;
   border-bottom:1px solid #2C8B25;
}

.suggestionBox {
 /*  background-color: #fff7f2; */
    width: 100%;
/*     border-left:1px solid #e6c1aa;
    border-right:1px solid #e6c1aa;
    border-bottom:1px solid #e6c1aa; */
}

/*리스트 줄 세우기 그리드*/
#suggestedBookList {
   display: grid;
   grid-template-columns: 100%;
    grid-template-rows: 140px;
/*     grid-gap: 5px; */
    /* overflow:scroll; */
    /*border: 1px solid black;*/
    padding-left: 0px;

}

.suggestedBook {
   list-style: none;
   border-bottom:1px solid #2C8B25;
   width: 100%;
   transition: all 0.7s ease;
}

.suggestedBook:hover {
   background-color: #fffbfa;
   transition: all 0.7s ease;
}

/*이미지랑 설명이랑 나누는 그리드 */
.bookLink {
   display: flex;
   width: 100%;

}

.bookImage {
   margin: 15px;
   float: left;
}

.bookImage img {
  
  width:  80px;
  overflow: hidden;
  margin: auto;
  
}

/*설명 안에서 제목,작가,설명 나누는 그리드*/
.leftInformation {
   margin: 15px;
   float: left;
   display: grid;
   grid-template-columns: 100%;
   grid-template-rows: 18px 12px 48px;
   grid-gap: 10px;
}

.bookTitle {
   font-size: 1.1em;
   margin-bottom: 12px;
   height: 25px;
   display: -webkit-box;
   -webkit-line-clamp: 1;
   -webkit-box-orient: vertical;
   line-height: 1.2;
   height: 1.2em;
   overflow: hidden;
/*    white-space: nowrap;
   overflow:hidden;
   text-overflow: ellipsis; */
   
}

.bookAuthorAndPublisher {
   font-size: 0.8em;
   margin-bottom: 6px;
}
.bookDescription {
   font-size: 0.7em;
   overflow: hidden;
   display: -webkit-box;
   -webkit-line-clamp: 2;
   -webkit-box-orient: vertical;
   line-height: 1.2;
   height: 2.4em;
}

.bookIsbn {
   display: none;
}

</style>

    <div class="SearchAndResultBox">
        <div class="SearchBarBox">
            <form action="/bookSearch" method="get">
                <input class="bookSearchInput" id="bookname" onkeyup="searchFunction()" type="search" name="book" size="30" placeholder="책 제목/저자 입력">
             </form>
        </div>
                <div class="suggestionBox">
                    <!--자동완성div-->
               <ul id ="suggestedBookList" >
               </ul>
                </div>
    </div>
