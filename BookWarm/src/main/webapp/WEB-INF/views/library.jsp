<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/logintest.js"></script> 
<link rel="stylesheet" href="./resources/css/main.css" />
</head>
<body>
	library 페이지입니다.
	<br /> 이 페이지는 서재 페이지로 로그인 페이지 이후 들어올 수 있습니다.
	<br /> 서재 그림이 배경 전체화면을 차지하고, 책을 클릭시 해당 책의 정보나 로그, 리뷰, 상세페이지를 볼 수 있는
	모달창 띄우기
	<br /> 책 이미지는 책 등록시 이미지 경로 저장해놓았다가 띄우는 방식으로 한다. 따라서 서재에 들어갈 책들 정보에는 책
	이미지 경로 저장해야 한다.
	<br /> -=====================================책 검색해서 기록 작성하는 링크는 여기서도
	등록하게 해야할듯..? 어떤 방식으로 등록할지 해랑씨에게 물어보자.<br/>
	<button id='addBook'>책 등록하기</button>
	<!-- 이 페이지에서 추가로 구현해야 할 것들
	 1. SQL에 책 더미데이터 만들기 (테스트에서 만들기 완료)
	 1.1 책 등록하기 구현 (책 등록하는 것은 모달창으로 책 검색하여 등록하도록 한다.)
	 1.1.1 책 등록하기 버튼 만들기
	 1.1.2 책 등록하기 버튼 클릭시 책 검색할 수 있는 모달창 띄우기
	 1.1.3 모달창에서 책 검색한 결과 책 이미지나 책 제목 클릭시 등록하시겠습니까 창 띄우고, 확인 클릭시 책 등록하기
	 1.1.4 책 검색한 결과는 페이징처리하기
	 1.1.5 이 모달창에서는 등록만 구현하면 된다. 
	 1.2 닫기버튼 구현
	 2. 책 이미지 뿌려주기 (완료)
	 3. 책 이미지 클릭시 - 책에대한 간략 정보 모달로 제공(기록, 감상, 책 정보, 리스트에서 삭제 )
	 (리스트에서 삭제시 레코드도 삭제되는것이 아니라, index에서 띄워주는 이미지만 삭제 -> 즉 update로 list_no 만 0으로 바꿔주기)
	 4. 등록된 책 정보가 없을때 어떻게 처리할지 고민하기
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
					<td class="book-img-location"><a href="javascript:openModal('modal<c:out value='${libraryBooks[row*4+colum].isbn}'/>')"><img class="book-thumbnail" src="<c:out value="${libraryBooks[row*4+colum].list_img_src}"/>"></a></td>
				</c:forEach>
				<td class="library_emptySpace"></td>
			</tr>
		</c:forEach>
		</table>
	</div>


	<div id="modal">
		<c:forEach var="UserBooks" items="${libraryBooks}"> 
			<div class="modal-library modal${UserBooks.isbn }">
				<a href="javascript:;" class="close">X</a>
				<p class="title">제목</p>
				<div class="con">
				<!-- user_id는 session으로 해당 컨트롤러나 jsp에서 꺼내 사용하기 get방식으로 isbn만 다음페이지로 넘기기
				삭제는 비동기통신으로 처리하기-->
					<a href="reviewMain?isbn=${UserBooks.isbn}"><span>Review / 필요정보 user_id isbn </span></a><br/>
					<a href="boardlog?isbn=${UserBooks.isbn}"><span>Record / user_id : ${UserBooks.user_id}, isbn : ${UserBooks.isbn}</span></a><br/>
					<span>Modify / user_id : ${UserBooks.user_id}, isbn : ${UserBooks.isbn}</span><br/>
					<span>Delete / user_id : ${UserBooks.user_id}, isbn : ${UserBooks.isbn}</span><br/>
				</div>
			</div>
		</c:forEach>
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