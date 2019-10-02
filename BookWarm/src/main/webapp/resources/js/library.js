console.log("========== Library Module");

var libraryService = (function() {
	function getUserBooksList(callback, error){
		console.log("========== Library.getList()")
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
	
	// delete book on library
	function removeBookOnLibrary(isbn, callback, error){
		console.log("========== Library.remove()")
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
		getUserBooksList:getUserBooksList,
		removeBookOnLibrary:removeBookOnLibrary
	};
})();