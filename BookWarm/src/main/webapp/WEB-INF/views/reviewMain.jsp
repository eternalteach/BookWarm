<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./includes/header/header-dark-dropdown.jsp"%>


      <div class="page has-sidebar has-right-sidebar bordered">

         <section class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll loaded dzsprx-readyall b-bordered bg-overlay--gradient-dark">

            <div class="divimage dzsparallaxer--target w-100" style="height: 120%; background-image: url(./resources/VertexEx/img/main/slide-01.jpg);">
            </div>

            <div class="container pt-200 pb-120 text-center text-white z-index-1">
               <div class="row">

                  <div class="col-md-12">
                     <h2 class="fs-40 fw-7 mb-15">
                        Blog Left Sidebar
                     </h2>
                     <p class="section-sub-title">Build stunning fluid layout of news and sidebars</p>
                  </div>
               </div>
            </div>
         </section>

         <div class="page-inner">

            <div class="container">
               <div class="row">
					
				<!-- 감상 메인 페이지에서 사이드바 안 쓸 듯 -->
                  <!-- <div class="col-md-3 left-side-sidebar pt-70">

                     <aside class="sidebar">
						<section></section>                        
                     </aside>
                  </div> -->

                  <div class="col-md-12 v_blog-medium pt-70">


				<!-- 블로그에 글 넣기 시도 -->
				<!-- 책별 데이터 불러오고 그 중 가장 최근 데이터 하나만 불러오기. -->
				
				<c:forEach items="${list}" var="vo">
				
				<div class="post-content no-thumb clearfix">
				    <article class="v_blog-item">
                        <div class="v_blog-item-inner row">
                        
                           <!-- 여기가 이미지 들어가는 부분 -->
                           <div class="v_blog-item-media col-md-2">
                              <a href="/warm/reviewPerBook?user_id=${vo.user_id}&isbn=${vo.isbn}">
                                 <img class="w-100" src="${vo.book_img}"/>
                              </a>
                           </div>
                           
                           <!-- 최근 작성한 리뷰가 들어가는 부분 -->
                           <div class="v_blog-item-content col-md-7">
                           
                              <div class="v_blog-item-header">
                                 <ul class="v_blog-item-meta">
                                    <%-- <li class="v_blog-item-author">
                                       <span>By </span> <a href="#">${vo.user_id}</a>
                                    </li> --%>
                                    <li class="v_blog-item-date">
                                       <time class="" datetime="2018-06-30T10:47:48+00:00">
                                          최근 감상 작성일 ${vo.review_modify_date}
                                       </time>
                                    </li>
                                    <li class="v_blog-item-counter"><span>작성한 감상 n개</span></li>
                                 </ul>

                                 <a href="./resources/VertexEx/blog-post-standard.html" rel="bookmark">
                                    <h2 class="v_blog-item-title" itemprop="name headline"><%-- ${vo.review_title} --%></h2>
                                 </a>
                              </div>
	
                              <div itemprop="articleBody">
                                 <p>
                                 	${vo.review_content}
                                 </p>
                                 <a class="v_blog-item-read-more" href="#">
                                    <span>Reviews about this book</span>
                                 </a>
                              </div>
                              
                           </div>
                           
                        </div>
                     </article>
				</div>                     
				</c:forEach>


                    <!--  <article class="v_blog-item">
                        <div class="v_blog-item-inner row">
                           <div class="v_blog-item-media col-md-5">
                              <a href="#">
                                 <img src="./resources/VertexEx/img/blog/x3.jpg" />
                              </a>
                           </div>
                           <div class="v_blog-item-content col-md-7">
                              <div class="v_blog-item-header">
                                 <ul class="v_blog-item-meta">
                                    <li class="v_blog-item-author">
                                       <span>By </span> <a href="#">Vertex</a>
                                    </li>
                                    <li class="v_blog-item-date">
                                       <time class="" datetime="2018-06-30T10:47:48+00:00">
                                          June 14, 2018
                                       </time>
                                    </li>
                                    <li class="v_blog-item-comments">No Comments</li>
                                    <li class="v_blog-item-like-counter"><span>22 Likes</span></li>
                                 </ul>

                                 <a href="./resources/VertexEx/blog-post-standard-2.html" rel="bookmark">
                                    <h2 class="v_blog-item-title" itemprop="name headline">How to love what you do</h2>
                                 </a>
                              </div>

                              <div itemprop="articleBody">
                                 <p>
                                    Verterem repudiare no duo. Voluptua forensibus honestatis ad qui, vide atqui percipit id ius,
                                    congue id.
                                 </p>
                                 <a class="v_blog-item-read-more" href="#">
                                    <span>Read more</span>
                                 </a>
                              </div>
                           </div>
                        </div>
                     </article> -->

                     <div class="row">
                        <div class="col-md-12">

                           <nav aria-label="Page navigation example">
                              <ul class="pagination">
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

         <footer class="footer footer-2 footer-dark" id="footer-2">
            <div class="main">
               <div class="container">
                  <div class="row">
                     <div class="col-md-4 col-sm-6">
                        <section>
                           <img alt="Vertex" src="./resources/VertexEx/img/logo-white.png" height="150" class="mb-20">

                           <p class="mb-25">
                              Class aptent taciti sociosqu ad litora torquent <br /> per conubia nostra,
                              per inceptos himenaeos. Nulla <br /> nunc dui, tristique in semper vel,
                              congue sed ligula auctor torquent per conubia nostra.
                           </p>
                           <p class="fs-11 fw-6 text-uppercase">
                              <a href="./resources/VertexEx/blog-standard-post.html">Read More →</a>
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
                              <li><a href="./resources/VertexEx/pages-about.html">About</a></li>
                              <li><a href="./resources/VertexEx/blog-grid.html">Blog</a></li>
                              <li><a href="./resources/VertexEx/pages-contact.html">Contact</a></li>
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
   </div>


<%-- <%@ include file="./includes/footer/footer-2.jsp"%> --%>

</body>
</html>