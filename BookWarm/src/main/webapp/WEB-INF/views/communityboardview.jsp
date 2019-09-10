<%@ page language="java" contentType="text/html; charset=UTF-8"
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
											<h2><i class='fa fa-comments fa-fw'></i>Comment</h2>
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
													<p>이 글을 본 당신은 행운이 가득한 사람!</p>
												</div>
											</li>
											</ul>
										</div>
										<div class="panel-footer">
										
										</div>
										<div>
											<br/>
											<br/>
										</div>
										<!-- write comment div -->
										<div class="comment-write">
											<div class="modal-content">
            									<div class="modal-header">
              										<h4 class="modal-title" id="myModalLabel">Add Comment</h4>
            									</div>
            								<div class="modal-body">
              									<div class="form-group">
                									<label>Comment</label> 
               										<input class="form-control" name='comm_cmt_content' value='New Comment!!!!'>
              									</div>      
           										<div class="form-group">
                									<label>User Name, get session</label> 
                									<input hidden ='hidden' class="form-control" name='user_id' value='tester'>
              									</div>
              									<div class="form-group">
                									<label>Comment Date 이 부분은 ajax로 비동기통신 통해 1초마다 시간 갱신되게 해보자</label> 
               										<input class="form-control" hidden='hidden' name='comm_cmt_written_time' value='2018-01-01 13:13'>
            									</div>
     										</div>
												<div class="modal-footer">
        											<button id='commentRegisterBtn' type="button" class="btn btn-primary">Register</button>
      											</div> 
											</div>
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
					
<script type="text/javascript" src="resources/js/comment.js"></script>

<script>
// comment view code
$(document).ready(function(){
	var comm_noValue='<c:out value="${sellectedCommunityBoardPost.comm_no}"/>';
	console.log("=====================check paging ============================")
	console.log("comm_noValue : "+comm_noValue);
	var commentUL=$(".chat");
	showList(1);
	
	function showList(page){
		
		console.log("show list" + page);
		
		commentService.getList({comm_no:comm_noValue,page:page||1},function(commentCnt,list){
			
			console.log("commentCnt: " +commentCnt);
			console.log("list"+list);

			if(page==-1){
				pageNum==Math.ceil(commentCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str="";
			if(list ==null||list.length==0){
				return;
			}
			for(var i=0, len=list.length||0;i<len;i++){
				str+="<li class='left clearfix' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>";
				str+="<div><div class='header'><strong class='primary-font'>["+list[i].comm_cmt_no+"]"+list[i].user_id+"</strong>";
				str+="<small class='pull-right text-muted'><button id='commentModfiyBtn' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>수정</button><button id='commentRemoveBtn' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>삭제</button></small></div>";
				str+="<small class='pull-right text-muted'>"+list[i].comm_cmt_written_time+"</small></div>";
				/* str+="<small class='pull-right text-muted'>"+commentService.displayTime(list[i].comm_cmt_written_time)+"</small></div>"; */
				str+="<p>"+list[i].comm_cmt_content+"</p></div></li>";
			}
			
			commentUL.html(str);
			showCommentPage(commentCnt);			
		});
	} // end showList
	
	// comment paging
	var pageNum=1;
	var commentPageFooter = $(".panel-footer");
	
	function showCommentPage(commentCnt){
		var endNum=Math.ceil(pageNum/10.0)*10;
		var startNum = endNum -9;
		
		var prev=startNum != 1;
		var next = false;
		
		if(endNum * 10 >= commentCnt){
			endNum=Math.ceil(commentCnt/10.0);
		}
		if(endNum*10<commentCnt){
			next=true;
		}
		var str="<ul class='pagination pull-right'>";
		if(prev){
			str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		
		for(var i= startNum; i<=endNum; i++){
			var active = pageNum == i? "active":"";
			str+="<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		str+="</ul></div>";
		console.log(str);
		commentPageFooter.html(str);
	}
	
	// click new comment page, get new comment
	commentPageFooter.on("click","li a",function(e){
		e.preventDefault();
		console.log("page click");
		var targetPageNum=$(this).attr("href");
		console.log("targetPageNum: "+targetPageNum);
		pageNum=targetPageNum;
		showList(pageNum);
	});
	
	var commentDiv=$(".comment");
	var commentDivInputCommentContent=commentDiv.find("input[name='comm_cmt_content']");
	var commentDivInputUser=commentDiv.find("input[name='user_id']");
	var commentDivInputCommentDate=commentDiv.find("input[name='comm_cmt_written_time']");
	
	var commentModfiyBtn=$("#commentModfiyBtn");
	var commentRemoveBtn=$("#commentRemoveBtn");
	var commentRegisterBtn=$("#commentRegisterBtn");
	
	// Registe comment At Modal
	
	commentRegisterBtn.on("click",function(e){
		var comment={
				comm_cmt_content:commentDivInputCommentContent.val(),
				user_id:commentDivInputUser.val(),
				comm_no:comm_noValue
		};
		commentService.add(comment,function(result){
			alert(result);
			commentDiv.find("input").val("");
			showList(-1);
		});
		commentDiv.find("input").val("");
	});
	
	// comment (ul) click event
	// modify
  	$(".chat").on("click","#commentModfiyBtn",function(e){
  		var target = $(this).closest("li");
		let comm_cmt_no=$(this).data("comm_cmt_no");
		
		commentService.get(comm_cmt_no,function(comment){
			comm_cmt_content=comment.comm_cmt_content;
			commentDivInputUser.val(comment.user_id);
			commentDivInputCommentDate.val(comment.comm_cmt_written_time).attr("readonly","readonly");
			commentDiv.data("comm_cmt_no",comment.comm_cmt_no);

			// html 내용
			str="";
			str+="<div><div class='header'><strong class='primary-font'>["+comm_cmt_no+"]"+commentDivInputUser.val()+"</strong>";
			str+="<small class='pull-right text-muted'><button id='commentModfiySaveBtn' data-comm_cmt_no='"+comm_cmt_no+"'>저장</button><button id='commentRemoveBtn' data-comm_cmt_no='"+comm_cmt_no+"'>삭제</button></small></div>";
			str+="<small class='pull-right text-muted'>"+commentDivInputCommentDate.val()+"</small></div>";
			str+="<textarea class='modifyCommentContent'>"+commentDivInputCommentContent.val()+"</textarea></div>";
		
			console.log(str);
			target.html(str);
		});
		
		
	});
	
	// modify save
  	$(".chat").on("click","#commentModfiySaveBtn",function(e){
  		var target = $(this).closest("li");
		var comm_cmt_no=$(this).data("comm_cmt_no");
		var comment={comm_cmt_no:commentDiv.data("comm_cmt_no"),comm_cmt_content:$(".modifyCommentContent").val()};
		commentService.update(comment, function(result){
			alert(result);
			showList(pageNum);
		});
		
	});
	
	// remove success
  	$(".chat").on("click","#commentRemoveBtn",function(e){
		var comm_cmt_no=$(this).data("comm_cmt_no");
		commentService.remove(comm_cmt_no,function(result){
			alert(result);
			showList(pageNum);
		});
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
