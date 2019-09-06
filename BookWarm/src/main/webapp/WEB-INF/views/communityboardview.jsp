<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-record.jsp"%>



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
						<form id='pagingActionForm' method='get'>
							<input type='text' hidden='hidden' id='pageNum' name='pageNum' value='${criteria.pageNum}'> 
							<input type='text' hidden='hidden' id='amount' name='amount' value='${criteria.amount}'>
							<input type='text' hidden='hidden' id='comm_no' name='comm_no' value='${sellectedCommunityBoardPost.comm_no}'>
						</form>
					</div>
<script>
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
