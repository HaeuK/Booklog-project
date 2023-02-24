<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booklog chatRoom</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<jsp:include page="/include/resource.jsp" />

<style type="text/css">
#messages{
	list-style-type:none;
	display:flex;
	flex-direction: column-reverse;
	overflow-y:auto;
	height:535px;
}
.btn-outline-primary {
	color: #005b47!important;
	border-color: #005b47!important;
}
.btn-outline-primary:hover {
	color: #fff!important;
	background-color: #005b47!important;
	border-color: #005b47!important;
</style>

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="overflow: auto; min-width: 500px; min-height: 1200px; max-height: 1200px;">
					<div class="row m-3 justify-content-center">
						<div class="col-sm-10 col-xs-10 mt-5">
							<h3>토론방</h3>
							<div class="card my-3">
								<div class="chatForm card-body">

									<div>
										<button type="button" class="btn btn-outline-primary" onclick="openSocket();">토론방 참여</button>
                                        <button type="button" class="btn btn-outline-danger" onclick="closeSocket();">토론방 나가기</button><br>
									</div>
									
									<div id="messages" style="color: rgb(31, 30, 30)">
									</div><br>
									
									<div class="chatinput">
										<input type="text" id="sender" name="usernickname" value="${loginVo.usernickname}" style="display: none;">
										<input type="text" id="messageinput" size=30 placeholder="내용 입력">
										<button type="button" class="btn btn-outline-primary" onclick="send();">전송</button>
									</div>

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

var ws;
var messages = document.getElementById("messages");

// 웹 소켓 연결
function openSocket() {
	if(ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
		writeResponse("이미 연결되어 있습니다."); /* 웹소켓이 이미 연결되어 있음 */
		return;
	}
	
	// 웹 소켓 객체 만들기
	ws = new WebSocket("ws://localhost:8181/booklogChat");
	
	ws.onopen = function(event){
		if(event.data === undefined) {
			return;
		}
		writeResponse(event.data);
	};
	
	ws.onmessage = function(event) {
		//console.log('writeResponse');
		console.log(event.data)
		writeResponse(event.data);
	};
     
	ws.onclose = function(event) {
		writeResponse("토론이 종료되었습니다.");
	};
}
	
// 메시지 보내기
/* function send() {
	var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
	ws.send(text);
	$('#messageinput').val('');
	$('#messageinput').focus();
} */

// 엔터키를 눌러도 메시지 보내기
/* $('.chatinput').keydown(function(e) {
	if (e.keyCode == 13) {
		send();
		return;
	}
}); */

// 메시지 보내기 ver2
function send() {
	var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
	if(document.getElementById("messageinput").value != false){
		ws.send(text);
		$('#messageinput').val('');
		$('#messageinput').focus();
	}
}

// 엔터키 눌러도 메시지 보내기 ver2
$('.chatinput').keydown(function(e) {
	if (e.keyCode == 13) {
		send();
		return;
	}
});

// 웹 소켓 연결 해제
function closeSocket() {
	ws.close();
}

// 메시지를 출력창에 표시
function writeResponse(text) {
	messages.innerHTML += "<br>" + text;
}

</script>
</body>
</html>