<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <div class="smartforms-px">
	<a href="#" data-smart-modal="#smart-modal-validation" class="smartforms-modal-trigger">Modal Validation</a>
</div> -->

	<div class="smartforms-modal-container" id="modal">

		<div class="smartforms-modal-header">
			<h3>주문 상세</h3>
			<!-- <a href="javascript:hideModal()" class="smartforms-modal-close">&times;</a>	X버튼 ; 모달창끄기 -->
		</div>
		<!-- .smartforms-modal-header -->

		<div class="smartforms-modal-body">
			<div class="smart-wrap">
				<div class="smart-forms smart-container wrap-full">
					<!-- 모달창 시작하는 부분 -->
					<div class="form-body">
						<a href="javascript:hideModal()" class="smartforms-modal-close">&times;</a> <!-- X버튼 ; 모달창끄기 -->
						
						<form method="post" action="" id="smart-form">
							
							<div class="frm-row section colm colm6">
								pay 정보
							</div>
							<div class="frm-row">
								<div class="section colm colm6">
									<label class="field prepend-icon">
										<input type="text" name="firstname" id="firstname" class="gui-input">
										<span class="field-icon">
											<i class="fa fa-user"></i>
										</span>
									</label>
								</div>								
								<!-- end section -->
								
								<div class="section colm colm6">
									<label class="field prepend-icon">
										<input type="text" name="lastname" id="lastname" class="gui-input">
										<span class="field-icon">
											<i class="fa fa-user"></i>
										</span>
									</label>
								</div>
								<!-- end section -->
							</div>
							
							<!-- end .frm-row section -->
							<div class="frm-row">
								<div class="section colm colm6">
									<label class="field prepend-icon"> <input type="email"
										name="emailaddress" id="emailaddress" class="gui-input"
										placeholder="Email address"> <span class="field-icon"><i
											class="fa fa-envelope"></i></span>
									</label>
								</div>
								<!-- end section -->
								<div class="section colm colm6">
									<label class="field prepend-icon"> <input type="tel"
										name="telephone" id="telephone" class="gui-input"
										placeholder="Telephone number"> <span
										class="field-icon"><i class="fa fa-phone-square"></i></span>
									</label>
								</div>
								<!-- end section -->
							</div>
							<!-- end .frm-row section -->
							<div class="frm-row">
								<div class="section colm colm6">
									<label class="field prepend-icon"> <input type="text"
										name="address" id="address" class="gui-input"
										placeholder="Physical address"> <span
										class="field-icon"><i class="fa fa-map-marker"></i></span>
									</label>
								</div>
								<!-- end section -->
								<div class="section colm colm6">
									<label class="field select"> <select name="departments"
										id="departments">
											<option value="">Select Department</option>
											<option value="Sales">Sales and Marketing</option>
											<option value="Techical">Techical</option>
											<option value="Management">Management</option>
											<option value="ICT">ICT</option>
									</select> <i class="arrow double"></i>
									</label>
								</div>
								<!-- end section -->
							</div>
							<!-- end .frm-row section -->
							<div class="section">
								<label class="field prepend-icon">
									<textarea class="gui-textarea" id="sendermessage" name="sendermessage" placeholder="Your message"></textarea>
									<span class="field-icon">
										<i class="fa fa-comments"></i>
									</span>
									<span class="input-hint">
										<strong>DO NOT:</strong> Be negative or off topic, we expect a great comment...
									</span>
								</label>
							</div>
							<!-- end section -->
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
