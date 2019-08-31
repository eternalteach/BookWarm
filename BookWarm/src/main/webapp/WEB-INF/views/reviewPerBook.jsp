<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="./includes/header/header-from-vertex.jsp" %>
    


    
    <div role="main" class="main">

        <section class="page-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                        <span class="tob-sub-title text-color-primary d-block">OUR FEATURES</span>
                        <h1>Blog Standard</h1>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="col-md-4">
                        <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="./resources/Vertex/index.html">Home</a></li>
                            <li><a href="./resources/Vertex/index.html">blog</a></li>
                            <li class="active">Blog Standard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <div class="v-page-wrap has-left-sidebar has-one-sidebar">
            <div class="container">
                <div class="row">

                    

                    <aside class="sidebar left-sidebar col-sm-3">
                    
                    	<!-- 사이드바에 해당 책 이미지와 책 제목+작가 띄워보기. -->
                    	
                    	<section>
                            <div>
                                <ul>
                                    <li><a href="#">
                                			<img src="${thumbnail.img_src}">
                            			</a>
                            		</li>
                                    <li>${thumbnail.book_title}</li>
                                    <li>${thumbnail.writer_name}</li>
                                </ul>
                            </div>
                            
                    	</section>
                    
                    
                    
                        <section class="widget v-search-widget clearfix">
                            <form role="search" method="get" id="searchform" class="searchform" action="#">
                                <div class="form-group">
                                    <input class="form-control" type="text" value="" name="s" id="s" placeholder="Search" />
                                </div>
                            </form>
                        </section>
                        
                        
                        <section class="widget v-category-widget clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>Categories</span></h4>
                            </div>
                            <ul>
                                <li><a href="./resources/Vertex/blog-standard-post.html" title="View all posts">Web Design</a> </li>
                                <li><a href="./resources/Vertex/blog-standard-post.html" title="View all posts">Bootstrap</a> </li>
                                <li><a href="./resources/Vertex/blog-standard-post.html" title="View all posts">Business</a> </li>
                                <li><a href="./resources/Vertex/blog-standard-post.html" title="View all posts">JQuery</a> </li>
                                <li><a href="./resources/Vertex/blog-standard-post.html" title="View all posts">Gaming</a> </li>
                                <li><a href="./resources/Vertex/blog-standard-post.html" title="View all posts">Photography</a> </li>
                            </ul>
                        </section>
                        <section class="widget v-recent-entry-widget clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>Recent Posts</span></h4>
                            </div>
                            <ul>
                                <li>
                                    <a href="./resources/Vertex/blog-standard-post.html">Amazing Standard Post</a>
                                    <span class="post-date">March 12, 2018</span>
                                </li>
                                <li>
                                    <a href="./resources/Vertex/blog-full-width-post.html">Full Width Media Post</a>
                                    <span class="post-date">September 25, 2018</span>
                                </li>
                                <li>
                                    <a href="./resources/Vertex/blog-video-post.html">Perfect Video Post</a>
                                    <span class="post-date">November 19, 2014</span>
                                </li>
                                <li>
                                    <a href="./resources/Vertex/blog-slideshow-post.html">Amazing Slideshow post</a>
                                    <span class="post-date">November 21, 2018</span>
                                </li>
                                <li>
                                    <a href="./resources/Vertex/blog-standard-post.html">Text-only Post</a>
                                    <span class="post-date">March 23, 2018</span>
                                </li>
                            </ul>
                        </section>

                        <section class="widget widget_sf_recent_custom_comments clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>Recent Comments</span></h4>
                            </div>
                            <ul class="recent-comments-list">

                                <li class="comment">
                                    <div class="comment-wrap clearfix">
                                        <div class="comment-avatar">
                                            <img src="./resources/Vertex/img/team/t3.png" class="avatar" height="100" width="100" />
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-body">
                                                <a href="./resources/Vertex/blog-standard-post.html#comments">
                                                    <p>Praesent eros mauris dolor</p>
                                                </a>
                                            </div>
                                            <div class="comment-meta">
                                                <span class="comment-author">Vertex</span> <span class="comment-date">20 hours ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="comment">
                                    <div class="comment-wrap clearfix">
                                        <div class="comment-avatar">
                                            <img src="./resources/Vertex/img/team/t1.png" class="avatar" height="100" width="100" />
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-body">
                                                <a href="./resources/Vertex/blog-standard-post.html#comments">
                                                    <p>Omnis iste natus error sit dolor </p>
                                                </a>
                                            </div>
                                            <div class="comment-meta">
                                                <span class="comment-author">Guest</span> <span class="comment-date">5 hours ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="comment">
                                    <div class="comment-wrap clearfix">
                                        <div class="comment-avatar">
                                            <img src="./resources/Vertex/img/team/t4.png" class="avatar" height="100" width="100" />
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-body">
                                                <a href="./resources/Vertex/blog-standard-post.html#comments">
                                                    <p>Sed tellus ante aliquam eget</p>
                                                </a>
                                            </div>
                                            <div class="comment-meta">
                                                <span class="comment-author">Admin</span> <span class="comment-date">2 days ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </section>

                        <section class="widget v-tag-cloud-widget clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>Tags</span></h4>
                            </div>
                            <div class="tagcloud">
                                <ul class='wp-tag-cloud'>
                                    <li><a href="#">CSS 3</a></li>
                                    <li><a href="#">HTML 5</a></li>
                                    <li><a href="#">Lifestyle</a></li>
                                    <li><a href="#">Mobile</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">PHP</a></li>
                                    <li><a href="#">Social</a></li>
                                    <li><a href="#">video</a></li>
                                    <li><a href="#">WordPress</a></li>
                                </ul>
                            </div>
                        </section>
                    </aside>
					<div class="col-sm-9 v-blog-wrap">

                        <div class="v-blog-items-wrap blog-standard">

                            <ul class="v-blog-items row standard-items clearfix">
                            
                            <!-- 감상 작성 버튼 추가 -->
                            <li class="v-blog-item col-sm-12">
                            <button class="btn btn-outline-secondary">
                            	<a href="/warm/reviewWrite<%-- ?isbn=${isbn} --%>">
		                            
		                            	<span class="text ls-1">
		                            		Write Review
			                                <i class="icon icon-pen-3"></i>
		                            	</span>
		                            
                            	</a>
                            </button>
                            </li>
                            
                            
                            <!-- 8/28 책별 감상 뿌리기 -->
                            <c:forEach items="${list}" var="vo">
                            
	                        <!-- 8/29 날짜 형식 변환: 달을 영어로 출력하기 위해 언어 변경, format을 필요 데이터만 필요한 형태로 변환 -->    
	                        <fmt:setLocale value="en_US" scope="session"/>
                            <fmt:formatDate var="fmt_date" value="${vo.review_modify_date}" pattern="ddMMM"/>
                            <!-- 		작성일 혹은 수정일을 쪼개서 형식에 맞게 넣기 위한 c태그 추가 -->
                            <c:set var="tmp_date" value="${fmt_date}"/>
                            
								<li class="v-blog-item col-sm-12">

                                    <div class="post-content no-thumb clearfix">

                                        <div class="v-post-date pull-left">
                                            <span class="day">${fn:substring(tmp_date,0,2)}</span> <!-- 가져온 날짜 중 일에 해당하는 숫자 -->
                                            <span class="month">${fn:substring(tmp_date,2,5)}</span>
                                            <div class="like-holder like-button"><i class="fa fa-heart"></i>18</div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
                                                <h2 class="title"><a href="#">${vo.review_title}</a></h2>

                                                <div class="post-meta-info">
                                                    <span class="blog-author minor-meta">
                                                        Posted by
                                                        <span class="entry-author-link">
                                                            <span class="vcard author">
                                                                <span class="v-blog-item-details">
                                                                    <a href="#" title="Posts by HB-Themes" rel="author">${vo.user_id}</a>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="text-sep">|</span>

                                                    <span class="blog-categories minor-meta">
                                                        <a href="#">News</a>, <a href="#">Updates</a> <span class="text-sep">|</span>

                                                        <span class="comment-container minor-meta">
                                                            <a href="./resources/Vertex/blog-standard-post.html#comment-area" class="comments-link">3 comments </a>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p>
                                                    ${vo.review_content}
                                                </p>
                                            </div>
                                            <a class="btn v-btn standard white sf-icon-stroke" style="float:right" "href="/warm/reviewSelectOne?review_no=${vo.review_no}&isbn=${vo.isbn}">
                                                <i class="icon-arrow-32"></i><span class="text">Read more</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                
							</c:forEach>                                



                                
                                <li class="v-blog-item col-sm-12">
                                
                                    <figure class="animated-overlay overlay-alt">
                                        <div class="flexslider thumb-slider">
                                            <ul class="slides">
                                                <li>
                                                    <a href="./resources/Vertex/blog-slideshow-post.html" class="link-to-post">
                                                        <img src='./resources/Vertex/img/blog/b-fw-5.jpg' />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="./resources/Vertex/blog-slideshow-post.html" class="link-to-post">
                                                        <img src='./resources/Vertex/img/blog/b-fw-4.jpg' />
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </figure>
                                    
                                    
                                    <div class="post-content">

                                        <div class="v-post-date pull-left">
                                            <span class="day">17</span>
                                            <span class="month">Mar</span>
                                            <div class="like-holder like-button"><i class="fa fa-heart"></i>18</div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
                                                <h2 class="title"><a href="./resources/Vertex/blog-slideshow-post.html">How to Boost Your Business Email Writing Skills</a></h2>

                                                <div class="post-meta-info">
                                                    <span class="blog-author minor-meta">
                                                        Posted by
                                                        <span class="entry-author-link">
                                                            <span class="vcard author">
                                                                <span class="v-blog-item-details">
                                                                    <a href="#" title="Posts by HB-Themes" rel="author">Vertex</a>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="text-sep">|</span>

                                                    <span class="blog-categories minor-meta">
                                                        <a href="#">News</a>, <a href="#">Updates</a> <span class="text-sep">|</span>

                                                        <span class="comment-container minor-meta">
                                                            <a href="./resources/Vertex/blog-slideshow-post.html#comment-area" class="comments-link">3 comments </a>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa quis mauris sollicitudin
                                                    commodo venenatis ligula commodo. Sed blandit convallis dignissim. Pellentesque pharetra velit eu velit
                                                    elementum et convallis erat vulputate. Sed in nulla ut elit mollis posuere. Praesent a felis accumsan
                                                    neque interdum molestie…
                                                </p>
                                            </div>
                                            <a class="btn v-btn standard white sf-icon-stroke" href="./resources/Vertex/blog-full-width-post-2.html">
                                                <i class="icon-arrow-32"></i><span class="text">Read more</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>

                                <li class="v-blog-item col-sm-12">

                                    <figure class="animated-overlay overlay-alt">
                                        <img src="./resources/Vertex/img/blog/b-fw-1.jpg" />
                                        <a href="./resources/Vertex/blog-standard-post.html" class="link-to-post"></a>
                                        <figcaption>
                                            <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right"></i></div>
                                        </figcaption>
                                    </figure>

                                    <div class="post-content">

                                        <div class="v-post-date pull-left">
                                            <span class="day">15</span>
                                            <span class="month">Mar</span>
                                            <div class="like-holder like-button"><i class="fa fa-heart"></i>25</div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
                                                <h2 class="title"><a href="./resources/Vertex/blog-standard-post.html">Scaling Your eCommerce Business? Read This First</a></h2>

                                                <div class="post-meta-info">
                                                    <span class="blog-author minor-meta">
                                                        Posted by
                                                        <span class="entry-author-link">
                                                            <span class="vcard author">
                                                                <span class="v-blog-item-details">
                                                                    <a href="#" title="Posts by HB-Themes" rel="author">Vertex</a>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="text-sep">|</span>

                                                    <span class="blog-categories minor-meta">
                                                        <a href="#">News</a>, <a href="#">Industry</a> <span class="text-sep">|</span>

                                                        <span class="comment-container minor-meta">
                                                            <a href="./resources/Vertex/blog-standard-post.html#comment-area" class="comments-link">3 comments </a>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa quis mauris sollicitudin
                                                    commodo venenatis ligula commodo. Sed blandit convallis dignissim. Pellentesque pharetra velit eu velit
                                                    elementum et convallis erat vulputate. Sed in nulla ut elit mollis posuere. Praesent a felis accumsan
                                                    neque interdum molestie…
                                                </p>
                                            </div>
                                            <a class="btn v-btn standard white sf-icon-stroke" href="./resources/Vertex/blog-full-width-post-2.html">
                                                <i class="icon-arrow-32"></i><span class="text">Read more</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>

                                <li class="v-blog-item col-sm-12">
                                    <figure class="animated-overlay overlay-alt">
                                        <img src="./resources/Vertex/img/blog/b-fw-2.jpg" />
                                        <a href="./resources/Vertex/blog-full-width-post.html" class="link-to-post"></a>
                                        <figcaption>
                                            <div class="thumb-info thumb-info-v2"><i class="fa fa-angle-right"></i></div>
                                        </figcaption>
                                    </figure>

                                    <div class="post-content">

                                        <div class="v-post-date pull-left">
                                            <span class="day">18</span>
                                            <span class="month">Jun</span>
                                            <div class="like-holder like-button"><i class="fa fa-heart"></i>12</div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
                                                <h2 class="title"><a href="#">Optimizing Your Affiliate Content for Search in 2018</a></h2>

                                                <div class="post-meta-info">
                                                    <span class="blog-author minor-meta">
                                                        Posted by
                                                        <span class="entry-author-link">
                                                            <span class="vcard author">
                                                                <span class="v-blog-item-details">
                                                                    <a href="#" title="Posts by HB-Themes" rel="author">Vertex</a>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="text-sep">|</span>

                                                    <span class="blog-categories minor-meta">
                                                        <a href="#">News</a>, <a href="#">Updates</a> <span class="text-sep">|</span>

                                                        <span class="comment-container minor-meta">
                                                            <a href="./resources/Vertex/blog-standard-post.html#comment-area" class="comments-link">8 comments </a>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa quis mauris sollicitudin
                                                    commodo venenatis ligula commodo. Sed blandit convallis dignissim. Pellentesque pharetra velit eu velit
                                                    elementum et convallis erat vulputate. Sed in nulla ut elit mollis posuere. Praesent a felis accumsan
                                                    neque interdum molestie…
                                                </p>
                                            </div>
                                            <a class="btn v-btn standard white sf-icon-stroke" href="./resources/Vertex/blog-full-width-post-2.html">
                                                <i class="icon-arrow-32"></i><span class="text">Read more</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>

                                <li class="v-blog-item col-sm-12">

                                    <div class="post-content no-thumb clearfix">

                                        <div class="v-post-date pull-left">
                                            <span class="day">12</span>
                                            <span class="month">Mar</span>
                                            <div class="like-holder like-button"><i class="fa fa-heart"></i>18</div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
                                                <h2 class="title"><a href="#">Text-Only Post</a></h2>

                                                <div class="post-meta-info">
                                                    <span class="blog-author minor-meta">
                                                        Posted by
                                                        <span class="entry-author-link">
                                                            <span class="vcard author">
                                                                <span class="v-blog-item-details">
                                                                    <a href="#" title="Posts by HB-Themes" rel="author">Vertex</a>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="text-sep">|</span>

                                                    <span class="blog-categories minor-meta">
                                                        <a href="#">News</a>, <a href="#">Updates</a> <span class="text-sep">|</span>

                                                        <span class="comment-container minor-meta">
                                                            <a href="./resources/Vertex/blog-standard-post.html#comment-area" class="comments-link">3 comments </a>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa quis mauris sollicitudin
                                                    commodo venenatis ligula commodo. Sed blandit convallis dignissim. Pellentesque pharetra velit eu velit
                                                    elementum et convallis erat vulputate. Sed in nulla ut elit mollis posuere. Praesent a felis accumsan
                                                    neque interdum molestie…
                                                </p>
                                            </div>
                                            <a class="btn v-btn standard white sf-icon-stroke" href="./resources/Vertex/blog-full-width-post-2.html">
                                                <i class="icon-arrow-32"></i><span class="text">Read more</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="page-item disabled">
                                        <span class="page-link">Previous</span>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item active">
                                        <span class="page-link">
                                            2
                                            <span class="sr-only">(current)</span>
                                        </span>
                                    </li>
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

<%@ include file="./includes/footer/footer-6 from Vertex.jsp" %>
    </div>

    <script src="./resources/Vertex/plugins/aos/aos.js"></script>
    <script src="./resources/Vertex/js/theme-core.js"></script>
</body>
</html>