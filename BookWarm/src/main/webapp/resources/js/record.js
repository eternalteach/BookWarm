console.log("recordService Module..........................................");

var recordService = (function() {
	//add comment
	function add(addRecord, callback, error) { // comment : object, callback : callback
		console.log("add Record..............................................");

		$.ajax({
			type : 'post',
			url : 'recordwrite',
			data : JSON.stringify(addRecord),
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
	
	//수정을 위해 write_no 제공하여 해당 write_no의 게시글 받기
	function get(write_no, callback, error){
		$.getJSON("recordModify/"+write_no+".json",
				function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function update(record, callback, error){
		$.ajax({
			type:'put',
			url:'recordModifySave/'+record.write_no,
			data:JSON.stringify(record),
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
	
	//삭제를 위해 write_no 제공하여 해당 write_no의 게시글 삭제
	function remove(write_no, callback, error){
		$.getJSON("recordRemove/"+write_no+".json",
				function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	
	function getList(param, callback, error){
		var user_id=param.user_id;
		var isbn = param.isbn;
		
		$.getJSON("getRecordList/"+user_id+"/"+isbn+".json",
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
	
	
	return {
		getList:getList,
		add : add,
		get:get,
		update:update,
		remove:remove
	};
})();