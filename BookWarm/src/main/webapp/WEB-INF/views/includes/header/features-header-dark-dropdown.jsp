﻿<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="./header_front01.jsp"%>
</head>
<body>

	<div class="wrapper">

		<!--header start-->
		<header id="header" class="header-no-min-height" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 0, 'stickySetTop': '0', 'stickyChangeLogo': false}">
			<div class="header-body">
				<div class="header-container container">
					<div class="header-row">
						<div class="header-column">
							<div class="header-row">
								<div class="header-logo">
									<a href="index.html"> <img alt="Vertex" width="120"
										height="80" src="img/logo.png">
									</a>
								</div>
							</div>
						</div>
						<div class="header-column justify-content-end">
							<div class="header-row">
								<div
									class="header-nav header-nav-dark-dropdown header-nav-top-line">
									<div
										class="header-nav-main header-nav-main-square header-nav-main-effect-2 header-nav-main-sub-effect-1">
										<!-- 탑 메뉴 -->
										<%@ include file="./top_nav.jsp"%>
										
									</div>
									<ul class="header-social-icons social-icons d-none d-sm-block">
										<li class="social-icons-facebook"><a
											href="http://www.facebook.com/" target="_blank"
											title="Facebook"><i class="fa fa-facebook"></i></a></li>
										<li class="social-icons-twitter"><a
											href="http://www.twitter.com/" target="_blank"
											title="Twitter"><i class="fa fa-twitter"></i></a></li>
										<li class="social-icons-linkedin"><a
											href="http://www.linkedin.com/" target="_blank"
											title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
									</ul>
									<button class="btn header-btn-collapse-nav"
										data-toggle="collapse" data-target=".header-nav-main nav">
										<i class="fa fa-bars"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!--header end-->



		<div class="page">

			<section
				class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll loaded dzsprx-readyall bg-overlay--gradient-dark">

				<div class="divimage dzsparallaxer--target w-100"
					style="height: 120%; background-image: url(img/banner/b10.jpg);">
				</div>

				<div class="container text-white text-center pt-200 pb-200">
					<div class="row">

						<div class="col-md-12 z-index-1">
							<p class="mb-0 o-7 fw-5 ls-1 text-uppercase">Parallax Page
								Title Example</p>
							<h2 class="fw-6 fs-54 lh-56">
								We are a creative <br /> design <span class="primary-color">studio.</span>
							</h2>

							<ol class="breadcrumb clean-breadcrumb text-white mb-0 mt-20 o-8">
								<li><a href="#"><i class="fa fa-home"></i> Home</a></li>
								<li><a href="#"><i class="fa fa-diamond"></i> Features</a></li>
								<li><a href="#"><i class="fa fa-tint"></i> Headers</a></li>
								<li><a href="#"><i class="fa fa-header"></i>
										Transparent Header</a></li>
							</ol>
						</div>
					</div>
				</div>
			</section>

			<div class="page-inner p-none">

				<div class="section-primary">
					<div class="container">

						<div class="row">
							<div class="col-md-11">

								<div class="special-heading word-underline-2">
									<h1 class="special-heading-inner">
										<span>Transparent header. </span>
									</h1>
								</div>

								<div class="clearfix">
									<p class="fs-24 lh-34 e-custom-heading">Enthusiastically
										orchestrate premier web services whereas turnkey
										relationships. Competently procrastinate goal-oriented
										catalysts for change through resource-leveling paradigms.</p>
								</div>
							</div>
						</div>

						<hr class="invisible pb-15" />

						<div class="row">
							<div class="col-md-4">
								<div class="special-heading underline">
									<h2 class="fs-36 special-heading-inner fw-6">
										<span> The amazing <br /> Vertex template.. <br />
											reloaded!
										</span>
									</h2>
								</div>
							</div>
							<div class="col-md-4">
								<p>Enthusiastically orchestrate premier web services whereas
									turnkey relationships. Competently procrastinate goal-oriented
									catalysts for change through resource-leveling paradigms.</p>
								<p>Assertively integrate resource sucking sources through
									resource maximizing channels. Seamlessly deliver virtual
									paradigms through web-enabled value.</p>
							</div>
							<div class="col-md-4">
								<p>Assertively integrate resource sucking sources through
									resource maximizing channels. Seamlessly deliver virtual
									paradigms through web-enabled value. Progressively parallel
									task turnkey materials without effective leadership skills.</p>
								<p>Enthusiastically orchestrate premier web services whereas
									turnkey relationships.</p>
								<br />
							</div>
						</div>
					</div>
				</div>
			</div>

			<footer class="footer stylelamas">
				<div class="main">
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<section>
									<div class="heading">
										<h4 class="title">Newsletter</h4>
									</div>
									<p class="mb-10">Keep up on our always evolving product
										features and technology. Enter your e-mail and subscribe to
										our newsletter.</p>

									<div class="clearfix">
										<form id="newsletterForm"
											action="php/newsletter-subscribe.php" method="POST"
											novalidate="novalidate">
											<div class="input-group">
												<input class="form-control" placeholder="Email Address"
													name="newsletterEmail" id="newsletterEmail" type="text">
												<span class="input-group-btn">
													<button class="btn btn-light" type="submit">
														<i class="fa fa-search"></i>
													</button>
												</span>
											</div>
										</form>
									</div>

									<div class="clearfix social-wrap mt-25">
										<ul class="list-inline">
											<li><a href="http://twitter.com/"
												class="asc_twitter clearfix"> <span class="social-icon"><i
														class="ion-social-twitter"></i></span>
													<div class="meta clearfix">
														<strong class="asc_count">Follow</strong>
														<div class="name">on Twitter</div>
													</div>
											</a></li>
											<li><a href="http://facebook.com/"
												class="asc_facebook clearfix"> <span class="social-icon"><i
														class="ion-social-facebook"></i></span>
													<div class="meta clearfix">
														<strong class="asc_count">Follow</strong>
														<div class="name">on Facebook</div>
													</div>
											</a></li>
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

							<div class="col-md-1"></div>
							<div class="col-md-2 col-sm-6">
								<section>
									<div class="heading">
										<h4 class="title">Company</h4>
									</div>
									<ul class="list-unstyled">
										<li><a href="index.html">FAQ & Terms</a></li>
										<li><a href="custom-fonts/index.html">About Company</a></li>
										<li><a href="index.html">Terms of Service</a></li>
										<li><a href="index.html">Track Order</a></li>
										<li><a href="custom-fonts/index.html">Delivery</a></li>
										<li><a href="index.html">Privacy Policy</a></li>
										<li><a href="index.html">Jobs</a> <span
											class="label label-default o-8">2</span></li>
									</ul>
								</section>
							</div>
							<div class="col-md-2 col-sm-6">
								<section>
									<div class="heading">
										<h4 class="title">Usefull Links</h4>
									</div>
									<ul class="list-unstyled">
										<li><a href="contact/index.html">Knowledge Base</a></li>
										<li><a href="custom-fonts/index.html">Tracking &
												Reports</a></li>
										<li><a href="index.html">Contact Vertex</a></li>
										<li><a href="responsive-image/index.html">Conditions</a>
										</li>
										<li><a href="contact/index.html">Privacy Policy</a></li>
										<li><a href="index.html">Documentation</a></li>
										<li><a href="custom-fonts/index.html">All Features</a></li>
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
										<abbr title="Phone Number"><strong>Phone:</strong></abbr> (91)
										8547 632521<br> <abbr title="Fax"><strong>Fax:</strong></abbr>
										(91) 11 4752 1433<br> <abbr title="Email Address"><strong>Email:</strong></abbr>
										info@vertex.com
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
									<li><a href="#" class="tooltips" data-placement="top"
										data-rel="tooltip" data-original-title="Twitter"><i
											class="fa fa-twitter"></i></a></li>
									<li><a href="#" class="tooltips" data-placement="top"
										data-rel="tooltip" data-original-title="Facebook"><i
											class="fa fa-facebook"></i></a></li>
									<li><a href="#" class="tooltips" data-placement="top"
										data-rel="tooltip" data-original-title="Google+"><i
											class="fa fa-google-plus"></i></a></li>
									<li><a href="#" class="tooltips" data-placement="top"
										data-rel="tooltip" data-original-title="Linkedin"><i
											class="fa fa-linkedin"></i></a></li>
									<li><a href="#" class="tooltips" data-placement="top"
										data-rel="tooltip" data-original-title="Linkedin"><i
											class="fa fa-tumblr"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</footer>
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

	<script src="vendor/dzsparallaxer/dzsparallaxer.js"></script>
	<script src="vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
	<script src="vendor/dzsparallaxer/advancedscroller/plugin.js"></script>

	<!-- Theme Initialization -->
	<script src="js/theme.js"></script>

	<!-- Custom JS -->
	<script src="js/custom.js"></script>

	<!-- Style Swicher -->
	<!--<script src="vendor/style-switcher/style.switcher.js" id="styleSwitcherScript" data-base-path="" data-skin-src=""></script>
   <script src="vendor/style-switcher/style.switcher.localstorage.js"></script>-->
</body>
</html>