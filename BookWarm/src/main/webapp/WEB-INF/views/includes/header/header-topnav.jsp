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
                    <div class="justify-content-end center">
                        <div class="header-nav header-nav-light-dropdown">
                            <div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
                                <nav class="collapse">
									<ul class="nav nav-pills" id="mainNav">
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="/warm/library">My Library</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="/warm/library">My Library</a></li>
												<li><a class="dropdown-item" href="/warm/reviewMain">My Review</a></li>
											</ul>
										</li>
										
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="/warm/communityboard">Community</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="/warm/communityboard">Community Board</a></li>
												<li><a class="dropdown-item" href="/warm/openreview">Open Review</a></li>
											</ul>
										</li>
										<li>
											<a class="nopadding" href="/warm/library" style="padding-top: 0px;    padding-bottom: 0px;">
					                           <h1 style="margin:0">BOOK & WARM</h1>
											</a>   
										</li>
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Books </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="/warm/shop/shoplist">shoplist</a></li>
												<li><a class="dropdown-item" href="/warm/shop/cart">cart</a></li>
												<li><a class="dropdown-item" href="#">주문내역 확인</a></li>
											</ul>
										</li>
										
										<!-- make icon -->
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">User Info</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="/warm/myInfo">My Info</a></li>
												<li><a class="dropdown-item" href="/warm/message">Message</a></li>
											</ul>
										</li>
										
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<!-- only access Administrator -->
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="/warm/admin">Admin </a>
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
    <!--End Header-->