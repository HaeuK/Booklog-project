function ajaxCall4Html(apiURL, request, callback){
	$.ajax({
		url : apiURL,
		headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
		type : 'post',
		crossDomain : true,
		dataType : "html",
		async : false,
		data : request,
		success : function(result) {
			callback(result);
		},
		error:function(request,status,error){
			console.log(error);
			callback('{"result":"0"}');
		}
	});
}

/****************************************************************
 * isNumComma(form.field, format) : 
 * 입력값이 사용자가 정의한 포맷 형식인지 체크
 * 자세한 format 형식은 자바스크립트의 'regular expression(정규식)'을 참조
 * 정규식에 대한 내용은 검색엔진을 통해 찾아보면 나옴.
 * examples  : 
 *
 * if (isValidFormat(form.field, "[xyz]")) {
 *		alert('x-z 까지의 문자가 존재하네요.');
 * }
 *
 * return : 입력값이 지정한 올바른 포맷으로 되어 있으면 TRUE 	 									
 ****************************************************************/
function isValidFormat(value, format) {
    if (value.search(format) != -1) {
        return true; 
    }
    return false;
}

/****************************************************************
 * isEmpty(form.field) : 입력값이 비어있는지 체크
 * examples  : 
 *
 * if( isEmpty(form.field) ) { 
 *	 alert('입력값이 없네요.');
 * }	
 *				
 * return : 입력값에 아무것도 없으면 TRUE 	 									
 ****************************************************************/
function isEmpty(value) {
    if (value == undefined || value == null || value.replace(/ /gi,"") == "") {
        return true;
    }
    return false;
}


/****************************************************************
 * isAlphabet(form.field) : 입력값이 알파벳으로만 되어 있는지 체크
 * 본 함수가 자주 호출될 경우에는 캐릭터 지역변수를 전역변수로 사용해도 좋다.
 * examples  : 
 *
 * if( isAlphabet(form.field) ) { 
 *	 alert('입력값이 알파벳으로만 구성되어 있네요.');
 * }	
 *			
 * return : 입력값이 알파벳으로만 이루어져 있으면 TRUE 	 									
 ****************************************************************/
function isAlphabet(value) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    return containsCharsOnly(value,chars);
}


/****************************************************************
 * isNumber(form.field) : 입력값이 숫자로만 되어 있는지 체크
 * 본 함수가 자주 호출될 경우에는 숫자 지역변수를 전역변수로 사용해도 좋다.
 * examples  : 
 *
 * if( isNumber(form.field) ) { 
 *	 alert('입력값이 숫자로만 구성되어 있네요.');
 * }	
 *	
 * return : 입력값이 숫자로만 이루어져 있으면 TRUE 	 									
 ****************************************************************/
function isNumber(value) {
    var chars = "0123456789";
    return containsCharsOnly(value,chars);
}


/****************************************************************
 * isValidEmail(form.field) : 입력값이 이메일 형식인지 체크
 * examples  : 
 *
 * if (isValidEmail(form.field)) {
 *		alert('입력값이 이메일 형식이네요.');
 * }
 *			
 * return : 입력값이 이메일 형식으로 되어있으면 TRUE 	 									
 ****************************************************************/
function isValidEmail(value) {
	/*--
	var format = /^(\S+)@(\S+)\.([A-Za-z]+)$/;
	--*/
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    return isValidFormat(value,format);
}



/****************************************************************
 * isValidPhone(form.field) : 입력값이 전화번호 형식(숫자-숫자-숫자)인지 체크
 * examples  : 
 *
 * if (isValidPhone(form.field)) {
 *		alert('입력값이 전화번호 형식이네요.');
 * }
 *	 
 * return : 입력값이 전화번호 형식(숫자-숫자-숫자)이면 TRUE 	 									
 ****************************************************************/
function isValidPhone(value) {
    var format = /^(\d+)-(\d+)-(\d+)$/;
    return isValidFormat(value,format);
}

