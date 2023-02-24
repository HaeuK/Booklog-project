<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- css import -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- font-family: 'NanumSquareNeoLight';
font-family: 'NanumSquareNeo';
font-family: 'NanumSquareNeoBold';
font-family: 'NanumSquareNeoExtraBold';
font-family: 'NanumSquareNeoHeavy'; -->

<!-- bootstrap -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- project common -->
<link href="${pageContext.request.contextPath}/resources/common_css/common.css" rel="stylesheet" type="text/css" />

<!-- 자바스크립트 import -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/jQuery/jQuery-2.1.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/jQuery/jQuery-ajaxload.js" type="text/javascript"></script>

<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<!-- project common -->
<script src="${pageContext.request.contextPath}/resources/common_js/common.js" type="text/javascript"></script>

<script type="text/javascript">
/*  서비스가 어떤 실행 환경에서 실행될 지 알 수 없으므로, 기본적으로 url을 만들 때 서비스의 contextPath를 앞에 추가한 후 사용해줘야 한다.
 *  그러나, 매번 url만들때마다 pageContext를 호출하는 것은 비효율적이므로 ctxPath를 전역변수로 사용한다.
 */
var ctxPath='${pageContext.request.contextPath}';
</script>