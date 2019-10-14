<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <div class="smartforms-px">
	<a href="#" data-smart-modal="#smart-modal-validation" class="smartforms-modal-trigger">Modal Validation</a>
</div> -->
	<div class="smartforms-modal-container" id="modal" style="overflow:auto">
		<div class="smartforms-modal-header">
 			<h3 style="padding-top:15px;">주문상세</h3>
			<a href="javascript:hideModal()" class="smartforms-modal-close" style="text-align:center;padding-top:10px;">&times;</a> <!-- X버튼 ; 모달창끄기 -->
		</div>
		<!-- .smartforms-modal-header -->

		<div class="smartforms-modal-body">
			<div class="smart-wrap">
				<div class="smart-forms smart-container wrap-full">
					<!-- 모달창 시작하는 부분 -->
					<div class="form-body" style="background-color:white;padding-top:20px;">
						<!-- 수정하기 부분 나중에 구현 -->
						<form method="post" action="/warm/modify" id="smart-form">
							
							<div class="frm-row section colm colm6">
								<h4 style="text-align:center;font-style:bold;margin-bottom:5px;">결제정보</h4>
							</div>
							<div class="frm-row">
								<!-- 결제 방법 -->
								<div class="section colm">
									결제 방법 : <input type="text" name="orders_payment" id="orders_payment" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>								
								
								<!-- 주문 총액(할인받기 전 금액) -->
								<div class="section colm">
									주문 도서 총액 : <input type="text" name="orders_total" id="orders_total" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 배송비 -->
								<div class="section colm">
									배송비 : <input type="text" name="delivery_fee" id="delivery_fee" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 차감된 포인트 -->
								<div class="section colm">
									차감된 포인트 : <input type="text" name="discounted_point" id="discounted_point" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 결제 금액(주문 총액-할인금액) -->
								<div class="section colm">
									결제 금액 : <input type="text" name="orders_pay_total" id="orders_pay_total" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 환불받을 계좌 -->
								<div class="section colm">
									환불 받을 계좌번호 : <input type="text" name="refund_account" id="refund_account" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 환불받을 은행 -->
								<div class="section colm">
									환불 받을 은행 : <input type="text" name="refund_bank" id="refund_bank" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 주문일 -->
								<div class="section colm">
									주문일 : <input type="text" name="orders_date" id="orders_date" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 결제일 -->
								<div class="section colm">
									결제일 : <input type="text" name="orders_pay_date" id="orders_pay_date" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
							</div>



							
							<div id="coupon_area">
							</div>
							
							
							
							
							<div class="frm-row section colm colm6">
								<h4 style="text-align:center;font-style:bold;margin-bottom:5px;margin-top:10px;border-top:1px solid #EAEAEA;padding-top:10px;">배송정보</h4>
							</div>
							<div class="frm-row">
								<!-- 배송 받을 사람 이름 -->
								<div class="section colm" >
									이름 : <input type="email" name="post_name" id="post_name" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 배송 받을 사람 전화번호 -->
								<div class="section colm">
									전화번호 : <input type="email" name="post_phone" id="post_phone" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 배송 우편번호 -->
								<div class="section colm">
									우편 번호 : <input type="email" name="post_zipcode" id="post_zipcode" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 배송 주소 -->
								<div class="section colm">
									주소 : <input type="email" name="post_addr" id="post_addr" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
								<!-- 할인 받은 금액 -->
								<div class="section colm">
									<input type="email" name="post_addr_detail" id="post_addr_detail" class="gui-input" readonly style="margin-top:5px;width:272px;">
								</div>
								
							</div>
							<!-- end .frm-row section -->
							
							
							
							<div class="smartforms-modal-footer">
								<button type="submit" class="btn v-btn standard lightgrey standard" style="margin-left:75px;">수정</button>
							</div>
							<!-- end .form-footer section -->
						</form>
					</div>
	</div>
					<!-- end .form-body section -->
				</div>
				<!-- end .smart-forms section -->
			</div>
			<!-- end .smart-wrap section -->
		</div>
		<!-- .smartforms-modal-body -->
	</div>
	<!-- .smartforms-modal-container -->
<!-- .smartforms-modal -->
