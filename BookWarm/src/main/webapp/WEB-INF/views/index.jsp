<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" href="./resources/css/main.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div>
		<a href="javascript:openModal('login-modal');"><img
			src="resources/img/first_page/firstPage02.jpg"></a>
		<!-- 이미지 태그 클릭시 모달창으로 로그인 띄우게하기
 그 뒤 로그인 성공시 서재페이지로 이동, 비회원 미리보기는 새 창 띄워서 소개창 만들기 -->
		<!-- 로그인 성공시 library 페이지로 이동 -->
		<!-- 로그인 실패시 실패원인 띄우기 -->
	</div>
		<div id="modal">
			<div class="modal-library login-modal">
				<a href="javascript:;" class="close">X</a>
				<p class="title">제목</p>
				<div class="con">
					<%@include file="./includes/content/login/loginPage.jsp"%>
				</div>
				<div class='modal-footer'>
					<a href="preview">사이트 미리보기</a>
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

			$(".close").on('click', function() {
				$("#modal").fadeOut(300);
				$(".login-modal").fadeOut(300);
			});

		});
		
		// 나중에 지우기
		 $(document).ready(function(){
			$("#gotolibrary").on("click",function(e){
				/* sessionStorage.setItem('user_id', 'aaa'); */
				$("#gotolibrary").attr("href","library");
			});
		}); 
	</script>
</body>