<% String context = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<body>


    <div role="main" class="main">
        <section class="page-header mb-0">
<!--             <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                        <span class="tob-sub-title text-color-primary d-block">LITLE BIT ABOUT US</span>
                        <h1>Elements</h1>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="col-md-4">
                        <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="index.html">Shortcodes</a></li>
                            <li class="active">Elemens</li>
                        </ul>
                    </div>
                </div>
            </div> -->
        </section>

        <div class="v-page-wrap mb-0 mt-0">
            <div class="container">
                <div class="row v-right-sidebar-nav">

                    <div class="col-sm-3 v-right-sidebar-wrap pt-8">
                        <!--Tab-->
                        <ul id="myTab" class="nav v-right-sidebar-inner">
                            <li>
                                <a href="#counters" data-toggle="tab" class="active show">
                                    <i class="fa fa-star-o"></i>받은쪽지함
                                </a>
                            </li>
                            <li>
                                <a href="#recent-posts" data-toggle="tab">
                                    <i class="fa fa-calendar"></i>보낸 쪽지함
                                </a>
                            </li>

                        </ul>
                        <!--End Tab-->
                    </div>


                    <!--Tab Content-->
                    <div class="col-sm-9 v-sidebar-content-wrap mb-7 mt-3">
                        <div class="tab-content">
                            
                            <!--Counters-->
                            <div class="tab-pane fade active show" id="counters">
								 <div class="row">
                                    <div class="col-md-9 left-side-sidebar">
                                    <c:forEach items="${msglist}" var="msglist">
                                        <div class="v-blog-recent-post">
                                            <div class="blog-list-item-date">03<span>Mar</span></div>
                                            <div class="blog-list-content">
                                                <h6 class="special"><a href="#">${msglist.msg_title}</a></h6>
                                                <small>${msglist.msg_get_id}</small>
                                                <div class="blog-list-item-excerpt">
                                                    <p>${msglist.msg_content}</p>
                                                </div>
                                            </div>
                                        </div>
                                      </c:forEach>
                                    </div>	
                                   </div>				
                            </div>
                            <!--End Counters-->
                            
                            <!--Recent Posts-->
                            <div class="tab-pane fade" id="recent-posts">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="v-blog-recent-post">
                                            <div class="blog-list-item-date">03<span>Mar</span></div>
                                            <div class="blog-list-content">
                                                <h6 class="special"><a href="#">Standard Image Post</a></h6>
                                                <small>5 Comments</small>
                                                <div class="blog-list-item-excerpt">
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                        Aliquam bibendum, libero eu rutrum feugiat, urna orci porta,
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                                    </p>
                                                    <a href="#" class="read-more">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="v-blog-recent-post">
                                            <div class="blog-list-item-date">03<span>Mar</span></div>
                                            <div class="blog-list-content">
                                                <h6 class="special"><a href="#" title="Youtube Post">Full Width Media Post</a></h6>
                                                <small>2 Comments</small><div class="blog-list-item-excerpt">
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                        Aliquam bibendum, libero eu rutrum feugiat, urna orci porta,
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                                    </p>
                                                    <a href="#" class="read-more">Read More</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--EndRecent Posts-->

                        </div>
                    </div>
                    <!--End Tab Content-->
                </div>
            </div>
        </div>

    </div>



    <!-- Libs -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/jquery.easing.js"></script>
    <script src="js/jquery.fitvids.js"></script>
    <script src="js/jquery.carouFredSel.min.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/theme-plugins.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/imagesloaded.js"></script>

    <script src="js/view.min.js?auto"></script>
    <script src="plugins/aos/aos.js"></script>
    <script src="js/theme-core.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/theme.init.js"></script>

    <script>
        // Select the active tab
        $(document).ready(function () {
            $('a[href=' + window.location.hash + ']').tab('show');
        });
    </script>

</body>
</html>
