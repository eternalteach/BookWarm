<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>


<!DOCTYPE html>
<html lang="UTF-8">
<head>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/warm/resources/js/Criteria.js"></script>
<script type="text/javascript" src="/warm/resources/js/msg.js"></script>
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
							<li><a class="aa" href="#modal-msg" data-toggle="modal" data-target="#modala" class="nav v-right-sidebar-inner"><i class="fa fa-edit"></i>쪽지 보내기</a></li>
							<li><a href="#counters" id="#counters" data-toggle="tab" class="active show"> <i class="fa fa-envelope-o"></i>받은쪽지함</a></li>
							<li><a href="#recent-posts" id="#recent-posts" data-toggle="tab"><i class="fa fa-envelope-open-o"></i>보낸쪽지함</a></li>
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
									 	<div id="getMSG">
									 	<!-- 받은쪽지 리스트 불러오기  -->
										</div>
												
											<!-- 페이징 -->
											<div class="row col-lg-12">
												<div class="panel-footer center msgPaging"></div>
											</div>
										</div>
									</div>
								</div>
							<!--받은쪽지함 끝-->
							
							

							<!--보낸 쪽지함-->
							<div class="tab-pane" id="recent-posts">
								<div class="row">
									<div class="col-md-9">
										<h1>보낸쪽지함&ensp;${msgcount2}개</h1>
										<div id="sendMSG">
										<!-- 보낸쪽지 리스트 불러오기  -->
										</div>

											<!-- 페이징 -->
											<div class="row col-lg-12">
												<div class="panel-footer center msgPaging2"></div>
											</div>
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



