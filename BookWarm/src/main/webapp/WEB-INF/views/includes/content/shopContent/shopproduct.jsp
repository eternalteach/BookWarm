<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body class="bg-white">

   <div class="wrapper">

      <div class="page has-sidebar has-left-sidebar bordered single-product-wrap">

         <div class="page-inner no-border">

            <div class="container single-product-inner">
               <div class="row">
				<c:forEach items="${bookdetail}" var="bookdetail">	
                  <div class="col-md-4">
                        <img src="${bookdetail.book_img}">
                  </div>

                  <div class="col-md-6">
                     <ol class="breadcrumb clean-breadcrumb">
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>${bookdetail.book_title}</a></li>
                     </ol>
					
					
                     <div class="product-details">
                        <h2 class="product-name"><a href="#">${bookdetail.book_title}</a></h2>

                        <div class="product-price-wrap">

                           <span class="product-price">
                              <del class="product-amount"><span class="product-price-currency">정가&nbsp<fmt:formatNumber value="${bookdetail.book_price}" pattern="###,###,###" /></span>원</del><br>
                              <ins> 
                                 <span class="product-amount">
                                    <span class="product-price-currency">할인가&nbsp<fmt:formatNumber value="${bookdetail.book_price_for_sale}" pattern="###,###,###" /></span>원
                                 </span>
                            </ins>
                           </span><br>
                           <span class="product-price-currency">
                           <span class="product-star-rating" title="Rated 4.67 out of 5">
                           <!-- 나중에 booksatr로 가져올거임 별점수  -->
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                           </span>
                           </span>
                        </div>

						
						
                        <div class="product-summary">
                         <p>${bookdetail.writer_name}&nbsp저</p>
 						 <p>${bookdetail.translator_name}&nbsp역</p>
                        </div>

                           <!-- 수량변경버튼 -->
                           <form name="cart" method="get" enctype="multipart/form-data">
                           <div class="quantity">
								<input type=hidden  title="Qty" class="input-text qty text" name="sell_price" fmt:formatNumber value="${bookdetail.book_price_for_sale}" pattern="###,###,###">
								<input type="text" name="amount" value="1" title="Qty" class="input-text qty text" onchange="change();">
									<div class="qty-adjust">
										<i class="fa fa-chevron-up qty-plus" value=" + " onclick="add();"></i>
										<i class="fa fa-chevron-down qty-minus" value=" - " onclick="del();"></i><br>
									</div>
							</div>
							</form> 
						
<!-- 							<div class="qty-adjust">
							금액 : <input type="text" name="sum" readonly>원
                            </div> -->
                           
							<!-- 장바구니로 이동 -->
                           <a href="/warm/shop_list"><button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="장바구니로 이동" data-location="top">
                           <i class="fa fa-shopping-basket" data-title="장바구니로 이동" data-location="top"></i>
                           <span>장바구니</span>
                           </button></a>
							<!-- 구매로이동  -->
                            <a href="/warm/shop_list"><button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="구매로 이동" data-location="top">
                          	<span>구매</span>
                           </button></a>
                       		<!-- 목록버튼 클릭하면 책 목록으로 이동. -->
						    <a href="/warm/shoplist"><button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="목록으로 이동" data-location="top">
                          	<span>목록</span>
                           </button></a>
                          
                       
                     <div class="product_meta mb-40">
                           <span class="tagged_as">
                      <!--         Tags:
                              <a href="#" rel="tag">Sweaters</a>,
                              <a href="#" rel="tag">Turtleneck</a>,
                              <a href="#" rel="tag">Wool</a> -->
                           </span>
                        </div>


            		    <!-- 줄거리/목차부분  -->
                        <div class="clearfix">
                           <div class="tab-wrap clean-tab">
                              <ul class="nav nav-tabs" role="tablist">
                                 <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#About" role="tab">줄거리</a>
                                 </li>
                                 <!-- <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#Services" role="tab">목차</a>
                                 </li> -->
                              </ul>
                              <div class="tab-content">
                                 <div class="tab-pane active" id="About" role="tabpanel">
                                    <p>${bookdetail.book_story}</p>
                                 </div>
                                 <div class="tab-pane" id="Services" role="tabpanel">
                                    <table class="table table-striped">
                                       <tbody>
                                          <tr>
                                             <td>1</td>
                                             <td>목차</td>
                                             <td>@mdo</td>
                                          </tr>
                                          <tr>
                                             <td>2</td>
                                             <td>Jacob</td>
                                             <td>Thornton</td>
                                             <td>@fat</td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div> 
                           </div>
                        </div>
                       <!-- 줄거리/목차 끝  -->
                     </div>
                  </div>
                  </c:forEach>
               </div>
            </div>


			<!-- 대표저서  -->
             <section class="section-big main-color">

               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h2 class="section-title mb-5 fs-26">
                           	 대표 저서
                        </h2>
                     </div>
                  </div>

                  <div class="row">
                    <c:forEach items="${bookwritername}" var="bookwriter">
                     <div class="col-md-2">
						<figure class="product-shadows product-item">
                        <div class="product-shadows product-item">
                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap first-image">
                                         <a href="shop_product?isbn=${bookwriter.isbn}&writer_name=${bookwriter.writer_name}"><img src="${bookwriter.book_img}"></a>
                                       </div>
                                    </div>
									
                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">${bookwriter.book_title}</a></h3>
                                          <class="product-amount">
                                          	 <class="product-price-currency"><fmt:formatNumber value="${bookwriter.book_price}" pattern="###,###,###" />원</class>
                                       <div class="product-star-rating" title="Rated 4.67 out of 5">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                       </div>
                                     
                                    </div> 
                                 </figure>
                              </div>
                              </figure>
                             </div>
                            </c:forEach>
                         </div>
                         <!-- row끝 -->
                        </div>
		            </section> 
				</div>
              </div>
         </div>
         
        <body onload="init();">
        <script type="text/javascript">
 		var sell_price;
 		var amount;

 		function init () {
 			sell_price = document.cart.sell_price.value; /* 가격 */
 			amount = document.cart.amount.value;
 			/* document.cart.sum.value = sell_price; 
 			change(); */
 		}
		/* 수량증가 */
 		function add () {
 			/* alert("올리기") */
 			hm = document.cart.amount;
 			/* sum = document.cart.sum; */
 			hm.value ++ ;

 			/* sum.value = parseInt(hm.value) * sell_price; */
 		}
		/* 수량감소 */
 		function del () {
 			hm = document.cart.amount;
 			/* sum = document.cart.sum; */
 				if (hm.value > 1) {
 					hm.value -- ;
 					/* sum.value = parseInt(hm.value) * sell_price; */
 				}
 		}

/*  		function change () {
 			hm = document.cart.amount;
 			sum = document.cart.sum;

 				if (hm.value < 0) {
 					hm.value = 0;
 				}
 			sum.value = parseInt(hm.value) * sell_price;
 		}  */ 
         </script>
          </body>
         
</body>
