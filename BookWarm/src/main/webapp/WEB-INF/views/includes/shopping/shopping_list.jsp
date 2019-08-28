<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="page has-sidebar has-right-sidebar bordered">
  <div class="page-inner no-border">
     <section class="section-primary main-color pt-40">
               <div class="container">
                  <div class="row">
                     <div class="col-md-9 left-side-sidebar">
                        <div class="row">
                           <div class="col-md-9">
                              <h2 class="section-title m-none fs-26">
                           		베스트셀러
                              </h2>
                              <p class="mb-25">
								주간베스트
                              </p>
                           </div>

                           <div class="col-md-3">
                              <select class="custom-select pull-right mt-15">
                                 <option selected>쇼핑 	 Newness</option>
                                 <option value="2">쇼핑 by popularity</option>
                                 <option value="3">쇼핑 by price: high to low</option>
                              </select>
                           </div>
                        </div>
                        
                        <div class="row">
						
						<!-- 책 나열스타트  -->
						<c:forEach items="${list}" var="shop">
                           <div class="col">

                              <figure class="product-shadows product-item">
                                 <div class="product-media">
                                    <div class="img-wrap first-image">
                                       <img src="./resources/VertexEx/img/shop/adidas-grey-red001_1.jpg">
                                    </div>
                                    <!-- <div class="img-wrap second-image">
                                       <img src="./resources/VertexEx/img/shop/adidas-grey-red001_2.jpg">
                                    </div> -->

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
                                   <!--        <div class="shop-action-item add-to-quickview-wrap lite-tooltip" data-title="Quickview" data-location="top">
                                             <a href="#">
                                                <i class="fa fa-eye"></i>
                                             </a>
                                          </div> -->
                                       </div>
                                    </div>
                                 </div>

                                 <div class="product-details">
                                    <h3 class="product-name"><a href="#">${shop.book_title}</a></h3>
                                    <span class="product-posted_in"><a href="#" rel="tag">${shop.writer_name}</a></span>
                                    <span class="product-price">
                                       <span class="product-amount">
                                          <span class="product-price-currency">${shop.book_price_for_sale}</span>원
                                       </span>
                                    </span>
                                 </div>
                              </figure>
                           </div>
                           </c:forEach>
                           <!--test중  -->
                        </div>
                     </div>


					<!-- 사이드바 -->
                     <div class="col-md-3 right-side-sidebar">
                        <aside class="sidebar">
                           <section class="sidebar-widget bordered-sidebar">
                              <div class="heading">
                                 <h4 class="title">List </h4>
                              </div>
                              <ul class="list-group">
                                 <li class="list-group-item"><a href="#"><i class="fa fa-caret-right"></i> Grid System </a> </li>
                                 <li class="list-group-item"><a href="#"><i class="fa fa-caret-right"></i>  Info Messages</a>  </li>
                                 <li class="list-group-item list-toggle">
                                    <a class="accordion-toggle" href="#Glyphicons8" data-toggle="collapse"><i class="fa fa-caret-right"></i>  Glyphicons Icons</a>
                                    <ul id="Glyphicons8" class="collapse show" aria-expanded="true">
                                       <li><a href="#">Headers</a> </li>
                                       <li><a href="#">Form Elements</a> </li>
                                       <li><a href="#">Footers</a> </li>
                                       <li><a href="#">Google Maps</a> </li>
                                       <li><a href="#">Streamline Icons</a> </li>
                                    </ul>
                                 </li>
                                 <li class="list-group-item"><a href="#"><i class="fa fa-caret-right"></i>  Heading Options</a>  </li>
                                 <li class="list-group-item list-toggle">
                                    <a class="accordion-toggle collapsed" href="#Glyphicons9" data-toggle="collapse"><i class="fa fa-caret-right"></i>  Glyphicons Icons</a>
                                    <ul id="Glyphicons9" class="collapse">
                                       <li><a href="#">Font Awesome Icons</a>  </li>
                                       <li><a href="#">Streamline Icons</a> </li>
                                    </ul>
                                 </li>
                                 <li class="list-group-item"><a href="page-meet-team.html"><i class="fa fa-caret-right"></i>  Team Elements</a> </li>
                              </ul>
                           </section>

                        </aside>
                     </div>
                  </div>
               </div>
            </section>
         </div>
      </div>

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

   </script>
</body>
</html>