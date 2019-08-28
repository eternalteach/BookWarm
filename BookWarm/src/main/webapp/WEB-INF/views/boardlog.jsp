<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-record.jsp"%>



<div class="page has-sidebar has-right-sidebar bordered">

	<div class="page-inner">

		<div class="container">
			<div class="row">
				<div class="col-md-3 left-side-sidebar pt-70">
					<aside class="sidebar">
						<!-- recode 삽입 -->
						<%@ include file="includes/record/record.jsp"%>
					</aside>
				</div>

				<div class="col-md-8 right-side-sidebar v_blog-medium pt-70">

					<article class="v_blog-item">
						<div class="v_blog-item-inner row">
							<div class="v_blog-item-media col-md-5">
								<a href="#"> <img src="img/blog/x5.jpg" />
								</a>
							</div>
							<div class="v_blog-item-content col-md-7">
								<div class="v_blog-item-header">
									<ul class="v_blog-item-meta">
										<li class="v_blog-item-author"><span>By </span> <a
											href="#">Vertex</a></li>
										<li class="v_blog-item-date"><time class=""
												datetime="2018-06-30T10:47:48+00:00"> June 30, 2018 </time>
										</li>
										<li class="v_blog-item-comments">No Comments</li>
										<li class="v_blog-item-like-counter"><span>22
												Likes</span></li>
									</ul>

									<a href="blog-post-standard-2.html" rel="bookmark">
										<h2 class="v_blog-item-title" itemprop="name headline">How
											to love what you do</h2>
									</a>
								</div>

								<div itemprop="articleBody">
									<p>Verterem repudiare no duo. Voluptua forensibus
										honestatis ad qui, vide atqui percipit id ius, congue qui id</p>
									<a class="v_blog-item-read-more" href="#"> <span>Read
											more</span>
									</a>
								</div>
							</div>
						</div>
					</article>

					<article class="v_blog-item">
						<div class="v_blog-item-inner row">
							<div class="v_blog-item-media col-md-5">
								<div class="fluid-width-video-wrapper"
									style="padding-top: 165px">
									<iframe itemprop="video" class=""
										src="https://player.vimeo.com/video/77770080" frameborder="0"
										title="dd" webkitallowfullscreen="" mozallowfullscreen=""
										allowfullscreen=""></iframe>
								</div>
							</div>
							<div class="v_blog-item-content col-md-7">
								<div class="v_blog-item-header">
									<ul class="v_blog-item-meta">
										<li class="v_blog-item-author"><span>By </span> <a
											href="#">Vertex</a></li>
										<li class="v_blog-item-date"><time class=""
												datetime="2018-06-30T10:47:48+00:00"> June 12, 2018 </time>
										</li>
										<li class="v_blog-item-comments">No Comments</li>
										<li class="v_blog-item-like-counter"><span>22
												Likes</span></li>
									</ul>

									<a href="blog-post-standard-2.html" rel="bookmark">
										<h2 class="v_blog-item-title" itemprop="name headline">This
											is a post with an Vimeo Video</h2>
									</a>
								</div>

								<div itemprop="articleBody">
									<p>Verterem repudiare no duo. Voluptua forensibus
										honestatis ad qui, vide atqui percipit id ius, congue qui.</p>
									<a class="v_blog-item-read-more" href="#"> <span>Read
											more</span>
									</a>
								</div>
							</div>
						</div>
					</article>

					<article class="v_blog-item">
						<div class="v_blog-item-inner row">
							<div class="v_blog-item-media col-md-5">
								<div class="carousel-wrap">
									<div class="owl-carousel owl-theme"
										data-plugin-options='{"items":1, "singleItem": true, "dots":false, "autoPlay": true}'>
										<div>
											<img alt="" class="img-responsive" src="img/blog/x8.jpg">
										</div>
										<div>
											<img alt="" class="img-responsive" src="img/blog/x2.jpg">
										</div>
									</div>
									<div class="customNavigation">
										<a class="prev"><i class="fa fa-angle-left"></i></a> <a
											class="next"><i class="fa fa-angle-right"></i></a>
									</div>
								</div>
							</div>
							<div class="v_blog-item-content col-md-7">
								<div class="v_blog-item-header">
									<ul class="v_blog-item-meta">
										<li class="v_blog-item-author"><span>By </span> <a
											href="#">Vertex</a></li>
										<li class="v_blog-item-date"><time class=""
												datetime="2018-06-30T10:47:48+00:00"> June 30, 2018 </time>
										</li>
										<li class="v_blog-item-comments">No Comments</li>
										<li class="v_blog-item-like-counter"><span>22
												Likes</span></li>
									</ul>

									<a href="blog-post-standard-2.html" rel="bookmark">
										<h2 class="v_blog-item-title" itemprop="name headline">This
											is a standard post with a images slider</h2>
									</a>
								</div>

								<div itemprop="articleBody">
									<p>Verterem repudiare no duo. Voluptua forensibus
										honestatis ad qui, vide atqui percipit id ius, congue id.</p>
									<a class="v_blog-item-read-more" href="#"> <span>Read
											more</span>
									</a>
								</div>
							</div>
						</div>
					</article>

					<article class="v_blog-item">
						<div class="v_blog-item-inner row">
							<div class="v_blog-item-media col-md-5">
								<video controls="controls" poster="img/blog/b21.jpg"
									class="w-100">
									<source
										src="http://www.html5videoplayer.net/videos/toystory.mp4"
										type="video/mp4">
									<source
										src="http://www.html5videoplayer.net/videos/toystory.ogv"
										type="video/ogg">
									<source
										src="http://www.html5videoplayer.net/videos/toystory.webm"
										type="video/webm">
								</video>
							</div>
							<div class="v_blog-item-content col-md-7">
								<div class="v_blog-item-header">
									<ul class="v_blog-item-meta">
										<li class="v_blog-item-author"><span>By </span> <a
											href="#">Vertex</a></li>
										<li class="v_blog-item-date"><time class=""
												datetime="2018-06-30T10:47:48+00:00"> June 30, 2017 </time>
										</li>
										<li class="v_blog-item-comments">No Comments</li>
										<li class="v_blog-item-like-counter"><span>22
												Likes</span></li>
									</ul>

									<a href="blog-post-standard-2.html" rel="bookmark">
										<h2 class="v_blog-item-title" itemprop="name headline">How
											to love what you do</h2>
									</a>
								</div>

								<div itemprop="articleBody">
									<p>Verterem repudiare no duo. Voluptua forensibus
										honestatis ad qui, vide atqui percipit id ius, congue id.</p>
									<a class="v_blog-item-read-more" href="#"> <span>Read
											more</span>
									</a>
								</div>
							</div>
						</div>
					</article>

					<article class="v_blog-item">
						<div class="v_blog-item-inner row">
							<div class="v_blog-item-media col-md-5">
								<a href="#"> <img src="img/blog/x3.jpg" />
								</a>
							</div>
							<div class="v_blog-item-content col-md-7">
								<div class="v_blog-item-header">
									<ul class="v_blog-item-meta">
										<li class="v_blog-item-author"><span>By </span> <a
											href="#">Vertex</a></li>
										<li class="v_blog-item-date"><time class=""
												datetime="2018-06-30T10:47:48+00:00"> June 14, 2018 </time>
										</li>
										<li class="v_blog-item-comments">No Comments</li>
										<li class="v_blog-item-like-counter"><span>22
												Likes</span></li>
									</ul>

									<a href="blog-post-standard-2.html" rel="bookmark">
										<h2 class="v_blog-item-title" itemprop="name headline">How
											to love what you do</h2>
									</a>
								</div>

								<div itemprop="articleBody">
									<p>Verterem repudiare no duo. Voluptua forensibus
										honestatis ad qui, vide atqui percipit id ius, congue id.</p>
									<a class="v_blog-item-read-more" href="#"> <span>Read
											more</span>
									</a>
								</div>
							</div>
						</div>
					</article>

					<div class="row">
						<div class="col-md-12">

							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>
