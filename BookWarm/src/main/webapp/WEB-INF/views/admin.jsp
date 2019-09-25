<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>

<div class="wrapper">
	<div class="page has-sidebar has-left-sidebar bordered">
		<div class="page-inner alternate-color">
			<div class="container">
				<div class="row">
					<div class="col-md-3 left-side-sidebar pt-70">
						<aside class="sidebar">
							<section class="sidebar-widget">
								<div class="heading">
									<h4 class="title">RECENT POST</h4>
								</div>
								<div class="sidebar-widget-inner">
									<div class="clearfix">
										<div class="spost clearfix">
											<div class="entry-image">
												<a href="#" class="nobg"><img class="img-circle" src="img/thumbs/project-3.jpg" alt=""></a>
											</div>
											<div class="entry-c">
												<div class="entry-title">
													<h4><a href="#">Lorem ipsum dolor sit amet, consectetur</a></h4>
												</div>
												<ul class="entry-meta">
													<li>10th July 2014</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</section>
						</aside>
					</div>
					<div class="col-md-9 right-side-sidebar pt-70">
						<ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
							<li class="nav-item active" data-option-value="*"><a class="nav-link" href="#">Show All</a></li>
							<li class="nav-item" data-option-value=".community"><a class="nav-link" href="#">Community Board</a></li>
							<li class="nav-item" data-option-value=".review"><a class="nav-link" href="#">Review</a></li>
						</ul>
						<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
							<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
								<div class="col-lg-4 isotope-item logos">
									<article class="v_blog-item v_blog-item-related v_blog-grid">
										<div class="v_blog-item-inner">
											<div class="v_blog-item-media">
												<a href="#"><img src="img/blog/x3.jpg" /></a>
											</div>
											<div class="v_blog-item-content">
												<div class="v_blog-item-header">
													<ul class="v_blog-item-meta">
														<li class="v_blog-item-date">
															<time class="" datetime="2018-06-30T10:47:48+00:00">
                                                   June 30, 2018
															</time>
														</li>
													</ul>
													<a href="blog-post-standard-2.html" rel="bookmark">
														<h2 class="v_blog-item-title" itemprop="name headline">How to love what you do</h2>
													</a>
												</div>
												<div itemprop="articleBody">
                                          <p>
                                             Many years ago, I worked for my parents who own a video production company.
                                          </p>
                                          <hr />
                                          <p class="v_blog-item-author">
                                             <a href="#">
                                                <img alt="" src="img/avatars/a1.jpeg">
                                                <span>by Jhon Dode</span>
                                             </a>
                                          </p>
                                       </div>
                                    </div>
                                 </div>
                              </article>
                           </div>
                          </div>
                        <div class="row">
                           <div class="col-md-12">

                              <hr class="invisible" />

                              <nav aria-label="Page navigation example">
                                 <ul class="pagination justify-content-center">
                                    <li class="page-item disabled">
                                       <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                       <a class="page-link" href="#">Next</a>
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
      </div>
   </div>

</body>
</html>