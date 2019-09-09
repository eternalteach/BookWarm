<% String path1 = request.getContextPath(); %>

   <div class="wrapper">
      <div class="page has-sidebar has-right-sidebar bordered">
         <section class="page-header b-bordered t-bordered">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <h1 class="title">Shop - Cart</h1>
                     <ol class="breadcrumb pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Shop</a></li>
                        <li class="active">Cart</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>
		<form action="<%=path1%>/shop/charge" method="get" id="sendForm">
         <div class="page-inner no-border">

            <section class="section-primary main-color">

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
                                 </tr>
                              </thead>
                              
                              <!-- 장바구니 담아놓은 것 리스트 -->
                              <tbody>
                              
                              	  <div id="list">
		                              <c:forEach items="${list}" var="vo" varStatus="idx">
		                              	<%-- <input type="hidden" class="cart_no" name="cart_no" value="${vo.cart_no}"> --%>
		                              	 <!-- 한 개 기준(시작) -->
		                                 <tr class="cart_item" id="item-${idx.count}">
		                                  	<!-- 체크박스 -->
		                                    <td class="cart-product-checkbox">
		                                       <input type="checkbox" class="chkbox" name="cart_no" value="${vo.cart_no}"checked>
		                                    </td>
											<!-- 책 이미지(사진) -->
		                                    <td class="cart-product-thumbnail">
		                                       <a href="#"><img width="64" height="64" src="${vo.book_img}"></a>
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
		                                       <div class="form-group">
		                                       	  <a href="<%=path1 %>/shop/cntDown?user_id=${vo.user_id}&cart_no=${vo.cart_no}&cart_cnt=${vo.cart_cnt}">-&nbsp&nbsp&nbsp</a>
		                                       	  ${vo.cart_cnt}
		                                       	  <a href="<%=path1 %>/shop/cntUp?user_id=${vo.user_id}&cart_no=${vo.cart_no}&cart_cnt=${vo.cart_cnt}">&nbsp&nbsp&nbsp+</a>
		                                          <%-- <input type="number" class="form-control cnt" value="${vo.cart_cnt}"> --%>
		                                       </div>
		                                    </td>
											<!-- 총액(책 가격 * 수량) -->
		                                    <td class="cart-product-subtotal">
		                                       <span class="amount tot">${vo.total}</span>
		                                    </td>
		                                    <!-- 쓰레기통 모양 아이콘 -->
		                                    <td class="cart-product-remove">
		                                       <%-- <a href="<%=path%>/shop/shop-cart?user_id=${vo.user_id}&isbn=${vo.isbn}" class="remove" title="Remove this item"><i class="fa fa-trash"></i></a> --%>
		                                       <i class="fa fa-trash" id="${idx.count}"></i>
		                                    </td>
		                                 </tr>
		                                 <!-- 한 개 기준(끝) -->
		                              </c:forEach>
                              	  </div>
	                              
	                              
                                 <!-- 쿠폰코드 있는 부분 -->
                                 <tr class="cart-footer_item">
                                    <td colspan="6" class="pt-35 pb-35 pl-0">
                                       <div class="row">
                                          <div class="col-md-4">
                                             <div class="form-group">
                                                <input class="form-control" type="text" placeholder="Enter Coupon Code.." id="example-text-input">
                                             </div>
                                          </div>

                                          <div class="col-md-3">
                                             <a href="#" class="btn btn-primary">쿠폰 적용</a>
                                          </div>

                                       </div>
                                    </td>
                                 </tr>
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
                                       <span class="amount color totAllItems"><strong>원</strong></span>
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
                                       <span class="amount subTotal">0 원</span>
                                       <input type="hidden" id="subTotal" name="subTotal" value="">
                                    </td>
                                 </tr>
                                 
                              </tbody>
                           </table>

                           <div class="btn btn-primary d-block fs-11" id="charge">구매하기</div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
   </form>
         
      </div>
   </div>
