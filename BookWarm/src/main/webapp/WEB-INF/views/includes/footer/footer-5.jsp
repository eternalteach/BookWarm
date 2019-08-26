<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<body>
	<div class="wrapper">
		<div class="page">
			<footer class="footer footer-emel" id="footer-5">
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
												<li><i class="fa fa-map-marker"></i> <strong>ADDRESS:</strong>
													<span>123 Street Name, City, Turkey</span></li>
												<li><i class="fa fa-phone"></i> <strong>PHONE:</strong>
													<span>(123) 456-7890</span></li>
												<li><i class="fa fa-envelope"></i> <strong>EMAIL:</strong>
													<span><a href="mailto:mail@example.com">mail@example.com</a></span></li>
												<li><i class="fa fa-clock-o"></i> <strong>WORKING
														DAYS/HOURS:</strong> <span>Mon - Sun / 9:00 AM - 8:00 PM</span></li>
											</ul>
										</div>
									</div>

									<div class="clearfix">
										<a href="#" class="social-icon si-dark si-small si-facebook"
											title="Facebook"> <i class="si-icon-facebook"></i> <i
											class="si-icon-facebook"></i>
										</a> <a href="#" class="social-icon si-dark si-small si-twitter"
											title="twitter"> <i class="si-icon-twitter"></i> <i
											class="si-icon-twitter"></i>
										</a> <a href="#" class="social-icon si-dark si-small si-google"
											title="google"> <i class="si-icon-google"></i> <i
											class="si-icon-google"></i>
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
										<ul class="list-unstyled mb-none d-inline-block mr-40">
											<li><i class="fa fa-angle-double-right"></i> <a
												href="index.html">About Our Company</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="contact/index.html">Large Image Blog</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="parallax-presentation/index.html">Contact Us</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="contact/index.html">Help</a></li>
										</ul>
										<ul class="list-unstyled mb-none d-inline-block mr-40">
											<li><i class="fa fa-angle-double-right"></i> <a
												href="parallax-presentation/index.html">Single Product</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="index.html">Order History</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="contact/index.html">Wish List</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="contact/index.html">Cart</a></li>
										</ul>

										<ul class="list-unstyled mb-none d-inline-block">
											<li><i class="fa fa-angle-double-right"></i> <a
												href="index.html">Shop Home</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="contact/index.html">Services</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="parallax-presentation/index.html">FAQ</a></li>
											<li><i class="fa fa-angle-double-right"></i> <a
												href="index.html">Jobs</a> <span
												class="label label-default o-8">2</span></li>
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
										<p>Keep up on our always evolving product features and
											technology. Enter your e-mail and subscribe to our
											newsletter.</p>
										<form id="newsletterForm"
											action="php/newsletter-subscribe.php" method="POST"
											novalidate="novalidate">
											<div class="input-group">
												<input class="form-control" placeholder="Email Address"
													name="newsletterEmail" id="newsletterEmail" type="text">
												<span class="input-group-btn">
													<button class="btn btn-light" type="submit">SUBSCRIBE</button>
												</span>
											</div>
										</form>
									</div>
									<div class="clearfix counters">
										<div class="row">
											<div class="col-md-6">
												<div class="counter text-left">
													<strong class="counter-number fs-34" data-to="120.50"
														data-plugin-options="{&quot;decimals&quot;: 2}">120.50</strong>
													<span class="text">Total Sales</span>
												</div>
											</div>

											<div class="col-md-6">
												<div class="counter text-left">
													<strong class="counter-number fs-34" data-to="141.100"
														data-plugin-options="{&quot;decimals&quot;: 3}">141.500</strong>
													<span class="text">Project Done</span>
												</div>
											</div>
										</div>
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
									<p class="mb-0 mt-10">© Vertex eCommerce. 2018. All Rights
										Reserved</p>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="clearfix pull-right">
									<img src="./resources/VertexEx/img/shop/payment-icon.png" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>

		<div class="modal fade" id="exampleModalLabel33" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel33"
			aria-hidden="true">
			<div class="modal-dialog" style="max-width: 345px" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel33">Login via</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="clearfix" id="login-dp">

							<div class="social-buttons text-center">
								<a href="#" class="btn btn-fb ls-0"><i
									class="fa fa-facebook"></i> Facebook</a> <a href="#"
									class="btn btn-tw ls-0"><i class="fa fa-twitter"></i>
									Twitter</a>
							</div>
							<div class="special-heading line center">
								<h5 class="special-heading-inner mb-10">
									<span class="o-7"> or </span>
								</h5>
							</div>
							<form class="form" role="form" method="post" action="login"
								accept-charset="UTF-8" id="login-nav">
								<div class="form-group">
									<label class="sr-only" for="exampleInputEmail2">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail2" placeholder="Email address" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="exampleInputPassword2">Password</label>
									<input type="password" class="form-control"
										id="exampleInputPassword2" placeholder="Password" required>
									<div class="help-block text-right pt-10 fs-13">
										<a href="" class="read-more">Forget the password ?</a>
									</div>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">Sign
										in</button>
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
</body>
</html>