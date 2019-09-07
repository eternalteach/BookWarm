﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-navonly.jsp"%>



					<div>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<td>Title &nbsp;
									${sellectedCommunityBoardPost.comm_subject}&nbsp;${sellectedCommunityBoardPost.comm_title}</td>
								<td>작성일 &nbsp; ${sellectedCommunityBoardPost.comm_written_time}</td>
							</tr>
							<tr>
								<td colspan="2">작성자 &nbsp; ${sellectedCommunityBoardPost.user_id}</td>
							</tr>
							<tr>
								<td colspan="2">내용</td>
							</tr>
							<tr>
								<td colspan="2">${sellectedCommunityBoardPost.comm_content}</td>
							</tr>
							<tr>
								<td colspan="2" align='right'><a>이 작성자의 게시글 더 보기</a> &nbsp;
									&nbsp; &nbsp;</td>
							</tr>
							<tr>
								<td colspan="2">조회수 &nbsp;
									${sellectedCommunityBoardPost.comm_clicked} &nbsp;
									&nbsp;좋아요&nbsp;2&nbsp;(하트)</td>
							</tr>
							<tr>
								<td colspan="2">
									<a class="submit" href="communityboardmodify">수정</a> &nbsp;&nbsp; 
									<a class="submit" href="communityboard">목록보기</a> &nbsp;&nbsp; 
									<a class="submit" href="communityboardreplywrite">답변</a>
								</td>
							</tr>
						</table>
						<!-- comment -->
						<div class="comment">
							<div class='row'>
								<div class='col-lg-12'>
									<div class='panel panel-default'>
										<div class='panel-heading'>
											<i class='fa fa-comments fa-fw'>
											</i>Comment <button id='addCommentBtn' class='btn btn-primary btn-xs pull-right'>New Comment</button>
										</div>
											<div><br/></div>
										<div class='panel-body'>
											<ul class='chat'>
											<!-- start comment -->
											<li class='left clearfix' data-comm_cmt_no='12'>
												<div>
													<div class='header'>
														<strong class='primary-font'>user00</strong>
														<small class='pull-right text-muted'>2019-09-05</small>
													</div>
													<p>Good Job!!</p>
												</div>
											</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end comment -->
						<form id='pagingActionForm' method='get'>
							<input type='text' hidden='hidden' id='pageNum' name='pageNum' value='${criteria.pageNum}'> 
							<input type='text' hidden='hidden' id='amount' name='amount' value='${criteria.amount}'>
							<input type='text' hidden='hidden' id='comm_no' name='comm_no' value='${sellectedCommunityBoardPost.comm_no}'>
						</form>
					</div>
					
					<!-- add Comment Modal -->
					<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        				<div class="modal-dialog">
          					<div class="modal-content">
            						<div class="modal-header">
              							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              							<h4 class="modal-title" id="myModalLabel">Comment MODAL</h4>
            						</div>
            						<div class="modal-body">
              							<div class="form-group">
                							<label>Comment</label> 
               								<input class="form-control" name='comm_cmt_content' value='New Comment!!!!'>
              							</div>      
              							<div class="form-group">
                							<label>User Name</label> 
                							<input class="form-control" name='user_id' value='user_id'>
              							</div>
              							<div class="form-group">
                							<label>Comment Date</label> 
               								<input class="form-control" name='comm_cmt_written_time' value='2018-01-01 13:13'>
              							</div>
            						</div>
								<div class="modal-footer">
        							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
       								<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        							<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        							<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      							</div> 
							</div>
          <!-- /.modal-content -->
        				</div>
        <!-- /.modal-dialog -->
      				</div>
      <!-- end modal -->
<script type="text/javascript" src="resources/js/comment.js"></script>

<script>
// comment view code
$(document).ready(function(){
	var comm_noValue='<c:out value="${sellectedCommunityBoardPost.comm_no}"/>';
	var commentUL=$(".chat");
	showList(1);
	
	function showList(page){
		commentService.getList({comm_no:comm_noValue,page:page||1},function(list){
			var str="";
			if(list ==null||list.length==0){
				commentUL.html("");
				return;
			}
			for(var i=0, len=list.length||0;i<len;i++){
				str+="<li class='left clearfix' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>";
				str+="<div><div class='header'><strong class='primary-font'>"+list[i].user_id+"</strong>";
				str+="<small class='pull-right text-muted'>"+list[i].comm_cmt_written_time+"</small></div>";
				/* str+="<small class='pull-right text-muted'>"+commentService.displayTime(list[i].comm_cmt_written_time)+"</small></div>"; */
				str+="<p>"+list[i].comm_cmt_content+"</p></div></li>";
			}
			commentUL.html(str);
		});
	} // end showList
	
	var modal=$(".modal");
	var modalInputComment=modal.find("input[name='comm_cmt_content']");
	var modalInputUser_id=modal.find("input[name='user_id']");
	var modalInputCommentDate=modal.find("input[name='comm_cmt_written_time']");
	
	var modalModBtn=$("#modalModBtn");
	var modalRemoveBtn=$("#modalRemoveBtn");
	var modalRegisterBtn=$("#modalRegisterBtn");
	
	$("#addCommentBtn").on("click",function(e){
		modal.find("input").val("");
		modalInputCommentDate.closest("div").hide();
		modal.find("button[id!='modalCloseBtn']").hide();
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	
});
</script>

<script>
// ===================== Community Board Comment Test script ===================== 
	$(document).ready(function() {

		console.log(commentService); // this code can see comment.js functions
		console.log("=======================");
		console.log("JS TEST");
		var comm_noValue='<c:out value="${sellectedCommunityBoardPost.comm_no}"/>';
		
		// for commentService add test
		/* commentService.add(
		{comm_cmt_content:"JS Test", user_id:"tester", comm_no:comm_noValue},
		function(result){
			alert("RESULT: "+result);
			}
		); */
		
		// for commentService getList Test
		/* commentService.getList({
			comm_no:comm_noValue,page:1},function(list){
				for(var i=0, len=list.length||0; i<len; i++){
					console.log(list[i]);
					}
		}); */
		
		//for commentService delete Test
		/* commentService.remove(2,function(count){
			console.log(count);
			if(count==="success"){
				alert("REMOVE");
			}
		},function(err){
			alert('ERROR');
		}); */
		
		// for commentService modify Test
		/* commentService.update({
			comm_cmt_no:11,
			comm_no:comm_noValue,
			comm_cmt_content:"Modified comment"
		},function(result){
			alert("수정완료");
		}); */
		
		// for commentService get Test
		/* commentService.get(10,function(data){
			console.log(data); 
		});*/
	});
</script>

<script>
// paging script
	$(document).ready(function() {
		var pagingActionForm = $("#pagingActionForm");
		$(".submit").on("click", function(e) {
			e.preventDefault(); // a태그 클릭해도 페이지 이동 없도록
			let moveNextPage=$(this).attr("href");
			pagingActionForm.attr("action",moveNextPage);
			pagingActionForm.submit();
		});
	});
</script>
<%@ include file="includes/footer/footer-1.jsp"%>
