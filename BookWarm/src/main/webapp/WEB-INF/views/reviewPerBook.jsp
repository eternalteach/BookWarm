<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="./includes/header/header-from-vertex.jsp" %>
    
	

    
    <div role="main" class="main">

        <section class="page-header" style="margin-bottom:10px">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                        <span class="tob-sub-title text-color-primary d-block">OUR FEATURES</span>
                        <h1>Blog Standard</h1>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="col-md-4">
                        <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="./resources/Vertex/index.html">Home</a></li>
                            <li><a href="./resources/Vertex/index.html">blog</a></li>
                            <li class="active">Blog Standard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <div class="v-page-wrap has-left-sidebar has-one-sidebar" style="margin-top:0px">
            <div class="container">
                <div class="row">

                    

                    <aside class="sidebar left-sidebar col-sm-3" style="margin-top:20px">
                    
                    	<!-- 사이드바에 해당 책 이미지와 책 제목+작가 띄워보기. -->
                    	
                    	<section>
                            <div>
                                <ul>
                                    <li>
                                    	<a href="#">
                                			<img src="${thumbnail.book_img}" style="display:block; margin:auto">
                            			</a>
                            		</li>
                                    <li style="text-align:center; margin:5px">${thumbnail.book_title}</li>
                                    <li style="text-align:center">${thumbnail.writer_name}</li>
                                </ul>
                            </div>
                            
                    	</section>
                    
                    
                    
                        <section class="widget v-search-widget clearfix">
                            <form role="search" method="get" id="searchform" class="searchform" action="#">
                                <div class="form-group">
                                    <input class="form-control" type="text" value="" name="s" id="s" placeholder="Search" />
                                </div>
                            </form>
                        </section>
                        

                        <!-- <section class="widget widget_sf_recent_custom_comments clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>Recent Comments</span></h4>
                            </div>
                            <ul class="recent-comments-list">

                                <li class="comment">
                                    <div class="comment-wrap clearfix">
                                        <div class="comment-avatar">
                                            <img src="./resources/Vertex/img/team/t3.png" class="avatar" height="100" width="100" />
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-body">
                                                <a href="./resources/Vertex/blog-standard-post.html#comments">
                                                    <p>Praesent eros mauris dolor</p>
                                                </a>
                                            </div>
                                            <div class="comment-meta">
                                                <span class="comment-author">Vertex</span> <span class="comment-date">20 hours ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="comment">
                                    <div class="comment-wrap clearfix">
                                        <div class="comment-avatar">
                                            <img src="./resources/Vertex/img/team/t1.png" class="avatar" height="100" width="100" />
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-body">
                                                <a href="./resources/Vertex/blog-standard-post.html#comments">
                                                    <p>Omnis iste natus error sit dolor </p>
                                                </a>
                                            </div>
                                            <div class="comment-meta">
                                                <span class="comment-author">Guest</span> <span class="comment-date">5 hours ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="comment">
                                    <div class="comment-wrap clearfix">
                                        <div class="comment-avatar">
                                            <img src="./resources/Vertex/img/team/t4.png" class="avatar" height="100" width="100" />
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-body">
                                                <a href="./resources/Vertex/blog-standard-post.html#comments">
                                                    <p>Sed tellus ante aliquam eget</p>
                                                </a>
                                            </div>
                                            <div class="comment-meta">
                                                <span class="comment-author">Admin</span> <span class="comment-date">2 days ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </section> -->

                        <section class="widget v-tag-cloud-widget clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>Tags</span></h4>
                            </div>
                            <div class="tagcloud">
                                <ul class='wp-tag-cloud'>
                                    <li><a href="#">CSS 3</a></li>
                                    <li><a href="#">HTML 5</a></li>
                                    <li><a href="#">Lifestyle</a></li>
                                    <li><a href="#">Mobile</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">PHP</a></li>
                                    <li><a href="#">Social</a></li>
                                    <li><a href="#">video</a></li>
                                    <li><a href="#">WordPress</a></li>
                                </ul>
                            </div>
                        </section>
                    </aside>
					<div class="col-sm-9 v-blog-wrap">

                        <div class="v-blog-items-wrap blog-standard">

                            <ul class="v-blog-items row standard-items clearfix">
                            
                            <!-- 감상 작성 버튼 추가 -->
                            <li class="col-sm-12" style="margin-top:10px">
                            	<div class="pull-right">
                            	
                            	<a class="btnPerBook" href="/warm/reviewWrite?isbn=${list[0].isbn}&user_id=${list[0].user_id}">
		                            	<span class="text ls-1">
		                            		감상 더하기
			                                <i class="icon icon-pen-3"></i>
		                            	</span>
                            	</a><br>
                            	<a class="btnPerBook" href="/warm/reviewWrite?isbn=${list[0].isbn}&user_id=${list[0].user_id}">
		                            	<span class="text ls-1">
		                            		서재로 돌아가기
		                            		<i class="fa fa-book"></i>
		                            	</span>
                            	</a><br>
                            	</div>
                            </li>
                            
                            <!-- 8/28 책별 감상 뿌리기 -->
                            <c:forEach items="${list}" var="vo">
                            
	                        <!-- 8/29 날짜 형식 변환: 달을 영어로 출력하기 위해 언어 변경, format을 필요 데이터만 필요한 형태로 변환 -->    
	                        <fmt:setLocale value="en_US" scope="session"/>
                            <fmt:formatDate var="fmt_date" value="${vo.review_written_date}" pattern="ddMMM"/>
                            <!-- 		작성일 혹은 수정일을 쪼개서 형식에 맞게 넣기 위한 c태그 추가 -->
                            <c:set var="tmp_date" value="${fmt_date}"/>
                            
								<li class="v-blog-item col-sm-12" style="margin-top:20px">
									
                                    <div class="post-content no-thumb clearfix">

                                        <div class="v-post-date pull-left">
                                            <span class="day">${fn:substring(tmp_date,0,2)}</span> <!-- 가져온 날짜 중 일에 해당하는 숫자 -->
                                            <span class="month">${fn:substring(tmp_date,2,5)}</span>
                                            <div class="like-holder like-button"><i class="fa fa-heart"></i>18</div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
                                                <%-- <h2 class="title"><a href="/warm/reviewSelectOne?user_id=${vo.user_id}&review_no=${vo.review_no}&isbn=${vo.isbn}">${vo.review_title}</a></h2> --%>
												
												<h2 class="title"><a class="move" href="${vo.review_no}">${vo.review_title}</a></h2>
												
                                                <div class="post-meta-info">
                                                    <span class="blog-author minor-meta">
                                                        	글쓴이
                                                        <span class="entry-author-link">
                                                            <span class="vcard author">
                                                                <span class="v-blog-item-details">
                                                                    <a href="#" title="Posts by HB-Themes" rel="author">${vo.user_id}</a>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </span>
                                                    <span class="text-sep">|</span>

                                                    <span class="blog-categories minor-meta">
                                                        <a href="#">${vo.review_modify_date}
                                                        <c:if test="${vo.review_modify_date != vo.review_written_date}">
                                                        	(수정됨)
                                                        </c:if>
                                                        </a> <span class="text-sep">|</span>

                                                        <span class="comment-container minor-meta" id="${vo.review_no}">
                                                            <!-- 댓글 수가 입력될 공간 -->
                                                   		</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p>
                                                    ${vo.review_content}
                                                </p>
                                            </div>
                                            <a class="btn v-btn standard white" style="float:right" href="/warm/reviewSelectOne?user_id=${vo.user_id}&review_no=${vo.review_no}&isbn=${vo.isbn}">
                                                <i class="icon-arrow-32" style="font-size:11px"></i><span class="text"> Read more</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                
							</c:forEach>                                

                            </ul>

                            <nav aria-label="...">
                                <ul class="pagination">
                                	
                                	 <!-- 책은 prev데이터가 없으면 아예 버튼을 노출하지 않는 거고,
                                	 여기서는 prev 데이터가 없으면 클릭이 되지 않게 만든 것. -->
                                	 
                                	 	<!-- 이렇게 하면 prev 데이터가 없을 때 previous가 비활성화되기만 함. -->
	                                    <%-- <li class="page-item ${pageMaker.prev ? "":"disabled"} ">
	                                        <a  class="page-link" href="${pageMaker.startPage-1}">
		                                        Previous
		                                    </a>
	                                    </li> --%>
                                	 
                                	 
                                	<c:if test="${pageMaker.prev}">
	                                    <li class="page-item">
	                                        <a class="page-link" href="${pageMaker.startPage-1}">
		                                        Previous
		                                    </a>
	                                    </li>
                                	</c:if>
                                	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                	
	                                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
	                                    
	                                    <!-- <li class="page-item active">
	                                        <span class="page-link">
	                                            2
	                                            <span class="sr-only">(current)</span>
	                                        </span>
	                                    </li> -->
	                                    
                                	</c:forEach>
                                    
                                    <c:if test="${pageMaker.next}">
	                                    <li class="page-item">
		                                    <a class="page-link" href="${pageMaker.endPage+1}">
		                                        Next
		                                    </a>
	                                    </li>
                                	</c:if> 
                                	
                                	<form id="actionForm" action="/warm/reviewPerBook" method="get">

                                		<input type="hidden" name="isbn" value="${list[0].isbn}">
                                		<input type="hidden" name="user_id" value="${list[0].user_id}">
                                		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                		
                                	</form>
                                	
                                </ul>
                            </nav>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
        	$(document).ready(function() {
        		
        		/* function encode(url) {
        			return encodeURIComponent(url);
        		}
        		
        		var tt = document.getElementById('aa').src;
        		console.log(tt);
        		console.log("전: " + tt);
        		
				document.getElementById('aa').src = '/warm/display?fileName=' + encodeURIComponent(tt);
				
				console.log("후: " + tt);
				
				var fileCallPath = encodeURIComponent("${img.uploadPath}" + "/" + "${img.uuid}" + "_" + "${img.fileName}");
				console.log(fileCallPath); */
        		
				
				
        		var actionForm = $("#actionForm");
        		
        		$(".page-link").on("click", function(e) {
        			
        			e.preventDefault();
        			
        			console.log('click');
        			
        			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        			actionForm.submit();
        		 });
        		
        		
        		$(".move").on("click", function(e) {
        			
        			e.preventDefault();
        			
        			actionForm.append("<input type='hidden' name='review_no' value='"+$(this).attr("href")+"'>");
        			actionForm.attr("action", "/warm/reviewSelectOne");
        			actionForm.submit();
        		}); 
        		
        		
        		/* var result = '<c:out value="${result}"/>';
        		
        		checkModal(result);
        		
        		history.replaceState({}, null, null);
        		
        		function checkModal(result) {
        			
        			if(result === '' || history.state) {
        				return;
        			}
        			
        			if(parseInt(result) > 0) {
        				$(".modal-body").html(
        						"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
        			}
        			
        			$("#myModal").modal("show");
        		}
        		
        		$("#regBtn").on("click", function() {
        			self.location = "/board/register";
        		}); */
        		
        	});
        </script>
        
    <!-- 댓글 처리를 위한 comment.js 추가 -->
    <script type="text/javascript" src = "/warm/resources/Vertex/js/comment.js"></script>
    
    <script>
    	
    	// 댓글 수를 표시하기 위한 즉시실행함수.
    	var cmtCntArr = $(".comment-container");
    	(function() {
    		$(cmtCntArr).each(function(i, cmt) {
    			var cmtATag = cmtCntArr.eq(i);
    			var review_no = cmt.id;
    			var str="";
    			commentService.getList({review_no: review_no}, function(commentCnt) {
    				str += "<a><i class='fa fa-commenting-o' style='transform:scaleX(-1)'></i> " + commentCnt + "</a>";
					cmtATag.html(str);    			
    			});
    		});
    		
    	})();
    	
    </script>
    

<%@ include file="./includes/footer/footer-6 from Vertex.jsp" %>
    </div>

    <script src="./resources/Vertex/plugins/aos/aos.js"></script>
    <script src="./resources/Vertex/js/theme-core.js"></script>
</body>
</html>