<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="smartforms-modal-container modal1" id="setCouponModal" style="overflow:auto">
	<div class='smartforms-modal-header'>
		<h3 style="margin-top:10px;">쿠폰등록</h3>
		<a href='javascript:hideModal()' class='smartforms-modal-close' style='text-align:left;width: 40px;height:50px;margin-top:5px;'>X</a>
	</div>
				
	<div class='smartforms-modal-body'>
		<div class='smart-wrap'>
			<div class='smart-forms smart-container wrap-full'>
				<div class='form-body'>
					<div class='frm-row'>
						
						<form action="javascript:searchCoupon($('#couponNo').val())">
							<!-- <input type="text" id="couponNo" placeholder="쿠폰 번호를 입력하세요." name="coupon_no">
							<input type="submit" value="검색"><br> -->
							
							
							 <div class="frm-row">
                             	<div class="section colm colm8">
                               		<label class="field">
                               			<input type="text" id="couponNo" placeholder="쿠폰 번호를 입력하세요." name="coupon_no" class="gui-input">
                                 	</label>
                                </div>
                                <div class="section colm colm4">
                                	<label class="field">
                                 		<input type="submit" class="btn v-btn standard lightgrey standard" value="검색">
                                 	</label>
                               	</div>
	                          </div>
							
							
						</form>
						
						<div id="showCoupons">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

