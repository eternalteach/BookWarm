<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body class="bg-white">

   <div class="wrapper">

      <div class="page has-sidebar has-left-sidebar bordered single-product-wrap">

         <div class="page-inner no-border">

            <div class="container single-product-inner">
               <div class="row">

                  <div class="col-md-4">
                          <img src="${shop_product.book_img}">
                  </div>

                  <div class="col-md-6">

					<c:forEach items="${bookgenre}" var="genre">
                     <ol class="breadcrumb clean-breadcrumb">
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>${genre.genre}</a></li>
                        <li><a href="#">${genre.book_title}</a></li>
                     </ol>
					</c:forEach>
					
					
                     <div class="product-details">
                        <h2 class="product-name"><a href="#">${shop_product.book_title}</a></h2>

                        <div class="product-price-wrap">

                           <span class="product-price">
                              <del class="product-amount"><span class="product-price-currency">정가&nbsp${shop_product.book_price}</span>원</del><br>
                              <ins> 
                                 <span class="product-amount">
                                    <span class="product-price-currency">할인가&nbsp${shop_product.book_price}</span>원
                                 </span>
                            </ins>
                           </span>
                           <span class="product-star-rating" title="Rated 4.67 out of 5">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                         <!--      <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                           </span> -->
                        </div>

						
						
                        <div class="product-summary">
                         <p>${shop_product.writer_name}&nbsp저</p>
 						 <p>${shop_product.translator_name}&nbsp역</p>
                        </div>

                        <form class="cart" method="get" enctype="multipart/form-data">
                           <div class="quantity">
                              <input type="text" name="quantity" value="1" title="Qty" class="input-text qty text">
                              <div class="qty-adjust">
                                 <a class="qty-plus" href="#"><i class="fa fa-chevron-up"></i></a>
                                 <a class="qty-minus" href="#"><i class="fa fa-chevron-down"></i></a>
                              </div>
                           </div>

                           <button type="submit" class="btn btn-outline-primary btn-md product-btn">
                              <i class="fa fa-shopping-basket" ></i><span>장바구니</span></a>
                           </button>

                           <button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="Add to wishlist" data-location="top">
                             <span>구매</span>
                           </button>
                           
                        </form>
						    <button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="Add to wishlist" data-location="top">
                          	<span>목록</span>
                           </button>

                 <!--        <div class="product_meta mb-40">
                           <span class="sku_wrapper">SKU: <span class="sku" itemprop="sku">612444</span></span>
                           <span class="posted_in">Categories: <a rel="tag" href="#">Accessories</a>, <a rel="tag" href="#">Bags</a>.</span>
                           <span class="tagged_as">
                              Tags:
                              <a href="#" rel="tag">Sweaters</a>,
                              <a href="#" rel="tag">Turtleneck</a>,
                              <a href="#" rel="tag">Wool</a>
                           </span>
                        </div> -->


                        <div class="clearfix">


                           <div class="tab-wrap clean-tab">
                              <ul class="nav nav-tabs" role="tablist">
                                 <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#About" role="tab">줄거리</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#Services" role="tab">목차</a>
                                 </li>
                              </ul>

                              <div class="tab-content">
                                 <div class="tab-pane active" id="About" role="tabpanel">
                                    <p>${shop_product.book_intro}</p>
                                 </div>
                                 <div class="tab-pane" id="Services" role="tabpanel">
                                    <table class="table table-striped">
                                       <tbody>
                                          <tr>
                                             <td>
                                                1
                                             </td>
                                             <td>
                                                목차                                             </td>
                                             
                                             <td>
                                                @mdo
                                             </td>
                                          </tr>
                                          <tr>
                                             <td>
                                                2
                                             </td>
                                             <td>
                                                Jacob
                                             </td>
                                             <td>
                                                Thornton
                                             </td>
                                             <td>
                                                @fat
                                             </td>
                                          </tr>
                                          <tr>
                                             <td>
                                                3
                                             </td>
                                             <td>
                                                Larry
                                             </td>
                                             <td>
                                                the Bird
                                             </td>
                                             <td>
                                                @twitter
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>


                        </div>




                     </div>
                  </div>
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
                         <c:forEach items="${bookwriter}" var="bookwriter">
                     <div class="col-md-2">
						<figure class="product-shadows product-item">
                        <div class="product-shadows product-item">
                                 <figure class="product-shadows product-item">
                                    <div class="product-media">



                                       <div class="img-wrap first-image">
                                         <a href="shop_product?isbn=${bookwriter.isbn}&writer_name=${bookwriter.writer_name}"><img src="${bookwriter.book_img}"></a>
                                       </div>
                                       
                                       
                                       
                                       
                                       
                                       
                                       <div class="img-wrap second-image">
                                          <img src="${bookwriter.book_img}">
                                       </div> 
                                    </div>
									
                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">${bookwriter.book_title}</a></h3>
                                       <span class="product-price">
                                          <span class="product-amount">
                                          	 <span class="product-price-currency">${bookwriter.book_price_for_sale}</span>원
                                             
                                          </span>
                                       </span>
                                       <div class="product-star-rating" title="Rated 4.67 out of 5">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star-half"></i>
                                       </div>
                                    </div> 
                                 </figure>
                              </div>
                              </figure>
                              </div>
                                </c:forEach>
                           </div>
                           
                           
                           
                        </div>
                     </div>
                  </div>
            </section> 
         </div>

  <!--     <div class="modal fade" id="exampleModalLabel33" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel33" aria-hidden="true">
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
 
<!-- 

   <script>
      $(document).ready(function () {
         $("#content-slider").lightSlider({
            loop: true,
            keyPress: true
         });
         $('#image-gallery').lightSlider({
            gallery: true,
            item: 1,
            slideMargin: 0,
            galleryMargin: 15,
            thumbMargin: 15,
            speed: 500,
            auto: true,
            loop: true,
            onSliderLoad: function () {
               $('#image-gallery').removeClass('cS-hidden');
            }
         });
      });
   </script>
   <style>
      .lSSlideOuter .lSPager.lSGallery {
         width: 100% !important;
      }

      .lSSlideOuter .lSPager.lSGallery li {
         width: 100px !important;
      }
   </style> -->
</body>
</html>