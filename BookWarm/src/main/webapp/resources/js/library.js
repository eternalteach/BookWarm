console.log("Library Module..........................................");

var libraryService = (function() {
	function getList(callback, error){
		
		$.getJSON("library/getList.json",
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
	function remove(isbn, callback, error){
		$.ajax({
			type:'delete',
			url : 'library/delete/'+isbn,
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

	return {
		getList:getList,
		remove:remove
	};
})();