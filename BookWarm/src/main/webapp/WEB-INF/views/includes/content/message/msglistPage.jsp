<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>

<style>
#t{
 color: pink;
}

</style>
<body>


	<div role="main" class="main">
		<section class="page-header mb-0">
			            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                        <h1>쪽지함</h1>
                        <span class="tob-sub-title text-color-primary d-block">쪽지왔는지 알림없음 걍 봐야함</span>
                    </div>
                    <a href="/warm/customLogout">로그아웃</a>
                    <!-- <div class="col-md-4">
                        <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="index.html">Shortcodes</a></li>
                            <li class="active">Elemens</li>
                        </ul>
                    </div> -->
                </div>
            </div>
		</section>

		<div class="v-page-wrap mb-0 mt-0">
			<div class="container">
				<div class="row v-right-sidebar-nav">

					<div class="col-sm-3 v-right-sidebar-wrap pt-8">
						<!--Tab-->
						<ul id="myTab" class="nav v-right-sidebar-inner">
							<li><a class="aa" href="#modal-msg" data-toggle="modal" data-target="#modala"
							class="nav v-right-sidebar-inner" >
							<i class="fa fa-edit"></i>쪽지 보내기</a></li>
							
							<li><a href="#counters" id="#counters" data-toggle="tab"
								class="active show"> <i class="fa fa-envelope-o"></i>받은쪽지함
							</a></li>
							<li><a href="#recent-posts" id="#recent-posts" data-toggle="tab"> <i
									class="fa fa-envelope-open-o"></i>보낸쪽지함
							</a></li>
						</ul>
						<!--End Tab-->
					</div>


					<!--Tab Content-->
					<div class="col-sm-9 v-sidebar-content-wrap mb-7 mt-3">
						<div class="tab-content">

							<!--받은쪽지함-->
							<div class="tab-pane fade active show" id="counters">
								<div class="row">
									<div class="col-md-9 left-side-sidebar">
										<h1 style="align-content: center;">받은쪽지함</h1>
										<c:forEach items="${msglist}" var="msglist">
										<fmt:setLocale value="en_US" scope="session"/>
										<fmt:formatDate var="fmt_date" value="${msglist.msg_read_time }" pattern="ddMMM"/>
											<div class="v-blog-recent-post" style="border: 1px solid;  margin: 20px; float:left;width:250px;height:150px ">
												<div class="blog-list-item-date">
													${fn:substring(fmt_date,0,2)}<span>${fn:substring(fmt_date,2,5)}</span>
												</div>
												<div class="blog-list-content">
													<h6 class="special">
														<a id="t" href="#" class="title" data-toggle="modal" data-target="#modalview${msglist.msg_no}" 
														 style="padding-top: 10px;" >
														제목 : ${msglist.msg_title}</a>
													</h6>
													<small>보낸 사람${msglist.msg_send_id}</small>
													<%-- <small>받는 사람 ${msglist.msg_get_id}</small> --%>
													<div class="blog-list-item-excerpt"><p>${msglist.msg_content}</p>
													<a class="bb" href="#modal-msgg" data-toggle="modal" data-target="#modal" data-send_id='${msglist.msg_send_id}'>
													<i class="fa fa-send-o"></i>답장</a>
													<a href="/warm/msgdelete?msg_no=${msglist.msg_no}"><i id="msgd" class="fa fa-close">삭제</i></a>
													
													
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<!--받은쪽지함 끝-->

							<!--보낸 쪽지함-->
							<div class="tab-pane fade" id="recent-posts">
								<div class="row">
									<div class="col-md-9">
										<h1>보낸쪽지함</h1>
										<c:forEach items="${msglist2}" var="msglist2">
										<fmt:setLocale value="en_US" scope="session"/>
										<fmt:formatDate var="fmt_date2" value="${msglist2.msg_send_time }" pattern="ddMMM"/>
										<div class="v-blog-recent-post" style="border: 1px solid;  margin: 20px; float:left;width:250px;height:150px ">
											<div class="blog-list-item-date">
												${fn:substring(fmt_date2,0,2)}<span>${fn:substring(fmt_date2,2,5)}</span>
											</div>
											
											<div class="blog-list-content">
													<h6 class="special">
														<a id="t" href="#" class="title" data-toggle="modal" data-target="#modalview2${msglist2.msg_no}" 
														 style="padding-top: 10px;" >
														제목 : ${msglist2.msg_title}</a>
													</h6>
													<%-- <small>보낸 사람 ${msglist2.msg_send_id}</small> --%>
													<small>받는 사람${msglist2.msg_get_id}</small>
													<div class="blog-list-item-excerpt">
													<p>${msglist2.msg_content}</p>
													<a href="/warm/msgdelete?msg_no=${msglist2.msg_no}"><i id="msgd" class="fa fa-close">삭제</i></a>
												</div>
											</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!--보낸쪽지함 끝 -->
					</div>
					<!--End Tab Content-->
				</div>
			</div>
		</div>
	</div>
	
