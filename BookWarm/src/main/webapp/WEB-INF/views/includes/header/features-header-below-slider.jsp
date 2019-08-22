<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="./includes/header/header_front01.jsp"%>
   <!-- 이 두줄 여기에 필요한게 맞는지 확인해야한다. -->
   <link rel="stylesheet" href="vendor/bootstrap/css/glyphicon.css" />
   <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700,800,900|Roboto%3A700%2C500%2C900%2C400" rel="stylesheet" type="text/css" />

   <!-- Current Page CSS -->
   <link rel="stylesheet" href="vendor/rs-plugin/css/settings.css">
   <link rel="stylesheet" href="vendor/rs-plugin/css/layers.css">
   <link rel="stylesheet" href="vendor/rs-plugin/css/navigation.css">

   <!-- Base MasterSlider style sheet -->
   <link rel="stylesheet" href="sliders/master-slider/classic-sliders/masterslider/style/masterslider.css" />
   <link href="sliders/master-slider/classic-sliders/masterslider/skins/default/style.css" rel='stylesheet' type='text/css'>
   <link href="sliders/master-slider/classic-sliders/fullscreen/style/ms-fullscreen.css" rel="stylesheet" />
   <link href="sliders/master-slider/classic-sliders/videogallery/style/ms-videogallery.css" rel="stylesheet" />

   <style type="text/css">
      .header {
         margin-bottom: 0;
      }

      .ms-fullscreen-template {
         min-height: 250px;
      }

      .master-slider {
         height: 100%;
         font-family: Lato, arial, sans-serif;
      }

      .demos-filter {
         margin: 0;
         text-align: right;
      }

      .demos-filter li {
         list-style: none;
         margin: 10px 0px;
      }

      .demos-filter li a {
         display: block;
         border: 0;
         text-transform: uppercase;
         letter-spacing: 1px;
         color: #444;
      }

      .demos-filter li a:hover,
      .demos-filter li.activeFilter a {
         color: #1ABC9C;
      }

      @media (max-width: 991px) {
         .demos-filter {
            text-align: center;
         }

         .demos-filter li {
            float: left;
            width: 33.3%;
            padding: 0 20px;
         }
      }

      @media (max-width: 767px) {
         .demos-filter li {
            width: 50%;
         }
      }
   </style>
</head>

