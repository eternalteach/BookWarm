<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<%@ include file="./include-header-front01.jsp"%>
<!-- 여기  front01의 current cSS 필요없음 -->
   <!-- Pricing CSS -->
   <link href="./resources/VertexEx/vendor/pricing-tables/main.css" rel="stylesheet" />
   <link href="./resources/VertexEx/vendor/pricing-tables/responsive.css" rel="stylesheet" />
   <link href="./resources/VertexEx/vendor/pricing-tables/style_9.css" rel="stylesheet" />
</head>
<body>
   <div class="body">
      <!--Header-->
      <header id="header" class="header-narrow header-full-width" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 0, 'stickySetTop': '0'}">
         <div class="header-body">
            <div class="header-container container">
               <div class="header-row">
                  <div class="header-column">
                     <div class="header-row">
                        <div class="header-logo">
                           <a href="index.html">
                              <img alt="logo" width="80" height="100" src="./resources/img/header/Alice_rabbit03.png">png">
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="header-column justify-content-end">
                     <div class="header-row">
                        <div class="header-nav">
                           <div class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">
                              
                              <!-- 탑 메뉴 -->
                              <%@ include file="./include-header-top-nav.jsp"%>
                              
                           </div>
                           <button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main nav">
                              <i class="fa fa-bars"></i>
                           </button>
                           <ul class="header-social-icons social-icons d-none d-sm-block">
                              <li class="social-icons-facebook"><a href="http://www.facebook.com/" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                              <li class="social-icons-twitter"><a href="http://www.twitter.com/" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                              <li class="social-icons-linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
