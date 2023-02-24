function rate1(){
    $('#rate_img1').attr("src","/resources/images/post/plus.png");
    $('#rate_img2').attr("src","/resources/images/post/zero.png");
    $('#rate_img3').attr("src","/resources/images/post/zero.png");  
    $('#rate_img4').attr("src","/resources/images/post/zero.png");  
    $('#rate_img5').attr("src","/resources/images/post/zero.png");   
}

function rate2(){
    rate1();
    $('#rate_img2').attr("src","/resources/images/post/plus.png"); 
}

function rate3(){
    rate2();
    $('#rate_img3').attr("src","/resources/images/post/plus.png"); 
}

function rate3(){
    rate2();
    $('#rate_img3').attr("src","/resources/images/post/plus.png"); 
}

function rate4(){
    rate3();
    $('#rate_img4').attr("src","/resources/images/post/plus.png"); 
}

function rate5(){
    rate4();
    $('#rate_img5').attr("src","/resources/images/post/plus.png"); 
}


$(document).ready(function () {
    if ($('input:radio[name=rate]').checked()) {
        var rateVar = $('input:radio[name=rate]:checked').val();
        
        console.log(rateVar);

        $('#rate_value').text(rateVar);
    }
});




