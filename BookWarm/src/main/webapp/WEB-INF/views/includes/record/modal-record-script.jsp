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
// 개선해보자. 모달 클릭시 두개 다 뜨는 문제가 있어서 if문으로 나눠서했다. 클릭시 하나만 뜨게 하는것 수정해보기
	function openModal(modalname) {
		$("#modal").fadeIn(300);
		$("." + modalname).fadeIn(300);
	}
/* 	function openModal(modalname) {
		$("#modal").fadeIn(300);
		$("." + modalname).fadeIn(300);
		if(modalname=="modal-more-record"){
			$(".modal-add-record").hide();
		}else{
			$(".modal-more-record").hide();
		}
	} */

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
	});
</script>
