<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>
<!-- 
<style>
#t{
 color: pink;
}

</style> -->
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
								class="active show"> <i class="fa fa-envelope-o"></i>받은쪽지함</a></li>
							<li><a href="#recent-posts" id="#recent-posts" data-toggle="tab"> <i class="fa fa-envelope-open-o"></i>보낸쪽지함</a></li>
						</ul>
						<!--End Tab-->
					</div>


					<!--Tab Content-->
					<div class="col-sm-9 v-sidebar-content-wrap mb-7 mt-3">
						<div class="tab-content">

							<!--받은쪽지함-->
							<div class="tab-pane active" id="counters">
								<div class="row">
									<div class="col-md-9 left-side-sidebar">
										<h1>받은쪽지함&ensp;${msgcount}개</h1>
										<c:forEach items="${msglist}" var="msglist">
										<fmt:setLocale value="en_US" scope="session"/>
										<fmt:formatDate var="fmt_date" value="${msglist.msg_read_time }" pattern="ddMMM"/>
											<div class="v-blog-recent-post" style="border: 1px dashed #bcbcbc; margin: 20px; float:left;width:250px;height:150px ">
												<div class="blog-list-item-date" style="margin-left: 10px;margin-top: 10px;">
													${fn:substring(fmt_date,0,2)}<span>${fn:substring(fmt_date,2,5)}</span>
												</div>
												<div class="blog-list-content" style="margin-top: 10px;">
													<h6 class="special" style="text-overflow: ellipsis;overflow: hidden; white-space: nowrap; width:80px;">
														<a id="t" href="#" class="title" data-toggle="modal" data-target="#modalview${msglist.msg_no}" 
														 style="padding-top: 10px;" >
														 
														${msglist.msg_title}</a>
													</h6>
													<small>보낸 사람${msglist.msg_send_id}</small>
													<%-- <small>받는 사람 ${msglist.msg_get_id}</small> --%>
													<div class="blog-list-item-excerpt"><p style="text-overflow: ellipsis;overflow: hidden; white-space: nowrap; width:70px" >${msglist.msg_content}</p>
													</div>
													
													<div class="box" style="padding-bottom: 20px;">
													<a class="bb" href="#modal-msgg" data-toggle="modal" data-target="#modal" data-send_id='${msglist.msg_send_id}'>
													<i class="icon-baloon"></i>답장</a>
													
													<a href="/warm/msgdelete?msg_no=${msglist.msg_no}"><i id="msgd" class="icon-bin-2">삭제</i></a>
													<i class="icon-skull-1"><a>신고</a></i>
													</div>
												
													</div>
												</div>
												</c:forEach>
											</div>
									</div>
								</div>
							<!--받은쪽지함 끝-->

							<!--보낸 쪽지함-->
							<div class="tab-pane" id="recent-posts">
								<div class="row">
									<div class="col-md-9">
										<h1>보낸쪽지함&ensp;${msgcount2}개</h1>
										<c:forEach items="${msglist2}" var="msglist2">
										<fmt:setLocale value="en_US" scope="session"/>
										<fmt:formatDate var="fmt_date2" value="${msglist2.msg_send_time }" pattern="ddMMM"/>
										<div class="v-blog-recent-post" style="border: 1px dashed blue; margin: 20px; float:left;width:250px;height:150px ">
											<div class="blog-list-item-date">
												${fn:substring(fmt_date2,0,2)}<span>${fn:substring(fmt_date2,2,5)}</span>
											</div>
											
											<div class="blog-list-content" style="margin-top: 10px;">
													<h6 class="special" style="color: pink; text-overflow: ellipsis;overflow: hidden; white-space: nowrap; width:80px;">
														<a id="t" href="#" class="title" data-toggle="modal" data-target="#modalview2${msglist2.msg_no}" 
														 style="padding-top: 10px;" >
														제목 : ${msglist2.msg_title}</a>
													</h6>
													<%-- <small>보낸 사람 ${msglist2.msg_send_id}</small> --%>
													<small>받는 사람${msglist2.msg_get_id}</small>
													<div class="blog-list-item-excerpt">
													<p style="text-overflow: ellipsis;overflow: hidden; white-space: nowrap; width:70px" >${msglist2.msg_content}</p>
													<a href="/warm/msgdelete?msg_no=${msglist2.msg_no}&tab_name=recent-posts"><i id="msgd" class="fa fa-close">삭제</i></a>
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
								<h1>답장하기</h1>
								보낸사람<input name="msg_send_id" type="text" value="${user_id}" readonly><br><br>
								<div id="temp">
								받는 사람<input name="msg_get_id" value="" readonly><br><br>
								</div>
								 제목 <input id="titlesubmit" name="msg_title" type="text" value="" style="padding-top: 10px"><br><br>
						  		<textarea id="contentsubmit" name="msg_content" style="width:400px; height:300px;"></textarea><br>
						  
						  <input id="sendsubmit" type="submit" value="보내기">
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
						<form action="/warm/send" name="my_form">
								<h1>쪽지보내기</h1>
								보낸사람<input id=sendd name="msg_send_id" type="text" value="${user_id}" readonly><br><br>
								받는 사람<input id=gett name="msg_get_id" type="text"><br><br>
								 제목 <input id=titlee name="msg_title" type="text" ><br><br>
						  		<textarea id=contentt name="msg_content" style="width:400px; height:300px;"></textarea><br>
						  <input id="sendsend" type="submit" value="보내기" onsubmit="return checkForm();">
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
								<h1>받은쪽지</h1>
								<fmt:formatDate var="fmt_date3" value="${msglist.msg_read_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
								보낸사람<input name="msg_send_id" type="text" value="${msglist.msg_send_id}" readonly><br><br>
								날짜<input name="msg_read_time" type="text" value="${fmt_date3}" readonly><br><br>
								제목<input name="msg_title" type="text" value="${msglist.msg_title}" readonly><br><br>
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
								보낸사람<input name="msg_send_id" type="text" value="${msglist2.msg_send_id}" readonly><br><br>
								날짜<input name="msg_read_time" type="text" value="${fmt_date4}" readonly><br><br>
								제목<input name="msg_title" type="text" value="${msglist2.msg_title}" readonly><br><br>
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

 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
		
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
			/* 답장하기 아이디 가져오기 */
				
			/* 새로고침시 유지 */
			if('${tab_name}' != '') {
				$("a[href=#${tab_name}]").get(0).click();
			};
			/* 끝 */
			
			/* 쪽지보내기 유효성검사 */
				$("#sendsend").on("click", function(e){
					
					e.preventDefault();
					var get = $("input[id='gett']").val();
					var title = $("input[id='titlee']").val();
					var content =$("textarea[id='contentt']").val();
					var formm = $("form[name='my_form']");
					console.log("sendsend");
					
					if(get == "" || get == null){			       
						alert("받는 사람을 입력하세요");
						return false;		
					}else if(title == ""){
						alert("제목을 입력하세요");
						return false
					}else if(content == ""){
						alert("내용을 입력하세요");
						return false
					};
					formm.submit();
				});		
			/* 쪽지보내기 유효성검사 끝 */
			
			/* 답장하기 유효성 검사  */
			$("#sendsubmit").on("click", function(e){
				
				e.preventDefault();
				
				var formsubmit = $("form[id='replyModal']");
				var titlesubmit = $("input[id='titlesubmit']").val();
				var contentsubmit = $("textarea[id='contentsubmit']").val();
				console.log("sendsubmit");
				
				if(titlesubmit == "") {
					alert("제목을 입력하세요");
					return false;
				}else if(contentsubmit == ""){
					alert("내용을 입력하세요");
					return false
				};
					formsubmit.submit();
			});
			/* 답장하기 유효성 검사 끝  */			
			
		});
	</script>
</body>
</html>