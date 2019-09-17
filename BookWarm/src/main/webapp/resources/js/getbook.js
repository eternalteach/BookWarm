console.log("getBookService Module..........................................");

var getBookService = (function() {

	// search book
	 function searchTitle(title){
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
		          success : function(result){
		     		 bookData=result;
		     		makeBookTable(result);
		          }
		      });
		    }
		}  
	
		// get book data
		function getBookData(bookData, callback, error) { 
			console.log("commentService..............................................");

			$.ajax({
				type : 'post',
				url : 'getbook/bookinfo',
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

	return {
		getBookData : getBookData
	};
})();