<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <div class="smartforms-px">
	<a href="#" data-smart-modal="#smart-modal-validation" class="smartforms-modal-trigger">Modal Validation</a>
</div> -->

	<div class="smartforms-modal-container" id="modal" style="overflow:auto">
		<div class="smartforms-modal-header">
 			<h3>주문 상세</h3>
			<a href="javascript:hideModal()" class="smartforms-modal-close" style="text-align:right">&times;</a> <!-- X버튼 ; 모달창끄기 -->
		</div>
		<!-- .smartforms-modal-header -->

		<div class="smartforms-modal-body">
			<div class="smart-wrap">
				<div class="smart-forms smart-container wrap-full">
					<!-- 모달창 시작하는 부분 -->
					<div class="form-body">
						
						<form method="post" action="" id="smart-form">
							
							<div class="frm-row section colm colm6">
								<h4>결제 정보</h4>
							</div>
							<div class="frm-row">
								<!-- 결제 방법 -->
								<div class="section colm">
									결제 방법 : <input type="text" name="orders_payment" id="orders_payment" class="gui-input" readonly>
								</div>								
								
								<!-- 주문 총액(할인받기 전 금액) -->
								<div class="section colm">
									주문 도서 총액 : <input type="text" name="orders_total" id="orders_total" class="gui-input" readonly>
								</div>
								
								<!-- 결제 금액(주문 총액-할인금액) -->
								<div class="section colm">
									결제 금액 : <input type="text" name="orders_pay_total" id="orders_pay_total" class="gui-input" readonly>
								</div>
								
								<!-- 환불받을 계좌 -->
								<div class="section colm">
									환불 받을 계좌번호 : <input type="text" name="refund_account" id="refund_account" class="gui-input" readonly>
								</div>
								
								<!-- 환불받을 은행 -->
								<div class="section colm">
									환불 받을 은행 : <input type="text" name="refund_bank" id="refund_bank" class="gui-input" readonly>
								</div>
								
								<!-- 주문일 -->
								<div class="section colm">
									주문일 : <input type="text" name="orders_date" id="orders_date" class="gui-input" readonly>
								</div>
								
								<!-- 결제일 -->
								<div class="section colm">
									결제일 : <input type="text" name="orders_pay_date" id="orders_pay_date" class="gui-input" readonly>
								</div>
							</div>



							
							<div id="coupon_area">
							</div>
							
							
							
							
							<div class="frm-row section colm colm6">
								<h4>배송 정보</h4>
							</div>
							<div class="frm-row">
								<!-- 배송 받을 사람 이름 -->
								<div class="section colm">
									이름 : <input type="email" name="post_name" id="post_name" class="gui-input" readonly>
								</div>
								
								<!-- 배송 받을 사람 전화번호 -->
								<div class="section colm">
									전화번호 : <input type="email" name="post_phone" id="post_phone" class="gui-input" readonly>
								</div>
								
								<!-- 배송 우편번호 -->
								<div class="section colm">
									우편 번호 : <input type="email" name="post_zipcode" id="post_zipcode" class="gui-input" readonly>
								</div>
								
								<!-- 배송 주소 -->
								<div class="section colm">
									주소 : <input type="email" name="post_addr" id="post_addr" class="gui-input" readonly>
								</div>
								
								<!-- 할인 받은 금액 -->
								<div class="section colm">
									<input type="email" name="post_addr_detail" id="post_addr_detail" class="gui-input" readonly>
								</div>
								
							</div>
							<!-- end .frm-row section -->
							
							
							
							<div class="smartforms-modal-footer">
								<button type="submit" class="button btn-primary">수정하기</button>
							</div>
							<!-- end .form-footer section -->
						</form>
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
