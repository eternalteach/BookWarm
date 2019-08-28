<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-record.jsp"%>



<div class="page has-sidebar has-right-sidebar bordered">

	<div class="page-inner">

		<div class="container">
			<div class="row">
				<div class="col-md-3 left-side-sidebar pt-70">
					<aside class="sidebar">
						<!-- side menu 삽입 -->
						<%@ include file="includes/record/record.jsp"%>
					</aside>
				</div>

				<div class="col-md-8 right-side-sidebar v_blog-medium pt-70">


					<div>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
								<input type="hidden" name="commNo"
									value="${communityBoardOne.commNo}">
								<tr>
									<td>Title &nbsp; ${communityBoardOne.commTitle}</td>
									<td>작성일 &nbsp; ${communityBoardOne.commWrittenTime}</td>
								</tr>
								<tr>
									<td colspan="2">작성자 &nbsp; ${communityBoardOne.userId}</td>
								</tr>
								<tr>
									<td colspan="2">내용</td>
								</tr>
								<tr>
									<td colspan="2">${communityBoardOne.commContent}</td>
								</tr>
								<tr>
									<td colspan="2" align='right'><a>이 작성자의 게시글 더 보기</a> &nbsp;
										 &nbsp; &nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">조회수 &nbsp;
										${communityBoardOne.commClicked} &nbsp; &nbsp;좋아요&nbsp;2&nbsp;(하트)</td>
								</tr>
								<tr>
									<td colspan="2"><a href="communityboardmodify?commNo=${communityBoardOne.commNo}">수정</a>
										&nbsp;&nbsp; <a href="communityboard">목록보기</a> &nbsp;&nbsp; <a
										href="communityboarddelete?commNo=${communityBoardOne.commNo}">삭제</a>
										&nbsp;&nbsp; <a
										href="reply_view?commNo=${communityBoardOne.commNo}">답변</a></td>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>
