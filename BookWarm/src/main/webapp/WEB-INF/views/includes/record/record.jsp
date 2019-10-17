<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/warm/resources/js/record.js"></script>
<script type="text/javascript" src="/warm/resources/js/DateJsonToJsp.js"></script>
<section class="section-primary alternate-color b-bordered" style="min-width:170px; padding-top:25px">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="special-heading word-underline">
					<h4 class="special-heading-inner">
						<span> Reading Log </span>
					</h4>
				</div>
				<article class="v_blog-item">
					<div class="v_blog-item-inner row">
						<div class="v_blog-item-media col-md-12">
							<ul class="mb-3">
                                <li>
                                    <a href="#">
                                    	<c:choose>
                                    		<c:when test="${!empty bookVO.book_img}">
	                                    		<img src="${bookVO.book_img}" style="display:block; margin:auto; margin-bottom:15px">
                                    		</c:when>
                                    		<c:when test="${empty bookVO.book_img}">
	                                    		<img class="w-50" src="/warm/resources/img/happyGeneralB_dark3.png" style="display:block; margin:auto; margin-bottom:15px">
                                    		</c:when>
                                    	</c:choose>
                            		</a>
                            	</li>
                                <li style="text-align:center"><strong>${bookVO.book_title}</strong></li>
                                <li style="text-align:center">${fn:substring(bookVO.writer_name, 1, fn:length(bookVO.writer_name)-1)}</li>
                            </ul>
                            <p class="star text-center mb-1">
                            	<a class="on" id="star1">★</a>
                            	<a class="on" id="star2">★</a>
                            	<a class="on" id="star3">★</a>
                            	<a class="on" id="star4">★</a>
                            	<a class="on" id="star5">★</a>
                            </p>
                            <div class="text-center explArea m-1"></div>
						</div>
					</div>
				</article>
				<div class="progress-bars v2 frontRecordInfo mt-6">
					<div class="progress-label col-md-12" style="width:80%">
						<span>${recordInfo.reading}% Finished</span>
					</div>
					<div class="progress mx-auto" style="width:90%">
						<div id="reading" class="progress-bar bg-info progress-bar-striped progress-bar-animated" data-appear-progress-animation="${recordInfo.reading}%"></div>
						<span class="progress-bar-tooltip">${recordInfo.reading}%</span>
					</div>
					<div class="content-grid-item col-md-12">
						<div class="counters">
							<div class="progress-label">
								<span>Pages Read</span>&nbsp; &nbsp;<strong class="primary-color" data-to="${recordInfo.readPageNum}" data-plugin-options="{&quot;decimals&quot;: 0}">${recordInfo.readPageNum}</strong>
							</div>
						</div>
						<div class="counters">
							<div class="progress-label">
								<span>Total Pages</span>&nbsp; &nbsp;<strong class="primary-color" data-to="${bookVO.book_tot_page}" data-plugin-options="{&quot;decimals&quot;: 0}">${bookVO.book_tot_page}</strong>
							</div>
						</div>
						<div class="counters">
							<div class="progress-label">
							<!-- open more record modal -->
								<span>Record</span>&nbsp; &nbsp;
								<a href="#modal-more-record" data-toggle="modal" ><strong class="primary-color" data-to="${recordNum}" data-plugin-options="{&quot;decimals&quot;: 0}">${recordNum}</strong></a>
							</div>
						</div>
							<!-- open add record modal -->
						<div class="counters">
							<div class="progress-label mt-4" style="text-align:center; height:50px">
								<span><button type="button" class="btn" data-toggle="modal" data-target="#modal-add-record" style="margin:0;">Add</button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="modal-more-record" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				                <!-- 기록 보는 모달창 -->
				<div class="post-header form-header">
					<h3> <span class="blog-author minor-meta"> Posted by 
						<span class="entry-author-link"> 
							<span class="vcard author">
								<span class="v-blog-item-details"> <a href="#" title="Posts by HB-Themes" rel="author">${user_id}</a></span>
							</span>
						</span>
					</span></h3>
				
					<div class="center" style="overflow:auto; width:340px; height:250px;">
						<!-- recordView는 JS로 처리 -->
						<div class="recordView"></div>
					</div>
					<div class="form-horizontal center">
						<br/>
						<button type="button" class="close col-sm-6" data-dismiss="modal">Close</button>
						<br/>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-add-record" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
				<!-- 기록 쓰는 모달창 -->
			<div class="modal-body post-content">
				<div class="post-header form-header">
					<form id="submitloging" class="form-horizontal" >
						<div class="form-body">
							<input type="text" id="isbn" name="isbn" hidden='hidden' value="${bookVO.isbn}"><br />
							<input type="text" hidden='hidden' id="submit_start_date" name="start_date" value="">
							<input type="datetime-local" hidden='hidden' id="datetime" name="" value="">
							<div class="form-group form-inline">
								<div class="col-sm-4 special-heading word-underline-2">
									<span class="close">Record</span>
								</div>
							</div>
							<div class="form-group form-inline">
								<label for="start_page" class="col-sm-4 control-label">Start Page</label>
								<div class="col-sm-8">
									<input type="number" min="1" max="${bookVO.book_tot_page}" id="start_page" class="col-sm-10 btn-outline-secondary" name="start_page">
								</div>
							</div>
														
							<div class="form-group form-inline">
								<label for="end_page" class="col-sm-4 control-label">End Page</label>
								<div class="col-sm-8">
									<input type="number" min="1" max="${bookVO.book_tot_page}" id="end_page" class="col-sm-10 btn-outline-secondary" name="end_page">
								</div>
							</div>
													
							<div class="form-group form-inline">
								<label for="start_date" class="col-sm-4 control-label">읽은 날</label>
								<div class="col-sm-8">
									<input type="date" id="start_date" class="col-sm-10 btn-outline-secondary" name="start_date">
								</div>
							</div>
														
							<div class="form-group form-inline">
								<label for="end_date" class="col-sm-4 control-label">완독여부</label>
								<div>
									<input type="checkbox" id="end_date" name="end_date">
								</div>
							</div>
						</div>
						
						<div class="form-footer form-inline pull-right">
							<div class="form-inline">
							<button type="submit" class="close">Record</button>
							</div>
							<div class="col-sm-1"></div>
							<div class="cta-btn form-inline">
							<button type="button" class="close col-sm-6" data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-modify-record" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
	                <!-- 기록 수정하는 모달창 -->
				<div class="post-header form-header">
					<form id="submitModifyRecord" class="form-horizontal" >
						<div class="form-body">
							<input type="text" id="modifyWrite_no" name="write_no" hidden='hidden' >
							<input type="text" id="modifyUser_id" name="user_id" hidden='hidden' >
							<input type="text" id="isbn" name="isbn" hidden='hidden' value="${bookVO.isbn}"><br />
							<input type="text" hidden='hidden' id="submit_start_date" name="start_date">
							<input type="datetime-local" hidden='hidden' id="datetime">
							
							<div class="form-group form-inline">
								<div class="col-sm-4 special-heading word-underline-2">
									<span class="close">Record</span>
								</div>
							</div>
							<div class="form-group form-inline">
								<label for="modifyStart_page" class="col-sm-4 control-label">Start Page</label>
								<div class="col-sm-8">
									<input type="number" id="modifyStart_page" class="col-sm-10 btn-outline-secondary" name="start_page">
								</div>
							</div>
														
							<div class="form-group form-inline">
								<label for="modifyEnd_page" class="col-sm-4 control-label">End Page</label>
								<div class="col-sm-8">
									<input type="number" id="modifyEnd_page" class="col-sm-10 btn-outline-secondary" name="end_page">
								</div>
							</div>
													
							<div class="form-group form-inline">
								<label for="modifyStart_date" class="col-sm-4 control-label">읽은 날</label>
								<div class="col-sm-8">
									<input type="date" id="modifyStart_date" class="col-sm-10 btn-outline-secondary" name="start_date">
								</div>
							</div>
														
							<div class="form-group form-inline">
								<label for="modifyEnd_date" class="col-sm-4 control-label">완독여부</label>
								<div>
									<input type="checkbox" id="modifyEnd_date" name="end_date">
								</div>
							</div>
						</div>
						
						<div class="form-footer form-inline pull-right">
							<div class="form-inline">
							<button type="submit" class="close">Record</button>
							</div>
							<div class="col-sm-1"></div>
							<div class="cta-btn form-inline">
							<button type="button" class="close col-sm-6" data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				</div>
            </div>
        </div>
    </div>
