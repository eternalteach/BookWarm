<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- body안에 넣기 -->
<!--Header-->

    <header id="header" class="header-narrow header-full-width" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 70}">
        <div class="header-body">
            <div class="header-container container">
                <div class="header-row">  
                    <div>
						 
                    </div>
                    <div class="justify-content-end center">
                        <div class="header-nav header-nav-light-dropdown">
                            <div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
                                <nav class="collapse">
									<ul class="nav nav-pills" id="mainNav">
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="library">My Library</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="library">My Library</a></li>
												<li><a class="dropdown-item" href="reviewMain">My Review</a></li>
											</ul>
										</li>
										
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="communityboard">Community</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="communityboard">Community Board</a></li>
												<li><a class="dropdown-item" href="openreview">Open Review</a></li>
												<li><a class="dropdown-item" href="chat">Chatting</a></li>
											</ul>
										</li>
										<li>
											<a class="nopadding" href="/warm/library" style="padding-top: 0px;    padding-bottom: 0px;">
					                           <h1 style="margin:0">BOOKWARM</h1>
											</a>   
										</li>
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Books </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="shop/shoplist">shoplist</a></li>
												<li><a class="dropdown-item" href="shop/shop-cart">cart</a></li>
												<li><a class="dropdown-item" href="#">주문내역 확인</a></li>
											</ul>
										</li>
										
										<!-- make icon -->
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">User Info</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#">My Info</a></li>
												<li><a class="dropdown-item" href="message">Message</a></li>
											</ul>
										</li>
										
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="customLogout" style="float:right;">logout</a></li>
										
										
										
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<!-- only access Administrator -->
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Admin </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#">사용자 관리</a></li>
												<li><a class="dropdown-item" href="#">삭제된 게시글 관리</a></li>
											</ul>
										</li>
										</sec:authorize>
									</ul>
								</nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
<div style="height:70px;" clwass="col-sm-12"></div>
    <!--End Header-->