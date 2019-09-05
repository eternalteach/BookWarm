<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" href="./resources/css/main.css" />
</head>
<body>
	library 페이지입니다.
	<br /> 이 페이지는 서재 페이지로 로그인 페이지 이후 들어올 수 있습니다.
	<br /> 서재 그림이 배경 전체화면을 차지하고, 책을 클릭시 해당 책의 정보나 로그, 리뷰, 상세페이지를 볼 수 있는
	모달창 띄우기
	<br />
	<div class="library-body">
		<table style="width: 795px; height: 1001px;">
			<tr style="height: 39px;">
				<td colspan="9" style="width: 795px;"></td>
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

</body>