<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal.username" var="user_id"/>
<!DOCTYPE html>
<html lang="kr">
<head>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<%@ include file="./includes/header/header-vertexEx.jsp"%>
<title> Community </title>
</head>
<body>
<div class="footer-wrap">
<%@ include file="includes/header/header-topnav.jsp"%>
					
<div class="container center-block">
	<div class='row margin-20px'>
		<div class='col-lg-12'>
			<div class='panel panel-default'>
				<div class="comment-write">
					<div class="modal-content">
						<div class="modal-body" >
							<div class="form-inline">
								<div class="card transparent col-lg-12" style="border:none;">
									<h4 class="modal-title">${sellectedCommunityBoardPost.comm_subject}&nbsp;${sellectedCommunityBoardPost.comm_title}</h4>
								</div>
							</div>
							<div class="pull-right">
								<span>작성일&nbsp; ${sellectedCommunityBoardPost.comm_written_time}</span>
							</div>
						</div>
       					<div class="card transparent col-lg-12" style="border:none;">
							<h3 class="margin-10px"> <span class="blog-author minor-meta"> Posted by 
								<span class="entry-author-link"> 
									<span class="vcard author">
										<span class="v-blog-item-details"> <a href="#" title="Posts by HB-Themes" rel="author">${sellectedCommunityBoardPost.user_id}</a></span>
										</span>
									</span>
								</span>
							</h3>
         					<div class="form-group">
         						<div class="transparent col-lg-12">
         							<textarea class="padding-10px bg-white"name="comm_content" rows="20" placeholder="${sellectedCommunityBoardPost.comm_content}" readonly="readonly"></textarea>
         						</div>
         					</div>
         					<div class="form-horizontal">
           						<div class="form-group from-horizentar pull-right">
									<a class="submit" href="communityboard"><button type="button" class="btn btn-sm btn-outline-secondary">List</button></a>
									<c:if test="${user_id==sellectedCommunityBoardPost.user_id}"><a class="submit" href="communityboardmodify"><button  type="button" class="btn btn-sm">Modify</button></a></c:if>
									<a class="submit" href="communityboardreplywrite"><button  type="button" class="btn btn-sm btn-secondary">Reply</button></a>
									<sec:authentication property='principal' var='pinfo'/>
									<sec:authorize access="hasRole('ROLE_MANAGER')">
										<button  type="button" class="btn btn-sm" id="adminMove">관리자 이동</button>
									</sec:authorize>
           						</div>   
         					</div>
						</div>
						<!-- 댓글 추가할 곳 -->
						<div class="col-lg-12">
     						<div class="form-inline">
 								<div class='panel-heading margin-20px'>
									<h2><i class='fa fa-comments fa-fw'></i>Comment</h2>
								</div>	
							</div>
							<!-- 댓글 -->
							<div class='panel-body'>
								<ul class='chat'>
								<!-- start comment -->
								</ul>
							</div>
							<!-- 댓글 작성부 -->
							<div class="comment-write margin-20px">
								<div class="modal-content">
          							<div class="modal-body">
            							<div class="form-group">
             								<label>Comment</label> 
             								<input id='newComment' class="form-control" name='comm_cmt_content' placeholder='New Comment!!!!'>
            							</div>      
            						<div class="container col-lg-12  ">
      									<button id='commentRegisterBtn' type="button" class="btn btn-primary pull-right">Register</button>
          							</div>
          									<!-- 댓글 페이징처리 -->
          									<div class="row col-lg-12">
     											<div class="panel-footer center"></div>
          									</div>
   										</div>
								</div>
							</div>
						</div><!-- End Comment -->
							<form id='pagingActionForm' method='get'>
								<input type='text' hidden='hidden' id='pageNum' name='pageNum' value='${criteria.pageNum}'> 
								<input type='text' hidden='hidden' id='amount' name='amount' value='${criteria.amount}'>
								<input type='text' hidden='hidden' id='comm_no' name='comm_no' value='${sellectedCommunityBoardPost.comm_no}'>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript" src="resources/js/comment.js"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>

