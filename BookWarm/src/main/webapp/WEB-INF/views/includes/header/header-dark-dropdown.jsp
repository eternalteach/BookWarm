<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="./include-header-front01.jsp"%>
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
										height="80" src="./resources/VertexEx/img/logo.png">
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
										<%@ include file="./include-header-top-nav.jsp"%>
										
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
					style="height: 120%; background-image: url(./resources/VertexEx/img/banner/b10.jpg);">
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

			<!-- insert context -->
			<!-- insert footer -->
		</div>
	</div>
