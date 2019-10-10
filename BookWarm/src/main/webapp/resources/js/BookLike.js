console.log("BookLike Module..........................................");

var bookLikeService = (function() {
	function addBookLike(bookLike, callback, error) {
		console.log("addBookLike..............................................");
		$.ajax({
			type : 'post',
			url : '/warm/BookLike/add',
			data : JSON.stringify(bookLike),
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
		});
	}
	
	function getListMyBookLike(param, callback, error){
		
		$.getJSON("/warm/BookLike/getMyBookLike.json",
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
	
	function removeBookLikeAboutISBN(isbn, callback, error){
		console.log("removeBookLikeAboutISBN : "+isbn);
		$.ajax({
			type:'delete',
			url : '/warm/BookLike/remove/'+isbn,
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
	
	function checkBookLikeAboutISBN(isbn,callback,error){
		$.get("/warm/BookLike/"+isbn+".json",function(result){
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
		addBookLike:addBookLike,
		getListMyBookLike:getListMyBookLike,
		removeBookLikeAboutISBN:removeBookLikeAboutISBN,
		checkBookLikeAboutISBN:checkBookLikeAboutISBN
	};
})();