<script>
// comment view code
$(document).ready(function(){
	var comm_noValue='<c:out value="${sellectedCommunityBoardPost.comm_no}"/>';
	console.log("=====================check paging ============================")
	console.log("comm_noValue : "+comm_noValue);
	var commentUL=$(".chat");
	showList(1);
	
	// 관리자버튼 클릭시 게시글 이동
	$("#adminMove").on("click",function(){
		let comm_no=$("#comm_no").val();
		alert(comm_no);
		adminService.get(comm_no,function(){
		location.reload();
		})
	});
	
	function showList(page){
		
		console.log("show list page : " + page);
		commentService.getList({comm_no:comm_noValue,page:page||1},function(commentCnt,list){
			console.log("commentCnt :  " +commentCnt);

			if(page==-1){
				pageNum==Math.ceil(commentCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str="";
			if(list ==null||list.length==0||list==undefined){
				commentUL.html(str);
				return;
			}
			
			for(var i=0, len=list.length||0;i<len;i++){
				str+="<li class='left clearfix' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>";
				str+="<div class='container'><strong class='primary-font'>"+list[i].user_id+"</strong>";
				str+="<p class='pull-right text-muted'>";
				if('${user_id}'==list[i].user_id){
				str+="<button id='commentModfiyBtn' class='btn close' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>수정</button><button id='commentRemoveBtn'  class='btn close' data-comm_cmt_no='"+list[i].comm_cmt_no+"'>삭제</button>";
				}
				str+="</p></div>";
				str+="<div class='container'><p class='form-inline'>"+list[i].comm_cmt_content+"</p>";
				str+="<small class='pull-right text-muted'> 작성일 : "+list[i].comm_cmt_written_time+"</br>&nbsp;</small></div></li>";
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
	
	var commentModfiyBtn=$("#commentModfiyBtn");
	var commentRemoveBtn=$("#commentRemoveBtn");
	var commentRegisterBtn=$("#commentRegisterBtn");
	
	var newComment=$("#newComment"); // 댓글 내용
	var boardNo=$("#comm_no");// 댓글 달 게시글 번호
	// Registe comment At Modal
	
	commentRegisterBtn.on("click",function(e){
		var comment={
				comm_cmt_content:newComment.val(),
				comm_no:boardNo.val()
		};
		commentService.add(comment,function(result){
			alert(result);
			newComment.val("");
			showList(-1);
		});
	});
	
	// comment (ul) click event
	// modify
  	$(".chat").on("click","#commentModfiyBtn",function(e){
  		var target = $(this).closest("li");
		let comm_cmt_no=$(this).data("comm_cmt_no");
		
		commentService.get(comm_cmt_no,function(comment){
			// 댓글 수정 클릭시 내용 변경
			str="";
			str+="<div><div class='header col-sm-12'><strong class='primary-font'>["+comm_cmt_no+"]"+comment.user_id+"</strong>";
			str+="<small class='pull-right text-muted'><button id='commentModfiyCancel' class='btn close' data-comm_cmt_no='"+comm_cmt_no+"'>취소</button><button id='commentModfiySaveBtn' class='btn close' data-comm_cmt_no='"+comm_cmt_no+"'>저장</button><button id='commentRemoveBtn'  class='btn close'  data-comm_cmt_no='"+comm_cmt_no+"'>삭제</button></small></div>";
			str+="<small class='pull-right text-muted'>"+comment.comm_cmt_written_time+"</small></div>";
			str+="<textarea class='modifyCommentContent'>"+comment.comm_cmt_content+"</textarea></div>";
			target.html(str);
		});
		
		
	});
	
	// modify save
  	$(".chat").on("click","#commentModfiySaveBtn",function(e){
  		var target = $(this).closest("li");
  		var textarea = $(".modifyCommentContent");
  		let comm_cmt_content = textarea.val();
		var comm_cmt_no=$(this).data("comm_cmt_no");
		var comment={comm_cmt_no:comm_cmt_no,comm_cmt_content:comm_cmt_content};
		commentService.update(comment, function(result){
			alert(result);
			showList(pageNum);
		});
	});
	
	// modify cancel
  	$(".chat").on("click","#commentModfiyCancel",function(e){
			showList(pageNum);
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
<%@ include file="./includes/header/script-vertexEx.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="includes/footer/footer-1.jsp"%>
</body>

</html>