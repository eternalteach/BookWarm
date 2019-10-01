<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
   <div class="wrapper">
      <div class="page has-sidebar has-right-sidebar bordered">

         <section class="page-header b-bordered t-bordered">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <h1 class="title">Shop - Checkout</h1>
                     <ol class="breadcrumb pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Shop</a></li>
                        <li class="active">Checkout</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <div class="page-inner no-border">

            <section class="section-primary main-color">

               <div class="container">
			<!-- --------------------------------------------------------------------------------------- -->
			<form method="post" action="/warm/shop/successOrder" id="account2">
                  <div class="row">

                     <div class="col-md-7">
						<!-- 폼 작성부분(왼쪽) -->
                        <div class="smart-forms">

                           <div class="form-header pt-0 pl-0">
                              <h4 class="fs-24">결제 상세 정보</h4>
                           </div>
                              <div class="form-body pl-0">

                                 <div class="spacer-b30">
                                    <div class="tagline"><span>배송지 정보</span></div><!-- .tagline -->
                                 </div>
                                 
                                 <div class="section">
                                    <label class="field prepend-icon">
                                       <input type="text" id="post_name" name="post_name" class="gui-input" placeholder="이름">
<!--                                        <input type="text" name="name" id="name" class="gui-input" placeholder="이름"> -->
                                       <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="section">
                                    <label for="mobile" class="field prepend-icon">
                                       <input type="tel" id="post_phone" name="post_phone" class="gui-input" placeholder="휴대폰 번호">
<!--                                        <input type="tel" name="mobile" id="mobile" class="gui-input" placeholder="휴대폰 번호"> -->
                                       <span class="field-icon"><i class="fa fa-phone-square"></i></span>
                                    </label>
                                 </div><!-- end section --><br>

                                 <div class="frm-row">
                                   	<!-- 삽입 시작////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                                   	<div class="section colm colm8">
                                   		<label class="field prepend-icon">
                                    	   <input type="text" id="sample4_postcode" name="post_zipcode" class="gui-input" placeholder="우편번호">
	                                       <span class="field-icon"><i class="fa fa-building-o"></i></span>
	                                    </label>
                                    </div>
                                    <div class="section colm colm4">
	                                    <label class="field prepend-icon">
	                                    	<span class="field-icon"><i class="fa fa-map-marker"></i></span>
	                                    	<input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	                                    </label>
                                   	</div>
	                             </div>
	                             <div class="frm-row">
                                    <div class="section colm colm6">
                                       		<input type="text" id="sample4_roadAddress" name="post_addr" class="gui-input" placeholder="도로명주소">
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_jibunAddress" class="gui-input" placeholder="지번주소">
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                                 
                                 <span id="guide" style="color:#999;display:none"></span>
	                             
	                             <div class="frm-row">
                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_detailAddress" name="post_addr_detail1" class="gui-input" placeholder="상세주소">
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_extraAddress" name="post_addr_detail2" class="gui-input" placeholder="참고항목">
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                                 <!-- 삽입 끝////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

                                 <div class="section">
                                    <label class="field option option-yellow">
                                       <input type="checkbox" checked>
