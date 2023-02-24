<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/commonHead.jsp" %>

<style>

.homenotice{
   width: 100%;
   height: 100%; /* 300px */
   background-color: rgb(246, 245, 239);
   opacity:0.9;
   font-size: 12px;

}

.homenotice ul {
   list-style: none;
   float: left;
}

</style>
<script type="text/javascript">
function selectPage(page) {
   $('#notice_list_pageIndex').val(page);
   
   $('#noticeListLoader').ajaxload(
      'blockLoad',
      ctxPath+'/notice/innerpage/innerNoticeList',
      "POST",
      "html",
      $("#formNoticeList").serialize()
   );
}
function selectNotice(seq) {
   $('#notice_no').val(seq);
   
   $("#fromNoticeView").submit();
}
</script>

<form id="fromNoticeView" class="form-horizontal" action="/notice/view" method="post">
   <input type="hidden" id="notice_no" name="noticeno" value=""/>
</form>

<div class="homenotice">
   <table class="table table-hover text-center">
      <tbody class="btn-fn">
         <c:forEach var="noticeList" items="${noticeList}" varStatus="status">
            <tr onclick="selectNotice('${noticeList.noticeno}');">
               <td>${noticeList.noticecode}</td>
               <td>${noticeList.noticetitle}</td>
               <td>${noticeList.noticewriter}</td>
               <td>${fn:substring(noticeList.noticewritetime, 0, 16)}</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
</div>