<!-- 답장하기 모달창  -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline" style="width:100px" >
						<form id="replyModal" action="/warm/send">
								<h1>답장하기</h1>
								보낸사람<input id="send_id" name="msg_send_id" type="text" value="${user_id}" readonly><br><br>
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


	<script>
		$(document).ready(function() {
			
			//받은페이징
			var msgPageNum = 1;
			var msgPaging = $(".msgPaging");
			var total = ${total};
			pagingService.paging(msgPageNum,total,msgPaging);
			var msgtable = $("#getMSG");
			showmsgboard(-1);
			
			function showmsgboard(page){
				msgservice.msgpaging(page,function(msglist){
					if(page==-1){
						msgPageNum==Math.ceil(total/10.0);
						showmsgboard(msgPageNum);
						return;
					}
					let msghtml ="";
					if(msglist==null || msglist.length==0){
						return;
					}
					 for(var i=0, len=msglist.length||0;i<len;i++){
						 msghtml+="<div class='v-blog-recent-post' style='border: 1px dashed #bcbcbc; margin: 20px; float:left;width:250px;height:150px'>";
						 var date = new Date(msglist[i].msg_read_time);
						 var month = date.getMonth()+1;
						 var date = date.getDate();
						 msghtml+="<div class='blog-list-item-date' style='margin-left: 10px;margin-top: 10px;'>"+date+"<span>"+month+"</span></div>";
						 msghtml+="<div class='blog-list-content' style='margin-top: 10px;'><h6 class='special' style='text-overflow: ellipsis;overflow: hidden; white-space: nowrap; width:80px;'>";
						 msghtml+="<a id='t' href='#' class='title' data-toggle='modal' data-target='#modalview"+msglist[i].msg_no+"' style='padding-top: 10px;'>"+msglist[i].msg_title+"</a></h6>";
						 msghtml+="<small>보낸 사람"+msglist[i].msg_send_id+"</small>";
						 msghtml+="<small id='sendperson' value="+msglist[i].msg_get_id+">받는 사람 "+msglist[i].msg_get_id+"</small>";
						 msghtml+="<div class='blog-list-item-excerpt'<p style='text-overflow: ellipsis;overflow: hidden; white-space: nowrap; width:70px' >"+msglist[i].msg_content+"</p></div>";
						 msghtml+="<div class='box' style='padding-bottom: 20px;'>";
						 msghtml+="<a class='bb' href='#modal-msgg' data-toggle='modal' data-target='#modal' data-send_id="+msglist[i].msg_send_id+">"
						 msghtml+="<i class='icon-baloon'></i>답장</a>"	
						 msghtml+="<a id='del' href='#' data="+msglist[i].msg_no+"><i class='icon-bin-2' >삭제</i></a>"
						 msghtml+="<i class='icon-skull-1'><a>신고</a></i></div></div></div>"
				}
					 msgtable.html(msghtml);
					 pagingService.paging(msgPageNum,total,msgPaging);
				});
			}
			msgPaging.on("click","li a",function(e){
				e.preventDefault();
				console.log("page click");
				let targetPageNum=$(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				msgPageNum=targetPageNum;
				showmsgboard(msgPageNum);
			});
			//쪽지삭제
			$("#getMSG").on("click", "#del", function(e) {
				var sendidid = $(this).attr("data");
				
				//var sendperson = $("small[id='sendperson']").val();
				var sendperson = $("#sendperson").html();
				
				alert(sendperson);
				
				msgservice.msgdelete(sendidid, sendperson, function(count){
						if(count === "success"){
							alert("받은쪽지삭제")
							showmsgboard(msgPageNum);
					}
				});
			});
		/* 받은쪽지 END  */
			
			//보낸쪽지함
			var msgPageNum2 = 1;
			var msgPaging2 = $(".msgPaging2");
			var total2 = ${total2};
			pagingService.paging(msgPageNum2,total2, msgPaging2);
			var msgtable2 = $("#sendMSG");
			showmsgboard2(-1);
			
			function showmsgboard2(page){
				msgservice.msgpaging2(page,function(msglist2){
					if(page==-1){
						msgPageNum2==Math.ceil(total/10.0);
						showmsgboard2(msgPageNum2);
						return;
					}
					let msghtml2 ="";
					if(msglist2==null || msglist2.length==0){
						return;
					}
					 for(var i=0, len=msglist2.length||0;i<len;i++){
						 msghtml2+="<div class='v-blog-recent-post'>";
						 var date = new Date(msglist2[i].msg_read_time);
						 var month = date.getMonth()+1;
						 var date = date.getDate();
						 msghtml2+="<div class='blog-list-item-date'>"+date+"<span>"+month+"</span></div>";
						 msghtml2+="<div class='blog-list-content'><h6 class='special'>";
						 msghtml2+="<a id='t' href='#' class='title' data-toggle='modal' data-target='#modalview2"+msglist2[i].msg_no+"'>"+msglist2[i].msg_title+"</a></h6>";
						
						 msghtml2+="<small id='sendperson2'>보낸 사람"+msglist2[i].msg_send_id+"</small>";
						 
						 msghtml2+="<small>받는 사람 "+msglist2[i].msg_get_id+"</small>";
						 msghtml2+="<div class='blog-list-item-excerpt'<p>"+msglist2[i].msg_content+"</p></div>";
						 msghtml2+="<div class='box' style='padding-bottom: 20px;'>"
						 msghtml2+="<a class='bb' href='#modal-msgg' data-toggle='modal' data-target='#modal' data-send_id="+msglist2[i].msg_send_id+">"
						 msghtml2+="<a id='del2' href='#' data="+msglist2[i].msg_no+"><i class='icon-bin-2' >삭제</i></a>"
						 msghtml2+="</div></div></div>"
				}
					 msgtable2.html(msghtml2);
					 pagingService.paging(msgPageNum2,total2,msgPaging2);
				});
			}
			
			msgPaging2.on("click","li a",function(e){
				e.preventDefault();
				let targetPageNum=$(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				msgPageNum2=targetPageNum;
				showmsgboard2(msgPageNum2);
			});
			
			
			$("#sendMSG").on("click", "#del2", function(e) {
				var sendidid2 = $(this).attr("data");
				var sendperson2 = $("#sendperson2").html();
				alert(sendperson2);
				
				msgservice.msgdelete2(sendidid2, sendperson2, function(count){
						if(count === "success"){
							alert("보낸쪽지삭제")
							showmsgboard2(msgPageNum2);
					}
				});
			});
			
			
			
			
			
			
			
			/* 답장하기 눌렀을때 send_id 가져오기 */
			$("#getMSG").on("click", ".bb", function(e) {
				var sendId = $(this).data("send_id");
				var temp = $("#temp");
				var str = '';
				str += "받는 사람<input name='msg_get_id' type='text' value='" + sendId + "' readonly><br><br>"
				/* alert(str);
				alert(temp.html); */
				temp.html(str);
			});
	
			/* 쪽지보내기 유효성검사 */
				$("#sendsend").on("click", function(e){
					e.preventDefault();
					var get = $("input[id='gett']").val();
					var title = $("input[id='titlee']").val();
					var content =$("textarea[id='contentt']").val();
					var formm = $("form[name='my_form']");
					console.log("sendsend");
					
		if (confirm("보내시겠습니까?") == true){   
			
					if($.trim(get) == ""){			       
						alert("받는 사람을 입력하세요");
						return false;
					}else if($.trim(title) == ""){
						alert("제목을 입력하세요");
						return false;
					}else if($.trim(content) == ""){
						alert("내용을 입력하세요");
						return false;
					};
					
					    formm.submit();
		}else{  
			return false;
			}
				
		});		
			
			/* 답장하기 유효성 검사  */
			$("#sendsubmit").on("click", function(e){
				e.preventDefault();
				
				var formsubmit = $("form[id='replyModal']");
				var titlesubmit = $("input[id='titlesubmit']").val();
				var contentsubmit = $("textarea[id='contentsubmit']").val();
				console.log("sendsubmit");
				
				if (confirm("보내시겠습니까?") == true){    //확인
					if($.trim(titlesubmit) == "") {
						alert("제목을 입력하세요");
						return false;
					}else if($.trim(contentsubmit) == ""){
						alert("내용을 입력하세요");
						return false
					};
					
					formsubmit.submit();
				}else{   //취소
					return false;
				}
			});
		
		});
	</script>
</body>
</html>