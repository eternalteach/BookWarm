console.log("Comment Module..........................................");

var commentService = (function() {
	//add comment
	function add(comment, callback, error) { // comment : object, callback : callback
		console.log("commentService..............................................");

		$.ajax({
			type : 'post',
			url : 'CommunityBoardComment/new',
			data : JSON.stringify(comment),
			contentType : "application/json;charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	//get comment list
	function getList(param, callback, error){
		var comm_no = param.comm_no;
		var page = param.page||1;
		
		$.getJSON("CommunityBoardComment/pages/"+comm_no+"/"+page+".json",
		function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	// remove comment
	function remove(comm_cmt_no, callback, error){
		alert("comm_cmt_no in remove function : "+comm_cmt_no);
		$.ajax({
			type:'delete',
			url : 'CommunityBoardComment/'+comm_cmt_no,
			success: function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}}
			});
	}
	
	// modify comment
	function update(comment, callback, error){
		console.log("comm_cmt_no: "+comment.comm_cmt_no);
		
		$.ajax({
			type:'put',
			url:'CommunityBoardComment/'+comment.comm_cmt_no,
			data:JSON.stringify(comment),
			contentType:"application/json;charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	// comment get
	function get(comm_cmt_no,callback,error){
		$.get("CommunityBoardComment/"+comm_cmt_no+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	// comment time form
	function displayTime(timeValue){
		var today=new Date();
		
		var gap=today.getTime()-timeValue;
		var dateObj = new Date(timeValue);
		var str="";
		if(gap<(1000*60*60*24)){
			var hh=dateObj.getHours();
			var mi=dateObj.getMinutes();
			var ss=dateObj.getSeconds();
			return [(hh>9 ? '':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
		} else {
			var yy=dateObj.getFullYear();
			var mm=dateObj.getMonth()+1;
			var dd=dateObj.getDate();
			
			return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
		}
	}
	
	function getList(param, callback, error){
		var comm_no=param.comm_no;
		var page = param.page||1;
		
		$.getJSON("CommunityBoardComment/pages/"+comm_no+"/"+page+".json",
				function(data){
			if(callback){
				callback(data.commentCnt,data.list);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}

	return {
		add : add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	};
})();