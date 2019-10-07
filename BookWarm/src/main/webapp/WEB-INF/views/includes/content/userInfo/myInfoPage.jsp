<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<div role="main" class="main">
    <section class="page-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8 text-left">
                    <h1>내 정보</h1>
                </div>
                <div class="col-md-4">
                    <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                        <li><a href="index.html">내 정보</a></li>
                    </ul>
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
                                    <h3>${user_id}님</h3>
                                </div>
                                <div class="author-bio-text">
                                    <p><a href="/warm/customLogout"><button type="button">로그아웃</button></a></p>
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
                                    <p><a href="javascript:setCoupon()" id="setCoupon">쿠폰 등록</a></p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="v-spacer col-sm-12 v-height-standard"></div>
                        
                        <!-- <div class="col-sm">
							<div class="v-heading-v2 col-sm-8 offset-sm-2 row center-text">
								<h4 class="v-search-result-count">최근 내 리뷰</h4>
							</div>
							이 부분에 해랑언니 코드 넣기
                        </div> -->
                </div>

               <%@ include file="./orderList-side-bar.jsp" %>
            </div>
        </div>
    </div>

</div>


<%@ include file="./couponList.jsp" %>
<%@ include file="./modal-myInfo-script.jsp" %>
