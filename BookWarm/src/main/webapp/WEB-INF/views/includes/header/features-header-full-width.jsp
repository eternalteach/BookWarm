<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="./header_front01.jsp"%>
<!-- 여기  front01의 current cSS 필요없음 -->
   <!-- Pricing CSS -->
   <link href="vendor/pricing-tables/main.css" rel="stylesheet" />
   <link href="vendor/pricing-tables/responsive.css" rel="stylesheet" />
   <link href="vendor/pricing-tables/style_9.css" rel="stylesheet" />
</head>
<body>

   <div class="body">

      <!--Header-->
      <header id="header" class="header-narrow header-full-width" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 0, 'stickySetTop': '0'}">
         <div class="header-body">
            <div class="header-container container">
               <div class="header-row">
                  <div class="header-column">
                     <div class="header-row">
                        <div class="header-logo">
                           <a href="index.html">
                              <img alt="Vertex" width="120" height="80" src="img/logo.png">
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="header-column justify-content-end">
                     <div class="header-row">
                        <div class="header-nav">
                           <div class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">
                              
                              <!-- 탑 메뉴 -->
                              <%@ include file="../includes/header/top_nav.jsp"%>
                              
                           </div>
                           <button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main nav">
                              <i class="fa fa-bars"></i>
                           </button>
                           <ul class="header-social-icons social-icons d-none d-sm-block">
                              <li class="social-icons-facebook"><a href="http://www.facebook.com/" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                              <li class="social-icons-twitter"><a href="http://www.twitter.com/" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                              <li class="social-icons-linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!--End Header-->

      <div class="page">

         <div class="page-inner p-none no-border">

            <section class="section-tiny main-color b-bordered" style="background: #f6f7f8 url(img/custom/arch-hero-t.png) right 0/auto 100% no-repeat;">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">

                        <i class="ion-android-checkmark-circle fs-60 primary-color"></i>
                        <h4 class="fs-13 fw-6 o-6 mt-20">DON'T WORRY! WE ARE WITH YOU TO HELP</h4>
                        <h2 class=" fs-34 lh-40 fw-3 mt-10">
                           Vertex will help you to create awesome <br /> websites in less time with
                        </h2>

                        <hr class="invisible small" />

                        <div class="clearfix content-center">
                           <ul class="list-inline flex-block clearfix">
                              <li class="item exp-animation slow" data-animation="vertex_hotspot_appear" data-delay="100">
                                 <img src="img/icons/php.png" width="55" />
                                 <a class="mt-10" href="#">Php</a>
                              </li>
                              <li class="item exp-animation slow" data-animation="vertex_hotspot_appear" data-delay="200">
                                 <img src="img/icons/icon-aspdotnet@2x.png" width="55" />
                                 <a class="mt-10" href="#">ASP.NET</a>
                              </li>
                              <li class="item exp-animation slow" data-animation="vertex_hotspot_appear" data-delay="300">
                                 <img src="img/icons/android-icon-medium@2x.png" width="55" />
                                 <a class="mt-10" href="#">Android</a>
                              </li>
                              <li class="item exp-animation slow" data-animation="vertex_hotspot_appear" data-delay="400">
                                 <img src="img/icons/silverlight-icon-med@2x.png" width="55" />
                                 <a class="mt-10" href="#">Silverlight</a>
                              </li>
                              <li class="item exp-animation slow" data-animation="vertex_hotspot_appear" data-delay="500">
                                 <img src="img/icons/Html-tags-icon.png" width="55" />
                                 <a class="mt-10" href="#">Html</a>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-12">
                        <a href="#" class="btn btn-primary btn-shadow-2x mt-15"> <i class="fa fa-info"></i> Get Started Now!</a>
                        <hr class="invisible " />
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-tiny main-color text-center b-bordered bg-block-top-shadow v2">
               <div class="container">

                  <div class="row">
                     <div class="col-sm-12">
                        <span class="m-none fs-16">
                           <span class="label label-primary mr-10 vl-3">Hot</span> Develop your high quality
                           <a href="https://wrapbootstrap.com/theme/vertex-responsive-bootstrap-template-WB0TR1711" data-toggle="tooltip" data-placement="top" data-original-title="Lorem ipsum dolor">
                              Bootstrap
                           </a>
                           themes & templates for your next web project.
                        </span>
                        <a class="fs-15 mb-none ml-5" href="#">
                           Buy now!
                        </a>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary main-color">
               <div class="container pr-30 pl-30">
                  <div class="row">
                     <div class="col-md-6">

                        <div class="p_table col-2 mt-25">

                           <!-- column style 1 -->
                           <div class="column_1">
                              <ul>
                                 <!-- column header -->
                                 <li class="header_row_1 align_center"><h2 class="col1">single</h2></li>
                                 <li class="header_row_2 align_center"><h1 class="col1">$<span>14</span></h1><h3 class="col1">per month</h3></li>
                                 <!-- data rows -->
                                 <li class="row_style_3 align_center"><span><span class="hidden_caption_span">Disk Space</span>Responsive</span></li>
                                 <li class="row_style_1 align_center"><span><span class="hidden_caption_span">Bandwidth mo.</span>Navigation</span></li>
                                 <li class="row_style_3 align_center"><span><span class="hidden_caption_span">E-mail Accounts</span>Unique</span></li>
                                 <li class="row_style_1 align_center"><span><span class="hidden_caption_span">MySQL Databases</span>Bootstrap 3</span></li>
                                 <li class="row_style_3 align_center"><span><span class="hidden_caption_span">Support Tickets mo.</span>24/7 Support</span></li>
                                 <!-- column footer -->
                                 <li class="footer_row"><a href="" class="sign_up radius3">sign up!</a></li>
                              </ul>
                           </div>

                           <!-- column style 2 -->
                           <div class="column_2 active_column">
                              <div class="column_ribbon">Save</div>
                              <ul>
                                 <li class="header_row_1 align_center"><h2 class="col2">multiple</h2></li>
                                 <li class="header_row_2 align_center"><h1 class="col2">$<span>30</span></h1><h3 class="col2">per month</h3></li>
                                 <!-- data rows -->
                                 <li class="row_style_4 align_center"><span>Responsive</span></li>
                                 <li class="row_style_2 align_center"><span>500GB</span></li>
                                 <li class="row_style_4 align_center"><span>Unique</span></li>
                                 <li class="row_style_2 align_center icon-yes-1"><span><span class="hidden_caption_span">MySQL Databases</span></span></li>
                                 <li class="row_style_4 align_center"><span><span class="hidden_caption_span">Support Tickets mo.</span>24/7 Support</span></li>
                                 <!-- column footer -->
                                 <li class="footer_row"><a href="" class="sign_up radius3">sign up!</a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">

                        <h3 class="uppercase fs-18 o-4 ls-1 mt-30">VERTEX UNIVERSITY</h3>
                        <h2 class="section-title mt-xs">
                           A better way to design website and
                           web apps with vertex
                        </h2>
                        <p class="fs-18 lh-26 fw-3 mt-md mb-md o-8">
                           Sign in to multiple teams, get desktop notifications,   <br />
                           and launch right from your tray.
                        </p>

                        <ul class="i-list filled">
                           <li><i class="fa fa-check"></i><span class="list-item">Donec non augue id augue dignissim lectus ipsum vehicula.</span></li>
                           <li><i class="fa fa-check"></i><span class="list-item">Libero sit amet dapibus, nibh urna iaculis magna, sed varius.</span></li>
                           <li><i class="fa fa-check"></i><span class="list-item">Duis porttitor meros dapibus pellentesque feugiat.</span></li>
                           <li><i class="fa fa-check"></i><span class="list-item">Quisque consectetuer accumsan augue.</span></li>
                        </ul>

                        <a href="#" class="btn btn-primary btn-shadow mt-md mb-none"><i class="ion-android-done-all fs-15"></i> Learn about Vertex</a>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary main-color t-bordered">
               <div class="container pr-30 pl-30">
                  <div class="row">
                     <div class="col-sm-12">
                        <div class="clearfix text-center">
                           <h2 class="section-title fs-4">Build Beautiful Websites Using <strong>Vertex</strong> </h2>
                           <p class="fs-16 lh-26 fw-3 mb-30">
                              Using Bootstrap and develop your great apps with Vertex
                           </p>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-4 col-sm-6">
                        <div class="clearfix exp-animation" data-animation="vertex_b_show" data-delay="200">
                           <div class="p-content">
                              <div class="p-image">
                                 <a href="#">
                                    <img src="img/custom/m1.png" class="img-responsive" />
                                 </a>
                              </div>
                              <div class="p-info">
                                 <div class="p-section">
                                    Web Design
                                 </div>
                                 <div class="p-title">
                                    <h4 class="fs-18 fw-6">Design your beautiful website.</h4>
                                 </div>
                                 <div class="p-description">
                                    <p>
                                       Clean and easy framework design for worry and hassle free customizations.
                                    </p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-6">
                        <div class="clearfix exp-animation" data-animation="vertex_b_show" data-delay="400">
                           <div class="p-content">
                              <div class="p-image">
                                 <a href="#">
                                    <img src="img/custom/m2.jpg" class="img-responsive" />
                                 </a>
                              </div>
                              <div class="p-info">
                                 <div class="p-section">
                                    Developing
                                 </div>
                                 <div class="p-title">
                                    <h4 class="fs-18 fw-6">Start to design your product.</h4>
                                 </div>
                                 <div class="p-description">
                                    <p>
                                       Beautiful cinematic designs optimized for all screen sizes and types.
                                    </p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-6">
                        <div class="clearfix exp-animation" data-animation="vertex_b_show" data-delay="600">
                           <div class="p-content">
                              <div class="p-image">
                                 <a href="#">
                                    <img src="img/custom/m3.png" class="img-responsive" />
                                 </a>
                              </div>
                              <div class="p-info">
                                 <div class="p-section">
                                    Tranining
                                 </div>
                                 <div class="p-title">
                                    <h4 class="fs-18 fw-6">The fastest way to grow your work.</h4>
                                 </div>
                                 <div class="p-description">
                                    <p>
                                       Lorem ipsum dolor sit amet consec tetuer adipi scingor elit sed diam nonummy.
                                    </p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary p-none">
               <div class="row fw-row">
                  <div class="xpromo-wrap col-sm-12">
                     <div class="xpromo-bar promo-button" style="background-color:#54ad27;">
                        <p class="text-white">High quality Bootstrap 4 templates for your next web project.</p>
                        <a href="#" target="_self" class="btn btn-primary">Buy Now</a>
                     </div>
                  </div>
               </div>
            </section>
         </div>

         <footer class="footer stylelamas" id="footer-1">
            <div class="main">
               <div class="container">
                  <div class="row">
                     <div class="col-md-4">
                        <section>
                           <div class="heading">
                              <h4 class="title">Newsletter</h4>
                           </div>
                           <p class="mb-10">
                              Keep up on our always evolving product features and technology. Enter your e-mail and subscribe to our newsletter.
                           </p>

                           <div class="clearfix">
                              <form id="newsletterForm" action="php/newsletter-subscribe.php" method="POST" novalidate="novalidate">
                                 <div class="input-group">
                                    <input class="form-control" placeholder="Email Address" name="newsletterEmail" id="newsletterEmail" type="text">
                                    <span class="input-group-btn">
                                       <button class="btn btn-light" type="submit"><i class="fa fa-search"></i></button>
                                    </span>
                                 </div>
                              </form>
                           </div>

                           <div class="clearfix social-wrap mt-25">
                              <ul class="list-inline">
                                 <li>
                                    <a href="http://twitter.com/" class="asc_twitter clearfix">
                                       <span class="social-icon"><i class="ion-social-twitter"></i></span>
                                       <div class="meta clearfix">
                                          <strong class="asc_count">Follow</strong>
                                          <div class="name">on Twitter</div>
                                       </div>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="http://facebook.com/" class="asc_facebook clearfix">
                                       <span class="social-icon"><i class="ion-social-facebook"></i></span>
                                       <div class="meta clearfix">
                                          <strong class="asc_count">Follow</strong>
                                          <div class="name">on Facebook</div>
                                       </div>
                                    </a>
                                 </li>
                                 <!--<li>
                                    <a href="http://facebook.com/" class="asc_rss clearfix">
                                       <span class="social-icon"><i class="ion-social-rss"></i></span>
                                       <div class="meta clearfix">
                                          <strong class="asc_count">Subscribe</strong>
                                          <div class="name">to RSS Feed</div>
                                       </div>
                                    </a>
                                 </li>-->
                              </ul>
                           </div>
                        </section>
                     </div>

                     <div class="col-md-1"> </div>
                     <div class="col-md-2 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Company</h4>
                           </div>
                           <ul class="list-unstyled">
                              <li> <a href="index.html">FAQ & Terms</a> </li>
                              <li> <a href="custom-fonts/index.html">About Company</a> </li>
                              <li> <a href="index.html">Terms of Service</a> </li>
                              <li> <a href="index.html">Track Order</a> </li>
                              <li> <a href="custom-fonts/index.html">Delivery</a> </li>
                              <li> <a href="index.html">Privacy Policy</a> </li>
                              <li> <a href="index.html">Jobs</a> <span class="label label-default o-8">2</span></li>
                           </ul>
                        </section>
                     </div>
                     <div class="col-md-2 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Usefull Links</h4>
                           </div>
                           <ul class="list-unstyled">
                              <li> <a href="contact/index.html">Knowledge Base</a> </li>
                              <li> <a href="custom-fonts/index.html">Tracking & Reports</a> </li>
                              <li> <a href="index.html">Contact Vertex</a> </li>
                              <li> <a href="responsive-image/index.html">Conditions</a> </li>
                              <li> <a href="contact/index.html">Privacy Policy</a> </li>
                              <li> <a href="index.html">Documentation</a> </li>
                              <li> <a href="custom-fonts/index.html">All Features</a> </li>
                           </ul>
                        </section>
                     </div>

                     <div class="col-md-3">
                        <section>
                           <div class="heading">
                              <h4 class="title">Contact Us</h4>
                           </div>

                           <div class="map-img">
                              <address>
                                 <i class="ion-ios-location"></i> <strong> Address</strong><br>
                                 795 Folsom Ave, Suite 600 San Francisco, CA 94107<br>
                              </address>
                              <abbr title="Phone Number"><strong>Phone:</strong></abbr> (91) 8547 632521<br>
                              <abbr title="Fax"><strong>Fax:</strong></abbr> (91) 11 4752 1433<br>
                              <abbr title="Email Address"><strong>Email:</strong></abbr> info@vertex.com
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
                        <ul class="list-inline fs-13 mb-none">
                           <li><p class="mb-0 fw-6">© 2015-2018 Vertex</p></li>
                           <li><a href="pages-about.html">About</a></li>
                           <li><a href="blog-grid.html">Blog</a></li>
                           <li><a href="pages-contact.html">Contact</a></li>
                           <li><a href="#">Terms</a></li>
                           <li><a href="#">Jobs</a></li>
                           <li><a href="#">Sitemap</a></li>
                           <li><a href="#">Public Policy</a></li>
                        </ul>
                     </div>
                     <div class="col-sm-6">
                        <ul class="footer-socials list-inline pull-right mb-none">
                           <li><a href="#" class="tooltips" data-placement="top" data-rel="tooltip" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                           <li><a href="#" class="tooltips" data-placement="top" data-rel="tooltip" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                           <li><a href="#" class="tooltips" data-placement="top" data-rel="tooltip" data-original-title="Google+"><i class="fa fa-google-plus"></i></a></li>
                           <li><a href="#" class="tooltips" data-placement="top" data-rel="tooltip" data-original-title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                           <li><a href="#" class="tooltips" data-placement="top" data-rel="tooltip" data-original-title="Linkedin"><i class="fa fa-tumblr"></i></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </footer>
      </div>

      <div class="modal fade" id="exampleModalLabel33" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel33" aria-hidden="true">
         <div class="modal-dialog" style="max-width:335px" role="document">
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
                        <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                        <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
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
                           <div class="help-block text-right pt-10 fs-13"><a href="" class="read-more fs-11">Forget the password ?</a></div>
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
   <script src="vendor/fitvids/fitvids.js"></script>

   <!-- Theme Initialization -->
   <script src="js/theme.js"></script>

   <!-- Custom JS -->
   <script src="js/custom.js"></script>

   <!-- Style Swicher --> 
   <!--<script src="vendor/style-switcher/style.switcher.js" id="styleSwitcherScript" data-base-path="" data-skin-src=""></script>
   <script src="vendor/style-switcher/style.switcher.localstorage.js"></script>-->
</body>
</html>