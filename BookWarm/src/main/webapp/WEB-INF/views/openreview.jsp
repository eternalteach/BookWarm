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


      <div class="page bordered">

         
         <div class="page-inner p-none">

            <section class="section-primary alternate-color">
               <div class="container">

                  <!-- <ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
                     <li class="nav-item active" data-option-value="*"><a class="nav-link" href="#">Show All</a></li>
                     <li class="nav-item" data-option-value=".websites"><a class="nav-link" href="#">Websites</a></li>
                     <li class="nav-item" data-option-value=".logos"><a class="nav-link" href="#">Logos</a></li>
                     <li class="nav-item" data-option-value=".brands"><a class="nav-link" href="#">Brands</a></li>
                     <li class="nav-item" data-option-value=".medias"><a class="nav-link" href="#">Medias</a></li>
                  </ul> -->

                  <div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
                     <div class="row portfolio-list sort-destination" data-sort-id="portfolio">

                        <div class="col-lg-3 isotope-item websites">

                           <article class="v_blog-item v_blog-item-related v_blog-grid v_blog_quate">
                              <div class="v_blog-item-inner">
                                 <div class="v_blog-item-media">
                                    <a href="#">
                                       <div class="v_blog-item-content">
                                          <div class="v_blog-item-content-inner">

                                             <div class="v_blog_quate-icon text-white mt-10">
                                                <i class="fa fa-quote fa-4x"></i>
                                             </div>

                                             <div class="v_blog-item-header">
                                                <ul class="v_blog-item-meta">
                                                   <li class="v_blog-item-date">
                                                      <time class="" datetime="2018-06-30T10:47:48+00:00">
                                                         June 30, 2018
                                                      </time>
                                                   </li>
                                                </ul>

                                                <a href="blog-post-standard-2.html" rel="bookmark">
                                                   <h2 class="v_blog-item-title text-white fs-30" itemprop="name headline">Quote Post Format</h2>
                                                </a>
                                             </div>

                                             <div class="text-white o-7" itemprop="articleBody">
                                                <p>
                                                   Many years ago, I worked for my parents who own a video production company.
                                                </p>
                                                <p class="v_blog-item-author">
                                                   <a href="#">
                                                      <img alt="" src="/warm/resources/Vertex/img/team/t1.png">
                                                      <span>by Jhon Dode</span>
                                                   </a>
                                                </p>
                                             </div>
                                          </div>
                                       </div>
                                       <img src="" />
                                    </a>
                                 </div>
                              </div>
                           </article>
                        </div>
						
						
					<c:forEach items="${openreview}" var="review" varStatus="status">
						<fmt:formatDate var="date" value="${review.review_modify_date}" pattern="yyyy. MM. dd"/>
                                
						<div class="col-lg-3 isotope-item websites">

                           <article class="v_blog-item v_blog-item-related v_blog-grid">
                              <div class="v_blog-item-inner">
                              
                               	 <c:if test="${!empty review.attachList}">
                                 <div class="v_blog-item-media">
                                    <a href="#">
                                       <%-- <c:set var="attach" value="${review.attachList[0].fileCallPath}"/> --%>
                                       <c:set var="uploadPath" value="${review.attachList[0].uploadPath}"/>
                                       <c:set var="uuid" value="${review.attachList[0].uuid}"/>
                                       <c:set var="fileName" value="${review.attachList[0].fileName}"/>
                                       <c:set var="attachM" value="${uploadPath}/${uuid}_${fileName}"/>
                                       ${attachM}
                                       
                                       <!-- var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName) -->
                                       <img class="w-100" src="/warm/display?fileName=<%=java.net.URLEncoder.encode("${attachM}", "utf-8")%>" />
                                       
                                       <%--  "<img src='/warm/display?fileName=${attach}'>" --%>
                                    </a>
                                 </div>
                                 </c:if>
                                 
                                 <div class="v_blog-item-content">
                                    <div class="v_blog-item-header">
                                       <ul class="v_blog-item-meta">
                                          <li class="v_blog-item-date">
                                             <time class="" datetime="2018-06-30T10:47:48+00:00">
                                                ${date}
                                             </time>
                                          </li>
                                       </ul>

                                       <a href="blog-post-standard-2.html" rel="bookmark">
                                          <h2 class="v_blog-item-title" itemprop="name headline">${review.review_title}</h2>
                                       </a>
                                    </div>
                                    <div itemprop="articleBody">
                                       <p>
                                          ${review.review_content}
                                       </p>
                                       <hr />
                                       <p class="v_blog-item-author">
                                          <a href="#">
                                          	 <!-- 임시로 다섯 개의 아바타 이미지를 돌려 쓰도록 함 -->
                                          	 <c:set var="index" value="${status.index%5+1}"/>
                                             <img alt="" src="/warm/resources/Vertex/img/team/t${index}.png">
                                             <span>by ${review.user_id}</span>
                                          </a>
                                       </p>
                                    </div>
                                 </div>
                              </div>
                           </article>
                        </div>
					</c:forEach>	
                        <div class="col-lg-3 isotope-item websites">

                           <article class="v_blog-item v_blog-item-related v_blog-grid">
                              <div class="v_blog-item-inner">
                                 <div class="v_blog-item-media">
                                    <a href="#">
                                       <img class="w-100" src="" />
                                    </a>
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
                                          <h2 class="v_blog-item-title" itemprop="name headline">Real time design tools</h2>
                                       </a>
                                    </div>
                                    <div itemprop="articleBody">
                                       <p>
                                          Many years ago, I worked for my parents who own a video production company.
                                       </p>
                                       <hr />
                                       <p class="v_blog-item-author">
                                          <a href="#">
                                             <img alt="" src="/warm/resources/Vertex/img/team/t1.png">
                                             <span>by Jhon Dode</span>
                                          </a>
                                       </p>
                                    </div>
                                 </div>
                              </div>
                           </article>
                        </div>

                        <div class="col-lg-3 isotope-item brands">
                           <article class="v_blog-item v_blog-item-related v_blog-grid">
                              <div class="v_blog-item-inner">
                                 <div class="v_blog-item-media">
                                    <div class="carousel-wrap">
                                       <div class="owl-carousel owl-theme" data-plugin-options='{"items":1, "singleItem": true, "dots":false, "autoPlay": true}'>
                                          <div>
                                             <img alt="" class="img-responsive" src="">
                                          </div>
                                          <div>
                                             <img alt="" class="img-responsive" src="">
                                          </div>
                                       </div>
                                       <div class="customNavigation">
                                          <a class="prev"><i class="fa fa-angle-left"></i></a>
                                          <a class="next"><i class="fa fa-angle-right"></i></a>
                                       </div>
                                    </div>
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
                                          <h2 class="v_blog-item-title" itemprop="name headline">This is a standard post with a images slider</h2>
                                       </a>
                                    </div>

                                    <div itemprop="articleBody">
                                       <p>
                                          Many years ago, I worked for my parents who own a video production company.
                                       </p>
                                       <hr />
                                       <p class="v_blog-item-author">
                                          <a href="#">
                                             <img alt="" src="/warm/resources/Vertex/img/team/t1.png">
                                             <span>by Jhon Dode</span>
                                          </a>
                                       </p>
                                    </div>
                                 </div>
                              </div>
                           </article>
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
            </section>
         </div>



<script>

// 여기서 가져와야 하는 첨부파일은, 뿌려지는 

//첨부파일 가져오기 위한 즉시 실행 함수
/* (function() {
	var review_no = '<c:out value="${review.review_no}"/>';
	$.getJSON("/warm/getAttachList", {review_no: review_no}, function(arr) {
		
				var uploadImgs = $(".uploadResult");
				var str = uploadImgs.html() + "";
				
				$(arr).each(function(i, attach) {
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
					str += "<li data-path = '" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "'><a>";
					str += "<img src='/warm/display?fileName=" + fileCallPath + "'>";
					str += "</a>";
					str += "</li>";
				});
				
				uploadImgs.html(str); 
				
	}); // end getJSON
})(); // end function */

</script>



<%@ include file="includes/footer/footer-1.jsp"%>
