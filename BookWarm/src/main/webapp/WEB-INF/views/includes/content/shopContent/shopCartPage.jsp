﻿   <div class="wrapper">
      <div class="page has-sidebar has-right-sidebar bordered">
         <section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-top:20px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <ol class="bar-breadcrumb pull-right">
                        <li>서점</li>
                        <li>장바구니</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>
		<form action="/warm/shop/charge" method="get" id="sendForm">
         <div class="page-inner no-border">

            <section class="section-primary main-color nopadding" style="margin-bottom: 50px;">

               <div class="container">

                  <div class="row">
					
                     <div class="col-md-9">

                        <h4>장바구니 <span class="o-6"></span> </h4>

                        <div class="table-responsive">

                           <table class="table cart-table">
                              <thead>
                                 <tr>
                                    <th class="cart-product-remove"><input type="checkbox" id="selectAll" checked></th>
                                    <th class="cart-product-thumbnail">&nbsp;</th>
                                    <th class="cart-product-name">도서 정보</th>
                                    <th class="cart-product-price">가 격</th>
                                    <th class="cart-product-quantity">수 량</th>
                                    <th class="cart-product-subtotal">총 액</th>
                                    <th class="cart-product-subtotal">&nbsp;</th>
                                 </tr>
                              </thead>
                              
                              <!-- 장바구니 담아놓은 것 리스트 -->
                              <tbody>
                              
                              	  <div id="list">
		                              <c:forEach items="${list}" var="vo" varStatus="idx">
		                              	 <!-- 한 개 기준(시작) -->
		                                 <tr class="cart_item" id="item-${idx.count}">
		                                  	<!-- 체크박스 -->
		                                    <td class="cart-product-checkbox">
		                                       <input type="checkbox" class="chkbox" name="cart_no" value="${vo.cart_no}"checked>
		                                    </td>
											<!-- 책 이미지(사진) -->
		                                    <td class="cart-product-thumbnail">
		                                       <a href="#"><img width="64" height="64" src="${vo.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
		                                    </td>
											<!-- 제품명(책 제목) -->
		                                    <td class="cart-product-name">
		                                       <a href="#">${vo.book_title}</a>
		                                    </td>
											<!-- 책 가격 -->
		                                    <td class="cart-product-price">
		                                       <span class="amount price">${vo.book_price_for_sale}</span>
		                                    </td>
											<!-- 수량 -->
		                                    <td class="cart-product-quantity">
		                                       <div class="form-group center" name="cart_cnt">
		                                       	  <a href="/warm/shop/cntDown?user_id=${vo.user_id}&cart_no=${vo.cart_no}&cart_cnt=${vo.cart_cnt}">-&nbsp&nbsp&nbsp</a>
		                                       	  ${vo.cart_cnt}
		                                       	  <a href="/warm/shop/cntUp?user_id=${vo.user_id}&cart_no=${vo.cart_no}&cart_cnt=${vo.cart_cnt}">&nbsp&nbsp&nbsp+</a>
		                                          <%-- <input type="number" class="form-control cnt" value="${vo.cart_cnt}"> --%>
		                                       </div>
		                                    </td>
											<!-- 총액(책 가격 * 수량) -->
		                                    <td class="cart-product-subtotal">
		                                       <span class="amount tot">${vo.total}</span>
		                                    </td>
		                                    <!-- 쓰레기통 모양 아이콘 -->
		                                    <td class="cart-product-remove">
		                                       <a href="/warm/shop/removeCartItem?cart_no=${vo.cart_no}" class="remove" title="Remove this item"><i class="fa fa-trash"></i></a>
		                                    </td>
		                                 </tr>
		                                 <!-- 한 개 기준(끝) -->
		                              </c:forEach>
                              	  </div>
                              </tbody>
                           </table>
                        </div>
                     </div>
					
                     <div class="col-md-3">
                        <h4>Cart Totals</h4>
                        <div class="table-responsive">

                           <table class="table cart-totals">
                              <tbody>
                              	 <tr class="cart_item">
                                    <td class="cart-product-name">
                                       <strong>전체 도서</strong>
                                    </td>
									
									<!-- 총액 -->
                                    <td class="cart-product-name">
                                       <span class="amount color totAllItems">원</span>
                                    </td>
                                 </tr>
                                 
                                 <tr class="cart_item">
                                    <td class="cart-product-name">
                                       <strong>배송비</strong>
                                    </td>

                                    <td class="cart-product-name">
                                       <span class="amount delivery">Free Delivery</span>
                                       <input type="hidden" id="delivery" name="delivery" value="">
                                    </td>
                                 </tr>
                                 
                                 <tr class="cart_item">
                                    <td class="cart-product-name">
                                       <strong>결제 금액</strong>
                                    </td>
									
									<!-- 체크한 물품 총액 -->
                                    <td class="cart-product-name">
                                       <span class="amount"><strong class='subTotal'>0 원</strong></span>
                                       <input type="hidden" id="subTotal" name="subTotal" value="">
                                    </td>
                                 </tr>
                                 
                              </tbody>
                           </table>

                           <div class="btn v-btn standard lightgrey standard d-block fs-11" id="charge">구매하기</div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
   </form>
         
      </div>
   </div>
