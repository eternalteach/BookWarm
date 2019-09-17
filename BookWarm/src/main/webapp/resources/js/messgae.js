console.log("message..............")

/*var action ='';
var url ='';
var type='';
var bno =0;*/

$(document).ready(function(){
	
	//쪽지보내기 버튼 클릭
	$("#send").click(function(){
/*		console.log("모달창");
		alert("왜안떠");
		
		action='create';
		type='POST';*/
		$("#modal-title").text("쪽지 쓰기");
		$("#myModal").modal();
	});

	
});