</div>
<!-- Modal End -->
<script type="text/javascript">
		$(document).ready(function() {
			showList();
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
		
			$('#submitModifyRecord').submit(
							function(e) {
								e.preventDefault();
								var write_no = $("#modifyWrite_no").val();
								var start_page = $("#modifyStart_page").val();
								var end_page = $("#modifyEnd_page").val();
								var start_date = $("#modifyStart_date").val();
								var user_id = $("#modifyUser_id").val();
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
								});
								
								$("#modifyWrite_no").val("");
								$("#modifyStart_date").val("");
								$("#modifyEnd_page").val("");
								$("#modifyStart_page").val("");
								$("#modifyEnd_date").prop("checked",false);
								showList();
								showFrontRecordInfo();
							});
		
		// modal-more-record의 modify or delete 버튼 클릭시 이벤트
		$(".recordView").on("click","button", function(e){
			console.log("recordView Click");
			console.log("write_no"+$(this).closest("tr").attr("data-write_no"));
			console.log("class"+$(this).closest("td").attr("data-write_no"));
			var recordViewWrite_no=$(this).closest("tr").attr("data-write_no");
			
			if($(this).closest("td").attr("class")=="recordDeleteBtnTD"){
				console.log("recordView DeleteBtn Click");
				recordService.remove(recordViewWrite_no,function(result){
				alert(result);
				});
			} else if($(this).closest("td").attr("class")=="recordModifyBtnTD"){
				recordService.get(recordViewWrite_no,function(record){
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

			recordService.getList({user_id:user_id,isbn:isbn},function(result){
				var str="";
				if(result ==null||result.length==0){
					recordView.html(str);
					return;
				}
				
				str+="<div class='post-meta-info' style='text-align: center;'>";
				str+="<table class='recordTable'>";
				for(var i=0;i<result.length;i++){
					str+="<tr data-write_no='"+result[i].write_no+"'>";
					str+="<td class='recordYear'><span class='blog-categories comment-container minor-meta'>"+displayTimeService.displayTime(result[i].start_date)+"</span></td>";
					str+="<td class='divPage'><span class='comment-container minor-meta text-sep'>&nbsp;|&nbsp;</span></td>";
					str+="<td class='recordPage'><span class='comment-container minor-meta text-sep'>&nbsp;p."+result[i].start_page+"</span></td>";
					str+="<td class='divPage'>-</td>";
					str+="<td class='recordPage'><span class='comment-container minor-meta text-sep'>&nbsp;p."+result[i].end_page+"</span></td>";
					str+="<td class='divPage'><span class='comment-container minor-meta text-sep'>&nbsp;|&nbsp;</span></td>"; 
					str+="<td class='recordModifyBtnTD'><button class='transparent' data-write_no='"+result[i].write_no+"' data-toggle='modal' data-target='#modal-modify-record' style='border: none;'><i class='icon icon-pen-3'></i></button></td>";
					str+="<td class='recordDeleteBtnTD'><button class='transparent' data-write_no='"+result[i].write_no+"' style='border: none;'><i class='fa fa-trash-o'></i></button></td>";
					str+="</tr>";
				}
					str+="</table>";
					str+="</div>";
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
				str+="<div class=\"progress-label\">";
				str+="<span>"+recordInfo.reading+"% Finished</span>";
				str+="</div>";
				str+="<div class='progress'>";
				str+="<div id=\"reading\" class=\"progress-bar bg-info progress-bar-striped progress-bar-animated\" data-appear-progress-animation=\""+recordInfo.reading+"%\" style=\"width:"+recordInfo.reading+"%;\"></div>";
				str+="<span class='progress-bar-tooltip'>"+recordInfo.reading+"%</span>";
				str+="</div>";
				str+="<div class='content-grid-item col-md-12'>";
				str+="<div class='counters'>";
				str+="<div class='progress-label'>";
				str+="<span>Pages Read</span>&nbsp; &nbsp;<strong class='primary-color' data-to=\""+recordInfo.readPageNum+"\" data-plugin-options=\"{&quot;decimals&quot;: 0}\">"+recordInfo.readPageNum+"</strong>";
				str+="</div>";
				str+="</div>";
				str+="<div class='counters'>";
				str+="<div class='progress-label'>";
				str+="<span>Total Pages</span>&nbsp; &nbsp;<strong class='primary-color' data-to=\""+${bookVO.book_tot_page}+"\" data-plugin-options=\"{&quot;decimals&quot;: 0}\">"+${bookVO.book_tot_page}+"</strong>";
				str+="</div>";
				str+="</div>";
				str+="<div class='counters'>";
				str+="<div class='progress-label'>";
				str+="<span>Record</span>&nbsp; &nbsp;";
				str+="<a href='#modal-more-record' data-toggle='modal'><strong class='primary-color' data-to=\""+recordInfo.logingCount+"\" data-plugin-options=\"{&quot;decimals&quot;: 0}\">"+recordInfo.logingCount+"</strong></a>";
				str+="</div>";
				str+="<div class=\"counters\">";
				str+="<div class=\"progress-label\" style=\"text-align:center; height:50px\">";
				str+="<span><button type=\"button\" class=\"btn\" data-toggle=\"modal\" data-target=\"#modal-add-record\" style=\"margin:0;\">Add</button></span>";
				str+="</div>";
				str+="</div>";
				str+="</div>";
				frontRecordInfo.html(str);

			});
		} // end showList
	});
</script>
