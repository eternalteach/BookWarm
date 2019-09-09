<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<style>
html{
width:100%;
height:100%;
}
body{
background-color: black;
width:100%;
height:100%;
}
.fullScreen{
width:100%;
height:100%;
margin-left: auto;
margin-top: auto;
margin-bottom: auto;
margin-right: auto;
}
img{
position:absolute;
max-width:100%; max-height:100%;
width:auto; height:auto;
margin:auto;
top:0; bottom:0; left:0; right:0;
}

</style>
</head>
<body>
<div>
	<img src="resources/img/first_page/firstPage02.jpg">
<!-- 이미지 태그 클릭시 모달창으로 로그인 띄우게하기
 그 뒤 로그인 성공시 서재페이지로 이동, 비회원 미리보기는 새 창 띄워서 소개창 만들기 -->
<!-- 로그인 성공시 library 페이지로 이동 -->
<!-- 로그인 실패시 실패원인 띄우기 -->
임시로 만든 로그인 성공시 이동 링크 <a href="library">서재로 이동</a>
</div>
</body>