<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<div role="main" class="main">
    <section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-top:20px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
        <div class="container">
			<div class="row align-items-center">
				<div class="col-sm">
                     <ol class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                        <li>내 정보</li>
                     </ol>
                  </div>
			</div>
		</div>
    </section>

    <div class="v-page-wrap has-right-sidebar has-one-sidebar">
        <div class="container">
            <div class="row">
                    <div class="row col-sm-9">
                        <div class="author-info-wrap clearfix col-sm-12" style="margin-top: 0px;">
                            <div class="author-avatar">
                                <!-- <img src="img/avatar.png" class="avatar photo" /> -->
                                <i class="fa fa-user-circle fa-5x" aria-hidde="true"></i>
                            </div>
                            <div class="author-bio">
                                <div class="author-name">
                                    <h3>${user_id}님 (level : ${user_level})</h3>
                                </div>
                                <div class="author-bio-text">
                                    <p><a href="/warm/customLogout"><button type="button" class="btn v-btn standard lightgrey standard">로그아웃</button></a></p>
                                </div>
                            </div>
                            <div class="author-bio">
                                <div class="author-name">
                                    <h3>포인트 : ${point}원</h3>
                                </div>
                            </div>
                            <div class="author-bio">
                                <div class="author-name">
                                    <h3>쿠폰 : <a href="javascript:pickCoupon()" id="pickCoupon">${couponCnt}개</a></h3>
                                </div>
                                <div class="author-bio-text">
                                    <p><a href="javascript:enrollCouponNo()" id="setCoupon">쿠폰등록</a></p>
                                    <p id="setMsg" style="color:red">${msg}</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="v-spacer col-sm-12 v-height-standard"></div>
                        
                        <div class="col-sm">
							<div class="v-heading-v2 col-sm-8 offset-sm-2 row center-text">
								<h4 class="v-search-result-count">최근 내 리뷰</h4>
							</div>
							
							<section style="margin:0">
							<c:if test="${empty list}">
								등록한 감상이 없습니다.
							</c:if>
							<!-- 책별 데이터 불러오고 그 중 가장 최근 데이터 하나만 불러오기. -->
							<c:forEach items="${list}" var="vo">
							
							<div class="post-content no-thumb clearfix" style="margin:20px ; padding:30px">
							    <article class="v_blog-item">
			                        <div class="v_blog-item-inner row">
			                        
			                           <!-- 여기가 이미지 들어가는 부분 -->
			                           <div class="v_blog-item-media col-md-3" style="padding-left:5%; padding-right:3%">
			                              <a href="/warm/reviewPerBook?isbn=${vo.isbn}">
			                                 <img class="w-100" src="${vo.book_img}"/>
			                              </a>
			                           </div>
			                           
			                           <!-- 최근 작성한 리뷰가 들어가는 부분 -->
			                           <div class="v_blog-item-content col-md-8" style="padding-left:5%; padding-right:3%">
			                           
			                              <div class="v_blog-item-header">
			                                 <ul class="v_blog-item-meta" style="list-style-type: none; padding-left:0px">
			                                    <li class="v_blog-item-date">
			                                       <time class="" datetime="2018-06-30T10:47:48+00:00">
			                                       	 <fmt:formatDate var="recentDate" value="${vo.review_modify_date}" pattern="yyyy. MM. dd"/>
			                                          ${recentDate}
			                                       </time>
			                                    </li>
			                                 </ul>
			                              </div>
				
			                              <div itemprop="articleBody">
			                                 <p style="overflow:hidden; display: -webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:2; line-height:1.8em; max-height:3.6em; margin-top:15px; margin-bottom:30px">
			                                 	${vo.review_content}
			                                 </p>
			                                 <a class="v_blog-item-read-more" style="position:absolute; bottom:0; right:0; color:gray" href="/warm/reviewPerBook?isbn=${vo.isbn}">
			                                    <span>감상 더보기</span>
			                                 </a>
			                              </div>
			                              
			                           </div>
			                           
			                        </div>
			                     </article>
							</div>                     
							</c:forEach>
							<!-- 최근 리뷰 페이징 처리 -->	
							<nav aria-label="...">
                                <ul class="pagination">
                        
                                	<c:if test="${pageMaker.prev}">
	                                    <li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a>
	                                    </li>
                                	</c:if>
                                	
                                	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a>
	                                    </li>
                                	</c:forEach>
                                	
                                    <c:if test="${pageMaker.next}">
	                                    <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a>
	                                    </li>
                                	</c:if> 
                                	
                                	<form id="actionForm" action="/warm/reviewMain" method="get">
                                		<input type="hidden" name="isbn" value="${list[0].isbn}">
                                		<input type="hidden" name="user_id" value="${list[0].user_id}">
                                		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                	</form>
                                </ul>
                            </nav>
						</section>
                	</div>
                </div>

               <%@ include file="./orderList-side-bar.jsp" %>
            </div>
        </div>
    </div>

</div>


<%@ include file="./couponList.jsp" %>
<%@ include file="./setCoupon.jsp" %>
<%@ include file="./modal-myInfo-script.jsp" %>
