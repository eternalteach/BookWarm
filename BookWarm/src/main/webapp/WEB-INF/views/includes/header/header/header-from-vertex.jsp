﻿<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="./include-header-front_addVertex.jsp"%>
</head>
<body>
		<!--Header-->
    <header id="header" class="header-effect-reveal" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 70}">
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
                                    <ul class="nav flex-column flex-lg-row" id="mainNav">
                                        <li class="dropdown dropdown-mega">
                                            <a class="dropdown-item dropdown-toggle" href="#">
                                                Home
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="dropdown-mega-content">
                                                        <div class="row">
                                                            <div class="col-lg-3 dropdown-mega-sub-content-block overlay overlay-show overlay-color-primary d-none d-lg-block">
                                                                <span class="top-sub-title text-color-light-2 d-block">THE MOST</span>
                                                                <span class="text-color-light font-weight-bold d-block text-4 mb-2">POWERFUL</span>
                                                                <p class="text-color-light-2">A revolutionary theme trusted by tons of customers</p>
                                                                <a class="btn btn-dark btn-rounded btn-v-3 btn-h-2 content-block-button font-weight-semibold" href="#">GET STARTED</a>
                                                            </div>
                                                            <div class="col-lg-3 ml-auto">
                                                                <span class="dropdown-mega-sub-title">MULTI PURPOSE</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index.html">Home - Variation 1</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-2.html">Home - Variation 2</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-3.html">Home - Variation 3</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-4.html">Home - Variation 4</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-5.html">Home - Variation 5</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-6.html">Home - Variation 6</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-7.html">Home - Variation 7</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-8.html">Home - Variation 8</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">PORTFOLIO</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-9.html">Home - Variation 9 </a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-10.html">Home - Variation 10 <span class="badge badge-warning badge-sm ml-1">Gap Outside</span></a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-11.html">Home - Variation 11</a></li>
                                                                </ul>
                                                                <span class="dropdown-mega-sub-title">Contact Us</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/contact-us.html">Contact Us</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/contact-us-2.html">Contact Us 2</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">About Us</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/page-about-us.html">About Us</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-2.html">About Us 2</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-3.html">About Us 3</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-4.html">About Us 4</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown-mega dropdown-mega-style-2">
                                            <a class="dropdown-item dropdown-toggle" href="#">
                                                Elements
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="dropdown-mega-content container">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">ELEMENTS 1</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-content-carousel.html"><i class="icon-list-1 menu-icon"></i>Content Carousel</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common2.html#modal-windows"><i class="icon-outbox-2 menu-icon"></i>Modal Windows</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-testimonials.html"><i class="icon-chat-2 menu-icon"></i>Testimonials</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-brands-clients.html"><i class="icon-connection-2 menu-icon"></i>Brands & Clients</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common2.html#image-frames"><i class="icon-photo-frame menu-icon"></i>Image Frames</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-buttons.html"><i class="icon-cursors menu-icon"></i>Buttons<span class="badge badge-warning badge-sm ml-1">Hot</span></a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-iconboxes.html"><i class="icon-star-1 menu-icon"></i>Animation & Feature Boxes</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common2.html#circle-counters"><i class="icon-heart-plus menu-icon"></i>Circle Counters</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-2.html"><i class="icon-photo-frame menu-icon"></i>Fancy Heading</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common2.html#recent-posts"><i class="icon-rss-1 menu-icon"></i>Recent Posts & News</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-icon-grid.html"><i class="icon-grid menu-icon"></i>Icon Grids</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">ELEMENTS 2</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/index-3.html"><i class="icon-video-camera-2 menu-icon"></i>Video Section</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-social-icons.html"><i class="icon-link menu-icon"></i>Social Icons</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-pricing-tables.html"><i class="icon-money menu-icon"></i>Pricing Tables</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-charts.html"><i class="icon-business-chart-2 menu-icon"></i>Charts <span class="v-menu-item-info">Hot</span></a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-progress-bar.html"><i class="icon-type-2 menu-icon"></i>Progress Bars</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-tabs.html"><i class="icon-window-selection-2 menu-icon"></i>Tab Control</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-team-member.html"><i class="icon-user-star-1 menu-icon"></i>Team Elements</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-accordion.html"><i class="icon-credit-card menu-icon"></i>Accordion & Toggles</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-call-to-actions.html"><i class="icon-bookmark-3 menu-icon"></i>Call To Actions <span class="badge badge-warning badge-sm ml-1">Important</span></a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-process-steps.html"><i class="icon-shear-tool menu-icon"></i>Process Steps</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-animated-headline.html"><i class="icon-cigarette menu-icon"></i>Animated Headline</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">ELEMENTS 3</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#gridsystem"><i class="icon-arrange-4-1 menu-icon"></i>Grid System</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#typograpy"><i class="icon-small-caps menu-icon"></i>Typograpy</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-forms.html"><i class="icon-text menu-icon"></i>Form Elements <span class="badge badge-danger badge-sm ml-1">Hot</span></a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#lists"><i class="icon-check-list menu-icon"></i>Lists</a></li>
                                                                    <li class="dropdown-submenu">
                                                                        <a class="dropdown-item dropdown-toggle" href="./resources/Vertex/#"><i class="icon-bucket menu-icon"></i> Icons</a>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a class="dropdown-item" href="./resources/Vertex/element-icons.html">Font Awesome Icons</a></li>
                                                                            <li><a class="dropdown-item" href="./resources/Vertex/element-icons-2.html">Streamline Icons</a></li>
                                                                            <li><a class="dropdown-item" href="./resources/Vertex/element-social-icons.html">Social Icons</a></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#info-messages"><i class="icon-information menu-icon"></i>Info Messages</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#heading-options"><i class="icon-megaphone-1 menu-icon"></i>Heading Options</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#tagline"><i class="icon-inbox-3 menu-icon"></i>Tagline & Info Boxes</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#pagination"><i class="icon-scroll-horizontal-1 menu-icon"></i>Pagination</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/element-common.html#separator-divider"><i class="icon-scissor-1 menu-icon"></i>Separator / Divider</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3 dropdown-mega-sub-content-block d-none d-lg-block">
                                                                <img src="./resources/Vertex/img/logo-white.png" class="img-responsive content-block-image" alt="" width="110" />
                                                                <span class="top-sub-title text-color-light-2 d-block">THE MOST</span>
                                                                <span class="text-color-light font-weight-bold d-block text-4 mb-4">POWERFUL</span>
                                                                <p class="text-color-light-2">A revolutionary theme<br> trusted by tons of<br> customers</p>
                                                                <a class="btn d-inline-block content-block-button text-color-primary font-weight-bold p-0" href="#">GET STARTED</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-item dropdown-toggle" href="#">
                                                Features
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#"><i class="icon-check-list menu-icon"></i> Headers</a>
                                                    <ul class="dropdown-menu">
                                                        <li class="dropdown-submenu">
                                                            <a class="dropdown-item dropdown-toggle" href="#">Top Bar</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-header-colored-top-bar.html">Default + Colored Top Bar</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-header-top-bar-search.html">Default + Top Bar with Search</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-header-top-bar-button.html">Default + Top Bar with Button</a></li>
                                                            </ul>
                                                        </li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-header-center.html">Center</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-header-logo-between-menu.html">Logo Between Menu</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-header-below-slider.html">Below Slider</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-header-with-borders.html">With Borders</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-header-full-width.html">Full Width</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-6.html">Floating</a></li>
                                                        <li class="dropdown-submenu">
                                                            <a class="dropdown-item dropdown-toggle" href="#">Transparent</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single.html">Transparent</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-8.html">Transparent - Bottom Border</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-header-semi-transparent.html">Semi Transparent</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-11.html">Semi Transparent - Light</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="dropdown-submenu">
                                                            <a class="dropdown-item dropdown-toggle" href="#">Navbar</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-header-navbar.html">Navbar</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-header-navbar-centered-logo.html">Navbar - Centered Logo</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#"><i class="icon-window-2 menu-icon"></i> Navigations</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-navigation-top-line.html">Top Line</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-navigation-stripe.html">Stripe</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-navigation-dark-dropdown.html">Dark Dropdown</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#"><i class="icon-layers menu-icon"></i> Footers</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-404.html#footer">Footer Variation</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-faq.html#footer">Footer Variation 2</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-services.html#footer">Footer Variation 3</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-11.html#footer">Footer Variation 4</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/feature-footers.html">Footer Variation 5</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#"><i class="icon-arrange-3-5 menu-icon"></i> Page Headers</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-left-alignment.html">Left Alignment</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-center-alignment.html">Center Alignment</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-right-alignment.html">Right Alignment</a></li>
                                                        <li class="dropdown-submenu">
                                                            <a class="dropdown-item dropdown-toggle" href="#">Colors</a>
                                                            <ul class="dropdown-menu">
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-color-primary.html">Primary Color</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-color-secondary.html">Secondary Color</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-color-tertiary.html">Tertiary Color</a></li>
                                                                <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-color-quaternary.html">Quaternary Color</a></li>
                                                            </ul>
                                                        </li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-dark.html">Dark</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-parallax.html">Parallax</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-video-background.html">Video Background</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-page-header-mini.html">Mini</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#"><i class="icon-board menu-icon"></i> Layout Options</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-10-boxed.html">Boxed</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/index-10.html">Gap Outside</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-item dropdown-toggle" href="#">
                                                Pages
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#">About Us</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-us.html">About Us</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-2.html">About Us 2</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-3.html">About Us 3</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-us-4.html">About Us 4</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-me.html">About Me</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-me-2.html">About Me 2</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-about-me-3.html">About Me 3</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#">Contact Us</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/contact-us.html">Contact Us</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/contact-us-2.html">Contact Us 2</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#">Layouts</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-right-sidebar.html">Right Sidebar Page</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-left-sidebar.html">Left Sidebar Page</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-left-right-sidebar.html">Left & Right Sidebar Page</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-full-width.html">Full width Page</a></li>
                                                    </ul>
                                                </li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-meet-team.html">Team</a></li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="./resources/Vertex/#">Services</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-services.html">Services</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-services-2.html">Services 2</a></li>
                                                    </ul>
                                                </li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-careers.html">Careers</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-job.html">Job Page</a></li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="./resources/Vertex/#">Login / Register</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-login.html">Login</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-login-2.html">Login 2</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-register.html">Register</a></li>
                                                    </ul>
                                                </li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-search-result.html">Search Result</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-help.html">Help Page</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-author-page.html">Author Page</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/page-pricing.html">Pricing Page</a></li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="./resources/Vertex/#">Extra</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-faq.html">FAQ</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-404.html">404 Error</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/page-privacy.html">Privacy Page</a></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#">Support</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/changelog.html"><i class="fa fa-terminal"></i>Changelog</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/theme-plugins.html"><i class="fa fa-star-o"></i>Theme Plugins</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown-mega dropdown-mega-style-2">
                                            <a class="dropdown-item dropdown-toggle" href="#">
                                                Portfolio
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="dropdown-mega-content container">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">Portfolio Gallery</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-two-gallery.html">Gallery - 2 Columns</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-three-gallery.html">Gallery - 3 Columns</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-four-gallery.html">Gallery - 4 Columns</a></li>
                                                                </ul>
                                                                <span class="dropdown-mega-sub-title">Portfolio Variations</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-right-sidebar.html">Right Sidebar</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-left-sidebar.html">Left Sidebar</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">Portfolio Standard</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-two-standard.html">Standard - 2 Columns</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-three-standard.html">Standard - 3 Columns</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-four-standard.html">Standard - 4 Columns</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">Portfolio Masonry</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-masonry-gallery.html">Gallery</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-masonry-standard.html">Standard</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-masonry-fw.html">Fullwidth Standard</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-masonry-fw-2.html">Fullwidth Gallery</a></li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <span class="dropdown-mega-sub-title">Portfolio Single</span>
                                                                <ul class="dropdown-mega-sub-nav">
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single.html">Single</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single-slider.html">Slider</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single-2.html">Custom</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single-gallery.html">Gallery</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single-fw.html">Full Width</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single-fw-slides.html">Full Width Slides</a></li>
                                                                    <li><a class="dropdown-item" href="./resources/Vertex/portfolio-single-extended.html">Extended <span class="badge badge-warning badge-sm ml-1">Showcase</span> </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a class="dropdown-item dropdown-toggle active" href="#">
                                                Blog
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><div class="menu-sm-info">Perfect Design</div></li>
                                                <li><a class="dropdown-item current" href="./resources/Vertex/blog-standard-sidebar.html"><i class="icon-list-1 menu-icon"></i> Blog Standard</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/blog-mini-sidebar.html"><i class="icon-list-2 menu-icon"></i> Blog Small</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/blog-masonry.html"><i class="icon-arrange-4-1 menu-icon"></i> Blog Masonry</a></li>
                                                <li><a class="dropdown-item" href="./resources/Vertex/blog-masonry-fw.html"><i class="icon-arrange-5 menu-icon"></i> Blog Fullwidth Masonry</a></li>
                                                <li class="dropdown-submenu">
                                                    <a class="dropdown-item dropdown-toggle" href="#"><i class="icon-link menu-icon"></i>  Blog Posts</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="./resources/Vertex/blog-standard-post.html">Standard Post</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/blog-full-width-post.html">Full Width Post</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/blog-standard-post-2.html">Standard Post - Modern</a></li>
                                                        <li><a class="dropdown-item" href="./resources/Vertex/blog-full-width-post-2.html">Full Width Post - Modern</a></li>
                                                    </ul>
                                                </li>
                                            </ul> 
                                        </li>

                                        <li class="dropdown dropdown-mega dropdown-mega-signin signin ml-lg-3" id="headerAccount">
                                            <a class="dropdown-item pl-lg-4" href="./resources/Vertex/page-login.html">Sign In</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="dropdown-mega-content">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="signin-form">
                                                                    <span class="top-sub-title text-color-light-3">MEMBERSHIP</span>
                                                                    <h2 class="text-4 mb-4 mt-1">Sign In</h2>
                                                                    <form action="page-login.html" id="frmSignIn" method="post">
                                                                        <div class="form-row">
                                                                            <div class="form-group col mb-2">
                                                                                <input type="email" value="" maxlength="100" class="form-control" name="email" id="signInEmail" placeholder="Username" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-row">
                                                                            <div class="form-group col">
                                                                                <input type="password" value="" class="form-control" name="password" id="signInPassword" placeholder="Password" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-row">
                                                                            <div class="form-group col">
                                                                                <div class="form-check checkbox-custom checkbox-default">
                                                                                    <input class="form-check-input" type="checkbox" id="signInRemember">
                                                                                    <label class="form-check-label" for="signInRemember">
                                                                                        Remember me
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group col text-right">
                                                                                <a href="#" id="headerRecover" class="forgot-pw text-color-dark d-block">Forgot password?</a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row align-items-center">
                                                                            <div class="col">
                                                                                <a href="#" id="headerSignUp" class="text-color-primary pl-0">Sign Up Now!</a>
                                                                            </div>
                                                                            <div class="col text-right">
                                                                                <button type="submit" class="btn btn-primary btn-sm pull-right mb-0 mr-0"><i class="fa fa-lock"></i> SIGN IN</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="signup-form">
                                                                    <span class="top-sub-title text-color-light-3">MEMBERSHIP</span>
                                                                    <h2 class="text-4 mb-4 mt-1">Sign Up</h2>
                                                                    <form action="#" id="frmSignUp" method="post">
                                                                        <div class="form-row">
                                                                            <div class="form-group col mb-2">
                                                                                <input type="text" value="" class="form-control" name="name" id="signUpName" placeholder="Full Name" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-row">
                                                                            <div class="form-group col mb-2">
                                                                                <input type="email" value="" maxlength="100" class="form-control" name="email" id="signUpEmail" placeholder="E-mail" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-row mb-3">
                                                                            <div class="form-group col">
                                                                                <input type="password" value="" class="form-control" name="password" id="signUpPassword" placeholder="Password" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row align-items-center">
                                                                            <div class="col">
                                                                                <a href="#" id="headerSignIn" class="text-color-primary pl-0">Have an account?</a>
                                                                            </div>
                                                                            <div class="col text-right">
                                                                                <button type="submit" class="btn btn-primary btn-sm pull-right mb-0 mr-0">SIGN UP</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="recover-form">
                                                                    <span class="top-sub-title text-color-light-3">MEMBERSHIP</span>
                                                                    <h2 class="text-4 mb-4 mt-1">Reset my Password</h2>
                                                                    <form action="#" id="frmResetPassword" method="post">
                                                                        <div class="form-row mb-4">
                                                                            <div class="form-group col mb-2">
                                                                                <input type="email" value="" maxlength="100" class="form-control" name="email" id="resetPasswordEmail" placeholder="E-mail" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row align-items-center">
                                                                            <div class="col">
                                                                                <a href="#" id="headerRecoverCancel" class="text-color-primary pl-0">Have an account?</a>
                                                                            </div>
                                                                            <div class="col text-right">
                                                                                <button type="submit" class="btn btn-primary btn-sm pull-right mb-0 mr-0">SUBMIT</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
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






</body>
</html>