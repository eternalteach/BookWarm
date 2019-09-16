console.log("message..............")

var action ='';
var url ='';
var type='';
var msg_no=0;

$(document).ready(function(){
	
	//쪽지보내기 버튼 클릭
	$("#send").click(function(){
		console.log("떠야함");
		alert("dd");
		
		action='create';
		type='POST';
		$("#modal-title").text("쪽지 쓰기");
		$("#myModal").show();
	});
	
	
})