console.log("recordService Module..........................................");

var recordService = (function() {
	//add comment
	function add(logingVO, callback, error) { // comment : object, callback : callback
		console.log("commentService..............................................");

		$.ajax({
			type : 'post',
			url : 'recordwrite',
			data : JSON.stringify(logingVO),
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
		add : add
	};
})();