<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	$(document).ready(function() {
		$('.select').on('click', function() {
			// 선택버튼 눌렀을 때, 쿠폰 input창에 선택한 쿠폰 이름 넣어준다.
			window.opener.chargeForm.coupon.value = $(this).val();
			/* // 최종금액(쿠폰할인) 부분에 반영
			window.opener.chargeForm.discountCoupon.innerHtml = $(this).val(); */
			
			self.close();
		})
	})
</script>
</head>
<body>
** 쿠폰페이지 **<br>
보유 쿠폰<br><br><br>
	<c:forEach items="${couponList}" var="vo">
		쿠폰 번호 : ${vo.coupon_no}<br>
		쿠폰 이름 : ${vo.coupon_name}<br>
		이 쿠폰을 사용 할 수 있는 회원 level : <c:forEach begin="${vo.coupon_req}" end="3" var="i">
										<c:out value="${i}"/>, 
									</c:forEach><br>
		${vo.coupon_use_req} 이상 구매시 사용 가능<br>
		할인율 : ${vo.coupon_discount_percent}<br>
		유효기간 : ${vo.coupon_validate}<br>
		<button type="button" class="select" value="${vo.coupon_name}">선택</button>
		------------------------------------------------------<br>
	</c:forEach>
	
</body>
</html>