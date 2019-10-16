<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<style>
	#modal {
		display:none;
		background-color:gray;
		position:fixed;
		width: 365px;
		height: 500px;
		left: 30%;
		top: 20%;
	}
</style>
<script>
	$(document).ready(function(){
		
		$('#modal').hide();
		
	}); 

// 모달 창 끄기
function hideModal() {
	$('#modal').fadeOut();
	//$('body').css("overflow", "auto");
}

// 모달 창 클릭시 발생하는 이벤트
function showDetail(orders_no) {
	$('#modal').fadeIn(500);
	//$('body').css("overflow", "hidden");
	$.ajax ({
		type: "get",
	    url : '/warm/orderDetails?orders_no='+orders_no,
	    dataType: "json",
	    contentType:"application/json;charset=UTF-8",
	    async: false,
	    success : function(data, status, xhr) {
			console.log(data.order.orders_no);
			console.log(data.post);
			$('#post_name').attr('value', data.post.post_name);
			$('#post_phone').attr('value', data.post.post_phone);
			$('#post_zipcode').attr('value', data.post.post_zipcode);
			$('#post_addr').attr('value', data.post.post_addr);
			$('#post_addr_detail').attr('value', data.post.post_addr_detail);
			
			$('#orders_payment').attr('value', data.order.orders_payment);
			$('#orders_total').attr('value', data.order.orders_total+"원");
			$('#delivery_fee').attr('value', data.order.delivery_fee+"원");
			$('#discounted_point').attr('value', data.order.discounted_point+"p");
			$('#orders_pay_total').attr('value', data.order.orders_pay_total+"원");
			$('#refund_account').attr('value', data.order.refund_account);
			$('#refund_bank').attr('value', data.order.refund_bank);
			$('#orders_date').attr('value', data.order.orders_date);
			
			if(data.order.orders_pay_date == null) {
				$('#orders_pay_date').attr('value', '결제를 진행해주세요.');
			}else {
				$('#orders_pay_date').attr('value', data.order.orders_pay_date);
			}
			
			// 쿠폰 검사
			if(data.coupon != null) {
				let couponHTML="";
				couponHTML += "<div class='frm-row section colm colm6'>";
				couponHTML += "<h4>사용된 쿠폰 정보</h4>";
				couponHTML += "</div>";
				couponHTML += "<div class='frm-row'>";
				couponHTML += "<div class='section colm'>";
				couponHTML += "쿠폰 이름 : <input type='text' name='coupon_name' id='coupon_name' class='gui-input' readonly>";
				couponHTML += "</div>";
				couponHTML += "<div class='section colm'>";
				couponHTML += "할인율 : <input type='text' name='coupon_discount_percent' id='coupon_discount_percent' class='gui-input' readonly>";
				couponHTML += "</div>";
				couponHTML += "<div class='section colm'>";
				couponHTML += "할인 받은 금액 : <input type='text' name='coupon_discounted_amount' id='coupon_discounted_amount' class='gui-input' readonly>";
				couponHTML += "</div>";
				couponHTML += "</div>";
				
				$('#coupon_area').html(couponHTML);
				
				$('#coupon_name').attr('value', data.coupon.coupon_name);
				
				var coupon_discount_percent = data.coupon.coupon_discount_percent+"%";
				$('#coupon_discount_percent').attr('value', coupon_discount_percent);
				
				// 얼마나 할인받았는지 계산
				$('#coupon_discounted_amount').attr('value', data.order.orders_pay_total-data.order.orders_total);
			}
			
			
		}, error : function(){
			console.log("error!");
		}
	})
}
</script>     
