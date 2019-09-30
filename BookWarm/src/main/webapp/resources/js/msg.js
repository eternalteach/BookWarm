console.log("MSG..........................................");

var msgservice = (function(){
	
	function msgpaging(pages, callback, error){
		console.log("보낸쪽지함................")
		var msgpageNum = pages;
		
		$.getJSON("message/pages/"+msgpageNum+".json",

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
	
	
	function msginsert(send, callback, error){
		console.log("보내기");
		
		$.ajax({
			type:'get',
			url : '/send',
			data : JSON.stringigy(send),
			contentType : "application/json; charset=UTF-8",

			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	function msgdelete(msg_no, callback, error){
		$.ajax({
			type : 'delete',
			url : '/message/' + msg_no,
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
	
	
	return{
		msgpaging:msgpaging,
		msginsert:msginsert,
		msgdelete : msgdelete
		
	};
})();