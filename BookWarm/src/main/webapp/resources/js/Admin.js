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
	

	return {
		get:get,
		getReview:getReview
	};
})();