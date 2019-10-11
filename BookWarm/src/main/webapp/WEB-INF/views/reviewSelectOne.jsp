<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<%@ include file="includes/header/header-vertex.jsp" %>
</head>
<body style="min-height:0!important;">
<%@ include file="includes/header/header-topnav.jsp"%>
<sec:authentication property="principal.username" var="user_id"/>
	
    <div role="main" class="main">

	<section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                    </div>
                    <div class="col-md-4">
                    	<c:if test="${user_id == review.user_id}">
                        <ul class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="/warm/library?user_id=${user_id}">내 서재</a></li>
                            <li><a href="/warm/reviewMain">감상 메인</a></li>
                            <li><a href="#" class="oper" data-oper='list'>${book.book_title}</a></li>
                            <li class="active">${review.review_title}</li>
                        </ul>
						</c:if>
                    </div>
                </div>
            </div>
     </section>

        <div class="v-page-wrap">
            <div class="container">

                <div class="row">

                    <div class="col-sm-9" style="margin-left:auto; margin-right:auto;">

                        <article>
                            <!-- 첨부이미지가 있는 경우 -->
                            <figure class="animated-overlay overlay-alt" style="margin-bottom:20px">
                                <div class="flexslider thumb-slider">
                                     <ul class="slides uploadResult">
                                       	  <!-- 첨부이미지가 보이는 영역 -->
                                     </ul>
                                </div>
                            </figure>
                            
							<div>
                            <h3 class="blog-post-caption" style="margin-bottom:5px">${review.review_title}</h3>
                            
                            <!-- 게시글 조회 화면에서 수정 / 삭제 / 목록으로 돌아가기 버튼 -->
                            <!-- script를 통해 각각 버튼을 클릭했을 때 다른 action을 취하도록 한다. -->
                            
                            <form id="operForm" action="reviewPerBook" method="get">
                                	<input type='hidden' id='review_no' name='review_no' value='${review.review_no}'>
                                	<input type='hidden' name='user_id' value='${review.user_id}'>
                                	<input type='hidden' name='isbn' value='${review.isbn}'>
                                	<input type='hidden' name='pageNum' value='${cri.pageNum}'>
                                	<input type='hidden' name='amount' value='${cri.amount}'>
                                	
									
									<div class="panel-group" style="position:relative">
										<div class="panel-heading" style="text-align:right; margin-bottom:10px">
											<span class="text ls-1" style="font-size:25px; padding:8px">
												<c:if test="${user_id == review.user_id}">
										  			<a data-toggle="collapse" href="#collapse1" style="color:gray">… </a>
										  		</c:if>
											</span>	
										</div>
										<div id="collapse1" class="collapse" style="position:absolute; right:0; border-radius:5%; text-align:right; background-color:white; box-shadow: 3px 3px 5px lightgrey">
											<div style="padding:5px; border-bottom: 1px solid #F1F3F7">
												<a href="#" class="oper" data-oper='modify' style="margin:8px; color:gray">
													<i class="fa fa-cut"></i>
													수정하기
												</a>
											</div>
											<div style="padding:5px">
												<a href="#" class="oper" data-oper='remove' style="margin:8px; color:gray">
													<i class="fa fa-trash-o"></i>
													삭제하기
												</a>
											</div>
											<div style="padding:5px">
												<button  type="button" class="btn btn-sm close" id="adminMove"><i class="fa fa-star"></i>관리자 이동</button>
											</div>
										</div>
									</div>
                                	
                            </form>
							</div>
                            <div class="post-info clearfix" style="z-index:1">
                                <span class="vcard author">
                                	
                                	<fmt:formatDate var="written_date" value="${review.review_written_date}" pattern="yyyy. MM. dd"/>
                                
                                    <a href="#" class="fn">${review.user_id}</a>님이
                                    <span class="date updated">${written_date}<!-- November 9, 2018 --></span>에 작성한 글입니다.<br>
                                    <a href="/warm/shop/shopproduct?isbn=${review.isbn}">${book.book_title}</a> 
                                    <c:if test="${review.review_ref != 0}">(${review.review_ref}페이지)</c:if>
                                </span>
                            </div>

                            <section class="article-body-wrap">

                                <div class="body-text clearfix pre">${review.review_content}</div>
                                
                                    <!-- 첫 글자만 크게 출력하고 나머지 내용은 보통 글씨로 나오는 형식 -->
                                    <%-- <p>
                                        <span class="dropcap1">${fn:substring(review.review_content,0,2)}</span>
                                        ${fn:substring(review.review_content,2,-1)}
                                    </p> --%>
                                    <%-- <blockquote class="pullquote" style="word-break:break-all;">
                                        <span style="color: #888888; width:90%">
                                            <pre>${review.review_content}</pre>
                                        </span>
                                    </blockquote> --%>

							   <!-- 태그 -->
                               <!--  <div class="tags-link-wrap clearfix">
                                    <div class="tags-wrap">
                                        <span class="font-weight-bold">Tags:</span> <span class="tags">
                                            <a href="#" rel="tag">Illustration</a>,
                                            <a href="#" rel="tag">News</a>
                                        </span>
                                    </div>
                                </div> -->

                            </section>
							
                            <div class="comments-wrap">
                                <h3 class="v-heading cmtCnt"><span></span></h3>
                                <ul class="media-list">
									<!-- 댓글 영역 -->                                    
                                </ul>
	                            <div class="panel-footer">
	                            	 <!-- 댓글 페이지 번호 출력 영역 -->
	                            </div>
                            </div>

                            <div class="post-block-wrap" id="comment-area">

                                <h3 class="v-heading"><span>Leave a comment</span></h3>
                                <form class="co_form" action="/warm/comments/new" method="post">
                                    <div class="form-group">
                                        <div class="row">
                                            <input type="hidden" value="${review.review_no}" class="form-control" name="review_no">
                                            <input type="hidden" value="${user_id}" class="form-control" name="user_id" id="name" readonly>
                                            <div class="col-sm-12">
                                            	<c:choose>
	                                                <c:when test="${empty user_id}">
	                                                	<c:set var="read" value="readonly"/>
	                                            		<c:set var="phText" value="댓글은 로그인한 사용자만 작성할 수 있습니다."/>
	                                            	</c:when>
                                            		<c:when test="${!empty user_id}">
                                            			<c:set var="phText" value="댓글을 입력하세요."/>
                                            		</c:when>
                                            	</c:choose>
                                                	<textarea maxlength="166" rows="10" ${read} placeholder="${phText}" class="form-control" name="content" id="content"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                        	<c:if test="${!empty user_id}">
                                            	<button name="submit" type="submit" id="Button1" class="btn v-btn v-btn-default no-three-d">Post comment</button>
                                            </c:if>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </article>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <!-- jQuery 사용을 위해 cdn 추가 -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- 댓글 처리를 위한 comment.js 추가 -->
    <script type="text/javascript" src = "/warm/resources/Vertex/js/comment.js"></script>
    
    <script type="text/javascript" src = "/warm/resources/js/admin.js"></script>
    <script type="text/javascript" >

		$("#adminMove").on("click",function(){
			let comm_no=${review.review_no};
			alert(comm_no);
			adminService.getReview(comm_no,function(){
			location.reload();
			})
		});
		
		// 첨부파일 가져오기 위한 즉시 실행 함수
		(function() {
			var review_no = '<c:out value="${review.review_no}"/>';
			$.getJSON("/warm/getAttachList", {review_no: review_no}, function(arr) {
				
					var uploadImgs = $(".uploadResult");
					var str = uploadImgs.html() + "";
					
					$(arr).each(function(i, attach) {
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
						str += "<li data-path = '" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "'><a>";
						str += "<img src='/warm/display?fileName=" + fileCallPath + "'>";
						str += "</a>";
						str += "</li>";
					});
					
					uploadImgs.html(str); 
						
			}); // end getJSON
		})(); // end function
	
        $(document).ready(function() {
        	
	    	// 댓글 목록
			var review_no_value = '<c:out value="${review.review_no}"/>';
			var commentUL = $(".media-list");	
			
			// document가 로드되면 댓글 목록 출력
			showList(-1);
			
			// 수정/삭제를 클릭했을 때. UL 클릭시 이벤트 위임.
			commentUL.on("click", "button", function() {
				
				var no = $(this).data("review_cmt_no");
				var oper = $(this).data("oper");
				
				var target = $(this).closest("li");
				var modifiedCmt = target.find("textarea");
				var cmtUser_id = target.find("strong");
				
				if(oper === 'modify') {
					// 'modify' 클릭시
					// 코멘트 내용이 입력 창으로 바뀐다. 즉, p태그 내용이 textarea로 바뀐다.
					// 지금 function이 가리키는 건 버튼. $(this).closest("li").html("");
					
					commentService.get(no, function(data) {
						
						var cmt_str = "";
					
						cmt_str += "	<div><div class='media-body'><strong class='media-heading'>" + data.user_id + "</strong>";
						cmt_str += "		<small class='date'>" + commentService.displayTime(data.review_cmt_written_date) + "</small>";
						cmt_str += "<button data-oper='save'  data-review_cmt_no='" + data.review_cmt_no+"' style='font-size:0.6em; background-color:transparent; border:none'>저장&nbsp;</button>";
						cmt_str += "<button data-oper='cancel'  data-review_cmt_no='" + data.review_cmt_no+"' style='font-size:0.6em; background-color:transparent; border:none'>취소</button>";
						cmt_str += "	</div>";
						cmt_str += "<textarea maxlength='166' class='form-control' name='content' id='content' cols='72' rows='3'>" + data.review_cmt_content + "</textarea>";
						target.html(cmt_str); 
						//$(this).closest("li").html(cmt_str); 
					});
					
				} else if(oper === 'delete') {
					
					commentService.remove(no, cmtUser_id.text(), function(result) {
						
						if(result === 'success')
							alert("댓글을 삭제했습니다.");
						showList(pageNum);
					});
				} else if(oper === 'save') {
					
					if($.trim(modifiedCmt.val()) == '') {
						alert("내용을 입력해주세요.");
					} else {
						commentService.update({
							review_cmt_no : no,
							review_no : review_no_value,
							review_cmt_content : modifiedCmt.val(),
							user_id : cmtUser_id.text()
						}, function(result) {
							if(result === 'success')
								alert("댓글이 수정되었습니다.");
							showList(pageNum);
						});  
					}
					
				} else {
					// 취소 클릭시
					showList(-1);
				}
			}); // end of click event(button mod, del)
			
				
		function showList(page) {
			commentService.getList({review_no:review_no_value, page: page || 1}, function(commentCnt, list) {
					
				if(page == -1) {
					pageNum = Math.ceil(commentCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
				if(list == null || list.length == 0) {
					$(".cmtCnt span").html(commentCnt + " Comments");
					commentUL.html("<p style='color:gray; margin-left:12px'>작성된 댓글이 없습니다.</p>");
					commentPageFooter.html("");
					return;
				}
				
				for(var i=0, len = list.length || 0; i<len; i++) {
						
						
					str += "<li class='media'>";
					str += "	<div><div class='media-body'><strong class='media-heading'>" + list[i].user_id + "</strong>";
					str += "		<small class='date'>" + commentService.displayTime(list[i].review_cmt_written_date) + "</small>";
					
					if(list[i].user_id == '${user_id}') {
						// 로그인한 아이디와 댓글 작성자 아이디가 같아야만 수정/삭제 버튼이 보이도록
					str += "<button data-oper='modify'  data-review_cmt_no='" + list[i].review_cmt_no+"' style='font-size:0.6em; background-color:transparent; border:none'>수정&nbsp;</button>";
					str += "<button data-oper='delete'  data-review_cmt_no='" + list[i].review_cmt_no+"' style='font-size:0.6em; background-color:transparent; border:none'>삭제</button>";
					
					}
					
					str += "	</div>";
					str += "		<p class='pre' style='word-break:break-all; padding:0; color:#444444' data-review_cmt_no='" + list[i].review_cmt_no + "'>" + list[i].review_cmt_content + "</p></div></li>";
					
				}
				// 댓글 수 표시
				$(".cmtCnt span").html(commentCnt + " Comments");
				commentUL.html(str);
				
				showReplyPage(commentCnt);
			}); // end function
		} //end showList
		
		
		// 댓글 페이징 처리
		var pageNum = 1;
		var commentPageFooter = $(".panel-footer");
		
		// commentCnt : 댓글 총 갯수
		function showReplyPage(commentCnt) {
			
			var endNum = Math.ceil(pageNum / 10.0) * 10; // 마지막페이지
			var startNum = endNum - 9; // 보여질 처음 페이지 = 마지막페이지-9
			
			var prev = startNum != 1; // '<<'표시(1~10페이지가 아닌 경우에만 보인다.)
			var next = false; // '>>'표시(처음에는 안 보이게)
			
			if(endNum * 10 >= commentCnt) {
				endNum = Math.ceil(commentCnt/10.0);
			}
			
			if(endNum * 10 < commentCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev) { // 11~20페이지인 경우
				str = "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
			}
			
			for(var i=startNum ; i<=endNum; i++) {
				var active = pageNum == i ? "active" : "";
				str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}
			
			if(next) { // 마지막 페이지들이 아닌 경우
				str = "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
			}
			
			str += "</ul>";
			commentPageFooter.html(str);
		}
		
		// 댓글 페이지 번호 클릭시 새 댓글 가져오기
		commentPageFooter.on("click", "li a", function(e) {
			
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum: " + targetPageNum);
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		
		// comment 폼이 있고, 여기서 받아서 넘겨야하는 값은 댓글작성자id(user_id), 감상글번호(review_no), 댓글내용(review_cmt_content)
		// 등록 버튼을 누르면 commentService.add 함수가 작동해서 내용을 등록하게 되는데, 
		// 등록 후에는 잘 등록되었다는 메시지가 뜨고, 다시 댓글 목록을 갱신하는 것까지.
		
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		
		// Comment Form
		var co_form = $(".co_form");
		var content = co_form.find("textarea[name='content']"); // Comment 내용
		var user_id = co_form.find("input[name='user_id']");	// Comment 작성자
		
		var commentRegisterBtn = $("#Button1"); // Comment 등록버튼
		commentRegisterBtn.on("click", function(e) {
			
			e.preventDefault();
			
			// 댓글이 공백인 경우 체크
			if($.trim(content.val()) == '') {
				alert("내용을 입력해주세요.");
			} else {
				
				var comment = {
					review_cmt_content : content.val(),
					user_id : user_id.val(),
					review_no : review_no_value
				};
				 
				commentService.add(comment, function(result){
					if(result == "success") { alert("댓글이 등록되었습니다."); }
					co_form.find("textarea[name='content']").val("");
					showList(-1);
				});
			}
		}); // end of commentRegisterBtn.onclick
		
		//AJax spring security header - csrf disabled 됐으므로 주석처리
		/* $(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		}); */
		
     }); // end of document.ready
    	
    </script>	
    
    
    	
    	
    <script type="text/javascript">
    	$(document).ready(function() {
    		
    		// 작성한 감상글 수정/삭제, 목록으로 돌아가기
    		
    		var operForm = $("#operForm");
    		/* var opers = operForm.find(".oper"); */
    		var opers = $(".oper");
    		
    		opers.on("click", function(e) {
    			
    			e.preventDefault();
    			
    			var operation = $(this).data("oper");
    			console.log(operation);
    			
    			if(operation === 'remove') {
    				// "삭제하기"
    				// -> 요청할 주소 : delete
    				// -> 넘겨야 하는 정보 : user_id, review_no(해당 게시물을 지우기 위함)
    				//							isbn(삭제 후 reviewPerBook 페이지에서 책 리뷰를 조회하기 위함)
    				operForm.attr("action", "delete");
    				
    			} else if (operation === 'modify') {
    				// "수정하기"
    				// -> 요청할 주소 : modifyReview
    				// -> 넘겨야 하는 정보 : user_id, review_no(해당 게시물을 불러와 수정하기 위함)
    				//							Criteria(pageNum, amount) (들어올 때의 페이지로 돌아가기 위함)
    				operForm.attr("action", "modifyReview");
    			} 
    			
    			// "목록으로"
    			// -> 요청할 주소 : reviewPerBook
    			// -> 넘겨야 하는 정보 : user_id, review_no(해당 게시물을 지우기 위함)
    			//							Criteria(pageNum, amount) (들어올 때의 페이지로 돌아가기 위함)
    			//							isbn(reviewPerBook 페이지에서 책 리뷰를 다시 조회하기 위함)
    			
    			operForm.submit();
    		});
    		
    	});
    </script>
    
               
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


	<script type='text/javascript'>
	    Kakao.init('8df864120cb346a88564c4c65d1b0233');
	    function shareStory() {
	      Kakao.Story.share({
	        url: 'http://localhost:8282/warm/reviewSelectOne?isbn=${review.isbn}&user_id=${review.user_id}&review_no=${review.review_no}#',
	        text: 'BookWarm에서 작성한 리뷰입니다: ${review.review_title}'
	      });
	    }
	</script>

<%@ include file="includes/header/script-vertex.jsp" %>
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>
