<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	String todayAll = formatter.format(new Date());
	String[] today = todayAll.split("-", 3);
	int year = Integer.parseInt(today[0]);
%>

<script>
$(document).ready(function() {
	var total = parseInt($('#total').val()); // 총 도서 금액
	var delivery = $('#delivery').html(); // 배송비(2500원 or 무료)
	var finalPay; // 최종 금액 >> 계속 사용할 변수임
	
	// 결제 금액에 총 도서 금액 + 배송비 넣기
	if(delivery == "2500원") {
		finalPay = total+2500;
	}else {
		finalPay = total;
	}
	$('#finalPay').html(finalPay);
	$('#submitTotal').val(finalPay);
	
	
	// 쿠폰 사용
	$('#modal').on('click', 'button', function() {
		var bookPrice = $('#total').val(); // 책 판매 총액
		//bookPrice = bookPrice.substring(0, bookPrice.lastIndexOf("원"));
		var discounted = $(this).attr('data-abc'); // 쿠폰할인액
		discounted = discounted/100*bookPrice; // 쿠폰할인액
		
		if(finalPay-$('#point').val() >= discounted) {
			// 도서총합계+배송비-포인트할인 >= 쿠폰할인
			
			// 할인 및 적립	>> 쿠폰 input 부분에 사용쿠폰 이름
			$('#coupon').attr('value', $(this).val());
			$('#submitCoupon').attr('value', $(this).val());
			
			// -0(쿠폰할인) << 이 부분에 빠지는 금액만큼 넣어주기
			$('#discountCoupon').html($(this).attr('data-abc')/100*bookPrice);
	
			// 전체 금액에서 빼주기(결제금액 = 결제금액-포인트 할인금액-쿠폰할인금액(discounted))
			$('#finalPay').html(finalPay-$('#point').val()-discounted);
			$('#submitTotal').val(finalPay-$('#point').val()-discounted);
		}else {
			alert("쿠폰 할인 금액이 총 금액을 넘어갑니다. 다른 쿠폰을 선택해주세요.");
		}
		
		// 모달 종료
		$('#modal').fadeOut(500);
	
	});
	
	
	
	// 쿠폰 사용 취소
	$('#cancleCoupon').on('click', function() {
		// 할인 및 적립	>> 쿠폰 input 부분에 사용쿠폰 이름 비우기
		$('#coupon').attr('value', "");
		
		// 결제쪽 쿠폰할인에 0
		var bookPrice = $('#total').val(); // 책 판매 총액
		$('#discountCoupon').html(0);
		$('#finalPay').html(finalPay-$('#point').val());
		$('#submitPay').val(finalPay-$('#point').val());
	})
	
	
	
	// 적립금(포인트) 사용
	$('#applyPoint').on('click', function() {
		var point = $('#point').val(); // 사용하려고 입력한 포인트
		var availablePoint = parseInt($('#availablePoint').text()); // 가용포인트
		var numExp = /[0-9]/; // 숫자만 입력하는 정규식
		
		if(numExp.test(point)) {
			// 받아온 값이 숫자면 parseInt 해준다.
			point  = parseInt(point);
		
			if(availablePoint<point) {
     			// 가용포인트<사용하려는 포인트 -> 경고창
   				alert("가용 포인트는 "+availablePoint+"p 입니다.");
   				$('#point').val('');
   			}else if(finalPay-$('#discountCoupon').html() >= point && point>=0) { 
   				// 쿠폰할인받은 금액보다 포인트할인금액이 더 작은 경우, 사용하려는 포인트가 양수인 경우에만 실행
   				// 가용포인트>=사용포인트 -> 사용 포인트에 입력
   				$('#usePoint').text(point);
   				// 최종금액(포인트 할인)에 반영
   				$('#discountPoint').html(point);
   				// 결제 금액에 반영
   				$('#finalPay').html(finalPay-point-$('#discountCoupon').html());
   				$('#submitTotal').val(finalPay-point-$('#discountCoupon').html());
   			}else if(point<0) {
   				// 포인트 사용에 음수 입력
   				alert("0원 이상의 금액을 입력해주세요.");
   				$('#point').val('');
   			}else {
   				// 도서 총 합계+배송비-쿠폰할인 < 포인트할인
   				alert("포인트 사용 금액이 총 금액을 넘습니다. 다시 입력해주세요.");
   				$('#point').val('');
   			}
			
		}else {
			// 숫자가 아닌 값 입력 시 -> 경고창, 입력부분 비워버리기
			alert('숫자만 입력 가능합니다.');
			$('#point').val('');
		}
		
	})
	
	
	////////////////////////////결제부분///////////////////////////////////////////
	
	// 주문 버튼 눌렀을 때
	$('#submit').on('click', function() {
		
		var post_name = $('#post_name').val(); // 이름
		var post_phone = $('#post_phone').val(); // 휴대폰번호
		var post_zipcode = $('#sample4_postcode').val(); // 우편번호
		var post_addr = $('#sample4_roadAddress').val(); // 주소
		var refundAccount = $('#refundAccount').val(); // 환불 계좌
		
		var numExp = /^[0-9]+$/; // 숫자 정규식
		var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // 폰번호 정규식
		
		if(post_name=="" || post_phone=="" || post_zipcode=="" ||
				post_addr=="" || refundAccount=="") {
			// 폼 입력 안된거 있으면 안넘어가도록(이름, 휴대폰번호, 주소, 환불계좌)
			alert("모든 폼을 입력해주세요.");
		}else if(!numExp.test(refundAccount)){
			// 환불계좌에 숫자가 아닌게 들어간 경우
			alert("환불 계좌번호에 숫자만 입력해주세요.");
		}else if(!phoneExp.test(post_phone)) {
			// 핸드폰번호 형식이 아닌 다른게 들어간 경우
			alert("휴대폰 번호는 '000-0000-0000' 또는 '000-000-0000' 형식으로 입력해주세요.");
		}else {
			// 폼 입력 다 했고, 환불계좌랑 휴대폰번호에도 알맞게 입력했다면 submit버튼
			$(this).attr('type', 'submit');
		}
		
	})
	
})
</script>