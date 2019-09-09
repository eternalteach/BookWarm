<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-record.jsp"%>
					<div>
							<form id="pagingActionForm" method="post">
						<table width="500" cellpadding="0" cellspacing="0" border="1">
								<tr>
									<td>번호</td>
									<td>${modifyCommunityBoardPost.comm_no}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${modifyCommunityBoardPost.comm_clicked}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text" name="user_id" value="${modifyCommunityBoardPost.user_id}"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="comm_title" value="${modifyCommunityBoardPost.comm_title}"></td>
								</tr>
								<tr>
									<td>말머리</td>
									<td><input type="text" name="comm_subject" value="${modifyCommunityBoardPost.comm_subject}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea rows="10" name="comm_content">${modifyCommunityBoardPost.comm_content}</textarea></td>
								</tr>
								<tr>
									<td colspan="2"><a class="submit" href="communityBoardSaveModify"><button type="submit">저장</button></a>&nbsp;&nbsp; 
										<a class="submit" href="communityboard">List</a> &nbsp;&nbsp; 
										<a class="submit" href="communityboarddelete">Delete</a>
								</tr>
									<input type='text' hidden='hidden' id='pageNum' name='pageNum' value='${criteria.pageNum}'> 
									<input type='text' hidden='hidden' id='amount' name='amount' value='${criteria.amount}'>
									<input type='text' hidden='hidden' id='comm_no' name='comm_no' value='${modifyCommunityBoardPost.comm_no}'>
						</table>
							</form>
					</div>
<script>
	$(document).ready(function() {
		var pagingActionForm = $("#pagingActionForm");
		$(".submit").on("click", function(e) {
			e.preventDefault();
			let moveNextPage=$(this).attr("href");
			pagingActionForm.attr("action",moveNextPage);
			pagingActionForm.submit();
		});
	});
</script>
<%@ include file="includes/footer/footer-1.jsp"%>