<!-- 모달창 -->
<!-- 답장하기 모달창  -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline" style="width:100px" >
						<form id="replyModal" action="/warm/send">
								보낸사람<input name="msg_send_id" type="text" value="${user_id}" readonly><br><br>
								<div id="temp">
								받는 사람<input name="msg_get_id" value="" readonly><br><br>
								</div>
								 제목 <input name="msg_title" type="text" value="" style="padding-top: 10px"><br><br>
						  		<textarea name="msg_content" style="width:400px; height:300px;"></textarea><br>
						  
						  <input id="sendd" type="submit" value="보내기">
						 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</form>
				</div>
            </div>
        </div>
    </div>
</div>

<!-- 쪽지보내기모달창 -->
<div class="modal fade" id="modala" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline" style="width:100px" >
						<form action="/warm/send">
								보낸사람<input name="msg_send_id" type="text" value="${user_id}" readonly><br><br>
								받는 사람<input name="msg_get_id" type="text"><br><br>
								 제목 <input name="msg_title" type="text" ><br><br>
						  		<textarea name="msg_content" style="width:400px; height:300px;"></textarea><br>
						  <input id="sendd" type="submit" value="보내기">
						 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</form>
				</div>
            </div>
        </div>
    </div>
</div>

<!-- 제목눌렀을때 내용 불러오는 모달창  -->
<c:forEach items="${msglist}" var="msglist">
<div class="modal fade" id="modalview${msglist.msg_no}" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline" style="width:100px" >
						<div id="titletemp">
								<fmt:formatDate var="fmt_date3" value="${msglist.msg_read_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
								제목<input name="msg_title" type="text" value="${msglist.msg_title}" readonly><br><br>
								보낸사람<input name="msg_send_id" type="text" value="${msglist.msg_send_id}" readonly><br><br>
								날짜<input name="msg_read_time" type="text" value="${fmt_date3}" readonly><br><br>
								내용<textarea name="msg_content" style="width:400px; height:200px;" readonly>${msglist.msg_content}</textarea><br> 
						 		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
				</div>
            </div>
        </div>
    </div>
 </div>
 </c:forEach>
 <!-- 받은쪽지에서 제목눌렀을때 모달 끝  -->
 
 <!-- 보낸쪽지 제목 눌렀을때 모달창 -->
<c:forEach items="${msglist2}" var="msglist2">
<div class="modal fade" id="modalview2${msglist2.msg_no}" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline" style="width:100px" >
						<div id="titletemp">
								<fmt:formatDate var="fmt_date4" value="${msglist2.msg_read_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
								제목<input name="msg_title" type="text" value="${msglist2.msg_title}" readonly><br><br>
								보낸사람<input name="msg_send_id" type="text" value="${msglist2.msg_send_id}" readonly><br><br>
								날짜<input name="msg_read_time" type="text" value="${fmt_date4}" readonly><br><br>
								내용<textarea name="msg_content" style="width:400px; height:200px;" readonly>${msglist2.msg_content}</textarea><br> 
						 		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
				</div>
            </div>
        </div>
    </div>
 </div>
 </c:forEach>
 
</div>
<!-- 메인끝  -->


	<!-- Libs -->
<!-- 	<script src="js/jquery.min.js"></script>
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
	<script src="js/theme.init.js"></script> -->

	<script>
		$(document).ready(function() {
			/* $('a[href=' + window.location.hash + ']').tab('show'); */
		
			/* 답장하기 눌렀을때 send_id 가져오기 */
			$(".bb").on("click", function() {
				
				//alert($(this).data("send_id"));
				var sendId = $(this).data("send_id");
				var temp = $("#temp");
				var str = '';
				str += "받는 사람<input name='msg_get_id' type='text' value='" + sendId + "' readonly><br><br>"
				/* alert(str);
				alert(temp.html); */
				temp.html(str);
			});
			
		});
	</script>
</body>
</html>