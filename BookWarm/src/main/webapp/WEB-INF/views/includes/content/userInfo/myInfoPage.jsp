<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<div role="main" class="main">
    <section class="page-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8 text-left">
                    <span class="tob-sub-title text-color-primary d-block">LITLE BIT ABOUT US</span>
                    <h1>Author Page</h1>
                </div>
                <div class="col-md-4">
                    <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                        <li><a href="index.html">Pages</a></li>
                        <li class="active">Author Page</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>


    <div class="v-page-wrap has-right-sidebar has-one-sidebar">

        <div class="container">

            <div class="row">

                    <div class="row col-sm-9">

                        <div class="col-sm-12">

                            <div class="author-info-wrap clearfix" style="margin-top: 0px;">
                                <div class="author-avatar">
                                    <img src="img/avatar.png" class="avatar photo" />
                                </div>
                                <div class="author-bio">
                                    <div class="author-name">
                                        <h3>About <span>Vertex Templates</span></h3>
                                    </div>
                                    <div class="author-bio-text">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa quis mauris
                                            sollicitudin commodo venenatis ligula commodo. Sed blandit
                                            convallis dignissim. Pellentesque pharetra velit.
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa quis mauris
                                            sollicitudin commodo venenatis ligula commodo. Sed blandit
                                            convallis dignissim.
                                        </p>
                                    </div>

                                    <div class="clearfix pt-2">
                                        <a href="#" class="social-icon si-dark si-facebook" title="Facebook">
                                            <i class="si-icon-facebook"></i>
                                            <i class="si-icon-facebook"></i>
                                        </a>
                                        <a href="#" class="social-icon si-dark si-twitter" title="Twitter">
                                            <i class="si-icon-twitter"></i>
                                            <i class="si-icon-twitter"></i>
                                        </a>
                                        <a href="#" class="social-icon si-dark si-instagram" title="Instagram">
                                            <i class="si-icon-instagram"></i>
                                            <i class="si-icon-instagram"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="v-spacer col-sm-12 v-height-standard"></div>
                        <div class="v-divider dotted v-bg-stylish col-sm-12"></div>
                </div>

               <%@ include file="./orderList-side-bar.jsp" %>
            </div>
        </div>
    </div>

</div>

