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

                     <ol class="breadcrumb clean-breadcrumb">
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>소설</a></li>
                        <li><a href="#">한국소설</a></li>
                        <li><a href="#">${shop_product.book_title}</a></li>
                     </ol>

                     <div class="product-details">
                        <h2 class="product-name"><a href="#">${shop_product.book_title}</a></h2>

                        <div class="product-price-wrap">

                           <span class="product-price">
                              <del class="product-amount"><span class="product-price-currency">${shop_product.book_price}</span>원</del>
                              <ins> 
                                 <span class="product-amount">
                                    <span class="product-price-currency">${shop_product.book_price}</span>원
                                 </span>
                                <!--  <span class="product-amount">
                                    <span class="product-price-currency">£</span>360
                                 </span> -->
                            </ins>
                           </span>
                           <span class="product-star-rating" title="Rated 4.67 out of 5">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                           </span>
                        </div>


                        <div class="product-summary">
                           <p>
                   <%--         ${shop_product.book_intro} --%>
                           </p>
                        </div>




                        <form class="cart" method="post" enctype="multipart/form-data">
                           <div class="quantity">
                              <input type="text" name="quantity" value="1" title="Qty" class="input-text qty text">
                              <div class="qty-adjust">
                                 <a class="qty-plus" href="#"><i class="fa fa-chevron-up"></i></a>
                                 <a class="qty-minus" href="#"><i class="fa fa-chevron-down"></i></a>
                              </div>
                           </div>

                           <button type="submit" class="btn btn-outline-primary btn-md product-btn">
                              <i class="fa fa-shopping-basket"></i><span>장바구니</span>
                           </button>

                           <button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="Add to wishlist" data-location="top">
                              <i class="fa fa-shopping-basket"></i><span>구매</span>
                           </button>
                        </form>




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
                                                Mark
                                             </td>
                                             <td>
                                                Otto
                                             </td>
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



            <section class="section-big main-color">

               <div class="container">
                  <div class="row">

                     <div class="col-md-12">
                        <h2 class="section-title mb-5 fs-26">
                           Related Products
                        </h2>
                        <p class="mb-25">
                           Lorem ipsum dolor sit amet isse potenti.
                        </p>
                     </div>
                  </div>

                  <div class="row">

                     <div class="col">

                        <div class="carousel-wrap">
                           <div class="owl-carousel owl-theme" data-plugin-options='{"items":4, "singleItem": true, "dots":false, "autoPlay": true, "margin": 30}'>
                              <div>
                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap first-image">
                                          <img src="./resources/VertexEx/img/shop/adidas-grey-red001_1.jpg">
                                       </div>
                                       <div class="img-wrap second-image">
                                          <img src="./resources/VertexEx/img/shop/adidas-grey-red001_2.jpg">
                                       </div>

                                       <div class="cart-overlay clearfix">
                                          <div class="shop-actions clearfix">
                                             <div class="shop-action-item add-to-cart-wrap lite-tooltip" data-title="Add to cart" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-shopping-basket"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-wishlist-wrap lite-tooltip" data-title="Add to wishlist" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-heart"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-quickview-wrap lite-tooltip" data-title="Quickview" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-eye"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">Adidas Boston Super</a></h3>
                                       <span class="product-posted_in"><a href="#" rel="tag">Shirting</a></span>
                                       <span class="product-price">
                                          <span class="product-amount">
                                             <span class="product-price-currency">£</span>200
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
                              <div>
                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap first-image">
                                          <img src="./resources/VertexEx/img/shop/UltraBoostUncaged.jpg">
                                       </div>
                                       <div class="img-wrap second-image">
                                          <img src="./resources/VertexEx/img/shop/UltraBoostUncaged2.jpg">
                                       </div>

                                       <div class="cart-overlay clearfix">
                                          <div class="shop-actions clearfix">
                                             <div class="shop-action-item add-to-cart-wrap lite-tooltip" data-title="Add to cart" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-shopping-basket"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-wishlist-wrap lite-tooltip" data-title="Add to wishlist" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-heart"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-quickview-wrap lite-tooltip" data-title="Quickview" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-eye"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">Ultra Boost Uncaged</a></h3>
                                       <span class="product-posted_in"><a href="#" rel="tag">Shirting</a></span>
                                       <span class="product-price">
                                          <span class="product-amount">
                                             <span class="product-price-currency">£</span>190
                                          </span>
                                       </span>
                                       <div class="product-star-rating" title="Rated 4.67 out of 5">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                       </div>
                                    </div>
                                 </figure>
                              </div>

                              <div>

                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="badge-wrap">
                                          <span class="onsale">Sale</span>
                                       </div>
                                       <div class="img-wrap">
                                          <img src="./resources/VertexEx/img/shop/Vertex-gift-card.jpg">
                                       </div>

                                       <div class="cart-overlay clearfix">
                                          <div class="shop-actions clearfix">
                                             <div class="shop-action-item add-to-cart-wrap lite-tooltip" data-title="Add to cart" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-shopping-basket"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-wishlist-wrap lite-tooltip" data-title="Add to wishlist" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-heart"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">Gift Card</a></h3>
                                       <span class="product-posted_in"><a href="#" rel="tag">Accessories</a></span>
                                       <span class="product-price">
                                          <span class="product-amount">
                                             <span class="product-price-currency">£</span>100
                                          </span>
                                       </span>
                                    </div>
                                 </figure>
                              </div>

                              <div>
                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap">
                                          <img src="./resources/VertexEx/img/shop/ami-turtle-grey.jpg">
                                       </div>

                                       <div class="cart-overlay clearfix">
                                          <div class="shop-actions clearfix">
                                             <div class="shop-action-item add-to-cart-wrap lite-tooltip" data-title="Add to cart" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-shopping-basket"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-wishlist-wrap lite-tooltip" data-title="Add to wishlist" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-heart"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-quickview-wrap lite-tooltip" data-title="Quickview" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-eye"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">Turtleneck Sweater</a></h3>
                                       <span class="product-posted_in"><a href="#" rel="tag">Outerwear</a></span>
                                       <span class="product-price">
                                          <span class="product-amount">
                                             <span class="product-price-currency">£</span>720
                                          </span>
                                       </span>
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

                              <div>

                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap">
                                          <img src="./resources/VertexEx/img/shop/UltraBoostUncaged.jpg">
                                       </div>

                                       <div class="cart-overlay clearfix">
                                          <div class="shop-actions clearfix">
                                             <div class="shop-action-item add-to-cart-wrap lite-tooltip" data-title="Add to cart" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-shopping-basket"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-wishlist-wrap lite-tooltip" data-title="Add to wishlist" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-heart"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">Ultra Boost Uncaged</a></h3>
                                       <span class="product-posted_in"><a href="#" rel="tag">Accessories</a></span>
                                       <span class="product-price">
                                          <span class="product-amount">
                                             <span class="product-price-currency">£</span>100
                                          </span>
                                       </span>
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

                              <div>

                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap">
                                          <img src="./resources/VertexEx/img/shop/ami-turtle-grey001alt-700x904.jpg">
                                       </div>

                                       <div class="cart-overlay clearfix">
                                          <div class="shop-actions clearfix">
                                             <div class="shop-action-item add-to-cart-wrap lite-tooltip" data-title="Add to cart" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-shopping-basket"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-wishlist-wrap lite-tooltip" data-title="Add to wishlist" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-heart"></i>
                                                </a>
                                             </div>
                                             <div class="shop-action-item add-to-quickview-wrap lite-tooltip" data-title="Quickview" data-location="top">
                                                <a href="#">
                                                   <i class="fa fa-eye"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>

                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">Turtleneck Sweater Grey</a></h3>
                                       <span class="product-posted_in"><a href="#" rel="tag">Shirting</a></span>
                                       <span class="product-price">
                                          <span class="product-amount">
                                             <span class="product-price-currency">£</span>190
                                          </span>
                                       </span>
                                       <div class="product-star-rating" title="Rated 4.67 out of 5">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                       </div>
                                    </div>
                                 </figure>
                              </div>
                           </div>
                           <div class="customNavigation">
                              <a class="prev"><i class="fa fa-angle-left"></i></a>
                              <a class="next"><i class="fa fa-angle-right"></i></a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>

      </div>

      <div class="modal fade" id="exampleModalLabel33" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel33" aria-hidden="true">
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
      </div>
   </div>


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
   </style>
</body>
</html>