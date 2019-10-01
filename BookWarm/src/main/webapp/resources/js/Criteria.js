console.log("pagingService..........................................");
var pagingService = (function() {
	
	// Input -> 페이지 번호, 게시글 총 수, 페이지 영역
	// Output -> 페이지영역에 페이징처리
	function paging(pageNum,PostsCnt,pagingDiv){
		let endNum=Math.ceil(pageNum/10.0)*10;
		let startNum = endNum -9;
		
		let prev=startNum != 1;
		let next = false;
		
		if(endNum * 10 >= PostsCnt){
			endNum=Math.ceil(PostsCnt/10.0);
		}
		
		if(endNum*10<PostsCnt){
			next=true;
		}
		
		let str="<ul class='pagination pull-right'>";
		
		if(prev){
			str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		
		for(let i= startNum; i<=endNum; i++){
			let active = pageNum == i? "active":"";
			str+="<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		str+="</ul></div>";
		
		pagingDiv.html(str);
		console.log(str);
	}
	return {
		paging:paging
	};
})();