console.log("Reply Module......");

var replyService = (function(){
	
//	댓글 추가
	function add(reply, callback, error) {
		
		console.log("add reply");
		
		$.ajax({
			type : 'post',
			url : '/warm/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
		
	}
	
//	댓글 불러오기
	function getList(param, callback, error) {
		
		var review_no = param.review_no;
		var page = param.page || 1;
		
		$.getJSON("/warm/replies/pages/" + review_no + "/" + page + ".json",
				function(data) {
					if (callback) {
						callback(data);
					}
			}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	
//	댓글 삭제
	function remove(review_re_no, callback, error) {
		
		$.ajax({
			type : 'delete',
			url : '/warm/replies/' + review_re_no,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
//	댓글 수정
	function update(reply, callback, error) {
		
		console.log("Review_re_no: " + reply.review_re_no);
		
		$.ajax({
			type : 'put',
			url : '/warm/replies/' + reply.review_re_no,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
//	댓글 조회
	function get(review_re_no, callback, error) {
		
		$.get("/warm/replies/" + review_re_no + ".json", function(result) {
			
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
//	시간 처리
//	작성한 지 24시간이 지난 댓글은 날짜로, 이내의 글은 시간으로 표시
	function displayTime(timeValue) {
		
		var today = new Date();
		var dateObj = new Date(timeValue);
		
		var gap = today.getTime() - timeValue;
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
			
		} else {
			
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
			
		}
	};

	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
	
})();