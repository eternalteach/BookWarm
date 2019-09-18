<% String path1 = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<body>
	<!--Header-->
	<header id="header" class="header-effect-shrink"
		data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 120}">
		<div class="header-body">
			<div class="header-top">
				<div class="header-top-container container">
					<div class="header-row">
						<div class="header-column justify-content-start">
							<span class="d-none d-sm-flex align-items-center pr-3">
							<i class="fa fa-phone mr-1"></i><a href="tel:+1234567890">Call us: <strong>123-456-7890</strong></a></span>
							<span class="d-none d-sm-flex align-items-center ml-3"> 
							<i class="fa fa-envelope-o mr-1"></i><a href="mailto:info@yoursite.com">info@yoursite.com</a></span>
						</div>
						<div class="header-column justify-content-end">
							<ul class="nav">
								<li class="nav-item"><a class="nav-link" href="contact-us-1.html">Contact Us</a></li>
								<li class="nav-item"><a class="nav-link" href="page-help.html">Help</a></li>
								<li class="nav-item"><a href="#" class="nav-link dropdown-menu-toggle" id="dropdownLanguage" 
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> English<i class="fa fa-angle-down fa-sm"></i></a>
									<ul class="dropdown-menu dropdown-menu-right dropdown-language"	aria-labelledby="dropdownLanguage">
										<li class="menu-header">Select your language</li>
										<li><a href="#" class="no-skin"><img src="img/blank.gif" class="flag flag-us" alt="English" />USA</a></li>
										<li><a href="#" class="no-skin"><img src="img/blank.gif" class="flag flag-fr" alt="France" />France</a></li>
										<li><a href="#" class="no-skin"><img src="img/blank.gif" class="flag flag-es" alt="Spain" />Spain</a></li>
										<li><a href="#" class="no-skin"><img src="img/blank.gif" class="flag flag-de" alt="Germany" />Germany</a></li>
									</ul></li>
							</ul>
							<div class="d-none d-md-block mb-0">
								<a href="#" class="social-icon si-borderless si-facebook si-small mb-0"	title="Facebook"> 
								<i class="si-icon-facebook"></i><i class="si-icon-facebook"></i>
								</a> <a href="#"
									class="social-icon si-borderless si-twitter si-small mb-0"
									title="Twitter"> <i class="si-icon-twitter"></i> <i
									class="si-icon-twitter"></i>
								</a> <a href="#"
									class="social-icon si-borderless si-instagram si-small mb-0"
									title="Instagram"> <i class="si-icon-instagram"></i> <i
									class="si-icon-instagram"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="header-container container">
				<div class="header-row">
					<div class="header-column justify-content-start">
						<div class="header-logo">
							<a href="index.html"> <img alt="Vertex" width="130"
								src="./resources/Vertex/img/logo.png">
							</a>
						</div>
					</div>
					<div class="header-column justify-content-end">
						<div class="header-nav header-nav-light-dropdown">
							<div
								class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
								<nav class="collapse">
									<ul class="nav flex-column flex-lg-row" id="mainNav">
										<li class="dropdown dropdown-mega"><a
											class="dropdown-item dropdown-toggle" href="#"> Home </a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--End Header-->

	<div role="main" class="main">
		<section class="page-header">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-8 text-left">
						<span class="tob-sub-title text-color-primary d-block">LITLE BIT ABOUT US</span>
						<h1>Tabs Control</h1>
						<p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
					<div class="col-md-4">
						<ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
							<li><a href="index.html">Elements</a></li>
							<li class="active">Tabs Control</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="v-page-wrap has-right-sidebar has-one-sidebar">
			<div class="container">
				<!--Horizontal Tab - Clean-->
				<div class="row">
					<div class="col-sm-12">
						<div class="v-heading-v2">
							<h3>Centered</h3>
						</div>
					</div>

					<!-- 책 정렬 제목  -->
					<div class="col-sm-12">
						<ul class="nav nav-tabs nav-tabs-default nav-tabs-centered "
							role="tablist">
							<!-- isbn순 -->
							<li class="nav-item"><a class="nav-link active" 
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0" 
								data-toggle="tab"
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00" role="tab"
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								aria-expanded="true">제목순</a></li>
								
							<!-- 제목순 -->	
							<li class="nav-item"><a class="nav-link"
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1"
								data-toggle="tab"								
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tab" 
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
								aria-expanded="true">낮은 가격순</a></li>
							<!-- test//아직 아무것도 없음 -->
    						<li class="nav-item">
                           	 <a class="nav-link " 
                           	 id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2" 
                           	 data-toggle="tab" 
                           	 href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" 
                           	 role="tab" 
                            	aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" 
                           	 aria-expanded="true">높은 가격순</a>
                        	</li>
								
						</ul>
						<!-- ul끝  -->

						<div class="tab-content">
						
							<div class="tab-pane fade show active" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0">
								<!-- shoptitlelist  -->
								<div class="row">
									<c:forEach items="${shoptitlelist}" var="shop">
										<div class="col-md-2"">
											<figure class="product-shadows product-item">
												<p>&nbsp;${shop.isbn}</p>
												
												<!-- 책 이미지 누르면 책 상세정보로 이동 -->
												<div class="product-media">
													<div class="img-wrap first-image">
														<a href="shopproduct?isbn=${shop.isbn}">
														<img src="${shop.book_img}"></a>
													</div>
												</div>

												<div class="product-details">
													<h3 class="product-name">
														<a href="#">${shop.book_title}</a>
													</h3>
													<span class="product-posted_in">
													<a rel="tag">${shop.writer_name}&nbsp;저</a></span>
													<span class="product-posted_in">
													<a rel="tag" id="translastor_name"><%-- ${shop.translator_name}&nbsp;저 --%></a></span>
													<span class="product-price"> <span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${shop.book_price}" pattern="###,###,###" /></span>원<br>
														<span class="product-price-currency">할인가&nbsp;<fmt:formatNumber value="${shop.book_price_for_sale}" pattern="###,###,###" />
