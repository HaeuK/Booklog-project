(function($) {
    var methods = {
    	genLoad : function(url, type, dataType, data, async) {
    		var content = this;
    		async = typeof async !== 'undefined' ? async : false;
    		
    		$.ajax({
				type		: type,
				url			: url,
				data		: data,
				dataType	: dataType,
				async		: async,
				beforeSend	: function() { // 전처리
					
				},
				success		: function(data) {
					$(content).html(data);
				},
				error		: function(x, e) {
					if (x.status == 0) {
						$.alert('서버와 통신할 수 없습니다.<br />네트워크 설정을 확인하여 주시기 바랍니다.');
					} else if (x.status == 404 || x.status == 500) {
						$.alert('오류가 발생되었습니다.<br />관리자에게 문의하여 주세요.');
					} else if (e == 'timeout') {
						$.alert('일시적인 장애가 발생되었습니다.<br />재시도해 주세요.');
					} else {
						$.alert('알수없는 오류가 발생되었습니다.' + x.responseText);
					}
				},
				complete	: function() { // 후처리
//					Layout.resize();
				}
			});
    	},
    	
    	fadeLoad : function(url, type, dataType, data, async) {
    		var content = this;
    		async = typeof async !== 'undefined' ? async : false;
    		
    		$(content).fadeOut('fast', function() {
    			$jquery.ajax({
    				type		: type,
    				url			: url,
    				data		: data,
    				dataType	: dataType,
    				async		: async,
    				beforeSend	: function() { // 전처리
    					
    				},
    				success		: function(data) {
    					if (content != undefined) {
    						$(content).html(data);
    					} else {
    						return true;
    					}
    				},
    				error		: function(x, e) {
    					if (x.status == 0) {
    						$.alert('서버와 통신할 수 없습니다.<br />네트워크 설정을 확인하여 주시기 바랍니다.');
    					} else if (x.status == 404 || x.status == 500) {
    						$.alert('오류가 발생되었습니다.<br />관리자에게 문의하여 주세요.');
    					} else if (e == 'timeout') {
    						$.alert('일시적인 장애가 발생되었습니다.<br />재시도해 주세요.');
    					} else {
    						$.alert('알수없는 오류가 발생되었습니다.' + x.responseText);
    					}
    				},
    				complete	: function() { // 후처리
    					$(content).fadeIn('slow');
//    					Layout.resize();
    				}
    			});
    		});
    	},
    	
    	blockLoad : function(url, type, dataType, data, async) {
    		var content = this;
    		async = typeof async !== 'undefined' ? async : false;
//    		$.block();
//    			jQuery.ajax(
//    			{async : async
//    			,type : type
//    			,url : url
//    			,dataType : dataType
//    			,data: data
//    			,success : function(jsonData) {
//    			var _login_result = jsonData.result;
//    			if(_login_result == 1){
//    			alert("로그인 성공!\n환영합니다.");
//    			$("#loginFrm").attr("action", "/login/loginSuccess.do").submit();
//    			} else {
//    			alert("로그인 실패하였습니다. 아이디와 비밀번호를 재확인해 주세요.");
//    			}		
//    			}
//    			,error:	function(request,status,error){
//    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//    			}
//    			});
    		$.ajax({
    			type		: type,
    			crossDomain : true,
				url			: url,
				data		: data,
				dataType	: dataType,
				async		: async,
				beforeSend	: function() { // 전처리
					
				},
				success		: function(data) {
					$(content).html(data);
				},
				error		: function(x, e) {
					if (x.status == 0) {
						$.alert('서버와 통신할 수 없습니다.<br />네트워크 설정을 확인하여 주시기 바랍니다.');
					} else if (x.status == 404 || x.status == 500) {
						$.alert('오류가 발생되었습니다.<br />관리자에게 문의하여 주세요.');
					} else if (e == 'timeout') {
						$.alert('일시적인 장애가 발생되었습니다.<br />재시도해 주세요.');
					} else {
						$.alert('알수없는 오류가 발생되었습니다.');
					}
				},
				complete	: function() { // 후처리
//					$.unBlock();
				}
			});
    	}
    };

    
    $.fn.ajaxload = function(method) {
        var thisObj = $(this);
        var args;
        
        if (arguments.length <= 1) {
	    	args = arguments;
	    } else {
	    	args = Array.prototype.slice.call(arguments, 1);
	    }
        
        if(!thisObj[0]) {
		  return false;
        }
        
        if (typeof(method) === 'string' && method.charAt(0) != '_' && methods[method]) {
        	methods[method].apply(thisObj, args);
        }
        
        return true;
    };
})(jQuery);
