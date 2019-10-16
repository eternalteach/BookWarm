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
		
	//get review list
	function getReviewListWithPaging(pages, callback, error){
		var reviewPageNum = pages;
		
		$.getJSON("admin/review/pages/"+reviewPageNum+".json",
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
		$.get("user/"+user_id+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	// modify authentication
	function modfiyAuthentication(UserAuthentication, callback, error){
		console.log("========== modfiyAuthentication()");
		
		$.ajax({
			type:'put',
			url:'admin/authentication',
			data:JSON.stringify(UserAuthentication),
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
	
	function modifyOrdersStatus1(changeStatus, callback, error) {
		console.log("========== modifyOrdersStatus1()");
		alert("변경변경");
		$.ajax({
			type:'put',
			url:'admin/modifyOrdersStatus',
			data:JSON.stringify(changeStatus),
			contentType:"application/json;charset=utf-8",
			success:function(result,status,xhr){
				alert("변경 성공");
				if(callback){
					callback(result);
				}
			}, error:function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	/*function modifyOrdersStatus1(changeStatus, ordersNo) {
		console.log("========== modifyOrdersStatus1()");
		alert("변경변경");
		$.ajax({
			url : '/warm/admin/modifyOrdersStatus?orders_status='+changestatus+'&ordersNo='+ordersNo,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				alert("변경 성공");
				
			}, error : function() {
				console.log("error!");
			}
		})
		
		
	}*/
	

	return {
		get:get,
		getReview:getReview,
		getUser:getUser,
		getCommListWithPaging:getCommListWithPaging,
		getReviewListWithPaging:getReviewListWithPaging,
		modfiyAuthentication:modfiyAuthentication,
		modifyOrdersStatus1:modifyOrdersStatus1
	};
})();