<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- body안에 넣기 -->
<!--Header-->
    <header id="header" class="header-narrow header-full-width" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 70}">
        <div class="header-body">
            <div class="header-container container">
                <div class="header-row">
                    <div class="header-column justify-content-start">
                        <div class="header-logo">
                            <a href="./resources/Vertex/index.html">
                                <img alt="Vertex" width="130" src="./resources/Vertex/img/logo.png">
                            </a>
                        </div>
                    </div>
                    <div class="header-column justify-content-end">
                        <div class="header-nav header-nav-light-dropdown">
                            <div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
                                <nav class="collapse">
									<ul class="nav nav-pills" id="mainNav">
										<li class="dropdown"><a class="dropdown-item dropdown-toggle active" href="library">My Library</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="library">My Library</a></li>
												<li><a class="dropdown-item" href="reviewMain">My Review</a></li>
												<li><a class="dropdown-item" href="record">My Record</a></li><!-- <span class="tip tip-primary">Landing</span> -->
											</ul>
										</li>
										
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="communityboard">Community</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="communityboard">Community Board</a></li>
												<li><a class="dropdown-item" href="openreivew">Open Review</a></li>
												<li><a class="dropdown-item" href="chat">Chatting</a></li>
											</ul>
										</li>
										
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Books </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="shoplist">shoplist</a></li>
												<li><a class="dropdown-item" href="shop-cart">cart</a></li>
												<li><a class="dropdown-item" href="#">주문내역 확인</a></li>
											</ul>
										</li>
										
										<!-- make icon -->
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">User Info</a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#">My Info</a></li>
												<li><a class="dropdown-item" href="#">Message</a></li>
											</ul>
										</li>
										
										<!-- only access Administrator -->
										<li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#">Admin </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="#">사용자 관리</a></li>
												<li><a class="dropdown-item" href="#">삭제된 게시글 관리</a></li>
											</ul>
										</li>
										
									</ul>
								</nav>
                            </div>
                            <div class="header-button d-none d-sm-flex ml-3">
                                <a class="btn v-btn standard lightgrey sf-icon-reveal mb-0 mr-0" href="https://wrapbootstrap.com/theme/express-business-website-template-WB0TR1711" target="_self">
                                    <i class="icon-cart-4"></i><span class="text text-uppercase">Buy Me</span>
                                </a>
                            </div>
                            <button class="header-btn-collapse-nav ml-3" data-toggle="collapse" data-target=".header-nav-main nav">
                                <span class="hamburguer">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                                <span class="close">
                                    <span></span>
                                    <span></span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--End Header-->