<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<%@ include file="includes/header/header-vertexEx.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>
    
	<sec:authentication property="principal.username" var="user_id"/>

    <div role="main" class="main">

        <section class="page-header pb-0 pt-2 mt-2 mb-2" style="border-bottom-color:transparent; background-color:transparent">
            <div class="container">
               <!--  <div class="row align-items-center"> -->
                    <div class="col-md-8 pull-right">
                        <ul class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="/warm/library?user_id=${user_id}">내 서재</a></li>
                            <li><a href="/warm/reviewMain">감상 메인</a></li>
                            <li class="active">${bookVO.book_title}</li>
                        </ul>
                    </div>
               <!--  </div> -->
            </div>
        </section>
        
	</div>
    <!-- end of div main -->

        <div class="v-page-wrap has-left-sidebar has-one-sidebar mt-0">
            <div class="container">
            	
                <div class="row">

                    <aside class="sidebar left-sidebar col-sm-3" style="padding-top:15px;">
                    
						<!-- record 삽입 -->
						<%@ include file="includes/record/record.jsp"%>
                    
                        <section class="widget v-search-widget clearfix">
                            <form role="search" method="get" id="searchform" class="searchform" action="#">
                                <div class="form-group">
                                    <input class="form-control" type="text" value="" name="s" id="s" placeholder="Search" />
                                </div>
                            </form>
                        </section>

                    </aside>
                    
					<div class="col-sm-9 v-blog-wrap">
                        <div class="v-blog-items-wrap blog-standard">

                            <ul class="v-blog-items row standard-items clearfix">
                            
                            <!-- 8/28 책별 감상 뿌리기 -->
                            <c:forEach items="${list}" var="vo">
                            
	                        <!-- 8/29 날짜 형식 변환: 달을 영어로 출력하기 위해 언어 변경, format을 필요 데이터만 필요한 형태로 변환 -->    
	                        <fmt:setLocale value="en_US"/>
                            <fmt:formatDate var="fmt_date" value="${vo.review_written_date}" pattern="ddMMM"/>
                            
								<li class="v-blog-item col-sm-12" style="margin-top:10px">
									
                                    <div class="post-content no-thumb clearfix">

                                        <div class="v-post-date pull-left">
                                            <span class="day">${fn:substring(fmt_date,0,2)}</span> <!-- 가져온 날짜 중 일에 해당하는 숫자 -->
                                            <span class="month">${fn:substring(fmt_date,2,5)}</span>
                                            <div class="like-holder like-button" style="cursor:default"><i class="fa fa-heart"></i></div>
                                        </div>
                                        <div class="post-inner">
                                            <div class="post-header">
												
												<h2 class="title" style="overflow:hidden; text-overflow:ellipsis"><a class="move" href="${vo.review_no}">${vo.review_title}</a></h2>
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
                                                    <fmt:formatDate var="date" value="${vo.review_modify_date}" pattern="yyyy. MM. dd"/>
                                                        <a href="#">${date}
                                                        <c:if test="${vo.review_modify_date != vo.review_written_date}">
                                                        	(수정됨)
                                                        </c:if>
                                                        </a> 
                                                        <span class="text-sep">|</span>
                                                        <span class="comment-container minor-meta" id="${vo.review_no}">
                                                            <!-- 댓글 수가 입력될 공간 -->
                                                   		</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="v-blog-post-description">
                                                <p style="overflow:hidden; display: -webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:3; line-height:1.8em; max-height:5.4em;">
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
							<!-- -----------------------페이징 부분 시작----------------------------- -->
                            
            		        <ul style="position:absolute; right:0">                     
	                            <!-- 감상 작성 버튼 추가 -->
	                            <li class="col-sm-12">
	                            	<div class="pull-right">
		                            	<a class="btnPerBook" href="/warm/reviewWrite?isbn=${bookVO.isbn}">
			                            	<span class="text ls-1">
			                            		감상 더하기<i class="icon icon-pen-3"></i>
			                            	</span>
		                            	</a>
	                            	</div>
	                            </li>
	                        </ul>   
	                        
							<c:if test="${empty list}">
                            	<div style="margin:150px; text-align:center">작성한 감상이 없습니다.</div>
                            </c:if>
                            
                            <nav aria-label="...">
                                <ul class="pagination">
                            
                           			<!-- prev 데이터가 없으면 prev버튼이 비활성화 -->
                               	 
                                    <%-- <li class="page-item ${pageMaker.prev ? "":"disabled"} ">
                                        <a  class="page-link" href="${pageMaker.startPage-1}">
	                                        Previous
	                                    </a>
                                    </li> --%>
                                	 
		                            <!-- prev데이터가 없으면 아예 버튼을 노출하지 않음 -->
                                	<c:if test="${pageMaker.prev}">
	                                    <li class="page-item">
	                                        <a class="page-link" href="${pageMaker.startPage-1}">Previous</a>
	                                    </li>
                                	</c:if>
                                	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
                                	</c:forEach>
                                    <c:if test="${pageMaker.next}">
	                                    <li class="page-item">
		                                    <a class="page-link" href="${pageMaker.endPage+1}">Next</a>
	                                    </li>
                                	</c:if> 
                                	
                                </ul>
                            </nav>
                            <!-- -----------------------------페이징 끝------------------------------------ -->
                            
                            <!-- 페이지 정보 등을 넘기기 위한 폼 -->
                           	<form id="actionForm" action="/warm/reviewPerBook" method="get">
                           		<input type="hidden" name="isbn" value="${bookVO.isbn}">
                           		<%-- <input type="hidden" name="user_id" value="${list[0].user_id}"> --%>
                           		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                           		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                           	</form>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
    
     	       
        <script type="text/javascript">
        	$(document).ready(function() {
				
        		var actionForm = $("#actionForm");
        		
        		$(".page-link").on("click", function(e) {
        			
        			e.preventDefault();
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

<%@ include file="includes/header/script-vertexEx.jsp"%>
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>

