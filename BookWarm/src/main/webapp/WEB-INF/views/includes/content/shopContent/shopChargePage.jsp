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

                  <div class="row">

                     <div class="col-md-7">
						<!-- 폼 작성부분(왼쪽) -->
                        <div class="smart-forms">

                           <div class="form-header pt-0 pl-0">
                              <h4 class="fs-24">결제 상세 정보</h4>
                           </div>
                           <form method="post" action="/" id="accountx" name="chargeForm">
                              <div class="form-body pl-0">

                                 <div class="spacer-b30">
                                    <div class="tagline"><span>배송지 정보</span></div><!-- .tagline -->
                                 </div>
                                 
                                 <div class="section">
                                    <label class="field prepend-icon">
                                       <input type="text" name="name" id="name" class="gui-input" placeholder="이름">
                                       <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                 </div><!-- end section -->

                                 <div class="section">
                                    <label for="mobile" class="field prepend-icon">
                                       <input type="tel" name="mobile" id="mobile" class="gui-input" placeholder="휴대폰 번호">
                                       <span class="field-icon"><i class="fa fa-phone-square"></i></span>
                                    </label>
                                 </div><!-- end section --><br>

                                 <div class="frm-row">
                                   	<!-- 삽입 시작////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                                   	<div class="section colm colm8">
                                   		<label class="field prepend-icon">
                                    	   <input type="text" id="sample4_postcode" class="gui-input" placeholder="우편번호">
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
                                       		<input type="text" id="sample4_roadAddress" class="gui-input" placeholder="도로명주소">
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_jibunAddress" class="gui-input" placeholder="지번주소">
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                                 
                                 <span id="guide" style="color:#999;display:none"></span>
	                             
	                             <div class="frm-row">
                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_detailAddress" class="gui-input" placeholder="상세주소">
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_extraAddress" class="gui-input" placeholder="참고항목">
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                                 <!-- 삽입 끝////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

                                 <div class="section">
                                    <label class="field option option-yellow">
                                       <input type="checkbox" name="info" checked>
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
                                   	<div class="section colm colm6">
                                   		<label class="field">
                                    	   <input type="text" id="coupon" name="coupon" class="gui-input" placeholder="쿠폰" readonly>
	                                    </label>
                                    </div>
                                    <div class="section colm colm3">
	                                    <label class="field">
	                                    	<input type="button" class="btn btn-primary" id="pickCoupon" value="쿠폰 적용">
	                                    </label>
                                   	</div>
	                             </div>
                                 
                                 <div class="frm-row"><!-- class에 가운데정렬 하는 클래스 주기! -->
                                 	<div class="section colm colm2">
                                 		적립금
                                 	</div>
                                   	<div class="section colm">
                                   		<label class="field">
                                    	   <input type="text" id="point" class="gui-input" placeholder="적립금">
	                                    </label>
                                    </div>
                                    <div class="section colm">
	                                    <label class="field">
	                                    	<input type="button" class="btn btn-primary" id="applyPoint" value="사용하기">
	                                    </label>
                                   	</div>
                                    <div class="section colm">
	                                    <label class="field">
	                                    	가용 포인트 <span id="availablePoint">${userVO.user_point}</span>p / 사용 <span name="usePoint" id="usePoint">0</span>p
	                                    </label>
                                   	</div>
	                             </div>
	                             
                              </div><!-- end .form-body section -->
                           </form>
                        </div>
                        <!-- 폼 작성부분(왼쪽) -->
                       
                     </div>

                     <div class="col-md-5">

                        <div class="smart-forms smart-container wrap-3">

                           <div class="form-header">
                              <h4 class="fs-24">Your Order</h4>
                           </div><!-- end .form-header section -->
                           <form method="post" action="/" id="account2">
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
				                             </tr>
							   			  </c:forEach>
							   			  
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>배송비</strong>
                                             </td>

                                             <td class="cart-product-name">
                                                <span class="amount">${delivery}</span>
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>할인</strong>
                                             </td>
                                             <td class="cart-product-name">
                                                -<span class="amount" id="discountPoint">0</span>(포인트 할인)
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                          	 <td class="cart-product-name">
                                             </td>
                                          	 <td class="cart-product-name">
                                             	-<span class="amount" id="discountCoupon">0</span>(쿠폰 할인)
                                             </td>
                                          </tr>
                                          <tr class="cart_item">
                                             <td class="cart-product-name">
                                                <strong>결제 금액</strong>
                                             </td>

                                             <td class="cart-product-name">
                                                <span class="amount color"><strong>${subTotal}</strong></span>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>

                                    <!--<a href="shop.html" class="btn btn-primary w-100">Proceed to Checkout</a>-->
                                 </div>

                                 <div class="spacer-t40 spacer-b30">
                                    <div class="tagline"><span> 결제 정보 </span></div><!-- .tagline -->
                                 </div>

                                 <div class="section">
                                    <p class="small-text fine-grey">결제하실 정보를 입력해주세요.</p>
                                 </div><!-- end section -->

                                 <div class="section pb-15">
                                    <label class="field option option-yellow">
                                       <input type="radio" name="payment" checked>
                                       <span class="radio"></span> 무통장입금
                                    </label>

                                    <label class="field option option-yellow">
                                       <input type="radio" name="payment">
                                       <span class="radio"></span> 신용카드
                                    </label>
                                 </div><!-- end section -->

                                 <div class="fmx">

                                    <div class="section">
                                       <label class="field prepend-icon">
                                          <input type="text" name="cardname" id="cardname" class="gui-input" placeholder="Name on card...">
                                          <span class="field-icon"><i class="fa fa-user"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section">
                                       <label class="field prepend-icon">
                                          <input type="text" name="cardno" class="gui-input" placeholder="Card number...">
                                          <span class="field-icon"><i class="fa fa-credit-card"></i></span>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->

                                 <div class="frm-row">

                                    <div class="section colm colm6">
                                       <label for="cardmonth" class="field select">
                                          <select id="cardmonth" name="cardmonth">
                                             <option value="01">01 - Jan</option>
                                             <option value="02">02 - Feb</option>
                                             <option value="03">03 - Mar</option>
                                             <option value="04">04 - Apr</option>
                                             <option value="05">05 - May</option>
                                             <option value="06">06 - Jun</option>
                                             <option value="07">07 - Jul</option>
                                             <option value="08">08 - Aug</option>
                                             <option value="09">09 - Sep</option>
                                             <option value="10">10 - Oct</option>
                                             <option value="11">11 - Nov</option>
                                             <option value="12">12 - Dec</option>
                                          </select>
                                          <i class="arrow double"></i>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <label class="field select">
                                          <select id="cardyear" name="cardyear" id="cardyear"></select>
                                          <i class="arrow double"></i>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->

                                 <div class="frm-row">

                                    <div class="section colm colm6">
                                       <label class="field prepend-icon">
                                          <input type="text" name="secno" id="secno" class="gui-input" placeholder="Security number...">
                                          <b class="tooltip tip-left-top"><em> This is a four diigit number at the back of your card </em></b>
                                          <span class="field-icon"><i class="fa fa-barcode"></i></span>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                              </div><!-- end .form-body section -->
                              
                              <div class="form-footer">
                                 <button type="submit" class="btn btn-primary w-100">Proceed to confirm </button>
                              </div><!-- end .form-footer section -->
                           </form><!-- end form -->
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>

      </div>

      <!-- <div class="modal fade" id="exampleModalLabel33" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel33" aria-hidden="true">
         <div class="modal-dialog" style="max-width:345px" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel33">Login via</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <div class="clearfix" id="login-dp">

                     <div class="social-buttons text-center">
                        <a href="#" class="btn btn-fb ls-0"><i class="fa fa-facebook"></i> Facebook</a>
                        <a href="#" class="btn btn-tw ls-0"><i class="fa fa-twitter"></i> Twitter</a>
                     </div>
                     <div class="special-heading line center">
                        <h5 class="special-heading-inner mb-10"><span class="o-7"> or </span></h5>
                     </div>
                     <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
                        <div class="form-group">
                           <label class="sr-only" for="exampleInputEmail2">Email address</label>
                           <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required>
                        </div>
                        <div class="form-group">
                           <label class="sr-only" for="exampleInputPassword2">Password</label>
                           <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                           <div class="help-block text-right pt-10 fs-13"><a href="" class="read-more">Forget the password ?</a></div>
                        </div>
                        <div class="form-group">
                           <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                        </div>
                        <div class="checkbox-custom checkbox-default">
                           <input id="RememberMe" name="rememberme" type="checkbox">
                           <label for="RememberMe"> keep me logged-in</label>
                        </div>
                     </form>

                     <div class="bottom text-center">
                        New here ? <a href="#"><b>Join Us</b></a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div> -->
   </div>

</body>
</html>