<!--                                        <input type="checkbox" name="info" checked> -->
                                       <span class="checkbox"></span>
                                       Save my information <em class="small-text fine-grey"> (No worries, its secure) </em>
                                    </label>
                                 </div><!-- end section -->
								 
								 <hr class="invisible" />
		                         <div class="spacer-b30">
		                            <div class="tagline"><span>할인 및 적립</span></div><!-- .tagline -->
		                         </div>
                                 
                                 <div class="frm-row"><!-- class에 가운데정렬 하는 클래스 주기! -->
                                 	<div class="section colm colm2">
                                 		쿠폰
                                 	</div>
                                   	<div class="section colm">
                                   		<label class="field">
                                    	   <input type="text" id="coupon" name="useCoupon" class="gui-input" placeholder="쿠폰" readonly>
	                                    </label>
                                    </div>
                                    <div class="section colm">
	                                    <label class="field">
	                                    	<a href="javascript:pickCoupon()"><button type="button" class="btn btn-primary" id="pickCoupon">쿠폰적용</button></a>
	                                    	<button type="button" class="btn btn-primary" id="cancleCoupon">쿠폰적용 취소</button>
	                                    </label>
                                   	</div>
	                             </div>
                                 
                                 <div class="frm-row"><!-- class에 가운데정렬 하는 클래스 주기! -->
                                 	<div class="section colm colm2">
                                 		적립금
                                 	</div>
                                   	<div class="section colm">
                                   		<label class="field">
                                    	   <input type="text" id="point" name="usePoint" class="gui-input" placeholder="적립금">
	                                    </label>
                                    </div>
                                    <div class="section colm">
	                                    <label class="field">
	                                    	<input type="button" class="btn btn-primary" id="applyPoint" value="사용하기">
	                                    </label>
                                   	</div>
                                    <div class="section colm">
	                                    <label class="field">
	                                    	가용 포인트 <span id="availablePoint">${userVO.user_point}</span>p / 사용 <span id="usePoint">0</span>p
	                                    	<input type="hidden" name="originalPoint" value="${userVO.user_point}">
	                                    </label>
                                   	</div>
	                             </div>
	                             
                              </div><!-- end .form-body section -->
                           <!-- </form> -->
                        </div>
                        <!-- 폼 작성부분(왼쪽) -->
                       
                     </div>

                     <div class="col-md-5">

                        <div class="smart-forms smart-container wrap-3">

                           <div class="form-header">
                              <h4 class="fs-24">Your Order</h4>
                           </div><!-- end .form-header section -->
                           <!-- <form method="post" action="/warm/shop/successOrder" id="account2"> -->
                              <div class="form-body pt-15">
                                 <div class="table-responsive">
                                    <table class="table cart-totals">
                                       <tbody>
                                          <tr class="cart_item">
                                             <td class="cart-product-name"></td>
                                             <td class="cart-product-name"><strong>상품명</strong></td>
			                           		 <td class="cart-product-name"><strong>가격</strong></td>
			                           		 <td class="cart-product-name"><strong>수량</strong></td>
			                           		 <td class="cart-product-name"><strong>합계</strong></td>
                                          </tr>
                                          <c:forEach items="${list}" var="list">
				                             <tr>
				                           	 	<td class="cart-product-name amount"><img width="50" height="50" src="${list.book_img}"></td>
				                           	 	<td class="cart-product-name amount">${list.book_title}</td>
				                           		<td class="cart-product-name amount">${list.book_price_for_sale}원</td>
				                           		<td class="cart-product-name amount">${list.cart_cnt}</td>
				                           		<td class="cart-product-name amount">${list.total}원</td>
				                             	<input type="hidden" name="isbn" value="${list.isbn}">
				                             	<input type="hidden" name="cart_cnt" value="${list.cart_cnt}">
				                             </tr>
							   			  </c:forEach>
							   			  
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>배송비</strong>
                                             </td>

                                             <td class="cart-product-name" colspan="4">
                                                <span class="amount" id="delivery">${delivery}</span>
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>할인</strong>
                                             </td>
                                             <td class="cart-product-name" colspan="4">
                                                -<span class="amount" id="discountPoint">0</span>(포인트 할인)
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                          	 <td class="cart-product-name">
                                             </td>
                                          	 <td class="cart-product-name" colspan="4">
                                             	-<span class="amount" id="discountCoupon">0</span>(쿠폰 할인)
                                             	<input type="hidden" name="coupon_no" id="submitCoupon">
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>결제 금액</strong>
                                             </td>

                                             <td class="cart-product-name" colspan="4">
                                                <span class="amount color"><strong id="finalPay">${subTotal}</strong></span>
                                                <input type="hidden" name="orders_pay_total" id="submitTotal" value="${subTotal}">원
                                                <%-- <input type="hidden" name="orders_total" id="submitTotal" value="${subTotal}">원 --%>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>

                                 <div class="spacer-t40 spacer-b30">
                                    <div class="tagline"><span> 결제 정보 </span></div><!-- .tagline -->
                                   <input type="hidden" id="total" name="orders_total" value="${subTotal}">
                                 </div>

                                 <div class="section">
                                    <p class="small-text fine-grey">결제하실 정보를 입력해주세요.</p>
                                 </div><!-- end section -->

                                 <div class="section pb-15">
                                    <label class="field option option-yellow">
                                       <input type="radio" id="cash" name="orders_payment" class="payment" value="cash" checked>
                                       <span class="radio"></span> 무통장입금
                                    </label>

                                    <label class="field option option-yellow">
                                       <input type="radio" id="kakao" name="orders_payment" class="payment" value="kakao">
                                       <span class="radio"></span> 카카오페이
                                    </label>
                                 </div><!-- end section -->
							 <!-- ///////////////////////////////// -->
							 <div class="spacer-t40 spacer-b30">
                                    <div class="tagline"><span> 환불 정보 </span></div><!-- .tagline -->
                              </div>
 							  <div class="fmx">
 							  		<div class="section colm colm6">
                                       <label class="field select">
                                          <select id="refundBank" name="refund_bank">
                                             <option value="A">A은행</option>
                                             <option value="B">B은행</option>
                                             <option value="C">C은행</option>
                                             <option value="D">D은행</option>
                                          </select>
                                       </label>
                                    </div>

                                    <div class="section">
                                       <label class="field prepend-icon">
                                          <input type="text" id="refundAccount" name="refund_account" class="gui-input" placeholder="환불 계좌번호">
                                          <span class="field-icon"><i class="fa fa-credit-card"></i></span>
                                       </label>
                                    </div>
                              </div>
    						<!-- ///////////////////////////////// -->                                                         
                              </div><!-- end .form-body section -->
                              <div class="form-footer">
                                 <button type="button" id="submit" class="btn btn-primary w-100">주문</button>
                              </div><!-- end .form-footer section -->
                           <!-- </form> --><!-- end form -->
                        </div>
                     </div>
                  </div>
                  </form>
                  <!-- ---------------------------------------------------------------------- -->
               </div>
            </section>
         </div>
      </div>

   </div>
   
	<%@ include file="./modal-shopCharge-script.jsp"%>
	<!-- 쿠폰 선택하는 모달창 -->
	<%@ include file="./couponList.jsp"%>
