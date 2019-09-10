<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 <%@ include file="./includes/header/header-from-vertex.jsp" %>
 
 
 	<script>
 		
 		/* $("#review_open").attr("checked", "$(review.review_open)"); */
 		
 	</script>
 
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
                    
                    </aside>
                    
                    
					<div class="col-sm-9 v-blog-wrap">

                        <div class="v-blog-items-wrap blog-standard">

                            <ul class="v-blog-items row standard-items clearfix">
                            	
                            	
                            	<li>
                        
                            		<!-- 작성 페이지. -->
                            		<form id="operForm" action="modify">
										<input type="hidden" name="user_id" value="${review.user_id}">
										<input type="hidden" name="isbn" value="${review.isbn}">
                            			<input type="hidden" name="review_no" value="${review.review_no}">
                            			<input type="hidden" name="pageNum" value="${cri.pageNum}">
                            			<input type="hidden" name="amount" value="${cri.amount}">
										<!-- 작성 시간과 수정 시간은 알아서 데이터 입력시에 들어가니 여기엔 필요 없음 -->

                            			<table>
                            				<tr>
                            					<td>제목</td>
                            					<td><input type="text" name="review_title" value="${review.review_title}"></td>
                            				</tr>
                            				<tr>
                            					<td>관련 페이지</td>
                            					<td><input type="number" name="review_ref" value="${review.review_ref}"></td>
                            				</tr>
                            				<tr>
                            					<td>공개여부</td>
                            					<td><input type="checkbox" name="review_open" id="review_open" ${review.review_open}></td>
                            				</tr>
                            				<tr>
                            					<td>내용</td>
                            					<td><textarea name="review_content" cols="80" rows="10">${review.review_content}</textarea></td>
                            				</tr>
                            				<tr>
                            					<td></td>
                            					<td>
	                            					<button class="btn btn-outline-secondary" data-oper='modify' >
								                      	<span class="text ls-1">
						                            		수정하기
							                                <i class="icon icon-pen-3"></i>
						                            	</span>    
								                    </button>
								                    <button class="btn btn-outline-secondary" data-oper='list' >
								                      	<span class="text ls-1">
						                            		돌아가기
							                                <i class="icon icon-pen-3"></i>
						                            	</span>    
								                    </button>
								                    
					                            </td>
                            				</tr>
                            			</table>
										                    		
                            		</form>
                            	</li>
                            
                            
                            </ul>

                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Footer-Wrap-->
        <div class="footer-wrap">
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <section class="widget">
                                <img alt="Vertex" src="./resources/Vertex/img/logo-white.png" style="height: 40px; margin-bottom: 20px;">
                                <p class="pull-bottom-small">
                                    Donec quam felis, ultricies nec, pellen tesqueeu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel aliquet nec, vulputate eget aliquet nec, arcu.
                                </p>
                                <p>
                                    <a href="./resources/Vertex/page-about-us-2.html">Read More →</a>
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
                                            <a href="#" target="_blank">@Vertex</a>
                                            Lorem ipsum dolor sit amet, consec adipiscing elit onvallis dignissim.
                                        </div>
                                        <div class="twitter_intents">
                                            <a class="timestamp" href="#" target="_blank">3 hours ago</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="tweet-text">
                                            <a href="#" target="_blank">@Vertex</a>
                                            Sed blandit conval dignissim. pharetra velit eu velit et erat pharetra.
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
                                    <li>
                                        <a href="./resources/Vertex/blog-standard-post.html">Amazing Standard Post</a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/blog-full-width-post.html">Full Width Media Post</a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/blog-video-post.html">Perfect Video Post</a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/blog-slideshow-post.html">Amazing Slideshow post</a>
                                    </li>
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
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-1.jpg" />
                                            <span class="tooltip">Phasellus enim libero<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-2.jpg" />
                                            <span class="tooltip">Phasellus enim libero<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-3.jpg" />
                                            <span class="tooltip">Phasellus enim<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-4.png" />
                                            <span class="tooltip">Lorem Imput<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-5.jpg" />
                                            <span class="tooltip">Phasellus Enim libero<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-6.jpg" />
                                            <span class="tooltip">Phasellus Enim<span class="arrow"></span></span>
                                        </a>
                                    </li>
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
                        <a href="#" class="social-icon si-borderless si-facebook mb-0" title="Facebook">
                            <i class="si-icon-facebook"></i>
                            <i class="si-icon-facebook"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-twitter mb-0" title="Twitter">
                            <i class="si-icon-twitter"></i>
                            <i class="si-icon-twitter"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-instagram mb-0" title="Instagram">
                            <i class="si-icon-instagram"></i>
                            <i class="si-icon-instagram"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-vk mb-0" title="Vk">
                            <i class="si-icon-vk"></i>
                            <i class="si-icon-vk"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--End Footer-Wrap-->
    </div>
    
    
    <script type="text/javascript">
	
    $(document).ready(function() {
    	
    	var operForm = $("#operForm");
		
		$('button').on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			console.log(operation);
        										  
			if(operation === 'list') {
			// "목록으로"
			// -> 요청할 주소 : reviewPerBook
			// -> 넘겨야 하는 정보 : user_id, review_no, isbn(해당 게시물을 다시 조회하기 위함)
			//							Criteria(pageNum, amount) (들어올 때의 페이지로 돌아가기 위함)
			//							isbn(reviewPerBook 페이지에서 책 리뷰를 다시 조회하기 위함)
				
				operForm.attr("action", "reviewSelectOne");
			
				/* var user_id = $("input[name='user_id']").clone();
				var review_no = $("input[name='review_no']").clone();
				var isbn = $("input[name='isbn']").clone();
				var pageNum = $("input[name='pageNum']").clone();
				var amount = $("input[name='amount']").clone();
				
				operForm.empty();
				
				operForm.append(userid);
				operForm.append(review);
				operForm.append(isbn);
				operForm.append(pageNum);
				operForm.append(amount); */
			}
			// "수정하기"
			// -> 요청할 주소 : modify
			// -> 넘겨야 하는 정보 : user_id, review_no, user_
			//							Criteria(pageNum, amount) (들어올 때의 페이지로 돌아가기 위함)
			operForm.submit();
			
			
		});
    });
    
    </script>


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
</body>
</html>