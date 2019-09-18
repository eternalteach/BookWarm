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
			});
		});
		
		// modal-more-record의 삭제 버튼 클릭
		$(".recordDeleteBtn").on("click",function(e){
			var write_no=$(this).attr("data-write_no");
			
			recordService.remove(write_no,function(result){
				alert(result);
				//삭제 후 list 다시 가지고오기
			});
		});
		
	});
	

	
</script>
