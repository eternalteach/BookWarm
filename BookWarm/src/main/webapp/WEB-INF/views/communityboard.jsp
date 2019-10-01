<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>

<div class="page-inner">
	<section class="section-primary b-bordered">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="pull-right" colspan="5">
						<a href="communityboardwrite"><button class="btn btn-sm">글작성</button></a>
					</div>
					<table class="table table-hover" style="table-layout:fixed;">
						<tr>
							<th style="width:80px;">번호</th>
							<th style="width:420px;">제목</th>
							<th style="width:120px;">작성자</th>
							<th style="width:120px;">날짜</th>
							<!-- <th>조회수</th> -->
							<th><i class="fa fa-heart"></i></th>
						</tr>
						<c:forEach items="${communityBoardList}" var="communityBoard">
							<tr>
								<td>${communityBoard.comm_no}</td>
								<td style="width:420px;" >
								<div class="card transparent" style="border:none;">
								<c:forEach begin="1" end="${communityBoard.comm_indent}">[re]</c:forEach>
									<a class='move' href="${communityBoard.comm_no}">${communityBoard.comm_subject}&nbsp;${communityBoard.comm_title}</a></div></td>
								<td>${communityBoard.user_id}</td>
								<td>${communityBoard.comm_written_time}</td>
								<td>${communityBoard.comm_clicked}</td>
								<%-- <td>${communityBoard.comm_like}</td> --%>
							</tr>
						</c:forEach>
					</table>

					<div class="post-meta-section clearfix">
						<div class="tag-cloud clearfix">
				<!-- 페이징 처리 -->
							<div class="row justify-content-center">
								<nav aria-label="Page navigation example">
									<ul class=" tag-cloud-inner" style="text-align: center;">
										<c:if test="${pageMaker.prev}">
											<li class="commPaging page-item"><a class="commPaging page-link" href="${pageMaker.startPage-1}">Previous</a></li>
										</c:if>
							
										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li class="commPaging page-item ${pageMaker.cri.pageNum==num?"active":""}">
												<a class="commPaging page-link" href="${num}">${num}</a>
											</li>
										</c:forEach>
							
										<c:if test="${pageMaker.next}">
											<li class="commPaging page-item"><a class="commPaging page-link" href="${pageMaker.endPage+1}">Next</a></li>
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
	</section>
</div>
         

<!-- task 
		1. add script to can not submit null 
		2. paging error 
		3. Prohibit access when accessed in the wrong way-->
<script>
$(document).ready(function() {
	var pagingActionForm = $("#pagingActionForm");
	$(".commPaging a").on("click",function(e) {
		e.preventDefault();
		pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
		pagingActionForm.submit();
	});

	$(".move").on("click",function(e) {
		e.preventDefault();
		pagingActionForm.append("<input type='hidden' name='comm_no' value='"+ $(this).attr("href")+ "'>");
		pagingActionForm.attr("action","communityboardview");
		pagingActionForm.submit();
	})
});
</script>
<%@ include file="includes/footer/footer-1.jsp"%>
