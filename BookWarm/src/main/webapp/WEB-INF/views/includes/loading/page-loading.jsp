<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 화면로딩페이지 -->
<div class="page-loading"></div>
<script src="/warm/resources/VertexEx/vendor/jquery/jquery.js"></script>
<script>
$(window).load(function(){
    $(".page-loading").fadeOut();
});
</script>
<!-- End 화면로딩페이지 -->
