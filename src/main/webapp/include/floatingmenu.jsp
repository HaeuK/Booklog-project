<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--플로팅 구글폰트 아이콘 연결-->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  -->   
<title>플로팅 메뉴</title>
<style type="text/css">
.floatingarea{
    margin-left: 130px;
    float: right;
    position: fixed;
    bottom: 70px;
    right: 20px;
	z-index: 3;
}

.floatingarea button{
    border: none;
    width: 45px;
    height: 45px;
    border-radius: 45px;
    background-color: #005b47;
    cursor: pointer;
    /* padding-top: 2px; */
    box-shadow: 0 3px 3px rgb(141, 141, 141);
    color: #e4eeec;
    margin-right: 5px;
}

/* html .darkmode */
.dark{
    background-color: rgb(31, 30, 30);
    color: rgb(208, 208, 208);
}

.dark header{
	background-color: rgb(31, 30, 30);
}

.dark footer{
	background-color: rgb(31, 30, 30);
}
</style>
</head>

<body>
	 <div class="floatingarea">
	 	<button id="toggle">
	 		<i class="bi bi-moon-stars"></i>
	 	</button>
	 	<button onclick="location.href='/post/bookSearch'">
	 		<i class="bi bi-plus-square"></i>
	 	</button>
        <!-- <button type="submit" class="darkmodebut" id="toggle">
            <span class="material-symbols-outlined" style="color: #e4eeec;">
                dark_mode
            </span>
        </button> -->
        <!-- <button type="submit" class="writeflat" onclick="location.href='mainandfooter.html'">
            <span class="material-symbols-outlined" style="color: #e4eeec;">
                history_edu
            </span>
        </button> -->
    </div>
    
<script>
    // 참고자료 : https://blogpack.tistory.com/1117 --> css클래스로 구현하기 
    /* document.getElementById('toggle').addEventListener("click", function() {
    if(document.querySelector('body').classList.contains('darkmode')){
        document.body.classList.remove("darkmode");
    }else{
        document.body.classList.add("darkmode");
    }
    },false); */

    var mode = localStorage.getItem("darkMode");

    $("#toggle").on("click", function () {
      $("body").toggleClass("dark");

      if ($("body").hasClass("dark")) {
        activateDarkMode();
        localStorage.setItem("darkMode", "enabled");
      } else {
        deactivateDarkMode();
        localStorage.setItem("darkMode", "disabled");
      }
    });

    if (mode == "enabled") {
      activateDarkMode();
    } else if (mode == "disabled") {
      deactivateDarkMode();
    }

    function activateDarkMode() {
      $("body").addClass("dark");
    }

    function deactivateDarkMode() {
      $("body").removeClass("dark");
    }
</script>

</body>
</html>