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
	등록하게 해야할듯..? 어떻게 등록하는지 해랑씨에게 물어보자.
	<!-- 이 페이지에서 추가로 구현해야 할 것들
	 1. 책 이미지 클릭시 - 책에대한 간략 정보 모달로 제공(기록, 감상, 책 정보) 
	 2. Ajax로 모달창 띄워야 화면이동없이 사용할 수 있다. -->
	<div class="library-body">
		<table style="width: 795px; height: 1001px;">
			<tr style="height: 39px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			<tr style="height: 190px;">
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><a
					href="javascript:openModal('modal1');"><img
						class="book-thumbnail"
						src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></a></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><a
					href="javascript:openModal('modal2');"><img
						class="book-thumbnail"
						src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135"></a></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
			</tr>
			<tr style="height: 190px;">
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
			</tr>
			<tr style="height: 190px;">
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
			</tr>
			<tr style="height: 190px;">
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
			</tr>
			<tr style="height: 190px;">
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
				<td class="book-img-location"><img class="book-thumbnail"
					src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309"></td>
				<td class="library_emptySpace"></td>
			</tr>
		</table>
	</div>


	<div id="modal">
		<div class="modal-library modal1">
			<a href="javascript:;" class="close">X</a>
			<p class="title">제목</p>
			<div class="con">모달1에 대한 정보</div>
		</div>

		<div class="modal-library modal2">
			<a href="javascript:;" class="close">X</a>
			<p class="title">제목2</p>
			<div class="con">모달 2에 대한 정보</div>
		</div>
	</div>

	<script type="text/javascript">
		function openModal(modalname) {
			$("#modal").fadeIn(300);
			$("." + modalname).fadeIn(300);
		}
		$(document).ready(function() {
			var user_id=sessionStorage.getItem('user_id');
			alert("유저 아이디" + user_id);
			
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