<body>
   <div class="wrapper">
      <div class="page">
         <!--Slider-->
         <section id="slider" class="revslider-wrap clearfix">
            <div id="rev_slider_6_1_wrapper" class="rev_slider_wrapper fullscreen-container" data-alias="inspiration-header" style="background-color:transparent;padding:0px;">
               <!-- START REVOLUTION SLIDER 5.2.6 fullscreen mode -->
               <div id="rev_slider_6_1" class="rev_slider fullscreenbanner" style="display:none;" data-version="5.2.6">
                  <ul>
                     <!-- SLIDE  -->
                     <li data-index="rs-18" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="500" data-rotate="0" data-saveperformance="off" data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                        <!-- MAIN IMAGE -->
                        <img src="sliders/rs-demo/assets/images/transparent.png" style='background-color:#f9f9f9' alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" data-no-retina>
                        <!-- LAYERS -->
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-8"
                             id="slide-18-layer-4"
                             data-x="['left','left','left','left']" data-hoffset="['-264','-264','-371','-416']"
                             data-y="['top','top','top','top']" data-voffset="['-135','-135','-180','-203']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="x:left;rZ:-90deg;s:2500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="500"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 5;"><img src="sliders/rs-demo/assets/images/header_penpot.png" alt="" data-ww="['650px','650px','650px','650px']" data-hh="['500px','500px','500px','500px']" data-no-retina></div>
                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-9"
                             id="slide-18-layer-5"
                             data-x="['right','right','right','right']" data-hoffset="['30','30','-70','-144']"
                             data-y="['top','top','top','top']" data-voffset="['-204','-204','-233','-261']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="x:right;y:-500px;rZ:90deg;s:2500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="500"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 6;"><img src="sliders/rs-demo/assets/images/header_flowerpot.png" alt="" data-ww="['700px','700px','700px','700px']" data-hh="['600px','600px','600px','600px']" data-no-retina></div>
                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-10"
                             id="slide-18-layer-6"
                             data-x="['left','left','left','left']" data-hoffset="['-372','-372','-540','-638']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['-484','-484','-520','-522']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="x:left;rZ:45deg;s:2500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="650"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 7;"><img src="sliders/rs-demo/assets/images/header_papers.png" alt="" data-ww="['900px','900px','900px','900px']" data-hh="['1000px','1000px','1000px','1000px']" data-no-retina></div>
                        <!-- LAYER NR. 4 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-12"
                             id="slide-18-layer-9"
                             data-x="['left','left','left','left']" data-hoffset="['134','134','-2','-57']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['67','67','50','6']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="y:bottom;rZ:90deg;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="1050"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 8;"><img src="sliders/rs-demo/assets/images/header_marker.png" alt="" data-ww="['200px','200px','200px','200px']" data-hh="['300px','300px','300px','300px']" data-no-retina></div>
                        <!-- LAYER NR. 5 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-11"
                             id="slide-18-layer-10"
                             data-x="['left','left','left','left']" data-hoffset="['181','181','30','-39']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['-170','-170','-190','-212']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="y:bottom;rZ:-90deg;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="1250"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 9;"><img src="sliders/rs-demo/assets/images/header_edding.png" alt="" data-ww="['300px','300px','300px','300px']" data-hh="['400px','400px','400px','400px']" data-no-retina></div>
                        <!-- LAYER NR. 6 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-12"
                             id="slide-18-layer-11"
                             data-x="['left','left','left','left']" data-hoffset="['393','393','201','81']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['218','218','183','191']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="y:bottom;rZ:-90deg;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="500"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 10;"><img src="sliders/rs-demo/assets/images/header_paperclip.png" alt="" data-ww="['50px','50px','50px','50px']" data-hh="['100px','100px','100px','100px']" data-no-retina></div>
                        <!-- LAYER NR. 7 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-11"
                             id="slide-18-layer-12"
                             data-x="['left','left','left','left']" data-hoffset="['346','346','165','36']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['255','255','237','231']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;rZ:310;"
                             data-transform_in="y:bottom;rZ:90deg;s:2000;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="550"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 11;"><img src="sliders/rs-demo/assets/images/header_paperclip.png" alt="" data-ww="['50px','50px','50px','50px']" data-hh="['100px','100px','100px','100px']" data-no-retina></div>
                        <!-- LAYER NR. 8 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-9"
                             id="slide-18-layer-7"
                             data-x="['right','right','right','right']" data-hoffset="['-364','-364','-479','-553']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['-155','-155','-180','-202']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="x:right;rZ:-65deg;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="700"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 12;"><img src="sliders/rs-demo/assets/images/header_tablet.png" alt="" data-ww="['730px','730px','730px','730px']" data-hh="['520px','520px','520px','520px']" data-no-retina></div>
                        <!-- LAYER NR. 9 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-11"
                             id="slide-18-layer-8"
                             data-x="['right','right','right','right']" data-hoffset="['222','222','105','8']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['8','8','-17','-10']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="x:right;rZ:90deg;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="500"
                             data-basealign="slide"
                             data-responsive_offset="on"
                             style="z-index: 13;"><img src="sliders/rs-demo/assets/images/header_pen.png" alt="" data-ww="['300px','300px','300px','300px']" data-hh="['500px','500px','500px','500px']" data-no-retina></div>
                        <!-- LAYER NR. 10 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-2"
                             id="slide-18-layer-1"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']" data-voffset="['-70','-70','-70','-90']"
                             data-fontsize="['80','80','80','60']"
                             data-lineheight="['80','80','80','60']"
                             data-width="['none','none','none','360']"
                             data-height="none"
                             data-whitespace="['nowrap','nowrap','nowrap','normal']"
                             data-transform_idle="o:1;"
                             data-transform_in="y:-50px;rX:-45deg;sX:2;sY:2;opacity:0;s:1500;e:Power4.easeOut;"
                             data-transform_out="y:30px;rX:45deg;sX:0.8;sY:0.8;opacity:0;s:600;e:Power2.easeInOut;"
                             data-start="510"
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                             data-end="2650"
                             style="z-index: 14; white-space: nowrap; font-size: 80px; line-height: 80px; font-weight: 700; color: rgba(0, 0, 0, 1.00);font-family:Roboto;text-align:center;">Be Inspired.</div>
                        <!-- LAYER NR. 11 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-2"
                             id="slide-18-layer-15"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']" data-voffset="['-70','-70','-70','-90']"
                             data-fontsize="['80','80','80','60']"
                             data-lineheight="['80','80','80','60']"
                             data-width="['none','none','none','360']"
                             data-height="none"
                             data-whitespace="['nowrap','nowrap','nowrap','normal']"
                             data-transform_idle="o:1;"
                             data-transform_in="y:-50px;rX:-45deg;sX:2;sY:2;opacity:0;s:1500;e:Power4.easeOut;"
                             data-transform_out="y:30px;rX:45deg;sX:0.8;sY:0.8;opacity:0;s:600;e:Power2.easeInOut;"
                             data-start="2940"
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                             data-end="5100"
                             style="z-index: 15; white-space: nowrap; font-size: 80px; line-height: 80px; font-weight: 700; color: rgba(0, 0, 0, 1.00);font-family:Roboto;text-align:center;">Be Brave.</div>
                        <!-- LAYER NR. 12 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-2"
                             id="slide-18-layer-16"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']" data-voffset="['-70','-70','-70','-90']"
                             data-fontsize="['80','80','80','60']"
                             data-lineheight="['80','80','80','60']"
                             data-width="['none','none','none','400']"
                             data-height="none"
                             data-whitespace="['nowrap','nowrap','nowrap','normal']"
                             data-transform_idle="o:1;"
                             data-transform_in="y:-50px;rX:-45deg;sX:2;sY:2;opacity:0;s:1500;e:Power4.easeOut;"
                             data-transform_out="y:30px;rX:45deg;sX:0.8;sY:0.8;opacity:0;s:600;e:Power2.easeInOut;"
                             data-start="5390"
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 16; white-space: nowrap; font-size: 80px; line-height: 80px; font-weight: 700; color: rgba(0, 0, 0, 1.00);font-family:Roboto;text-align:center;">Start Creating.</div>
                        <!-- LAYER NR. 13 -->
                        <div class="tp-caption   tp-resizeme rs-parallaxlevel-2"
                             id="slide-18-layer-2"
                             data-x="['center','center','center','center']" data-hoffset="['-8','-8','-8','-8']"
                             data-y="['middle','middle','middle','middle']" data-voffset="['10','10','10','-10']"
                             data-fontsize="['20','20','20','25']"
                             data-lineheight="['20','20','20','30']"
                             data-width="['none','none','none','360']"
                             data-height="none"
                             data-whitespace="['nowrap','nowrap','nowrap','normal']"
                             data-transform_idle="o:1;"
                             data-transform_in="y:50px;rX:45deg;sX:2;sY:2;opacity:0;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="600"
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 17; white-space: nowrap; font-size: 20px; line-height: 20px; font-weight: 400; color: rgba(68, 68, 68, 1.00);font-family:Roboto;text-align:center;">A Flexible Parallax Header for your Vertex Template.</div>
                        <!-- LAYER NR. 14 -->
                        <div class="tp-caption rev-btn  rs-parallaxlevel-3"
                             id="slide-18-layer-3"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']" data-voffset="['92','92','92','92']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:150;e:Power1.easeInOut;"
                             data-style_hover="c:rgba(255, 255, 255, 1.00);bg:rgba(32, 85, 199, 1.00);"
                             data-transform_in="y:100px;rX:90deg;opacity:0;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="700"
                             data-splitin="none"
                             data-splitout="none"
                             data-actions='[{"event":"click","action":"scrollbelow","offset":"-60px","delay":""}]'
                             data-responsive_offset="on"
                             data-responsive="off"
                             style="z-index: 18; white-space: nowrap; font-size: 15px; line-height: 50px; font-weight: 700; color: rgba(255, 255, 255, 1.00);font-family:Roboto;background-color:rgba(41, 106, 245, 1.00);padding:0px 30px 0px 30px;border-color:rgba(0, 0, 0, 1.00);border-radius:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;letter-spacing:2px;cursor:pointer;">CONTINUE</div>
                        <!-- LAYER NR. 15 -->
                        <div class="tp-caption rev-scroll-btn revs-dark  rs-parallaxlevel-5"
                             id="slide-18-layer-13"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                             data-y="['bottom','bottom','bottom','bottom']" data-voffset="['50','50','50','50']"
                             data-width="35"
                             data-height="55"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="y:-50px;opacity:0;s:1500;e:Power4.easeOut;"
                             data-transform_out="opacity:0;s:300;"
                             data-start="800"
                             data-splitin="none"
                             data-splitout="none"
                             data-actions='[{"event":"click","action":"scrollbelow","offset":"-60px","delay":""}]'
                             data-basealign="slide"
                             data-responsive_offset="on"
                             data-responsive="off"
                             style="z-index: 19; min-width: 35px; max-width: 35px; max-width: 55px; max-width: 55px; white-space: nowrap; font-size: px; line-height: px; font-weight: 400;border-color:rgba(51, 51, 51, 1.00);border-style:solid;border-width:3px;border-radius:23px 23px 23px 23px;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                           <span></span>
                        </div>
                     </li>
                  </ul>
                  <div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
               </div>
            </div><!-- END REVOLUTION SLIDER -->
         </section>

         <!--End Slider-->
         <!--Header-->
         <header id="header" class="header-narrow" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAtElement': '#header', 'stickySetTop': '0', 'stickyChangeLogo': false}">
            <div class="header-body">
               <div class="header-container container">
                  <div class="header-row">
                     <div class="header-column">
                        <div class="header-row">
                           <div class="header-logo">
                              <a href="index.html">
                                 <img alt="Vertex" width="120" height="80" src="img/logo.png">
                              </a>
                           </div>
                        </div>
                     </div>
                     <div class="header-column justify-content-end">
                        <div class="header-row">
                           <div class="header-nav p-0">
                              <div class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">
                                 
                                 <!-- 탑 메뉴 -->
                                 <%@ include file="../includes/header/top_nav.jsp"%>
                                 
                              </div>
                              <ul class="header-social-icons social-icons d-none d-sm-block">
                                 <li class="social-icons-facebook"><a href="http://www.facebook.com/" target="_blank" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                 <li class="social-icons-twitter"><a href="http://www.twitter.com/" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                 <li class="social-icons-linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                              </ul>
                              <button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main nav">
                                 <i class="fa fa-bars"></i>
                              </button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </header>
         <!--End Header-->


         <div class="page-inner p-none no-border">

            <section class="section-primary main-color b-bordered">
               <div class="container">
                  <div class="row text-center">

                     <div class="col-sm-12">

                        <h1 class="section-title">
                           The Fastest & Easiest Way To Build A <span class="primary-color">Website</span>
                        </h1>

                        <p class="section-sub-title">
                           The Amazing Page Builder Visualizes The Process Of Building A Website.
                        </p>

                        <div class="exp-separator center-separator mb-50">
                           <div class="exp-separator-inner">
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">

                     <div class="col-md-4 col-md-border">
                        <div class="feature-box feature-box-secundary-one v-animation v-animate" data-animation="grow" data-delay="0">
                           <div class="feature-box-icon center-icon small">
                              <i class="fa fa-laptop v-icon"></i>
                           </div>
                           <div class="feature-box-text pb-none clearfix">
                              <h3>Incredibly Responsive</h3>
                              <div class="feature-box-text-inner">
                                 <p>
                                    Class aptent taciti sociosqu ad litora torquent per conubia nostra,
                                    per inceptos himenaeos. Nulla nunc dui, tristique in semper vel.
                                 </p>

                                 <a href="#" class="read-more">Read More</a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 col-md-border">
                        <div class="feature-box feature-box-secundary-one v-animation v-animate" data-animation="grow" data-delay="200">
                           <div class="feature-box-icon center-icon small">
                              <i class="fa fa-leaf v-icon"></i>
                           </div>
                           <div class="feature-box-text pb-none">
                              <h3>Fully Customizible</h3>
                              <div class="feature-box-text-inner">
                                 <p>
                                    Class aptent taciti sociosqu ad litora torquent per conubia nostra,
                                    per inceptos himenaeos. Nulla nunc dui, tristique in semper vel.<br>
                                 </p>
                                 <a href="#" class="read-more">Read More</a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="feature-box feature-box-secundary-one v-animation v-animate" data-animation="grow" data-delay="400">
                           <div class="feature-box-icon center-icon small">
                              <i class="fa fa-random v-icon"></i>
                           </div>
                           <div class="feature-box-text pb-none">
                              <h3>Interactive Elements</h3>
                              <div class="feature-box-text-inner">
                                 <p>
                                    Class aptent taciti sociosqu ad litora torquent per conubia nostra,
                                    per inceptos himenaeos. Nulla nunc dui, tristique in semper vel.<br>
                                 </p>
                                 <a href="#" class="read-more">Read More</a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary b-bordered bg-block-top-shadow v2">
               <div class="container">
                  <div class="row">
                     <div class="col-md-6">
                        <div class="text-center content-center">
                           <img class="img-responsive exp-animation" data-animation="left-to-right" data-delay="200" src="img/custom/a1.png">
                        </div>
                     </div>

                     <div class="col-md-6 mt-40">
                        <ul class="i-list medium">
                           <li class="i-list-item">
                              <div class="icon"> <i class="fa fa-check"></i> </div>

                              <div class="icon-content">
                                 <h3 class="title">Updates & New Features</h3>
                                 <p>
                                    Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu,
                                    consequat vitae, eleifend ac, enim. Aliquam lorem ante.
                                 </p>
                              </div>
                              <div class="iconlist-timeline"></div>
                           </li>
                           <li class="i-list-item">
                              <div class="icon"> <i class="fa fa-check"></i> </div>

                              <div class="icon-content">
                                 <h3 class="title">Crafted with love</h3>
                                 <p class="sub-title">
                                    Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu,
                                    consequat vitae, eleifend ac, enim. Aliquam lorem ante.
                                 </p>
                              </div>
                              <div class="iconlist-timeline"></div>
                           </li>
                           <li class="i-list-item">
                              <div class="icon"> <i class="fa fa-check"></i> </div>

                              <div class="icon-content">
                                 <h3 class="title">24/7 Customer Support</h3>
                                 <p>
                                    Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu,
                                    consequat vitae, eleifend ac, enim. Aliquam lorem ante.
                                 </p>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary main-color b-bordered bg-block-top-shadow v2">
               <div class="container">
                  <div class="row text-center">

                     <div class="col-sm-12">

                        <h1 class="section-title">
                           <span class="primary-color">We Craft</span> Websites & Applications
                        </h1>

                        <p class="section-sub-title">
                           The Amazing Page Builder Visualizes The Process Of Building A Website.
                        </p>

                        <div class="exp-separator center-separator">
                           <div class="exp-separator-inner">
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-sm-4">

                        <p>
                           <span class="dropcap2">H</span>elloroin facilisis varius nunc. Curabitur eros risus,
                           ultrices et dui ut, luctus accumsan nibh. Fusce convallis
                           sapien placerat tellus suscipit vehicula. Cras vitae diam ut
                           justo elementum faucibus eget a diam. Etiam sodales a sem vitae
                           fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nisl libero,
                           laoreet rutrum risus sed, suscipit eleifend leo. Phasellus
                           id cursus lectus. Aliquam erat volutpat suscipit eleifend curabitur.
                        </p>
                     </div>
                     <div class="col-sm-4">

                        <p>
                           elloroin facilisis varius nunc. Curabitur eros risus,
                           ultrices et dui ut, luctus accumsan nibh. Fusce convallis
                           sapien placerat tellus suscipit vehicula. Cras vitae diam ut
                           justo elementum faucibus eget a diam. Etiam sodales a sem vitae
                           fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nisl libero,
                           laoreet rutrum risus sed, suscipit eleifend leo. Phasellus
                           id cursus lectus. Aliquam erat volutpat suscipit eleifend curabitur.
                        </p>
                     </div>
                     <div class="col-sm-4">

                        <div class="accordion v8" id="accordion6vvv" role="tablist" aria-multiselectable="true">
                           <div class="card">
                              <div class="card-header" role="tab" id="headingOne6vvv">
                                 <h5 class="mb-0">
                                    <a data-toggle="collapse" data-parent="#accordion6vvv" href="#collapseOne6vvv" aria-expanded="false" aria-controls="collapseOne6vvv">
                                       <i class="fa fa-star-o"></i>  Services We Offer
                                    </a>
                                 </h5>
                              </div>

                              <div id="collapseOne6vvv" class="collapse" role="tabpanel" aria-labelledby="headingOne6vvv">
                                 <div class="card-block">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 5 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 5 wolf moon tempor, sunt aliqua
                                 </div>
                              </div>
                           </div>
                           <div class="card">
                              <div class="card-header" role="tab" id="headingTwo6vvv">
                                 <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion6vvv" href="#collapseTwo6vvv" aria-expanded="false" aria-controls="collapseTwo6vvv">
                                       <i class="fa fa-star-o"></i> Vision and Mission
                                    </a>
                                 </h5>
                              </div>
                              <div id="collapseTwo6vvv" class="collapse" role="tabpanel" aria-labelledby="headingTwo6vvv">
                                 <div class="card-block">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 5 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 5 wolf moon tempor, sunt aliqua
                                 </div>
                              </div>
                           </div>
                           <div class="card">
                              <div class="card-header" role="tab" id="headingThree6vvv">
                                 <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion6vvv" href="#collapseThree6vvv" aria-expanded="false" aria-controls="collapseThree6vvv">
                                       <i class="fa fa-star-o"></i>  Our Philosophy
                                    </a>
                                 </h5>
                              </div>
                              <div id="collapseThree6vvv" class="collapse" role="tabpanel" aria-labelledby="headingThree6vvv">
                                 <div class="card-block">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 5 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 5 wolf moon tempor, sunt aliqua
                                 </div>
                              </div>
                           </div>
                           <div class="card">
                              <div class="card-header" role="tab" id="headingThree6vvvaa">
                                 <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion6vvv" href="#collapseThree6vvvx" aria-expanded="false" aria-controls="collapseThree6vvvx">
                                       <i class="fa fa-star-o"></i>Our Commitments
                                    </a>
                                 </h5>
                              </div>
                              <div id="collapseThree6vvvx" class="collapse" role="tabpanel" aria-labelledby="headingThree6vvvaa">
                                 <div class="card-block">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 5 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 5 wolf moon tempor, sunt aliqua
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary b-bordered bg-block-top-shadow v2">
               <div class="container">

                  <div class="row">
                     <div class="col-sm-6">

                        <div class="ms-videogallery-template">
                           <!-- masterslider -->
                           <div class="master-slider ms-skin-default" id="masterslider2">
                              <div class="ms-slide">
                                 <img src="sliders/master-slider/classic-sliders/masterslider/style/blank.gif" data-src="img/portfolio/p_1.jpg" alt="lorem ipsum dolor sit" />
                                 <div class="ms-thumb">
                                    <img src="img/portfolio/p_1.jpg" alt="video thumb" />
                                    <h3>Red Bull</h3>
                                 </div>
                                 <h3 class="ms-layer video-title" style="right:41px; bottom:40px; background-color:#313D50;" data-effect="rotateback(20,620,br)" data-ease="easeOutQuad" data-delay="100">Red Bull Signature Series 2013</h3>
                                 <h4 class="ms-layer video-author" style="right:285px; bottom:14px; background-color:#86838B; color:#FFF;" data-effect="rotate3dbottom(95,0,0,100)" data-ease="easeOutExpo" data-duration="1400" data-delay="500"> by Vogner</h4>
                                 <a data-type="video" href="http://player.vimeo.com/video/58226214"> </a>
                              </div>
                              <div class="ms-slide">
                                 <img src="sliders/master-slider/classic-sliders/masterslider/style/blank.gif" data-src="img/portfolio/p_2.jpg" alt="lorem ipsum dolor sit" />
                                 <div class="ms-thumb">
                                    <img src="img/portfolio/p_2.jpg" alt="video thumb" />
                                    <h3>A Good Year</h3>
                                 </div>
                                 <h3 class="ms-layer video-title" style="right:53px; bottom:99px; background-color:#899798;" data-effect="rotatefront(20,620,br)" data-ease="easeOutQuad" data-delay="100">A Good Year for Extreme Sports</h3>
                                 <h4 class="ms-layer video-author" style="right:267px; bottom:75px; background-color:#595247; color:#fff;" data-effect="rotate3dbottom(95,0,0,100)" data-ease="easeOutExpo" data-duration="1400" data-delay="500">by Family Creative</h4>
                                 <a data-type="video" href="http://player.vimeo.com/video/56467883"> </a>
                              </div>
                              <div class="ms-slide">
                                 <img src="sliders/master-slider/classic-sliders/masterslider/style/blank.gif" data-src="img/portfolio/p_3.jpg" alt="lorem ipsum dolor sit" />
                                 <div class="ms-thumb">
                                    <img src="img/portfolio/p_3.jpg" alt="video thumb" />
                                    <h3>Where things</h3>
                                 </div>
                                 <h3 class="ms-layer video-title" style="left:51px; bottom:101px; background-color:#333;" data-effect="rotateback(20,620,br)" data-ease="easeOutQuad" data-delay="100">Where things come from</h3>
                                 <h4 class="ms-layer video-author" style="left:51px; bottom:76px" data-effect="rotate3dbottom(95,0,0,100)" data-ease="easeOutExpo" data-duration="1400" data-delay="500">by Hardy Seiler</h4>
                                 <a data-type="video" href="http://player.vimeo.com/video/40459347"> </a>
                              </div>
                              <div class="ms-slide">
                                 <img src="sliders/master-slider/classic-sliders/masterslider/style/blank.gif" data-src="img/portfolio/p_4.jpg" alt="lorem ipsum dolor sit" />
                                 <div class="ms-thumb">
                                    <img src="img/portfolio/p_4.jpg" alt="video thumb" />
                                    <h3>REEL 2013</h3>
                                 </div>
                                 <h3 class="ms-layer video-title" style="left:70px; bottom:140px; background: #6D6F6E; " data-effect="rotatebottom(20,20,br)" data-ease="easeOutQuad" data-delay="100">RENAN OZTURK // REEL 2013</h3>
                                 <h4 class="ms-layer video-author" style="left:70px; bottom:115px; background-color:#A09996; color:#FFF;" data-effect="rotate3dbottom(95,0,0,100)" data-ease="easeOutExpo" data-duration="1400" data-delay="500">by Camp 4 Collective</h4>
                                 <a data-type="video" href="http://player.vimeo.com/video/59626663"> </a>
                              </div>
                              <div class="ms-slide">
                                 <img src="sliders/master-slider/classic-sliders/masterslider/style/blank.gif" data-src="img/portfolio/p_7.jpg" alt="lorem ipsum dolor sit" />
                                 <div class="ms-thumb">
                                    <img src="img/portfolio/p_7.jpg" alt="video thumb" />
                                    <h3>Buenos Aires </h3>
                                 </div>
                                 <h3 class="ms-layer video-title" style="right: 48px; bottom:49px; background-color: #23354E;" data-effect="rotateleft(20,120,br)" data-ease="easeOutQuad" data-delay="100">Buenos Aires Ciudad </h3>
                                 <h4 class="ms-layer video-author" style="right: 136px; bottom:24px" data-effect="rotate3dbottom(95,0,0,100)" data-ease="easeOutExpo" data-duration="1400" data-delay="500">by Esteban Diácono</h4>
                                 <a data-type="video" href="http://player.vimeo.com/video/39003269"> </a>
                              </div>
                           </div>
                           <!-- end of masterslider -->
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <h1 class="section-title">Incredible Skills</h1>

                        <div class="exp-separator">
                           <div class="exp-separator-inner">
                           </div>
                        </div>

                        <p class="section-sub-title">
                           Cras gravida arcu tincidunt, suscipit velit sed, porta sapien.
                           Maecenas a dolor sit amet aliquam lectus. Vivamus consequat purus quis ligula vestibulum, eget mattis ex fermentum.
                           Donec dolor sit amet placerat felis sit amet dolor sit amet venenatis faucibus. Praesent aliquet convallis.
                        </p>

                        <div class="progress-bars">
                           <div class="progress-label">
                              <span>WordPress</span>
                           </div>
                           <div class="progress">
                              <div class="progress-bar progress-bar-primary" data-appear-progress-animation="75%" data-appear-animation-delay="500">
                                 <span class="progress-bar-tooltip">75%</span>
                              </div>
                           </div>
                           <div class="progress-label">
                              <span>Photoshop</span>
                           </div>
                           <div class="progress">
                              <div class="progress-bar progress-bar-primary" data-appear-progress-animation="85%" data-appear-animation-delay="700">
                                 <span class="progress-bar-tooltip">85%</span>
                              </div>
                           </div>
                           <div class="progress-label">
                              <span>Bootstrap</span>
                           </div>
                           <div class="progress">
                              <div class="progress-bar progress-bar-primary" data-appear-progress-animation="95%" data-appear-animation-delay="900">
                                 <span class="progress-bar-tooltip">95%</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary main-color b-bordered bg-block-top-shadow v2">
               <div class="container">
                  <div class="row text-center">

                     <div class="col-sm-12">

                        <h1 class="section-title">

                           What Others Say <span class="primary-color">About Us</span>
                        </h1>

                        <p class="section-sub-title">
                           Everyday More People Join The Ultimate Experience.
                        </p>

                        <div class="exp-separator center-separator">
                           <div class="exp-separator-inner">
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">

                     <div class="col-md-4 stories_wrapper">
                        <div class="media">
                           <div class="media-object img_testimonial">
                              <img src="img/avatars/a1.jpeg" />
                           </div>
                           <div class="media-body">
                              <p>
                                 <span class="quotes"> </span>
                                 I wish that I could choose more than one reason for my 5-star rating!
                                 and from what I've read in the support forum the customer support is great.
                                 This is a great template.
                              </p>
                              <span class="testimonial_name">— Jamie Morrison,</span>
                              <span class="testimonial_job">CEO at Google</span>
                           </div>
                        </div>
                     </div>

                     <div class="col-md-4 stories_wrapper">
                        <div class="media">
                           <div class="media-object img_testimonial">
                              <img src="img/avatars/a2.jpeg" />
                           </div>
                           <div class="media-body">
                              <p>
                                 <span class="quotes"> </span>
                                 This is the most robust template I've ever worked with. So much can be done
                                 with this multi-purpose package. Regular updates and enhancements
                                 add tremendous value.
                              </p>
                              <span class="testimonial_name">— William Richardson,</span>
                              <span class="testimonial_job">CEO at Youtube</span>
                           </div>
                        </div>
                     </div>

                     <div class="col-md-4 stories_wrapper">
                        <div class="media">
                           <div class="media-object img_testimonial">
                              <img src="img/avatars/a3.jpeg" />
                           </div>
                           <div class="media-body">
                              <p>
                                 <span class="quotes"> </span>
                                 Great customer support. It is amazing to be on top of these many comments and
                                 they are doing it very well.
                                 The template is very useful if you want to work on business of any project before you start!!
                              </p>
                              <span class="testimonial_name">— Michael Feldstein,</span>
                              <span class="testimonial_job">CEO at Wtitter</span>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <section class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll loaded dzsprx-readyall">

               <div class="divimage dzsparallaxer--target w-100" style="height: 110%; background-image: url(img/banner/b8.jpg);">
               </div>

               <div class="container text-white section-primary">
                  <div class="row">
                     <div class="col-sm-12 text-center">
                        <h3 class="section-title text-white">Simple & Creative</h3>

                        <h3 class="fs-54 lh-62 ls-1 fw-6 text-white">PARALLAX BACKGROUNDS</h3>
                        <div class="horizontal-break"></div>

                        <button type="button" class="btn btn-primary"><i class="fa fa-fire"></i>Purchase Now</button>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary b-bordered">
               <div class="container">

                  <div class="row">
                     <div class="col-sm-7">

                        <div class="v-clients-wrap-v2 carousel-wrap mt-20">
                           <div class="owl-carousel" data-plugin-options='{"items": 5, "singleItem": false, "autoPlay": true, "margin":15}'>
                              <div class="item">
                                 <figure>
                                    <a href="http://dribbble.com/" target="_blank">
                                       <img class="free" src="img/clients/1.png" />
                                    </a>
                                 </figure>
                              </div>
                              <div class="item">
                                 <figure>
                                    <a href="https://vimeo.com/pro/" target="_blank">
                                       <img class="free" src="img/clients/6.png" />
                                    </a>
                                 </figure>
                              </div>
                              <div class="item">
                                 <figure>
                                    <a href="http://jquery.com/" target="_blank">
                                       <img class="free" src="img/clients/3.png" />
                                    </a>
                                 </figure>
                              </div>
                              <div class="item">
                                 <figure>
                                    <a href="http://wordpress.org/" target="_blank">
                                       <img class="free" src="img/clients/4.png" />
                                    </a>
                                 </figure>
                              </div>
                              <div class="item">
                                 <figure>
                                    <a href="http://www.envato.com/" target="_blank">
                                       <img class="free" src="img/clients/5.png" />
                                    </a>
                                 </figure>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-sm-5">

                        <h2>Partners we work with</h2>
                        <p class="">
                           Vestibulum pharetra nibh sit amet consequat commodo. Ut viverra est non est venenatis, quis faucibus nulla rutrum. Proin neque purus, tincidunt non nibh non, vehicula ornare sapien. Nulla commodo nulla quis nunc fermentum interdum.
                        </p>
                     </div>
                  </div>
               </div>
            </section>

            <section class="section-primary main-color bg-block-top-shadow v2">

               <div class="container">
                  <div class="row text-center">

                     <div class="col-sm-12">

                        <h1 class="section-title">
                           Latest From The <span class="primary-color">Blog</span>
                        </h1>

                        <p class="section-sub-title">
                           Lorem Ipsum Dolor
                        </p>

                        <div class="exp-separator center-separator">
                           <div class="exp-separator-inner">
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">

                     <div class="col-sm-12">

                        <div class="carousel-wrap">

                           <div class="owl-carousel post-wrap v4" data-plugin-options='{"items": 4, "autoPlay": 9000, "margin":35}'>

                              <div class="">
                                 <article class="post-content-wrap">

                                    <div class="post-content-wrap-inner">

                                       <div class="post-meta">
                                          <ul>
                                             <li><i class="ion-android-time"></i>25 MARCH 2017</li>
                                          </ul>
                                       </div>
                                       <h2 itemprop="name headline" class="post-title">
                                          <a href="#">
                                             You don't think your way to creative work.
                                          </a>
                                       </h2>
                                       <div class="figure-excerpt" itemprop="description">
                                          <p>
                                             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa
                                             quis mauris sollicitudin.
                                          </p>
                                       </div>
                                       <div class="post-author-wrap">
                                          <div class="author-avatar">
                                             <img alt="" src="img/avatars/a1.jpeg" class="avatar photo" />
                                             <span class="post-author-name" itemprop="author">
                                                by
                                                <a href="#" title="Visit Swift Ideas’s website" rel="author external">Vertex</a>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                 </article>
                              </div>

                              <div class="">
                                 <article class="post-content-wrap">

                                    <div class="post-content-wrap-inner">

                                       <div class="post-meta">
                                          <ul>
                                             <li><i class="ion-android-time"></i> April 15 2017</li>
                                          </ul>
                                       </div>
                                       <h2 itemprop="name headline" class="post-title">
                                          <a href="#">
                                             Design creates culture. Culture shapes values.
                                          </a>
                                       </h2>

                                       <div class="figure-excerpt" itemprop="description">
                                          <p>
                                             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa
                                             quis mauris sollicitudin.
                                          </p>
                                       </div>
                                       <div class="post-author-wrap">
                                          <div class="author-avatar">
                                             <img alt="" src="img/avatars/a3.jpeg" class="avatar photo" />
                                             <span class="post-author-name" itemprop="author">
                                                by
                                                <a href="#" title="Visit Swift Ideas’s website" rel="author external">Vertex</a>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                 </article>
                              </div>

                              <div class="">
                                 <article class="post-content-wrap">

                                    <div class="post-content-wrap-inner">

                                       <div class="post-meta">
                                          <ul>
                                             <li><i class="ion-android-time"></i> April 15 2017</li>
                                          </ul>
                                       </div>
                                       <h2 itemprop="name headline" class="post-title">
                                          <a href="#">
                                             There is no such thing as a boring project.
                                          </a>
                                       </h2>

                                       <div class="figure-excerpt" itemprop="description">
                                          <p>
                                             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa
                                             quis mauris sollicitudin commodo.
                                          </p>
                                       </div>
                                       <div class="post-author-wrap">
                                          <div class="author-avatar">
                                             <img alt="" src="img/avatars/a1.jpeg" class="avatar photo" />
                                             <span class="post-author-name" itemprop="author">
                                                by
                                                <a href="#" title="Visit Swift Ideas’s website" rel="author external">Vertex</a>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                 </article>
                              </div>

                              <div class="">
                                 <article class="post-content-wrap">

                                    <div class="post-content-wrap-inner">

                                       <div class="post-meta">
                                          <ul>
                                             <li><i class="ion-android-time"></i> April 15 2017</li>
                                          </ul>
                                       </div>
                                       <h2 itemprop="name headline" class="post-title">
                                          <a href="#">
                                             Good design is a language, not a style.
                                          </a>
                                       </h2>

                                       <div class="figure-excerpt" itemprop="description">
                                          <p>
                                             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquam massa
                                             quis mauris sollicitudin commodo.
                                          </p>
                                       </div>
                                       <div class="post-author-wrap">
                                          <div class="author-avatar">
                                             <img alt="" src="img/avatars/a3.jpeg" class="avatar photo" />
                                             <span class="post-author-name" itemprop="author">
                                                by
                                                <a href="#" title="Visit Swift Ideas’s website" rel="author external">Vertex</a>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                 </article>
                              </div>
                           </div>

                           <div class="customNavigation">
                              <a class="prev"><i class="fa fa-angle-left"></i></a>
                              <a class="next"><i class="fa fa-angle-right"></i></a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
         <!--Footer-Wrap-->
         <footer class="footer footer-2  bg-block-top-shadow v2">
            <div class="main">
               <div class="container">
                  <div class="row">
                     <div class="col-md-3 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Newsletter</h4>
                           </div>
                           <p>
                              Enter your e-mail and subscribe to our newsletter.
                           </p>

                           <div class="clearfix">
                              <form id="newsletterForm" action="php/newsletter-subscribe.php" method="POST" novalidate="novalidate">
                                 <div class="input-group">
                                    <input class="form-control bg-white" placeholder="Email Address" name="newsletterEmail" id="newsletterEmail" type="text">
                                 </div>
                              </form>
                           </div>

                           <div class="clearfix social-wrap mt-25">
                              <ul class="list-inline">
                                 <li>
                                    <a href="http://twitter.com/" class="asc_twitter clearfix">
                                       <span class="social-icon"><i class="ion-social-twitter"></i></span>
                                       <div class="meta clearfix">
                                          <strong class="asc_count">Follow</strong>
                                          <div class="name">on Twitter</div>
                                       </div>
                                    </a>
                                 </li>
                                 <li>
                                    <a href="http://facebook.com/" class="asc_facebook clearfix">
                                       <span class="social-icon"><i class="ion-social-facebook"></i></span>
                                       <div class="meta clearfix">
                                          <strong class="asc_count">Follow</strong>
                                          <div class="name">on Facebook</div>
                                       </div>
                                    </a>
                                 </li>
                              </ul>
                           </div>
                        </section>
                     </div>
                     <div class="col-md-3 col-sm-6">
                        <section class="latest-news">
                           <div class="heading">
                              <h4 class="title">Latest News</h4>
                           </div>

                           <div class="clearfix">

                              <div class="spost clearfix mt-0 pt-0">
                                 <div class="entry-image">
                                    <a href="#" class="nobg"><img class="img-circle" src="img/thumbs/project-6.jpg" alt=""></a>
                                 </div>
                                 <div class="entry-c">
                                    <div class="entry-title">
                                       <h4><a href="#">Debitis nihil placeat, earum illum est nisi</a></h4>
                                    </div>
                                    <ul class="entry-meta">
                                       <li><i class="ion-ios-chatboxes-outline"></i> 35 Comments</li>
                                    </ul>
                                 </div>
                              </div>

                              <div class="spost clearfix mt-15 pt-15">
                                 <div class="entry-image">
                                    <a href="#" class="nobg"><img class="img-circle" src="img/thumbs/project-3.jpg" alt=""></a>
                                 </div>
                                 <div class="entry-c">
                                    <div class="entry-title">
                                       <h4><a href="#">Elit Assumenda vel amet dolorum quasi</a></h4>
                                    </div>
                                    <ul class="entry-meta">
                                       <li><i class="ion-ios-chatboxes-outline"></i> 24 Comments</li>
                                    </ul>
                                 </div>
                              </div>

                              <div class="spost clearfix mt-15 pt-15">
                                 <div class="entry-image">
                                    <a href="#" class="nobg"><img class="img-circle" src="img/thumbs/project-2.jpg" alt=""></a>
                                 </div>
                                 <div class="entry-c">
                                    <div class="entry-title">
                                       <h4><a href="#">Lorem ipsum dolor sit amet, consectetur earum</a></h4>
                                    </div>
                                    <ul class="entry-meta">
                                       <li><i class="ion-ios-chatboxes-outline"></i> 19 Comments</li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                        </section>
                     </div>
                     <div class="col-md-3 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Usefull Tags</h4>
                           </div>
                           <div class="tag-cloud clearfix mb-30">
                              <ul class="tag-cloud-inner">
                                 <li><a href="#">Lifetime</a></li>
                                 <li><a href="#">Mobile</a></li>
                                 <li><a href="#">News</a></li>
                                 <li><a href="#">PHP</a></li>
                                 <li><a href="#">Social</a></li>
                                 <li><a href="#">video</a></li>
                                 <li><a href="#">Bootstrap</a></li>
                              </ul>
                           </div>

                           <div class="heading">
                              <h4 class="title mb-25">Usefull Links</h4>
                           </div>
                           <div class="clearfix">
                              <ul class="list-unstyled mb-none">
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="index.html">About Our Company</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="contact/index.html">Large Image Blog</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="parallax-presentation/index.html">Contact Us</a>
                                 </li>
                                 <li>
                                    <i class="fa fa-angle-double-right"></i>
                                    <a href="contact/index.html">Help</a>
                                 </li>
                              </ul>
                           </div>
                        </section>
                     </div>
                     <div class="col-md-3 col-sm-6">
                        <section>
                           <div class="heading">
                              <h4 class="title">Contact Us</h4>
                           </div>

                           <div class="footer-contact-info">
                              <ul class="pl-none">
                                 <li>
                                    <p><i class="fa fa-building"></i>Your Company </p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-map-marker"></i>795 Folsom Ave, Suite 600 San Francisco, CA 94107 </p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-envelope"></i><strong>Email:</strong> <a class="b-link" href="mailto:mail@example.com">mail@example.com</a></p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-phone"></i><strong>Phone:</strong> (123) 456-7890</p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-print"></i><strong>Fax:</strong> 555-1254-8785</p>
                                 </li>
                                 <li>
                                    <p><i class="fa fa-skype"></i><a class="b-link" href="mailto:mail@example.com">vertextheme</a></p>
                                 </li>
                              </ul>
                              <br>

                              <!--<ul class="social-icons standard">
                                 <li class="twitter"><a href="#" target="_blank"><i class="fa fa-twitter"></i><i class="fa fa-twitter"></i></a></li>
                                 <li class="facebook"><a href="#" target="_blank"><i class="fa fa-facebook"></i><i class="fa fa-facebook"></i></a></li>
                                 <li class="youtube"><a href="#" target="_blank"><i class="fa fa-youtube"></i><i class="fa fa-youtube"></i></a></li>
                                 <li class="googleplus"><a href="#" target="_blank"><i class="fa fa-google-plus"></i><i class="fa fa-google-plus"></i></a></li>
                              </ul>-->
                           </div>
                        </section>
                     </div>
                  </div>
               </div>
            </div>

            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-sm-6">

                        <ul class="list-inline fs-13 mb-none">
                           <li><p class="mb-0 fw-6">© 2015-2018 Vertex</p></li>
                           <li><a href="pages-about.html">About</a></li>
                           <li><a href="blog-grid.html">Blog</a></li>
                           <li><a href="pages-contact.html">Contact</a></li>
                           <li><a href="#">Terms</a></li>
                           <li><a href="#">Jobs</a></li>
                           <li><a href="#">Sitemap</a></li>
                           <li><a href="#">Public Policy</a></li>
                        </ul>
                     </div>
                     <div class="col-sm-6">
                        <div class="clearfix pull-right">
                           <ul class="list-inline mb-0">
                              <li><a href="#"><div class="flag flag-tr"></div></a> </li>
                              <li><a href="#"><div class="flag flag-england"></div></a> </li>
                              <li><a href="#"><div class="flag flag-us"></div></a> </li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </footer>
         <!--End Footer-Wrap-->
      </div>
   </div>
   <!-- Vendor -->
   <script src="vendor/jquery/jquery.js"></script>
   <script src="vendor/jquery/jquery.nav.js"></script>
   <script src="vendor/jquery/jquery.validate.js"></script>
   <script src="vendor/jquery.appear/jquery.appear.min.js"></script>
   <script src="vendor/jquery.easing/jquery.easing.min.js"></script>
   <script src="vendor/jquery-cookie/jquery-cookie.min.js"></script>
   <script src="vendor/magnific-popup/jquery.magnific-popup.js"></script>
   <script src="vendor/modernizr/modernizr.min.js"></script>
   <script src="vendor/tether/tether.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="vendor/menuzord/menuzord.js"></script>
   <script src="vendor/sticky/jquery.sticky.min.js"></script>
   <script src="vendor/isotope/jquery.isotope.min.js"></script>
   <script src="vendor/respond/respond.js"></script>
   <script src="vendor/images-loaded/imagesloaded.js"></script>
   <script src="vendor/owl-carousel/owl.carousel.js"></script>
   <script src="vendor/wow/wow.min.js"></script>
   <script src="vendor/lite-tooltip/js/litetooltip.js"></script>
   <script src="js/theme-plugins.js"></script>

   <script src="vendor/dzsparallaxer/dzsparallaxer.js"></script>
   <script src="vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
   <script src="vendor/dzsparallaxer/advancedscroller/plugin.js"></script>

   <!-- Current Page Vendor and Views -->
   <script src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
   <script src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

   <!-- Theme Initialization -->
   <script src="js/theme.js"></script>

   <!-- Custom JS -->
   <script src="js/custom.js"></script>

   <!-- Style Swicher --> 
   <!--<script src="vendor/style-switcher/style.switcher.js" id="styleSwitcherScript" data-base-path="" data-skin-src=""></script>
   <script src="vendor/style-switcher/style.switcher.localstorage.js"></script>-->

   <script type="text/javascript">
      var tpj = jQuery;

      var revapi6;
      tpj(document).ready(function () {
         if (tpj("#rev_slider_6_1").revolution == undefined) {
            revslider_showDoubleJqueryError("#rev_slider_6_1");
         } else {
            revapi6 = tpj("#rev_slider_6_1").show().revolution({
               sliderType: "hero",
               jsFileLocation: "include/rs-plugin/js/",
               sliderLayout: "fullscreen",
               dottedOverlay: "none",
               delay: 9000,
               navigation: {
               },
               responsiveLevels: [1240, 1024, 778, 480],
               visibilityLevels: [1240, 1024, 778, 480],
               gridwidth: [1240, 1024, 778, 480],
               gridheight: [868, 768, 960, 720],
               lazyType: "none",
               parallax: {
                  type: "scroll",
                  origo: "slidercenter",
                  speed: 400,
                  levels: [10, 15, 20, 25, 30, 35, 40, -10, -15, -20, -25, -30, -35, -40, -45, 55],
                  type: "scroll",
               },
               shadow: 0,
               spinner: "off",
               autoHeight: "off",
               fullScreenAutoWidth: "off",
               fullScreenAlignForce: "off",
               fullScreenOffsetContainer: "",
               fullScreenOffset: "",
               disableProgressBar: "on",
               hideThumbsOnMobile: "off",
               hideSliderAtLimit: 0,
               hideCaptionAtLimit: 0,
               hideAllCaptionAtLilmit: 0,
               debugMode: false,
               fallbacks: {
                  simplifyAll: "off",
                  disableFocusListener: false,
               }
            });
         }
      });	/*ready*/
   </script>

   <!-- Master Slider -->
   <script src="sliders/master-slider/classic-sliders/masterslider/masterslider.min.js"></script>
   <script type="text/javascript">

      var slider = new MasterSlider();

      slider.control('arrows', { insertTo: '#masterslider' });
      slider.control('bullets');

      slider.setup('masterslider', {
         width: 1024,
         height: 768,
         space: 5,
         view: 'basic',
         layout: 'fullscreen',
         fullscreenMargin: 0,
         speed: 20
      });

      var slider2 = new MasterSlider();
      slider2.setup('masterslider2', {
         width: 510,
         height: 350,
         space: 5,
         shuffle: true,
         loop: true,
         view: 'basic'
      });

      slider2.control('arrows');
      slider2.control('thumblist', { autohide: false, dir: 'h' });
   </script>

</body>
</html>