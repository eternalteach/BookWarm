<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	
	
	
	// 쿠폰 사용
	$('#modal').on('click', 'button', function() {
		$('#coupon').attr('value', $(this).val());

		var bookPrice = $('#total').val();
		bookPrice = bookPrice.substring(0,bookPrice.lastIndexOf('원')); // 책 판매 총액
		var discounted = $(this).attr('data-abc')/100*bookPrice; // 쿠폰 할인 금액

		// -0(쿠폰할인) << 이 부분에 빠지는 금액만큼 넣어주기
		$('#discountCoupon').html($(this).attr('data-abc')/100*bookPrice);

		// 전체 금액에서 빼주기(결제금액 = 결제금액-포인트 할인금액-쿠폰할인금액(discounted))
		$('#finalPay').html(finalPay-$('#point').val()-discounted);
		
		// 모달 종료
		$('#modal').fadeOut(500);
	});
	
	
	
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
   			}else {
   				// 가용포인트>=사용포인트 -> 사용 포인트에 입력
   				$('#usePoint').text(point);
   				// 최종금액(포인트 할인)에 반영
   				$('#discountPoint').html(point);
   				// 결제 금액에 반영
   				$('#finalPay').html(finalPay-point-$('#discountCoupon').html());
   			}
			
			
		}else {
			// 숫자가 아닌 값 입력 시 -> 경고창, 입력부분 비워버리기
			alert('숫자만 입력 가능합니다.');
			$('#point').val('');
		}
		
	})
	
	
	// 카드 결제 >> expired year (현재년도~10년뒤)
	for(var i = <%=year%>; i < <%=year+10%>; i++) {
		$('#cardyear').append('<option value='+i+'>'+i+'</option>')
	}
	
	
})
</script>