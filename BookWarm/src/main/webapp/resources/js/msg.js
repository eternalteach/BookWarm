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
	
	//제거
	function msgdelete(msg_no, callback, error){
		
		$.ajax({
			type : 'delete',
			url : 'msgdelete/' + msg_no,
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
		msgdelete:msgdelete
	};
})();