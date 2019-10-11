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
	function getMyBooks(callback, error){ //모든 책 가져오기
		console.log("========== Library.getList()")
		$.getJSON("library/getMyBooks.json",
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
			url : 'library/modify/'+isbn,
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
	// add past book on library
	function reAddBookOnLibrary(isbn, callback, error){
		console.log("========== Library.reAdd()")
		$.ajax({
			type:'delete',
			url : 'library/readd/'+isbn,
			success: function(Result,status,xhr){
				if(callback){
					callback(Result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}}
		});
	}
	function removeMyBook(isbn, callback, error){
		console.log("========== removeMyBook()")
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
		removeBookOnLibrary:removeBookOnLibrary,
		getMyBooks:getMyBooks,
		removeMyBook:removeMyBook,
		reAddBookOnLibrary:reAddBookOnLibrary
	};
})();