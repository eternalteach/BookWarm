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
<body style="background-image: url('/warm/resources/img/background/star01.gif');">
	<button type="button" class="btn" data-toggle="modal" data-target="#modal-library">modal-library</button>
	<a href="reviewMain?user_id=aaa"><button>감상 메인페이지</button></a>
	<a href="shop/shoplist" class="fa fa-book fa" style="color:white;margin-right: 10px;
											margin-left: 10px">책 리스트	</a>
	<a href="message" class="icon-mail-2" style="color:white;font-style: italic;margin-right: 10px;">쪽지</a>
	<a href="customLogout" style="color:white;font-style: italic;" >로그아웃</a>
	<div class="library-body">
		<table class="margin-zero" style="width: 795px; height: 1001px;">
			<tr style="height: 43px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			<!-- library의 list_no=1인 책(즐겨찾기 추가한 책) 뿌려주기 -->
			<c:forEach var="row" begin="0" end="4">
			<tr style="height: 42px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
				<tr style="height: 100px;">
					<c:forEach var="colum" begin="0" end="3">
						<td class="library_emptySpace"></td>
						<td><a data-toggle="modal" data-target="#modal${libraryBooks[row*4+colum].isbn}"><img class="book-thumbnail" src="<c:out value="${libraryBooks[row*4+colum].list_img_src}"/>"></a></td>
					</c:forEach>
					<td class="library_emptySpace"></td>
				</tr>
			<tr style="height: 20px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			</c:forEach>
		</table>
	</div>


<!-- library Modal -->
<div class="modal fade" id="modal-library" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
                <%@ include file="includes/book/search-book.jsp"%>
            </div>
        </div>
    </div>
</div>

<c:forEach var="UserBooks" items="${libraryBooks}">
<div class="modal fade" id="modal${UserBooks.isbn}" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline">
					<img class="book-thumbnail" src="<c:out value="${UserBooks.list_img_src}"/>">
					<div class="cont">
						<!-- user_id는 session으로 해당 컨트롤러나 jsp에서 꺼내 사용하기 get방식으로 isbn만 다음페이지로 넘기기
					삭제는 비동기통신으로 처리하기-->
						<a href="reviewMain?isbn=${UserBooks.isbn}"><h4>Review</h4></a>
						<a href="record?isbn=${UserBooks.isbn}"><h4>Record</h4></a>
						<a href="library/delete?isbn=${UserBooks.isbn}"><h4>Delete</h4></a>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
</c:forEach>
<!-- End library Modal -->
</body>