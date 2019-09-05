<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-record.jsp"%>



<div class="page has-sidebar has-right-sidebar bordered">

	<div class="page-inner">

		<div class="container">
			<div class="row">

				<div class="col-md-8 right-side-sidebar v_blog-medium pt-70">


					<div>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
								<input type="hidden" name="comm_no"
									value="${communityBoardOne.comm_no}">
								<tr>
									<td>Title &nbsp; ${communityBoard.comm_subject}&nbsp;${communityBoardOne.comm_title}</td>
									<td>작성일 &nbsp; ${communityBoardOne.comm_written_time}</td>
								</tr>
								<tr>
									<td colspan="2">작성자 &nbsp; ${communityBoardOne.user_id}</td>
								</tr>
								<tr>
									<td colspan="2">내용</td>
								</tr>
								<tr>
									<td colspan="2">${communityBoardOne.comm_content}</td>
								</tr>
								<tr>
									<td colspan="2" align='right'><a>이 작성자의 게시글 더 보기</a> &nbsp;
										 &nbsp; &nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">조회수 &nbsp;
										${communityBoardOne.comm_clicked} &nbsp; &nbsp;좋아요&nbsp;2&nbsp;(하트)</td>
								</tr>
								<tr>
									<td colspan="2"><a href="communityboardmodify?comm_no=${communityBoardOne.comm_no}">수정</a>
										&nbsp;&nbsp; <a href="communityboard">목록보기</a> 
										&nbsp;&nbsp; <a href="communityboardreplywrite?comm_no=${communityBoardOne.comm_no}">답변</a></td>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>
