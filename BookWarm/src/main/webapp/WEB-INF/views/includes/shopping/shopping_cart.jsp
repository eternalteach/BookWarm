<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
</head>
<body>

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

         <div class="page-inner no-border">

            <section class="section-primary main-color">

               <div class="container">

                  <div class="row">

                     <div class="col-md-9">

                        <h4>Your selection <span class="o-6">(3 items)</span> </h4>

                        <div class="table-responsive">

                           <table class="table cart-table">
                              <thead>
                                 <tr>
                                    <th class="cart-product-remove">&nbsp;</th>
                                    <th class="cart-product-thumbnail">&nbsp;</th>
                                    <th class="cart-product-name">Product</th>
                                    <th class="cart-product-price">Unit Price</th>
                                    <th class="cart-product-quantity">Quantity</th>
                                    <th class="cart-product-subtotal">Total</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr class="cart_item">
                                    <td class="cart-product-remove">
                                       <a href="#" class="remove" title="Remove this item"><i class="fa fa-trash"></i></a>
                                    </td>

                                    <td class="cart-product-thumbnail">
                                       <a href="#"><img width="64" height="64" src="img/shop/ami-turtle-grey001alt-700x904.jpg" alt="Turtleneck Sweater Grey"></a>
                                    </td>

                                    <td class="cart-product-name">
                                       <a href="#">Turtleneck Sweater Grey</a>
                                    </td>

                                    <td class="cart-product-price">
                                       <span class="amount">$19.99</span>
                                    </td>

                                    <td class="cart-product-quantity">
                                       <div class="form-group">
                                          <input class="form-control" type="number" value="1">
                                       </div>
                                    </td>

                                    <td class="cart-product-subtotal">
                                       <span class="amount">$39.98</span>
                                    </td>
                                 </tr>
                                 <tr class="cart_item">
                                    <td class="cart-product-remove">
                                       <a href="#" class="remove" title="Remove this item"><i class="fa fa-trash"></i></a>
                                    </td>

                                    <td class="cart-product-thumbnail">
                                       <a href="#"><img width="64" height="64" src="img/shop/adidas-grey-red001_1.jpg" alt="Adidas Boston Super"></a>
                                    </td>

                                    <td class="cart-product-name">
                                       <a href="#">Adidas Boston Super</a>
                                    </td>

                                    <td class="cart-product-price">
                                       <span class="amount">$24.99</span>
                                    </td>

                                    <td class="cart-product-quantity">
                                       <div class="form-group">
                                          <input class="form-control" type="number" value="1">
                                       </div>
                                    </td>

                                    <td class="cart-product-subtotal">
                                       <span class="amount">$24.99</span>
                                    </td>
                                 </tr>
                                 <tr class="cart_item">
                                    <td class="cart-product-remove">
                                       <a href="#" class="remove" title="Remove this item"><i class="fa fa-trash"></i></a>
                                    </td>

                                    <td class="cart-product-thumbnail">
                                       <a href="#"><img width="64" height="64" src="img/shop/UltraBoostUncaged.jpg" alt="Ultra Boost Uncaged"></a>
                                    </td>

                                    <td class="cart-product-name">
                                       <a href="#">Ultra Boost Uncaged</a>
                                    </td>

                                    <td class="cart-product-price">
                                       <span class="amount">$13.99</span>
                                    </td>

                                    <td class="cart-product-quantity">
                                       <div class="form-group">
                                          <input class="form-control" type="number" value="1">
                                       </div>
                                    </td>

                                    <td class="cart-product-subtotal">
                                       <span class="amount">$41.97</span>
                                    </td>
                                 </tr>
                                 <tr class="cart-footer_item">
                                    <td colspan="6" class="pt-35 pb-35 pl-0">
                                       <div class="row">
                                          <div class="col-md-4">
                                             <div class="form-group">
                                                <input class="form-control" type="text" placeholder="Enter Coupon Code.." id="example-text-input">
                                             </div>
                                          </div>

                                          <div class="col-md-3">
                                             <a href="#" class="btn btn-primary">Apply Coupon</a>
                                          </div>

                                          <div class="col-md-5">
                                             <a href="#" class="btn btn-primary float-right mr-none">Update Cart</a>
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
                                       <strong>Cart Subtotal</strong>
                                    </td>

                                    <td class="cart-product-name">
                                       <span class="amount">$106.94</span>
                                    </td>
                                 </tr>
                                 <tr class="cart_item">
                                    <td class="cart-product-name">
                                       <strong>Shipping</strong>
                                    </td>

                                    <td class="cart-product-name">
                                       <span class="amount">Free Delivery</span>
                                    </td>
                                 </tr>
                                 <tr class="cart_item">
                                    <td class="cart-product-name">
                                       <strong>Total</strong>
                                    </td>

                                    <td class="cart-product-name">
                                       <span class="amount color"><strong>$106.94</strong></span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>

                           <a href="shop.html" class="btn btn-primary d-block fs-11">Proceed to Checkout</a>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>

         <footer class="footer footer-emel">
            <div class="main">
               <div class="container">
                  <div class="row">
                     <div class="col-md-3 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">CONTACT INFO</h4>
                           </div>

                           <div class="clearfix">
                              <div class="contact-info contact-info-block">
                                 <ul class="contact-details">
                                    <li><i class="fa fa-map-marker"></i> <strong>ADDRESS:</strong> <span>123 Street Name, City, Turkey</span></li>
                                    <li><i class="fa fa-phone"></i> <strong>PHONE:</strong> <span>(123) 456-7890</span></li>
                                    <li><i class="fa fa-envelope"></i> <strong>EMAIL:</strong> <span><a href="mailto:mail@example.com">mail@example.com</a></span></li>
                                    <li><i class="fa fa-clock-o"></i> <strong>WORKING DAYS/HOURS:</strong> <span>Mon - Sun / 9:00 AM - 8:00 PM</span></li>
                                 </ul>
                              </div>
                           </div>

                           <div class="clearfix">
                              <a href="#" class="social-icon si-dark si-small si-facebook" title="Facebook">
                                 <i class="si-icon-facebook"></i>
                                 <i class="si-icon-facebook"></i>
                              </a>

                              <a href="#" class="social-icon si-dark si-small si-twitter" title="twitter">
                                 <i class="si-icon-twitter"></i>
                                 <i class="si-icon-twitter"></i>
                              </a>

                              <a href="#" class="social-icon si-dark si-small si-google" title="google">
                                 <i class="si-icon-google"></i>
                                 <i class="si-icon-google"></i>
                              </a>
                           </div>
                        </section>
                     </div>
                     <div class="col-md-5 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Usefull Tags</h4>
                           </div>
                           <div class="tag-cloud clearfix mb-30">
                              <ul class="tag-cloud-inner">
                                 <li><a href="#">#Lifetime</a></li>
                                 <li><a href="#">#Mobile</a></li>
                                 <li><a href="#">#News</a></li>
                                 <li><a href="#">#PHP</a></li>
                                 <li><a href="#">#Social</a></li>
                                 <li><a href="#">#video</a></li>
                                 <li><a href="#">#Mobile</a></li>
                                 <li><a href="#">#News</a></li>
                                 <li><a href="#">#PHP</a></li>
                                 <li><a href="#">#Social</a></li>
                              </ul>
                           </div>

                           <div class="heading">
                              <h4 class="title">Usefull Links</h4>
                           </div>
                           <div class="clearfix">
                              <ul class="list-unstyled mb-none d-inline-block mr-50">
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="index.html">About Our Company</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="contact/index.html">Large Image Blog</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="parallax-presentation/index.html">Contact Us</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="contact/index.html">Help</a>
                                 </li>
                              </ul>
                              <ul class="list-unstyled mb-none d-inline-block">
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="index.html">Order History</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="contact/index.html">Wish List</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="parallax-presentation/index.html">Contact Us</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="contact/index.html">Help</a>
                                 </li>
                              </ul>
                           </div>
                        </section>
                     </div>
                     <div class="col-md-4 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">SUBSCRIBE NEWSLETTER</h4>
                           </div>

                           <div class="clearfix">
                              <p>
                                 Keep up on our always evolving product features and technology. Enter your e-mail and subscribe to our newsletter.
                              </p>
                              <form id="newsletterForm" action="php/newsletter-subscribe.php" method="POST" novalidate="novalidate">
                                 <div class="input-group">
                                    <input class="form-control" placeholder="Email Address" name="newsletterEmail" id="newsletterEmail" type="text">
                                    <span class="input-group-btn">
                                       <button class="btn btn-light" type="submit">SUBSCRIBE</button>
                                    </span>
                                 </div>
                              </form>
                           </div>
                        </section>
                     </div>
                  </div>
               </div>
            </div>

            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="clearfix">
                           <p class="mb-0 mt-10">
                              © Vertex eCommerce. 2018. All Rights Reserved
                           </p>
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="clearfix pull-right">
                           <img src="img/shop/payment-icon.png" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </footer>
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

   <!-- Vendor -->
   <script src="vendor/jquery/jquery.js"></script>
   <script src="vendor/jquery/jquery.nav.js"></script>
   <script src="vendor/jquery/jquery.validate.js"></script>
   <script src="vendor/jquery.appear/jquery.appear.min.js"></script>
   <script src="vendor/jquery.easing/jquery.easing.min.js"></script>
   <script src="vendor/jquery-cookie/jquery-cookie.min.js"></script>
   <script src="vendor/magnific-popup/jquery.magnific-popup.js"></script>
   <script src="vendor/modernizr/modernizr.min.js"></script>
   <script src="vendor/tether/tether.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="vendor/menuzord/menuzord.js"></script>
   <script src="vendor/sticky/jquery.sticky.min.js"></script>
   <script src="vendor/isotope/jquery.isotope.min.js"></script>
   <script src="vendor/respond/respond.js"></script>
   <script src="vendor/images-loaded/imagesloaded.js"></script>
   <script src="vendor/owl-carousel/owl.carousel.js"></script>
   <script src="vendor/wow/wow.min.js"></script>
   <script src="vendor/lite-tooltip/js/litetooltip.js"></script>
   <script src="js/theme-plugins.js"></script>

   <!-- Smart Form Elements -->
   <script src="smartforms/JavascriptTemplates/js/jquery-ui-custom.min.js"></script>
   <script src="smartforms/JavascriptTemplates/js/jquery.placeholder.min.js"></script>
   <script src="smartforms/JavascriptTemplates/js/select2.full.min.js"></script>
   <script src="smartforms/JavascriptTemplates/js/jquery-ui-combo.min.js"></script>

   <script type="text/javascript">

      jQuery(document).ready(function ($) {
         $(".example-tags").select2({
            tags: true
         });

         $("#ddFormat").datepicker({
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>',
            dateFormat: "dd/mm/yy"
         });

         $("#yyFormat").datepicker({
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>',
            dateFormat: "yy/mm/dd"
         });

         $("#city").combobox();
         $("#region").combobox();

         $("#slider").slider({
            range: "min",
            min: 10,
            max: 100,
            value: 80
         });
         $("#slider1").slider({
            range: true,
            values: [17, 83]
         });

         $("#slider2").slider({
            range: "min",
            value: 140,
            min: 1,
            max: 800,
            slide: function (event, ui) {
               $("#amount").val("$" + ui.value);
            }
         });

         $("#amount").val(
            "$" + $("#slider2").slider("value")
         );

         $("#slider3").slider({
            range: "max",
            min: 1,
            max: 10,
            value: 2,
            slide: function (event, ui) {
               $("#bedrooms").val(ui.value);
            }
         });

         $("#bedrooms").val(
            $("#slider3").slider("value")
         );

         //var select = $("#guests");
         //var guestnumber = $("#slider4").slider({
         //	min: 1,
         //	max: 10,
         //	range: "min",
         //	value: select[0].selectedIndex + 1,
         //	slide: function(event, ui) {
         //		select[0].selectedIndex = ui.value - 1;
         //	}
         //});

         $("#guests").change(function () {
            guestnumber.slider("value", this.selectedIndex + 1);
         });

         $("#slider5").slider({
            value: 100,
            min: 0,
            max: 500,
            step: 50,
            range: "min",
            slide: function (event, ui) {
               $("#donation").val(ui.value);
            }
         });

         $("#donation").val($("#slider5").slider("value"));
         $("#donation").blur(function () {
            $("#slider5").slider("value", $(this).val());
         });

         $("#slider6").slider({
            orientation: "vertical",
            range: "min",
            min: 0,
            max: 100,
            value: 60,
            slide: function (event, ui) {
               $("#volume").val(ui.value);
            }
         });

         $("#volume").val(
            $("#slider6").slider("value")
         );

         $("#slider7").slider({
            orientation: "vertical",
            range: true,
            values: [27, 67],
            slide: function (event, ui) {
               $("#sales").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
         });
         $("#sales").val("$" + $("#slider7").slider("values", 0) + " - $" + $("#slider7").slider("values", 1));

         $("#eq > .sliderv-wrapper").each(function () {
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
               value: value,
               range: "min",
               animate: true,
               orientation: "vertical"
            });
         });

         $("#eq2 > .sliderv-wrapper").each(function () {
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
               value: value,
               range: "min",
               animate: true,
               orientation: "vertical"
            });
         });

         $('#slider8').slider({
            range: true,
            values: [500, 1500],
            min: 10,
            max: 2000,
            step: 10,
            slide: function (event, ui) {
               $("#budget").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
         });

         $("#budget").val("$" + $("#slider8").slider("values", 0) + " - $" + $("#slider8").slider("values", 1));

         var initialYear = 1980;
         var yearTooltip = function (event, ui) {
            var curYear = ui.value || initialYear
            var yeartip = '<span class="slider-tip">' + curYear + '</span>';
            $(this).find('.ui-slider-handle').html(yeartip);
         }

         $("#slider10").slider({
            value: initialYear,
            range: "min",
            min: 1950,
            max: 2020,
            step: 1,
            create: yearTooltip,
            slide: yearTooltip
         });

         $("#slider-range").slider({
            range: true,
            min: 0,
            max: 500,
            values: [50, 420],
            slide: function (event, ui) {
               $("#amounts").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
         });

         $("#amounts").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

         $("#slider11").slider({
            min: 100,
            max: 1000,
            step: 10,
            values: [300, 700],
            range: true,
            slide: function (event, ui) {
               for (var i = 0; i < ui.values.length; ++i) {
                  $(".sliderValue[data-index=" + i + "]").val(ui.values[i]);
               }
            }
         });

         $(".sliderValue").change(function () {
            var $this = $(this);
            $("#slider11").slider("values", $this.data("index"), $this.val());
         });

         var valtooltip = function (sliderObj, ui) {
            val1 = '<span class="slider-tip">' + sliderObj.slider("values", 0) + '</span>';
            val2 = '<span class="slider-tip">' + sliderObj.slider("values", 1) + '</span>';
            sliderObj.find('.ui-slider-handle:first').html(val1);
            sliderObj.find('.ui-slider-handle:last').html(val2);
         };

         $("#slider-range2").slider({
            range: true,
            min: 0,
            max: 500,
            values: [50, 450],
            create: function (event, ui) {
               valtooltip($(this), ui);
            },
            slide: function (event, ui) {
               valtooltip($(this), ui);
               $("#amountx").val("$" + ui.values[0] + " - $" + ui.values[1]);
            },
            stop: function (event, ui) {
               valtooltip($(this), ui);
            }

         });

         $("#amountx").val("$" + $("#slider-range2").slider("values", 0) + " - $" + $("#slider-range2").slider("values", 1));

         var initialSpark = 60;
         var sparkTooltip = function (event, ui) {
            var curSpark = ui.value || initialSpark
            var sparktip = '<span class="slider-tip">' + curSpark + '</span>';
            $(this).find('.ui-slider-handle').html(sparktip);
         }

         $("#slider9").slider({
            orientation: "vertical",
            range: "min",
            min: 1,
            max: 100,
            step: 1,
            value: initialSpark,
            create: sparkTooltip,
            slide: sparkTooltip
         });

      });
</body>
</html>