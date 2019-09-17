<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/logintest.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/css/main.css" />
</head>
<body style="background-image: url('<%=path%>/resources/img/background/snow01.gif');">
	<a href="javascript:openModal('modal-searchBooks')"><button id='addBook'>책 등록하기</button></a>
	<a href="<%=path%>/reviewMain?user_id=aaa"><button>감상 메인페이지</button></a>
	<a href="<%=path%>/shop/shoplist"><button>책 리스트</button></a>
	<!-- 이 페이지에서 추가로 구현해야 할 것들
	 1. SQL에 책 더미데이터 만들기 (테스트에서 만들기 완료)
	 1.1 책 등록하기 구현 (책 등록하는 것은 모달창으로 책 검색하여 등록하도록 한다.)
	 1.1.1 책 등록하기 버튼 만들기 (완료)
	 1.1.2 책 등록하기 버튼 클릭시 책 검색할 수 있는 모달창 띄우기 (완료)
	 1.1.3 모달창에서 책 검색한 결과 책 이미지나 책 제목 클릭시 등록하기 (완료)
	 1.1.4 책 검색한 결과는 페이징처리하기 (페이징처리는 경운씨 해보기)
	 1.1.5 이 모달창에서는 등록만 구현하면 된다. (완료)
	 1.2 닫기버튼 구현  (완료)
	 2. 책 이미지 뿌려주기 (완료)
	 3. 책 이미지 클릭시 - 책에대한 간략 정보 모달로 제공(기록, 감상, 리스트에서 삭제 ) (완료)
	 (리스트에서 삭제시 레코드도 삭제되는것이 아니라, index에서 띄워주는 이미지만 삭제 -> 즉 update로 list_no 만 -1으로 바꿔주기)
	 4. 등록된 책 정보가 없을때 어떻게 처리할지 고민하기
	 5. 등록시 화면 리로드 할 수 있도록 만들기
	  -->
	<div class="library-body">
		<table style="width: 795px; height: 1001px;">
			<tr style="height: 39px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			<!-- library의 list_no=1인 책(즐겨찾기 추가한 책) 뿌려주기 -->
			<c:forEach var="row" begin="0" end="4">
				<tr style="height: 190px;">
					<c:forEach var="colum" begin="0" end="3">
						<td class="library_emptySpace"></td>
						<td class="book-img-location"><a
							href="javascript:openModal('modal<c:out value='${libraryBooks[row*4+colum].isbn}'/>')"><img
								class="book-thumbnail"
								src="<c:out value="${libraryBooks[row*4+colum].list_img_src}"/>"></a></td>
					</c:forEach>
					<td class="library_emptySpace"></td>
				</tr>
			</c:forEach>
		</table>
	</div>

<div id='overlay'> 
	<div id="modal">
		<c:forEach var="UserBooks" items="${libraryBooks}">
			<div class="modal-library modal${UserBooks.isbn }">
				<a href="javascript:;" class="close">X</a>
				<div class="con">
					<!-- user_id는 session으로 해당 컨트롤러나 jsp에서 꺼내 사용하기 get방식으로 isbn만 다음페이지로 넘기기
				삭제는 비동기통신으로 처리하기-->
					<a href="reviewMain?isbn=${UserBooks.isbn}"><span>Review<!--  / 필요정보 user_id isbn  --></span></a><br />
					<a href="record?isbn=${UserBooks.isbn}"><span>Record<%--  / user_id : ${UserBooks.user_id}, isbn : ${UserBooks.isbn} --%></span></a><br />
					<a href="library/delete?isbn=${UserBooks.isbn}"><span>Delete<%--  / user_id : ${UserBooks.user_id}, isbn : ${UserBooks.isbn} --%></span></a><br />
				</div>
			</div>
		</c:forEach>

		<div class="modal-library modal-searchBooks">
			<a href="javascript:;" class="close">X</a>
			<p class="title">제목</p>
			<div class="con">
				<%@ include file="includes/book/search-book.jsp"%>
			</div>
		</div>
	</div>
	</div>

	<script type="text/javascript">
		function openModal(modalname) {
			$("#modal").fadeIn(300);
			$("." + modalname).fadeIn(300);
		}

		$(document).ready(function() {
			$("#modal").hide();

		            
			$(".close").on('click', function(e) {
				if (!($(e.target).hasClass("modal-library"))) {
					$("#modal").fadeOut(300);
					$(".modal-library").fadeOut(300);
				}
			});
		});
	</script>
</body>