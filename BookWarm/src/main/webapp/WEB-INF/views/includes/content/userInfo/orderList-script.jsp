<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script>

	
	$(document).ready(function() {
		var actionForm = $('#actionForm');
		$('.pageLink').on('click', function(e) {
			e.preventDefault(); // 페이지 이동 없도록 한다.
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			actionForm.submit();
		})
	})
</script>