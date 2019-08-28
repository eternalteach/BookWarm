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
							<form action="modify" method="post">
								<input type="hidden" name="commNo"
									value="${communityBoardOne.commNo}">
								<tr>
									<td>번호</td>
									<td>${communityBoardOne.commNo}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${communityBoardOne.commClicked}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="userId"
										value="${communityBoardOne.userId}"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="commTitle"
										value="${communityBoardOne.commTitle}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea rows="10" name="commContent">${communityBoardOne.commContent}</textarea></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp; 
										<a href="communityboard">목록보기</a> &nbsp;&nbsp; 
										<a href="communityboarddelete?commNo=${communityBoardOne.commNo}">삭제</a>
								</tr>
							</form>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>
