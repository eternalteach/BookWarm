console.log("adminService..........................................");

var adminService = (function() {
	
	// community get
	function get(comm_no,callback,error){
		$.get("admin/community/"+comm_no+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	//get comment list
	function getCommListWithPaging(pages, callback, error){
		var commPageNum = pages;
		
		$.getJSON("admin/community/pages/"+commPageNum+".json",
		function(list){
			if(callback){
				callback(list);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	// review get
	function getReview(comm_no,callback,error){
		$.get("admin/review/"+comm_no+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function getUser(user_id,callback,error){
		$.get("admin/user/"+user_id+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	

	return {
		get:get,
		getReview:getReview,
		getUser:getUser,
		getCommListWithPaging:getCommListWithPaging
	};
})();