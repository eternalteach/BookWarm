<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link rel="stylesheet" type="text/css"  href="/warm/resources/VertexEx/smartforms/JavascriptTemplates/css/smart-forms.css">
<!-- <link rel="stylesheet" type="text/css"  href="/warm/resources/VertexEx/smartforms/JavascriptTemplates/css/smart-addons.css"> -->
<link rel="stylesheet" type="text/css"  href="/warm/resources/VertexEx/smartforms/JavascriptTemplates/css/font-awesome.min.css">
<!-- <script type="text/javascript" src="/warm/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/warm/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/warm/resources/VertexEx/smartforms/JavascriptTemplates/js/additional-methods.min.js"></script>
<script type="text/javascript" src="/warm/resources/VertexEx/smartforms/JavascriptTemplates/js/smartforms-modal.min.js"></script>   -->

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
	
	/* $( "#smart-form" ).validate({
			errorClass: "state-error",
			validClass: "state-success",
			errorElement: "em",
			onkeyup: false,
			onclick: false,
			rules: {
					firstname: {
							required: true,
							minlength: 2
					},
					lastname: {
							required: true,
							minlength: 2
					},									
					emailaddress: {
							required: true,
							email: true
					},							
					sendermessage: {
							required: true,
							minlength: 10
					}
			},
			messages:{
					firstname: {
							required: 'Enter your first name',
							minlength: 'Enter at least 2 characters'
					},
					lastname: {
							required: 'Enter your last name',
							minlength: 'Enter at least 2 characters'
					},											
					emailaddress: {
							required: 'Enter your email address',
							email: 'Enter a VALID email address'
					},													
					sendermessage: {
							required: 'Please enter your message',
							minlength: 'Message must be at least 10 characters'
					}
			},
			highlight: function(element, errorClass, validClass) {
					$(element).closest('.field').addClass(errorClass).removeClass(validClass);
			},
			unhighlight: function(element, errorClass, validClass) {
					$(element).closest('.field').removeClass(errorClass).addClass(validClass);
			},
			errorPlacement: function(error, element) {
			   if (element.is(":radio") || element.is(":checkbox")) {
						element.closest('.option-group').after(error);
			   } else {
						error.insertAfter(element.parent());
			   }
			}
	}); */

}); 

// 모달 창 끄기
function hideModal() {
	$('#modal').fadeOut();
}

// 모달 창 클릭시 발생하는 이벤트
function showDetail(orders_no) {
	$('#modal').fadeIn(500);
	$('body').css("overflow", "hidden");
	$.ajax ({
		type: "get",
	    url : '/warm/orderDetails?orders_no='+orders_no,
	    dataType: "json",
	    contentType:"application/json;charset=UTF-8",
	    async: false,
	    success : function(data, status, xhr) {
			console.log(data.order.orders_no);
			console.log(data.post);
			$('#orders_payment').attr('value', data.order.orders_payment);
			$('#orders_total').attr('value', data.order.orders_total);
			$('#orders_pay_total').attr('value', data.order.orders_pay_total);
			$('#refund_account').attr('value', data.order.refund_account);
			$('#refund_bank').attr('value', data.order.refund_bank);
			$('#orders_date').attr('value', data.order.orders_date);
			if(data.order.orders_pay_date == null) {
				$('#orders_pay_date').attr('value', '결제를 진행해주세요.');
			}else {
				$('#orders_pay_date').attr('value', data.order.orders_pay_date);
			}
			if(data.coupon.coupon_name != null) {
				$('#coupon_area').html("<div class='frm-row section colm colm6'>");
				$('#coupon_area').html("<h4>사용된 쿠폰 정보</h4>");
				$('#coupon_area').html("</div>");
				$('#coupon_area').html("<div class='frm-row'>");
				$('#coupon_area').html("<div class='section colm'>");
				$('#coupon_area').html("쿠폰 이름 : <input type='text' name='coupon_name' id='coupon_name' class='gui-input'>");
				$('#coupon_area').html("</div>");
				$('#coupon_area').html("<div class='section colm'>");
				$('#coupon_area').html("할인율 : <input type='email' name='coupon_discount_percent' id='coupon_discount_percent' class='gui-input'>");
				$('#coupon_area').html("</div>");
				$('#coupon_area').html("<div class='section colm'>");
				$('#coupon_area').html("할인 받은 금액 : <input type='email' name='coupon_discounted_amount' id='coupon_discounted_amount' class='gui-input'>");
				$('#coupon_area').html("</div>");
				$('#coupon_area').html("</div>)");
			}
			$('#coupon_name').attr('value', data.coupon.coupon_name);
			$('#coupon_discount_percent').attr('value', data.coupon.coupon_discount_percent);
			
			$('#post_name').attr('value', data.post.post_name);
			$('#post_phone').attr('value', data.post.post_phone);
			$('#post_zipcode').attr('value', data.post.post_zipcode);
			$('#post_addr').attr('value', data.post.post_addr);
			$('#post_addr_detail').attr('value', data.post.post_addr_detail);
		}, error : function(){
			console.log("error!");
		}
	})
}
</script>     
