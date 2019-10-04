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
		height: 530px;
		left: 50%;
		top: 30%;
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
	$.ajax ({
		type: "get",
	    url : '/warm/orderDetails?orders_no='+orders_no,
	    dataType: "json",
	    contentType:"application/json;charset=UTF-8",
	    async: false,
	    success : function(data, status, xhr) {
			console.log(data.order.orders_no);
			console.log(data.post);
			
			
			
		}, error : function(){
			console.log("error!");
		}
	})
}
</script>     
