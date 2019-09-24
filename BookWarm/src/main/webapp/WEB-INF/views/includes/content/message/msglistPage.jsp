<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>

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
							<li><a class="aa" href="#modal-msg" data-toggle="modal" data-target="#modal"
							class="nav v-right-sidebar-inner" >
							<i class="fa fa-star-o"></i>쪽지 보내기</a></li>
							
							<li><a href="#counters" data-toggle="tab"
								class="active show"> <i class="fa fa-star-o"></i>받은쪽지함
							</a></li>
							<li><a href="#recent-posts" data-toggle="tab"> <i
									class="fa fa-calendar"></i>보낸쪽지함
							</a></li>
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
										<fmt:formatDate var="fmt_date" value="${vo.review_written_date}" pattern="ddMMM"/>
											<div class="v-blog-recent-post">
												<div class="blog-list-item-date">
													03<span>Mar</span>
												</div>
												<div class="blog-list-content">
													<h6 class="special">
														<a href="#">제목 : ${msglist.msg_title}</a>
													</h6>
													<small>보낸 사람${msglist.msg_send_id}</small>
													<small>받는 사람 ${msglist.msg_get_id}</small>
													<div class="blog-list-item-excerpt">
														<p>내용 : ${msglist.msg_content}</p>
														<a class="aa" href="#modal-msg" data-toggle="modal" data-target="#modal">
													답장하기</a>
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
										<c:forEach items="${msglist2}" var="msglist2">
										<div class="v-blog-recent-post">
											<div class="blog-list-item-date">
												03<span>Mar</span>
											</div>
											<!-- <div class="blog-list-content">
												<h6 class="special">
													<a href="#" title="Youtube Post">Full Width Media Post</a>
												</h6>
												<small>2 Comments</small>
												<div class="blog-list-item-excerpt">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Aliquam bibendum, libero eu rutrum feugiat, urna
														orci porta, Lorem ipsum dolor sit amet, consectetur
														adipiscing elit</p>
													<a class="aa" href="#modal-msg" data-toggle="modal" data-target="#modal">
													<img class="read-more">답장하기
													</a>
												</div>
											</div> -->
											<div class="blog-list-content">
													<h6 class="special">
														<a href="#">제목 : ${msglist2.msg_title}</a>
													</h6>
													<small>보낸 사람 ${msglist2.msg_send_id}</small>
													<small>받는 사람${msglist2.msg_get_id}</small>
													<div class="blog-list-item-excerpt">
														<p>내용 : ${msglist2.msg_content}</p>
												</div>
										</div>
									</div>
									</c:forEach>
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
	
<!-- 모달창 -->
<div class="modal fade" id="modal${UserBooks.isbn}" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline" style="width:100px" >
					<div class="aa">
						<form action="/warm/send">
						보낸사람<input name="msg_send_id" type="text" value="${user_id}" readonly><br><br>
						  받는 사람<input name="msg_get_id" type="text"><br><br>
						 제목 <input name="msg_title" type="text"><br><br>
						  <textarea name="msg_content" style="width:400px; height:300px;"></textarea><br>
						  <input type="submit" value="보내기">
						 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</form>
					</div>
				</div>
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
		$(document).ready(function() {
			$('a[href=' + window.location.hash + ']').tab('show');
		});
		
		
		
		
		
		
		
	</script>
</body>
</html>