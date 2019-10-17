console.log("bookService");

var bookService = (function() {
	//add user choice book into database
	function addUserBook(addUserBook, callback, error) {
		console.log("========== bookService.addUserBook()");
		$.ajax({
			type : 'post',
			url : 'library/addBook',
			data : JSON.stringify(addUserBook),
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
	// search book
	 function searchTitle(title,callback, error){
		 console.log("========== searchTitle() ==========");
		    event.preventDefault();
		    if(title !== undefined && title !== ""){
		        $.ajax({
		 			url: "https://dapi.kakao.com/v3/search/book",
					headers: {'Authorization': 'KakaoAK a419f03c87401f1ade43abeb89afac92'},
					type : "get",
					data:{
					query: title,
					page:1,
					size: 20,
					target:'title'
		          },
		          success : function(result, status, xhr) {
						if (callback) {
							callback(result);
						}
					}
		      });
		    }
		}  
	
		// get book data
		function addBookData(bookData, callback, error) { 
			console.log("========== addBookData() ==========");

			$.ajax({
				type : 'post',
				url : '/warm/book/bookinfo',
				data : JSON.stringify(bookData),
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

		function getBookInfo(isbn,callback,error){
			console.log("========== BookService.getBookInfo()")
			$.get("book/getBookInfo/"+isbn+".json",function(result){
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
		addUserBook:addUserBook,
		searchTitle:searchTitle,
		addBookData : addBookData,
		getBookInfo:getBookInfo
	};
})();