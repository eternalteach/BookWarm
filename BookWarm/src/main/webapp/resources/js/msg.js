console.log("MSG..........................................");

var msgservice = (function(){
	
	//받은쪽지
	function msgpaging(pages, callback, error){
		console.log("받은쪽지함................")
		var msgpageNum = pages;
		
		$.getJSON("message/get/"+msgpageNum+".json",

		function(msglist){
			if(callback){
				callback(msglist);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	
	//받은쪽지
	function msgpaging2(pages, callback, error){
		
		console.log("보낸쪽지함................ 가져와라")
		var msgpageNum2 = pages;
		
		$.getJSON("message/send/"+msgpageNum2+".json",

		function(msglist2){
			if(callback){
				callback(msglist2);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	
	
	//받은제거
	function msgdelete(msg_no,msg_get_id,callback, error){
		console.log("받은쪽지제거")
		$.ajax({
			type : 'delete',
			url : "msgdelete/" + msg_no +"/"+ msg_get_id,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
		
	}
	//보낸쪽지제거
	function msgdelete2(msg_no,msg_send_id,callback, error){
		console.log("보낸쪽지제거")
		$.ajax({
			type : 'delete',
			url : "msgdelete2/" + msg_no +"/"+ msg_send_id,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
					console.log("보낸쪽지제거2")
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
					console.log("보낸쪽지제거3")
				}
			}
		});
		
	}
	
	
	return{
		msgpaging:msgpaging,
		msgpaging2:msgpaging2,
		msgdelete:msgdelete,
		msgdelete2:msgdelete2
	};
})();