/****************************************************************
 * isDate(value) : 입력값이 날짜 형식(yyyyMMdd)인지 체크
 * examples  : 
 *
 * if (isValidPhone(form.field)) {
 *		alert('입력값이 날짜 형식이네요.');
 * }
 *	 
 * return : 입력값이 날짜 형식(yyyyMMdd)이면 TRUE 	 									
 ****************************************************************/
function isDate(value) {
	var format = /^\d{4}[\-]\d{2}[\-]\d{2}$/;
	return isValidFormat(value,format);
}

/****************************************************************
 * fnGetPercentage(intParam1, intParam2) 
 *  : 지정한 수치의 percentage를 구한다. 
 * examples  : 
 * 
 * fnGetPercentage(100, 50) -> 50
 *
 * return : 비율(percentage)	 									
 ****************************************************************/
function fnGetPercentage(intParam1, intParam2) {
	var percentage = roundXL((intParam2 / intParam1) * 100, 2);
	
	return percentage;
}

/****************************************************************
 * getCommaMoney(number)
 *  : number의 형식을 콤마구분 숫자형식으로 변경
 * examples  :
 *
 * getCommaMoney(123456) -> '123,456'
 *
 * return : String
 ****************************************************************/
function getCommaMoney(number) {
	var money = '';
	var y = -1
	var chars = '0123456789';
	number = String(number);

	if(number.length <= 3) {
		return number;
	}

	for (var x=number.length; x>=0; x--) {
    	var moyo = number.charAt(x);
        if (moyo != ",") { /* 컴마가 없는 경우에만 숫자를 붙인다 */
            if (y%3 == 0 && y != 0) {/* 세자리 마다 컴마를 붙인다. */
            	if(chars.indexOf(moyo) != -1) {
            		money = moyo + "," + money;
            	} else {
            		money = moyo + money;
            	}
            }else {
                money = moyo + money;
            }
           	y++;
        }
    }

	return money;
}

/****************************************************************
 * monthDiff(d1, d2)
 *  : d1, d2 월 간격차이를 반환한다.
 * examples  :
 *
 * monthDiff('20110101', '20110201') -> 1
 *
 * return : int
 ****************************************************************/
function monthDiff(d1, d2) {
	var months = 0;
	
	if(d1.length == 8 || d2.length == 8) {
		var date1 = new Date(Number(d1.substring(0, 4)), Number(d1.substring(4, 6)), Number(d1.substring(6, 8)));
		var date2 = new Date(Number(d2.substring(0, 4)), Number(d2.substring(4, 6)), Number(d2.substring(6, 8)));
		
		months = (date2.getFullYear() - date1.getFullYear()) * 12;
		months -= date1.getMonth();
		months += date2.getMonth();
	}
	
	return months;
}

/****************************************************************
 * moneyToHan(money)
 *  : money의 한글명을 반환한다.
 * examples  :
 *
 * moneyToHan('1000000') -> 일백만
 *
 * return : string
 ****************************************************************/
function moneyToHan(money){
	
	arrayNum=new Array("","일","이","삼","사","오","육","칠","팔","구");
	arrayUnit=new Array("","십","백","천","만 ","십만 ","백만 ","천만 ","억 ","십억 ","백억 ","천억 ","조 ","십조 ","백조");
	arrayStr= new Array();
	
	var str = getCommaMoneyRemove(money);
	
	len = str.length;
	hanStr = "";
	
	for(var i=0;i<len;i++) {
		arrayStr[i] = str.substr(i,1);
	}
	
	code = len;
	
	for(var i=0;i<len;i++) {
		code--;
		tmpUnit = "";
		if(arrayNum[arrayStr[i]] != ""){
			tmpUnit = arrayUnit[code];
			
			if(code>4) {
				if(( Math.floor(code/4) == Math.floor((code-1)/4)
				     && arrayNum[arrayStr[i+1]] != "") || 
				   ( Math.floor(code/4) == Math.floor((code-2)/4) 
				     && arrayNum[arrayStr[i+2]] != "")) {
					tmpUnit=arrayUnit[code].substr(0,1);
				} 
			}
		}
		
		hanStr +=  arrayNum[arrayStr[i]]+tmpUnit;
    }
	
	return hanStr;
}