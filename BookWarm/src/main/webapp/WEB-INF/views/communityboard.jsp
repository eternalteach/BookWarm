<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-navonly.jsp"%>

<br />
<br />
<br />

<div class="page has-sidebar has-right-sidebar bordered">
	<div class="page-inner">
		<div class="container">
			<div class="row">
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
							<c:forEach items="${communityBoardList}" var="communityBoard">
								<tr>
									<td>${communityBoard.comm_no}</td>
									<td><c:forEach begin="1"
											end="${communityBoard.comm_indent}">[re]</c:forEach> <a
										class='move' href="${communityBoard.comm_no}">${communityBoard.comm_subject}&nbsp;${communityBoard.comm_title}</a></td>
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
					<!-- 페이징 처리 -->
					<div class="row">
						<nav aria-label="Page navigation example">
							<ul class="pagination" style="text-align: center;">
								<c:if test="${pageMaker.prev}">
									<li class="commPaging page-item"><a
										class="commPaging page-link" href="${pageMaker.startPage-1}">Previous</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="commPaging page-item ${pageMaker.cri.pageNum==num?"active":""}">
										<a class="commPaging page-link" href="${num}">${num}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="commPaging page-item"><a
										class="commPaging page-link" href="${pageMaker.endPage+1}">Next</a></li>
								</c:if>
							</ul>
						</nav>
						<form id='pagingActionForm' method='get'>
							<input type='text' hidden='hidden' id='pageNum' name='pageNum' value='${pageMaker.cri.pageNum}'> 
							<input type='text' hidden='hidden' name='amount' value='${pageMaker.cri.amount}'>
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document)
			.ready(
					function() {
						var pagingActionForm = $("#pagingActionForm");
						$(".commPaging a").on("click", function(e) {
									e.preventDefault();
									pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
									pagingActionForm.submit();
								});

						$(".move").on("click",function(e) {
											e.preventDefault();
											pagingActionForm.append("<input type='hidden' name='comm_no' value='" + $(this).attr("href") + "'>");
											pagingActionForm.attr("action", "communityboardview");
											pagingActionForm.submit();
										})
					});
</script>
<%@ include file="includes/footer/footer-1.jsp"%>
