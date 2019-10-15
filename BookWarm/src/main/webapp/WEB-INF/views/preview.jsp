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

<style>

.prevImg li img {
	box-shadow: 3px 3px 10px grey;
}
</style>

</head>
<body class="v-bg-color" style="overflow:auto; width:100%!important; height:100%!important">
<%@ include file="./includes/loading/page-loading.jsp"%>
<div>
	<button class="btn v-btn standard grey" type="button" onclick="location.href='/warm/index'" style="position:absolute; top:10vh; left:76vw; z-index:1050">돌아가기 <i class="glyphicon icon icon-arrow-undo"></i></button>
</div>
<figure class="animated-overlay overlay-alt center w-75" style="margin-top:6vh!important">
    <div class="flexslider thumb-slider">
        <ul class="slides prevImg">
            <li><img src="/warm/resources/img/preview_img/library.png">
            	<h2>Library</h2>
            	<p>내 서재에 책을 등록해 관리할 수 있습니다.</p>
            </li>
			<li><img src="/warm/resources/img/preview_img/ReviewMain.png">
				<h2>Review Main</h2>
            	<p>나의 독서 기록과 감상을 한 눈에 살펴볼 수 있습니다.</p>
            </li>
			<li><img src="/warm/resources/img/preview_img/Record.png">
				<h2>Record</h2>
            	<p>읽고 있는 책에 대한 감상을 작성하고 책별로 모아 볼 수 있습니다.</p>
            </li>
			<li><img src="/warm/resources/img/preview_img/Record02.png">
				<h2>Record</h2>
            	<p class="pre">책을 읽은 날짜와 페이지를 기록으로 남겨보세요.
사이드바를 통해 전체 진행률도 확인할 수 있습니다.</p>
            </li>
            <li><img src="/warm/resources/img/preview_img/openReview.png">
				<h2>Open Review</h2>
            	<p>공개 설정된 다른 사용자들의 감상을 통해 다양한 책과 생각을 접할 수 있습니다.</p>
            </li>
			<li><img src="/warm/resources/img/preview_img/community.png">
				<h2>Community</h2>
            	<p class="pre">어떤 책을 읽어야 할 지 고민이 된다면 커뮤니티 게시판에 도움을 구해보세요.
책에 대한 다양한 의견도 함께 나눌 수 있습니다.</p>
            </li>
			<li><img src="/warm/resources/img/preview_img/shop.png">
				<h2>Book Shop</h2>
            	<p>다른 사용자들의 감상을 읽고 구매욕이 동했다면 서점에서 책을 구매해보세요.</p>
            </li>
        </ul>
    </div>
</figure>
<!-- jQuery 사용을 위해 cdn 추가 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="includes/header/script-vertex.jsp" %>
</body>
</html>