<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<%@ include file="includes/header/header-vertex.jsp" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<figure class="animated-overlay overlay-alt" style="margin-bottom:20px">
	<div class="flexslider thumb-slider">
		<ul class="slides">
			<!-- 첨부이미지가 보이는 영역 -->
			<li style="display: list-item;"><img src="/warm/resources/img/preview_img/library.png"></li>
			<li style="display: list-item;"><img src="/warm/resources/img/preview_img/ReviewMain.png"></li>
			<li style="display: list-item;"><img src="/warm/resources/img/preview_img/Record.png"></li>
			<li style="display: list-item;"><img src="/warm/resources/img/preview_img/Record02.png"></li>
			<li style="display: list-item;"><img src="/warm/resources/img/preview_img/shop.png"></li>
			<li style="display: list-item;"><img src="/warm/resources/img/preview_img/community.png"></li>
		</ul>
	</div>
</figure>

    <!-- jQuery 사용을 위해 cdn 추가 -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <%@ include file="includes/header/script-vertex.jsp" %>
</body>