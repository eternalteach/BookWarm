<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="./includes/header/header-vertexEx.jsp"%>
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>
<div class="container center-block">
	<div class='row'>
		<div class='col-lg-12'>
			<div class='panel panel-default'>
				<div class="comment-write">
					<div class="modal-content">
					<form action="communityBoardSaveReplyWrite" method="post">
						<div class="modal-body col-lg-12">
							<div class="form-inline">
								<textarea class="col-lg-2 " rows="1" name="comm_subject" placeholder="${replyWriteCommunityBoardPost.comm_subject}"></textarea>
								<textarea class="col-lg-10 " rows="1" name="comm_title" placeholder="${replyWriteCommunityBoardPost.comm_title}"></textarea>
								<div id="comm_title_msg"></div>
							</div>
						</div>
       					<div class="col-lg-12">
							<h3> <span class="blog-author minor-meta"> Posted by 
								<span class="entry-author-link"> 
									<span class="vcard author">
										<span class="v-blog-item-details"> <a href="#" title="Posts by HB-Themes" rel="author">${user_id}</a></span>
										</span>
									</span>
								</span>
							</h3>
         					<div class="form-group">
         						<div class="form-control card" style="height:400px;">
         							<textarea  name="comm_content" rows="20" placeholder="${replyWriteCommunityBoardPost.comm_content}"></textarea>
         						</div>
         						<div id="comm_content_msg"></div>
         					</div>
         					<div class="form-horizontal">
           						<div class="form-group from-horizentar pull-right">
									<button type="submit" class="btn btn-sm btn-outline-secondary">Record</button>
									<a href="communityboard"><button type="button" class="btn btn-sm btn-outline-secondary">List</button></a>
           						</div>   
         					</div>
						</div>
							<input type="text" hidden='hidden' name="comm_group" value="${replyWriteCommunityBoardPost.comm_group}">
							<input type="text" hidden='hidden' name="comm_indent" value="${replyWriteCommunityBoardPost.comm_indent}">
							<input type="text" hidden='hidden' name="comm_step" value="${replyWriteCommunityBoardPost.comm_step}">
							<input type='text' hidden='hidden' id='pageNum' name='pageNum' value='${criteria.pageNum}'>
							<input type='text' hidden='hidden' id='amount' name='amount' value='${criteria.amount}'>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		var pagingActionForm = $("#pagingActionForm");
		$(".submit").on("click", function(e) {
			e.preventDefault();
			if($("#comm_title").val()==''||$.trim($("#comm_title").val())==""){
				$("#comm_title_msg").html("<span style='color:red'>제목을 입력해 주세요.</span>");
				return;
			}else{$("#comm_title_msg").html("")}
			
			if($("#comm_subject").val()==''||$.trim($("#comm_subject").val())==""){
				$("#comm_title_msg").html("<span style='color:red'> 말머리를 선택해 주세요. </span>");
				return;
			}else{$("#comm_title_msg").html("")}
			
			if($("#comm_content").val()==''||$.trim($("#comm_content").val())==""){
				$("#comm_content_msg").html("<span style='color:red'> 내용을 입력해 주세요. </span>");
				return;
			}else{$("#comm_content_msg").html("")}
			
			let moveNextPage=$(this).closest("a").attr("href");
			pagingActionForm.attr("action",moveNextPage);
			pagingActionForm.submit();
		});
	});
</script>

<%@ include file="./includes/header/script-vertexEx.jsp"%>
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>
