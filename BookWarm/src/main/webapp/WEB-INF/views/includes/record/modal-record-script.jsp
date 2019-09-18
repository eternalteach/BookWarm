<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
#modalRecordDetail {
	width: 365px;
	height: 530px;
	padding-left: 15px;
	padding-right: 15px;
	left: 50%;
	top: 50%;
	
}


.modal {
	left: 20%;
	top: 20%;
	background
}
</style>

<script type="text/javascript">
	// 클릭한 모달창 띄우기
	function openModal(modalname) {
				$("#modal ").fadeIn(300);
				$(".modal-record").hide();
				$("." + modalname).fadeIn(300);
	}

	//esc키 눌렀을 때 모달창 끄기
	$(document).keydown(function(event) {
		if (event.which == '27') {
			$("#modal").fadeOut(300);
			$(".modal-record").fadeOut(300);
		}
	});

	$(document).ready(function() {
		$("#modal").hide();
		showList();
		$(".close").on('click', function(e) {
			if (!($(e.target).hasClass("modal-record"))) {
				$("#modal").fadeOut(300);
				$(".modal-record").fadeOut(300);
			}
		});
		
		// modal-more-record의 수정 버튼 클릭
		$(".recordModifyBtn").on("click",function(e){
			var write_no=$(this).attr("data-write_no");
			
			recordService.get(write_no,function(record){
				console.log("recordService.get 사용후 function 내부 record 값"+record);
				$("#modifyStart_page").val(record.start_page);
				$("#modifyUser_id").val(record.user_id);
				$("#modifyEnd_page").val(record.end_page);
				$("#modifyStart_date").val(displayTimeService.displayTime(record.start_date));
				$("#modifyWrite_no").val(record.write_no);
				$("#modifyEnd_date").prop("checked",record.end_date);
				showList();
			});
		});
		
		// modal-more-record의 삭제 버튼 클릭
		$(".recordDeleteBtn").on("click",function(e){
			var write_no=$(this).attr("data-write_no");
			
			recordService.remove(write_no,function(result){
				alert(result);
				showList();
			});
		});
		
		function showList(){
			console.log("show list");
			var recordView=$(".recordView");
			var user_id="${user_id}";
			var isbn= ${bookVO.isbn};
			alert("user_id : "+user_id);
			alert("isbn : "+isbn);
			// user_id 와 isbn 받아오기
			recordService.getList({user_id:user_id,isbn:isbn},function(result){
				alert("getList 함수 종료 후");
				console.log("getList 함수 종료 후");
				console.log(result);
				console.log(result.length);
				
				var str="";
				if(result ==null||result.length==0){
					return;
				}
				alert(result.length+"리스트 길이")
				for(var i=0;i<result.length;i++){
					str+="<div class='post-meta-info' style='text-align: center;'>";
					str+="<span class='blog-categories minor-meta'>";
					str+="<span class='comment-container minor-meta'>"; 
					
					str+=result[i].start_date;
					str+="</span>"
					str+="<span class='comment-container minor-meta'> &nbsp;&nbsp;p."+result[i].start_page+"&nbsp;&nbsp;-&nbsp;p."+result[i].start_page+"}</span>";
					str+="<span class='text-sep'>&nbsp;|&nbsp;</span>"; 
					str+="<a href='javascript:openModal('modal-modify-record')'><button class='recordModifyBtn' data-write_no='"+result[i].write_no+"' style='border: none;'>Modify</button></a>";
					str+="<button class='recordDeleteBtn' data-write_no='"+result[i].write_no+"' style='border: none;'>Delete</button>";
					str+="</span>";
					str+="</div>";
				}
				recordView.html(str);
				console.log(str);
				console.log("recordView.html(str) 종료 후");
			});
		} // end showList
		
	});
	

	
</script>
