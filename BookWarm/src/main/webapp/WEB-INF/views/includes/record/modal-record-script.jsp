<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



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
		$(".modal-close").on('click', function(e) {
			if (!($(e.target).hasClass("modal-record"))) {
				$("#modal").fadeOut(300);
				$(".modal-record").fadeOut(300);
			}
		});
		
		$(document).ready(function() {
			$('#submitloging').submit(
							function(e) {
								e.preventDefault();
								var isbn = $("#isbn").val();
								var start_page = $("#start_page").val();
								var end_page = $("#end_page").val();
								var start_date = $("#start_date").val();
								var datetime = $("#datetime")
								var end_date=$("#end_date").prop("checked");
								start_date += "T00:00:00.000+09:00";
								$("#submit_start_date").val(start_date);
								
								if (parseInt(start_page) > parseInt(end_page)) {
									console.log(start_page);
									console.log(end_page);
									alert("시작 페이지는 종료 페이지보다 클 수 없습니다.");
									return false;
								}
								
								var logingVO={
										isbn:isbn,
										start_page:start_page,
										end_page:end_page,
										start_date:start_date,
										end_date:end_date
								};
								
								recordService.add(logingVO,function(result){
									alert(result);
									showList();
									// showlist 해야한다.
								});
								// modal-add-record 숨기기
								$("#modal").hide();
								$(".modal-add-record").hide();
								$("#start_page").val("");
								$("#end_page").val("");
								$("#start_date").val("");
								$("#end_date").prop("checked",false);
								showList();
								showFrontRecordInfo();
							});
		});
		
			$('#submitModifyRecord').submit(
							function(e) {
								e.preventDefault();
								var write_no = $("#modifyWrite_no").val();
								var start_page = $("#modifyStart_page").val();
								var end_page = $("#modifyEnd_page").val();
								var start_date = $("#modifyStart_date").val();
								var user_id = $("#modifyUser_id").val();
								alert(user_id);
								start_date += "T00:00:00.000+09:00";
								$("#submit_start_date").val(start_date);
								var end_date=$("#modifyEnd_date").prop("checked");
								if (parseInt(start_page) > parseInt(end_page)) {
									alert("시작 페이지는 종료 페이지보다 클 수 없습니다.");
									return false;
								}
								
								var logingVO={
										write_no:write_no,
										user_id:user_id,
										start_page:start_page,
										end_page:end_page,
										start_date:start_date,
										end_date:end_date
								};
								
								recordService.update(logingVO,function(result){
								console.log("update 안");
									alert(result);
									// showlist 해야한다.
								});
								
								
								$(".modal").fadeOut(300);
								$(".modal-modify-record").fadeOut(300);
								
								$("#modifyWrite_no").val("");
								$("#modifyStart_date").val("");
								$("#modifyEnd_page").val("");
								$("#modifyStart_page").val("");
								$("#modifyEnd_date").prop("checked",false);
							// modal-more-record 를 다시 호출하기
								showList();
								showFrontRecordInfo();
							});
		
		// modal-more-record의 삭제 버튼 클릭
		$(".recordView").on("click","button", function(e){
			
			if($(this).attr("class")=="recordDeleteBtn"){
				var write_no=$(this).attr("data-write_no");
				alert("write_no : "+write_no);
				recordService.remove(write_no,function(result){
				alert(result);
				
				});
			}
			
			if($(this).attr("class")=="recordModifyBtn"){

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
				
			}
			
			showList();
			showFrontRecordInfo();
		});
		
		function showList(){
			console.log("show list");
			var recordView=$(".recordView");
			
			var user_id="${user_id}";
			var isbn= ${bookVO.isbn};
			// user_id 와 isbn 받아오기
			recordService.getList({user_id:user_id,isbn:isbn},function(result){
				var str="";
				if(result ==null||result.length==0){
					recordView.html(str);
					return;
				}
				str+="<table class='recordTable'><tr>";
				for(var i=0;i<result.length;i++){
					str+="<div class='post-meta-info' style='text-align: center;'>";
					str+="<span class='blog-categories minor-meta'><td class='recordYear'>";
					str+="<span class='comment-container minor-meta'>"; 
					str+=displayTimeService.displayTime(result[i].start_date);
					str+="</span></td>"
					str+="<span class='comment-container minor-meta'> <td class='divPage'><span class='text-sep'>&nbsp;|&nbsp;</span></td><td class='recordPage'>&nbsp;p."+result[i].start_page+"</td><td class='divPage'>-</td><td class='recordPage'>&nbsp;p."+result[i].end_page+"</td></span>";
					str+="<td class='divPage'><span class='text-sep'>&nbsp;|&nbsp;</span></td>"; 
					str+="<td class='recordModifyBtnTD'><a href="+"\""+"javascript:openModal("+"'modal-modify-record')"+"\""+"><button class='recordModifyBtn transparent' data-write_no='"+result[i].write_no+"' style='border: none;'><i class='icon icon-pen-3'></i></button></a></td>";
					str+="<td class='recordDeleteBtnTD'><button class='recordDeleteBtn transparent' data-write_no='"+result[i].write_no+"' style='border: none;'><i class='fa fa-trash-o'></i></button></td>";
					str+="</span>";
					str+="</div></tr>";
				}
				str+="</table>";
				recordView.html(str);
			});
			
		} // end showList
		
		function showFrontRecordInfo(){
			console.log("showFrontRecordInfo");
			var frontRecordInfo=$(".frontRecordInfo");
		
			var user_id="${user_id}";
			var isbn= ${bookVO.isbn};
			// user_id 와 isbn 받아오기
			recordService.getFrontRecordInfo({user_id:user_id,isbn:isbn},function(recordInfo){
				var str="";
				str+="<div class='progress-label'>";
				str+="<span>Reading</span>";
				str+="</div>";
				str+="<div class='progress'>";
				str+="<div class='progress-bar progress-bar-primary' data-appear-progress-animation='"+recordInfo.reading+"%' style=\"width: "+recordInfo.reading+"%;\"></div>";
				str+="<span class='progress-bar-tooltip'>"+recordInfo.reading+"%</span>";
				str+="</div>";
				str+="<div class='content-grid-item col-md-12'>";
				str+="<div class='counters'>";
				str+="<div class='progress-label'>";
				str+="<span>ReadingPage</span>&nbsp; &nbsp;<strong class='primary-color' data-to=\""+recordInfo.readPageNum+"\" data-plugin-options=\"{&quot;decimals&quot;: 0}\">"+recordInfo.readPageNum+"</strong>";
				str+="</div>";
				str+="</div>";
				str+="<div class='counters'>";
				str+="<div class='progress-label'>";
				str+="<span>TotalPage</span>&nbsp; &nbsp;<strong class='primary-color' data-to=\""+${bookVO.book_tot_page}+"\" data-plugin-options=\"{&quot;decimals&quot;: 0}\">"+${bookVO.book_tot_page}+"</strong>";
				str+="</div>";
				str+="</div>";
				str+="<div class='counters'>";
				str+="<div class='progress-label'>";
				str+="<span>Record</span>&nbsp; &nbsp;";
				str+="<a href=\"javascript:openModal('modal-more-record')\"><strong class='primary-color' data-to=\""+recordInfo.logingCount+"\" data-plugin-options=\"{&quot;decimals&quot;: 0}\">"+recordInfo.logingCount+"</strong></a>";
				str+="</div>";
				str+="<div class='special-heading text-left'>";
				str+="<a href=\"javascript:openModal('modal-add-record')\">&nbsp; &nbsp;<strong class='primary-color'>Record write</strong>";
				str+="</a>";
				str+="</div>";
				str+="</div>";
				str+="</div>";
				frontRecordInfo.html(str);

			});
		} // end showList
		
	});
	
</script>
