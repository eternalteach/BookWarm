<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">

<script>
	$(document).ready(function() {
		var payment = $('#orders_payment').html();
		
		// 무통장입금으로 결제했을때에만 입금 정보 뜨게 하기
		if(payment=="kakao") {
			$('#depositInfo').hide();
		}else if(payment=="cash") {
			$('#depositInfo').show();
		}else {
			$('#depositInfo').hide();
		}
	})
</script>
