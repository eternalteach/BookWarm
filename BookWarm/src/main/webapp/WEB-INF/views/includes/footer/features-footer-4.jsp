<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="./include-footer-head.jsp"%>
</head>
<body>
	<footer class="footer footer-2">
		<div class="main">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6 pr-40">
						<section>
							<div class="heading">
								<h4 class="title">Newsletter</h4>
							</div>
							<p>Keep up on our always evolving product features and
								technology. Enter your e-mail and subscribe to our newsletter.</p>

							<div class="clearfix">
								<form id="newsletterForm" action="php/newsletter-subscribe.php"
									method="POST" novalidate="novalidate">
									<div class="input-group">
										<input class="form-control bg-white"
											placeholder="Email Address" name="newsletterEmail"
											id="newsletterEmail" type="text">
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
								</ul>
							</div>
						</section>
					</div>
					<div class="col-md-4 col-sm-6 pr-40">
						<section class="latest-news">
							<div class="heading">
								<h4 class="title">Latest News</h4>
							</div>

							<div class="clearfix">

								<div class="spost clearfix mt-0 pt-0">
									<div class="entry-image">
										<a href="#" class="nobg"><img class="img-circle"
											src="./resources/VertexEx/img/thumbs/project-6.jpg" alt=""></a>
									</div>
									<div class="entry-c">
										<div class="entry-title">
											<h4>
												<a href="#">Aptent class taciti sociosqu...</a>
											</h4>
										</div>
										<ul class="entry-meta">
											<li>June 28, 2018</li>
										</ul>
									</div>
								</div>

								<div class="spost clearfix mt-15 pt-15">
									<div class="entry-image">
										<a href="#" class="nobg"><img class="img-circle"
											src="./resources/VertexEx/img/thumbs/project-3.jpg" alt=""></a>
									</div>
									<div class="entry-c">
										<div class="entry-title">
											<h4>
												<a href="#">Elit Assumenda amet dolorum quasi.</a>
											</h4>
										</div>
										<ul class="entry-meta">
											<li>September 20, 2018</li>
										</ul>
									</div>
								</div>

								<div class="spost clearfix mt-15 pt-15">
									<div class="entry-image">
										<a href="#" class="nobg"><img class="img-circle"
											src="./resources/VertexEx/img/thumbs/project-2.jpg" alt=""></a>
									</div>
									<div class="entry-c">
										<div class="entry-title">
											<h4>
												<a href="#">Sociosqu class aptent taciti</a>
											</h4>
										</div>
										<ul class="entry-meta">
											<li>March 20, 2018</li>
										</ul>
									</div>
								</div>
							</div>
						</section>
					</div>
					<div class="col-md-4 col-sm-6">
						<section>
							<div class="heading">
								<h4 class="title">Contact Us</h4>
							</div>

							<div class="footer-contact-info">
								<ul class="pl-none">
									<li>
										<p>
											<i class="fa fa-building"></i>Your Company
										</p>
									</li>
									<li>
										<p>
											<i class="fa fa-map-marker"></i>795 Folsom Ave, Suite 600 San
											Francisco, CA 94107
										</p>
									</li>
									<li>
										<p>
											<i class="fa fa-envelope"></i><strong>Email:</strong> <a
												class="b-link" href="mailto:mail@example.com">mail@example.com</a>
										</p>
									</li>
									<li>
										<p>
											<i class="fa fa-phone"></i><strong>Phone:</strong> (123)
											456-7890
										</p>
									</li>
									<li>
										<p>
											<i class="fa fa-print"></i><strong>Fax:</strong>
											555-1254-8785
										</p>
									</li>
									<li>
										<p>
											<i class="fa fa-skype"></i><a class="b-link"
												href="mailto:mail@example.com">vertextheme</a>
										</p>
									</li>
								</ul>
								<br>

								<!--<ul class="social-icons standard">
                                 <li class="twitter"><a href="#" target="_blank"><i class="fa fa-twitter"></i><i class="fa fa-twitter"></i></a></li>
                                 <li class="facebook"><a href="#" target="_blank"><i class="fa fa-facebook"></i><i class="fa fa-facebook"></i></a></li>
                                 <li class="youtube"><a href="#" target="_blank"><i class="fa fa-youtube"></i><i class="fa fa-youtube"></i></a></li>
                                 <li class="googleplus"><a href="#" target="_blank"><i class="fa fa-google-plus"></i><i class="fa fa-google-plus"></i></a></li>
                              </ul>-->
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>

		<div class="copyright pb-15 pt-15">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<img src="./resources/VertexEx/img/logo-white.png" class="d-inline-block"
							style="width: 70px" />
						<p class="mb-none d-inline-block">© Copyright 2018. All Rights
							Reserved.</p>

					</div>
					<div class="col-sm-6">
						<ul class="list-inline mt-10 mb-none pull-right">
							<li><a href="pages-about.html">About</a></li>
							<li><a href="pages-contact.html">Contact</a></li>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Sitemap</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<footer class="footer footer-pompis" id="footer-4">
		<div class="main">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
							<img alt="Vertex" src="./resources/VertexEx/img/logo-white.png" style="height: 90px; margin-top: -20px;" class="mb-10">

						<p>Class aptent taciti sociosqu ad litora torquent per conubia
							nostra, per inceptos himenaeos. Nulla nunc dui, tristique in
							semper vel, congue sed ligula auctor torquent per conubia nostra.</p>
						<p>
							<a href="blog-standard-post.html">Read More →</a>
						</p>
					</div>

					<div class="col-md-3">
						<div class="heading">
							<h4 class="title">Contact Us</h4>
						</div>
						<div class="footer-contact-info">
							<ul class="pl-0">
								<li>
									<p>
										<i class="fa fa-building"></i>Your Company
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-map-marker"></i>1 Liberty St New York, NY 5006
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-envelope"></i><strong>Email:</strong> <a
											href="mailto:mail@example.com">mail@example.com</a>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-phone"></i><strong>Phone:</strong> (123)
										456-7890
									</p>
								</li>
							</ul>
							<br>


							<div class="clearfix">
								<a href="#" class="social-icon si-rounded si-facebook"
									title="Facebook"> <i class="si-icon-facebook"></i> <i
									class="si-icon-facebook"></i>
								</a> <a href="#" class="social-icon si-rounded si-twitter"
									title="Twitter"> <i class="si-icon-twitter"></i> <i
									class="si-icon-twitter"></i>
								</a> <a href="#" class="social-icon si-rounded si-skype"
									title="Skype"> <i class="si-icon-skype"></i> <i
									class="si-icon-skype"></i>
								</a> <a href="#" class="social-icon si-rounded si-gplus"
									title="Google Plus"> <i class="si-icon-gplus"></i> <i
									class="si-icon-gplus"></i>
								</a>
							</div>
						</div>

					</div>

					<div class="col-md-3">
						<div class="heading">
							<h4 class="title">Recent Post</h4>
						</div>
						<div class="clearfix">

							<div class="spost clearfix">
								<div class="entry-image">
									<a href="#" class="nobg"><img class="img-circle"
										src="./resources/VertexEx/img/thumbs/project-6.jpg" alt=""></a>
								</div>
								<div class="entry-c">
									<div class="entry-title">
										<h4>
											<a href="#">Amazing Standard Post</a>
										</h4>
									</div>
									<ul class="entry-meta">
										<li><i class="ion-ios-chatboxes-outline"></i> 35 Comments</li>
									</ul>
								</div>
							</div>

							<div class="spost clearfix">
								<div class="entry-image">
									<a href="#" class="nobg"><img class="img-circle"
										src="./resources/VertexEx/img/thumbs/project-3.jpg" alt=""></a>
								</div>
								<div class="entry-c">
									<div class="entry-title">
										<h4>
											<a href="#">Full Width Media Post</a>
										</h4>
									</div>
									<ul class="entry-meta">
										<li><i class="ion-ios-chatboxes-outline"></i> 24 Comments</li>
									</ul>
								</div>
							</div>

							<div class="spost clearfix">
								<div class="entry-image">
									<a href="#" class="nobg"><img class="img-circle"
										src="./resources/VertexEx/img/thumbs/project-2.jpg" alt=""></a>
								</div>
								<div class="entry-c">
									<div class="entry-title">
										<h4>
											<a href="#">Amazing Slideshow post</a>
										</h4>
									</div>
									<ul class="entry-meta">
										<li><i class="ion-ios-chatboxes-outline"></i> 19 Comments</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<div class="heading">
							<h4 class="title">Recent Works</h4>
						</div>
						<ul class="portfolio-grid">
							<li><a href="#" class="grid-image"> <img
									src="./resources/VertexEx/img/thumbs/project-6.jpg" alt="Desert Mini Planet">
							</a></li>
							<li><a href="#" class="grid-image"> <img
									src="./resources/VertexEx/img/thumbs/project-5.jpg" alt="SAAP">
							</a></li>
							<li><a href="#" class="grid-image"> <img
									src="./resources/VertexEx/img/thumbs/project-4.png" alt="Robot Chicken">
							</a></li>
							<li><a href="#" class="grid-image"> <img
									src="./resources/VertexEx/img/thumbs/project-3.jpg" alt="Tree">
							</a></li>
							<li><a href="#" class="grid-image"> <img
									src="./resources/VertexEx/img/thumbs/project-2.jpg" alt="Space Invaders">
							</a></li>
							<li><a href="#" class="grid-image"> <img
									src="./resources/VertexEx/img/thumbs/project-7.jpg" alt="Polar Ice">
							</a></li>
						</ul>

					</div>
				</div>

			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">

						<p class="mb-0 fs-13">© Copyright 2018 by Vertex. All Rights
							Reserved.</p>

					</div>
					<div class="col-sm-6">
						<div class="clearfix pull-right">

							<ul class="list-inline fs-13 mb-none">
								<li><a href="pages-about.html">About</a></li>
								<li><a href="blog-grid.html">Blog</a></li>
								<li><a href="pages-contact.html">Contact</a></li>
								<li><a href="#">Terms</a></li>
								<li><a href="#">Jobs</a></li>
								<li><a href="#">Sitemap</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	</div>
	</div>
	<%@ include file="./include-vendor.jsp"%>
	<!-- Theme Initialization -->
	<script src="./resources/VertexEx/js/theme.js"></script>

	<!-- Custom JS -->
	<script src="./resources/VertexEx/js/custom.js"></script>
</body>
</html>