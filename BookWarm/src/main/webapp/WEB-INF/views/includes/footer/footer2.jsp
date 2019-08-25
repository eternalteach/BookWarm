<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ include file="./include-footer-front.jsp"%>
</head>
<body>
	<div class="wrapper">

		<!--Header-->
		<header id="header" class="header-no-min-height"
			data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 0, 'stickySetTop': '0', 'stickyChangeLogo': false}">
			<div class="header-body">
				<div class="header-container container">
					<div class="header-row">
						<div class="header-column">
							<div class="header-row">
								<div class="header-logo">
									<a href="index.html"> <img alt="Vertex" width="120"
										height="80" src="./resources/VertexEx/img/logo.png">
									</a>
								</div>
							</div>
						</div>
						<div class="header-column justify-content-end">
							<div class="header-row">
								<div class="header-nav header-nav-top-line">
									<div
										class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">

										<!-- 탑 메뉴 -->
										<%@ include file="./include-footer-top-nav.jsp"%>

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
		<!--End Header-->
		
		
		 <section class="section-primary main-color t-bordered">
          </section> 
          
		<!-- footer -->
		  <footer class="footer footer-2 footer-dark" id="footer-2">
            <div class="main">
               <div class="container">
                  <div class="row">
                     <div class="col-md-4 col-sm-6">
                        <section>
                           <img alt="Vertex" src="./resources/VertexEx/img/logo-white.png" height="150" class="mb-20">

                           <p>
                              Class aptent taciti sociosqu ad litora torquent <br /> per conubia nostra,
                              per inceptos himenaeos. Nulla <br /> nunc dui, tristique in semper vel,
                              congue sed ligula auctor torquent per conubia nostra.
                           </p>
                           <p>
                              <a href="blog-standard-post.html">Read More →</a>
                           </p>
                        </section>
                     </div>
                     <div class="col-md-2 col-sm-6">

                     </div>
                     <div class="col-md-3 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Locate Us</h4>
                           </div>
                           <div class="footer-contact-info">
                              <ul class="pl-none">
                                 <li>
                                    <p><i class="fa fa-building"></i>Your Company </p>
                                 </li>
                                 <li class="mb-20">
                                    <p><i class="fa fa-map-marker"></i>795 Folsom Ave, </p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-envelope"></i> <a href="mailto:mail@example.com">mail@example.com</a></p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-phone"></i>(123) 456-7890</p>
                                 </li>
                              </ul>
                           </div>

                        </section>
                     </div>
                     <div class="col-md-3 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">PROJECTS</h4>
                           </div>

                           <ul class="portfolio-grid four-columns">
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-6.jpg" alt="Desert Mini Planet">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-5.jpg" alt="SAAP">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-4.png" alt="Robot Chicken">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-3.jpg" alt="Tree">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-2.jpg" alt="Space Invaders">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-7.jpg" alt="Polar Ice">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-8.png" alt="Robot Chicken">
                                 </a>
                              </li>
                              <li>
                                 <a href="#" class="grid-image">
                                    <img src="./resources/VertexEx/img/thumbs/project-9.png" alt="Tree">
                                 </a>
                              </li>
                           </ul>
                        </section>
                     </div>
                  </div>
               </div>
            </div>

            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-sm-6">
                        <p class="mb-0">© 2015-2018 Vertex. All right reserved.</p>

                     </div>
                     <div class="col-sm-6">
                        <div class="clearfix pull-right">
                           <ul class="list-inline fs-13 mb-none">
                              <li><a href="pages-about.html">About</a></li>
                              <li><a href="blog-grid.html">Blog</a></li>
                              <li><a href="pages-contact.html">Contact</a></li>
                              <li><a href="#">Terms</a></li>
                              <li><a href="#">Jobs</a></li>
                           </ul>

                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </footer>
      </div>
</body>
</html>