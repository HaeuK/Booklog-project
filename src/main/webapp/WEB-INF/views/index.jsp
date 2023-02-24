<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<jsp:include page="/include/resource.jsp" />

<script type="text/javascript">
	var loginId = ${loginSession eq null};
	
	if(loginId){
		document.location.href = ctxPath + "/user/login";
	}else{
		document.location.href = ctxPath + "/home";
	}
</script>
</head>
<body>
</body>
</html>