﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>
<%@ include file="includes/header/header-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>

      <div class="page bordered">
         
         <div class="page-inner p-none">

            <section class="section-primary alternate-color">
               <div class="container">

                  <div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
                     <div class="row portfolio-list sort-destination" data-sort-id="portfolio">


                    <c:set value="\\" var="bslash"/>
                    <c:set value="/" var="slash"/>
						
					<c:forEach items="${openreview}" var="review" varStatus="status">
						<fmt:formatDate var="date" value="${review.review_modify_date}" pattern="yyyy. MM. dd"/>
                                
						<div class="col-lg-3 isotope-item websites">

                           <article class="v_blog-item v_blog-item-related v_blog-grid">
                              <div class="v_blog-item-inner">
                              
                               	 <c:if test="${!empty review.attachList}">
                                 <div class="v_blog-item-media">
                                    <a href="/warm/reviewSelectOne?review_no=${review.review_no}&isbn=${review.isbn}">
                                    
                                       <c:set var="uploadPath" value="${fn:replace(review.attachList[0].uploadPath,bslash,slash)}"/>
                                       <c:set var="uuid" value="${review.attachList[0].uuid}"/>
                                       <c:set var="fileName" value="${review.attachList[0].fileName}"/>
                                       <c:set var="attachM" value="${uploadPath}/${uuid}_${fileName}"/>
                                        
                                       <img class="w-100" src="/warm/display?fileName=${attachM}"/>
                                       
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

                                       <a href="/warm/reviewSelectOne?review_no=${review.review_no}&isbn=${review.isbn}" rel="bookmark">
                                          <h2 class="v_blog-item-title" itemprop="name headline" style="overflow:hidden; text-overflow:ellipsis">${review.review_title}</h2>
                                       </a>
                                    </div>
                                    <div itemprop="articleBody">
                                       <p style="overflow:hidden; display: -webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:10; line-height:1.8em; max-height:18em; margin-top:15px; margin-bottom:30px">
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


                    <!--  <div class="row">
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
                     </div> -->
                     
                  </div>
               </div>
            </section>
         </div>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<%@ include file="includes/footer/footer-1.jsp"%>
