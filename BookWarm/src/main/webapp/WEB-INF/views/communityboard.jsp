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
						add comunity board<br>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
							<c:forEach items="${list}" var="communityBoard">
								<tr>
									<td>${communityBoard.comm_no}</td>
									<td><c:forEach begin="1" end="${communityBoard.comm_indent}">[re]</c:forEach>
										<a href="communityboardview?comm_no=${communityBoard.comm_no}">${communityBoard.comm_subject}&nbsp;${communityBoard.comm_title}</a></td>
									<td>${communityBoard.user_id}</td>
									<td>${communityBoard.comm_written_time}</td>
									<td>${communityBoard.comm_clicked}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5"><a href="communityboardwrite">글작성</a></td>
							</tr>
						</table>

					</div>


					<div class="row">
						<div class="col-md-12">

							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>
