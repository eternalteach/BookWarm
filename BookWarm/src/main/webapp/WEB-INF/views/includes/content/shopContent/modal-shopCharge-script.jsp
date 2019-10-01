<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<% String context1 = request.getContextPath(); %>
<style>
	#modal {
		display:none;
		background-color:white;
		position:fixed;
		width: 365px;
		height: 530px;
		padding-left: 15px;
		padding-right: 15px;
		left: 50%;
		top: 30%;
	}
</style>
<script>
	// 쿠폰 선택 버튼 눌렀을 때 실행
	function pickCoupon() {
		$('#modal').fadeIn(500);
		
		$.ajax({
			url : '<%=context1%>/shop/pickCoupon',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				// data(쿠폰 객체를 담은 list)를 받아와서 couponList.jsp페이지에 값을 넘겨줘야함.
				var couponList = data;
				var str = "";
				str += "** 쿠폰페이지 **<br>";
				str += "보유 쿠폰<br><br><br>";
				
				for(var i=0; i<couponList.length; i++) {
					str += "쿠폰 번호 : "+couponList[i].coupon_no+"<br>";
					str += "쿠폰 이름 : "+couponList[i].coupon_name+"<br>";
					str += "이 쿠폰을 사용 할 수 있는 회원 level : ";
					for(var j=couponList[i].coupon_req; j<3; j++) {
						str = str + j + ", ";
					}
					str += "<br>"+couponList[i].coupon_use_req+"이상 구매시 사용 가능<br>";
					str += "할인율 : "+couponList[i].coupon_discount_percent+"<br>";
					str += "유효기간 : "+couponList[i].coupon_validate+"<br>";
					str += "<button type='button' class='select' data-abc="+couponList[i].coupon_discount_percent+" id='"+couponList[i].coupon_no+"' value='"+couponList[i].coupon_no+"'>선택</button><br>";
				}
				
				// 할인 및 적립>쿠폰 창에 쿠폰 이름 입력
				$('#modal').html(str);
				
			}, error : function() {
				console.log("error!");
			}
		})
	}
	
	$(document).ready(function() {
		$("#modal").hide();
	});
	
</script>