</span>원
													</span>
													</span>
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
								
							</div>
							<!-- 끝 -->

								
							<!-- 가격순 책 불러오기  -->
							<div class="tab-pane fade" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
								role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1">
								<!-- bookpricelist 책 불러오기 -->
								<div class="row">
									<c:forEach items="${bookpricelist}" var="shop_title">
										<div class="col-md-2">
											<figure class="product-shadows product-item">
												<p>&nbsp;${shop_title.isbn}</p>
												<div class="product-media">
													<div class="img-wrap first-image">
														<!-- 책 이미지 누르면 책 상세 페이지로 이동 -->
														<a href="shopproduct?isbn=${shop_title.isbn}"><img src="${shop_title.book_img}"></a>
													</div>
												</div>

												<div class="product-details">
													<h3 class="product-name"><a href="#">${shop_title.book_title}</a></h3>
													<span class="product-posted_in"><a href="#" rel="tag">${shop_title.writer_name}&nbsp;저</a></span>
													<span class="product-price"> <span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${shop_title.book_price}" pattern="###,###,###" /></span>원<br>
														<span class="product-price-currency">할인가&nbsp;<fmt:formatNumber value="${shop_title.book_price_for_sale}" pattern="###,###,###" /></span>
													</span>
													</span>
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- bookpricelist 불러오기 끝  -->
							
							<!-- 높은 가격순   -->
								 <div class="tab-pane fade " id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2">

                                     <div class="row">
                                     <c:forEach items="${bookpricelist2}" var="bookpricelist2">
										<div class="col-md-2">
											<figure class="product-shadows product-item">
												<p>&nbsp;${bookpricelist2.isbn}</p>
												<div class="product-media">
													<div class="img-wrap first-image">
														<!-- 책 이미지 누르면 책 상세 페이지로 이동 -->
														<a href="shopproduct?isbn=${bookpricelist2.isbn}"><img src="${bookpricelist2.book_img}"></a>
													</div>
												</div>

												<div class="product-details">
													<h3 class="product-name"><a href="#">${bookpricelist2.book_title}</a></h3>
													<span class="product-posted_in"><a href="#" rel="tag">${bookpricelist2.writer_name}&nbsp;저</a></span>
													<span class="product-price"> <span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${bookpricelist2.book_price}" pattern="###,###,###" /></span>원<br>
														<span class="product-price-currency">할인가&nbsp;<fmt:formatNumber value="${bookpricelist2.book_price_for_sale}" pattern="###,###,###" /></span>
													</span>
													</span>
													</div>
												</figure>
											</div>
										</c:forEach>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				<!--End Horizontal Tab - Clean-->
			</div>
		</div>
	</div>


	<!--Footer-시작<<나중에는 뺄꺼임-->
	<div class="footer-wrap">
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<section class="widget">
							<img alt="Vertex" src="./resources/Vertex/img/logo-white.png"
								style="height: 40px; margin-bottom: 20px;">
							<p class="pull-bottom-small">Donec quam felis, ultricies nec,
								pellen tesqueeu, pretium quis, sem. Nulla consequat massa quis
								enim. Donec pede justo, fringilla vel aliquet nec, vulputate
								eget aliquet nec, arcu.</p>
							<p>
								<a href="page-about-us-2.html">Read More →</a>
							</p>
						</section>
					</div>
					<div class="col-sm-3">
						<section class="widget v-twitter-widget">
							<div class="widget-heading">
								<h4>Latest Tweets</h4>
								<div class="horizontal-break"></div>
							</div>
							<ul class="v-twitter-widget">
								<li>
									<div class="tweet-text">
										<a href="#" target="_blank">@Vertex</a> Lorem ipsum dolor sit
										amet, consec adipiscing elit onvallis dignissim.
									</div>
									<div class="twitter_intents">
										<a class="timestamp" href="#" target="_blank">3 hours ago</a>
									</div>
								</li>
								<li>
									<div class="tweet-text">
										<a href="#" target="_blank">@Vertex</a> Sed blandit conval
										dignissim. pharetra velit eu velit et erat pharetra.
									</div>
									<div class="twitter_intents">
										<a class="timestamp" href="#" target="_blank">5 days ago</a>
									</div>
								</li>
							</ul>
						</section>
					</div>
					<div class="col-sm-3">
						<section class="widget v-recent-entry-widget">
							<div class="widget-heading">
								<h4>Recent Posts</h4>
								<div class="horizontal-break"></div>
							</div>
							<ul>
								<li><a href="blog-standard-post.html">Amazing Standard
										Post</a></li>
								<li><a href="blog-full-width-post.html">Full Width
										Media Post</a></li>
								<li><a href="blog-video-post.html">Perfect Video Post</a></li>
								<li><a href="blog-slideshow-post.html">Amazing
										Slideshow post</a></li>
							</ul>
						</section>
					</div>
					<div class="col-sm-3">
						<section class="widget">
							<div class="widget-heading">
								<h4>Recent Works</h4>
								<div class="horizontal-break"></div>
							</div>
							<ul class="portfolio-grid">
								<li><a href="portfolio-single.html" class="grid-img-wrap">
										<img src="./resources/Vertex/img/thumbs/project-1.jpg" /> <span
										class="tooltip">Phasellus enim libero<span
											class="arrow"></span></span>
								</a></li>
								<li><a href="portfolio-single.html" class="grid-img-wrap">
										<img src="./resources/Vertex/img/thumbs/project-2.jpg" /> <span
										class="tooltip">Phasellus enim libero<span
											class="arrow"></span></span>
								</a></li>
								<li><a href="portfolio-single.html" class="grid-img-wrap">
										<img src="./resources/Vertex/img/thumbs/project-3.jpg" /> <span
										class="tooltip">Phasellus enim<span class="arrow"></span></span>
								</a></li>
								<li><a href="portfolio-single.html" class="grid-img-wrap">
										<img src="./resources/Vertex/img/thumbs/project-4.png" /> <span
										class="tooltip">Lorem Imput<span class="arrow"></span></span>
								</a></li>
								<li><a href="portfolio-single.html" class="grid-img-wrap">
										<img src="./resources/Vertex/img/thumbs/project-5.jpg" /> <span
										class="tooltip">Phasellus Enim libero<span
											class="arrow"></span></span>
								</a></li>
								<li><a href="portfolio-single.html" class="grid-img-wrap">
										<img src="./resources/Vertex/img/thumbs/project-6.jpg" /> <span
										class="tooltip">Phasellus Enim<span class="arrow"></span></span>
								</a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</footer>

		<div class="copyright">
			<div class="container">
				<p>© Copyright 2018 by Vertex. All Rights Reserved.</p>

				<div class="clearfix pull-right">
					<a href="#" class="social-icon si-borderless si-facebook mb-0"
						title="Facebook"> <i class="si-icon-facebook"></i> <i
						class="si-icon-facebook"></i>
					</a> <a href="#" class="social-icon si-borderless si-twitter mb-0"
						title="Twitter"> <i class="si-icon-twitter"></i> <i
						class="si-icon-twitter"></i>
					</a> <a href="#" class="social-icon si-borderless si-instagram mb-0"
						title="Instagram"> <i class="si-icon-instagram"></i> <i
						class="si-icon-instagram"></i>
					</a> <a href="#" class="social-icon si-borderless si-vk mb-0"
						title="Vk"> <i class="si-icon-vk"></i> <i class="si-icon-vk"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--End Footer-Wrap-->

	<!-- Libs -->
	<script src="./resources/Vertex/js/jquery.min.js"></script>
	<script src="./resources/Vertex/js/popper.js"></script>
	<script src="./resources/Vertex/js/bootstrap.min.js"></script>
	<script src="./resources/Vertex/js/jquery.flexslider-min.js"></script>
	<script src="./resources/Vertex/js/jquery.easing.js"></script>
	<script src="./resources/Vertex/js/jquery.fitvids.js"></script>
	<script src="./resources/Vertex/js/jquery.carouFredSel.min.js"></script>
	<script src="./resources/Vertex/js/jquery.validate.js"></script>
	<script src="./resources/Vertex/js/theme-plugins.js"></script>
	<script src="./resources/Vertex/js/jquery.isotope.min.js"></script>
	<script src="./resources/Vertex/js/imagesloaded.js"></script>
	<script src="./resources/Vertex/js/view.min.js?auto"></script>
	<script src="./resources/Vertex/plugins/aos/aos.js"></script>
	<script src="./resources/Vertex/js/theme-core.js"></script>
	<script src="./resources/Vertex/js/theme.js"></script>
	<script src="./resources/Vertex/js/theme.init.js"></script>
	
	<!-- 이게있어야 스크립트 작동ㅠㅠ -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>
</html>
