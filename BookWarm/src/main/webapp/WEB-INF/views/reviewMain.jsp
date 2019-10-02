<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />


<link href='http://unpkg.com/@fullcalendar/core/main.css' rel='stylesheet' />
<link href='http://unpkg.com/@fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='http://unpkg.com/@fullcalendar/list/main.css' rel='stylesheet' />
<script src='http://unpkg.com/@fullcalendar/core/main.js'></script>
<script src='http://unpkg.com/@fullcalendar/interaction/main.js'></script>
<script src='http://unpkg.com/@fullcalendar/daygrid/main.js'></script>
<script src='http://unpkg.com/@fullcalendar/list/main.js'></script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
</style>

</head>
<body style="margin:0">
<%@ include file="includes/header/header-topnav.jsp"%>

<sec:authentication property="principal.username" var="user_id"/>

<div role="main" class="main">

	<section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                    </div>
                    <div class="col-md-4">
                        <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="/warm/library?user_id=${user_id}">내 서재</a></li>
                            <li class="active">감상 메인</li>
                        </ul>
                    </div>
                </div>
            </div>
     </section>
	
</div>

<%-- <%@ include file="./includes/header/header-dark-dropdown.jsp"%> --%>


      <div class="page has-sidebar has-right-sidebar bordered">

         <!-- <section class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll loaded dzsprx-readyall b-bordered bg-overlay--gradient-dark">

            <div class="divimage dzsparallaxer--target w-100" style="height: 120%; background-image: url(./resources/VertexEx/img/main/slide-01.jpg);">
            </div>

            <div class="container pt-200 pb-120 text-center text-white z-index-1">
               <div class="row">

                  <div class="col-md-12">
                     <h2 class="fs-40 fw-7 mb-15">
                        Blog Left Sidebar
                     </h2>
                     <p class="section-sub-title">Build stunning fluid layout of news and sidebars</p>
                  </div>
               </div>
            </div>
         </section> -->

         <div class="page-inner has-left-sidebar has-one-sidebar">
            <div class="container">
               <div class="row">
					
                  <div class="col-md-4 left-side-sidebar pt-70" style="padding-top:50px !important;">
                     <aside class="sidebar" style="width:100%">
						<section>
							<div>
								<ul>
									<h4>
										<strong>${user_id}</strong>
										님의 독서기록
									</h4>
								</ul>
								<ul>
									<li>가장 최근에 서재에 담은 책: </li>
									<li>이 달 읽은 책 수: </li>
									<li><button id="modalBtn" type="button" data-toggle="modal" data-target="#calModal">달력보기</button></li>
								</ul>
							</div>
						</section> 
						
						<section class="widget widget_sf_recent_custom_comments clearfix">
                            <div class="widget-heading clearfix">
                                <h4 class="v-heading"><span>내 글에 달린 댓글</span></h4>
                            </div>
                            <ul class="recent-comments-list">

                            </ul>
                        </section>
						
						                       
                     </aside>
                     
                  </div>

                  <div class="col-md-8 v_blog-medium pt-70 pull-right" style="padding-top:30px !important;">
                  
                    <!-- 감상 작성 버튼 추가 -->
                    <div class="no-thumb clearfix" style="padding-right:20px">
                    	<div class="pull-right">
                    	
                    	<a class="btnPerBook" href="/warm/reviewWrite">
                      	<span class="text ls-1">
                      		감상 더하기
                           <i class="icon icon-pen-3"></i>
                      	</span>
                    	</a><br>
                    	<a class="btnPerBook" href="/warm/library">
                      	<span class="text ls-1">
                      		서재로 돌아가기
                      		<i class="fa fa-book"></i>
                      	</span>
                    	</a><br>
                    	</div>
                    </div>

				<c:if test="${empty list}">
					등록한 감상이 없습니다.
				</c:if>
				
				<!-- 블로그에 글 넣기 시도 -->
				<!-- 책별 데이터 불러오고 그 중 가장 최근 데이터 하나만 불러오기. -->
				
				<c:forEach items="${list}" var="vo">
				
				<div class="post-content no-thumb clearfix" style="margin:20px ; padding:30px">
				    <article class="v_blog-item">
                        <div class="v_blog-item-inner row">
                        
                           <!-- 여기가 이미지 들어가는 부분 -->
                           <div class="v_blog-item-media col-md-3" style="padding-left:5%; padding-right:3%">
                              <a href="/warm/reviewPerBook?isbn=${vo.isbn}">
                                 <img class="w-100" src="${vo.book_img}"/>
                              </a>
                           </div>
                           
                           <!-- 최근 작성한 리뷰가 들어가는 부분 -->
                           <div class="v_blog-item-content col-md-8" style="padding-left:5%; padding-right:3%">
                           
                              <div class="v_blog-item-header">
                                 <ul class="v_blog-item-meta" style="list-style-type: none; padding-left:0px">
                                    <li class="v_blog-item-date">
                                       <time class="" datetime="2018-06-30T10:47:48+00:00">
                                       	 <fmt:formatDate var="recentDate" value="${vo.review_modify_date}" pattern="yyyy년 MM월 dd일"/>
                                          ${recentDate}에 작성하신 감상입니다.
                                       </time>
                                    </li>
                                    <li class="v_blog-item-counter"><span>이 책에 대해 남긴 감상 2개</span></li>
                                 </ul>
                              </div>
	
                              <div itemprop="articleBody">
                                 <p style="overflow:hidden; display: -webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:3; line-height:1.8em; max-height:5.4em; margin-top:15px; margin-bottom:30px">
                                 	${vo.review_content}
                                 </p>
                                 <a class="v_blog-item-read-more" style="position:absolute; bottom:0; right:0; color:gray" href="/warm/reviewPerBook?isbn=${vo.isbn}">
                                    <span>Reviews about this book</span>
                                 </a>
                              </div>
                              
                           </div>
                           
                        </div>
                     </article>
				</div>                     
				</c:forEach>


                     <div class="row">
                        <div class="col-md-12">
                        
                         <nav aria-label="...">
                                <ul class="pagination">
                                	
                        
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
                                	
                                	<form id="actionForm" action="/warm/reviewMain" method="get">

                                		<input type="hidden" name="isbn" value="${list[0].isbn}">
                                		<input type="hidden" name="user_id" value="${list[0].user_id}">
                                		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                		
                                	</form>
                                	
                                </ul>
                            </nav>
                            
                           <!-- <nav aria-label="Page navigation example">
                              <ul class="pagination">
                                 <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                 </li>
                                 <li class="page-item"><a class="page-link" href="#">1</a></li>
                                 <li class="page-item"><a class="page-link" href="#">2</a></li>
                                 <li class="page-item"><a class="page-link" href="#">3</a></li>
                                 <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                 </li>
                              </ul>
                           </nav> -->
                        </div>
                     </div>
                  </div>
                  <!-- end of v_blog-medium -->
               </div>
               <!-- end of class row -->
            </div>
         </div>
         
         
         <!-- Modal -->
         <div class="modal fade" id="calModal" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
		    <div class="modal-dialog undefined" style="max-width:1000px !important;">
		        <div class="modal-content">
		            <div class="modal-body post-content">
		            	 <div class="post-header form-header">
		                  	<div id='loading'>loading...</div>
  							<div id='calendar'></div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
         
         <div class="eventSpace">
         	<!-- 여기에 이벤트 모달을 집어넣는다. -->
         </div>
      
   </div>
   
   
<script>

	
  document.addEventListener('DOMContentLoaded', function() {
	  
 	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid', 'list' ],
	
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,listYear'
	      },
	      
	      displayEventTime: false, // don't show the time column in list view
	      
	   	  events: function(info, successCallback, failureCallback) {
	   			$.getJSON("/warm/calendar.json",
	  					function(data) {
	  						// json데이터를 받아서 해야 하는 일.
	  						// data의 완독일 값이 true면 events에 추가하기.
	  						var events = [];
	  						let preDate = '';
	  						let limitCheck = 0;
	  						
	  						$.each(data, function(i, obj){
		  						let firstImg = false;
	  							console.log("i: " +i);
	  							console.log("obj.isbn: " + obj.isbn);
	  							
	  							// timestamp를 원하는 날짜 형식으로 변환하는 함수 호출
	  							var dateFormat = tsToDate(obj.start_date);
	  							
	  							// 같은 날짜에 완독한 책이 존재한다면 limitCheck값만 증가시켜주고, 
	  							// 이외의 경우 preDate에 날짜 저장 후 limitCheck 1로 초기화.
	  							if(preDate != dateFormat) {
	  								limitCheck = 1;
	  								preDate = dateFormat;
	  								firstImg = true;
	  							} else {
	  								limitCheck++;
	  							}
	  							
	  							if(limitCheck>2) {
		  							// 완독한 책 표지는 하루 최대 2권까지만 나타내도록 한다. 
	  								obj.book_img = '';
	  							}
	  							// 이벤트는 전부 추가해준다.
								events.push(
										{
											id:obj.isbn,
											title:obj.book_title, 
											start:obj.start_date, 
											backgroundColor:'lightgray', 
											borderColor:'transparent',
											textColor:'black',
											firstImg:firstImg,
											imageurl:obj.book_img,
											dateFormat:dateFormat
										}
								);
	  						});
	   						successCallback(events);
		   				}).fail(function(xhr, status, err) {
			   				if(err) {
			   					failureCallback(err);
			   				}
		   		});
	   	  }, 
	   	  /* 
	   	  eventClick: false, */
	   	  
	   	  viewRender: function(info) {
	   		  console.log("viewRender!");
	   		$(".fc-event-container").css("display", "none");
	   	  },
	   	  
	   	  eventRender: function(info) {
	   		  console.log("info.event.id:" + info.event.id);
	   		  console.log("info.event.title : " + info.event.title);
	   		  console.log("표지 : " + info.event.extendedProps.imageurl);
	   		  console.log("info.event.extendedProps.dateFormat: " +  info.event.extendedProps.dateFormat);
	   		  
	   		  var tdObj = $(".fc-day[data-date='" + info.event.extendedProps.dateFormat + "']");
	   		  var targetDate = tsToDate(info.event.start);
	   		  
	   		  if(info.event.extendedProps.imageurl != '') {
	   			  
	   			  console.log("============ 완독한 책 이미지 뿌려주기 =============");
	   			  var str = "<div style='width:40%; display:inline-block; position:relative; vertical-align:bottom'><img style='position:absolute; cursor: pointer;' id='" + info.event.id + "' src='" + info.event.extendedProps.imageurl + "'></div>"; 
	   			  
	   			  if(info.event.extendedProps.firstImg) {
	   				  // rerender시 표지가 반복적으로 추가되지 않도록 html에 새로 뿌려준다.
		   			  tdObj.html(str);
	   			  } else {
	   				  // 당일 이벤트가 3개 이상이라면 +버튼이 나타나도록 하고 싶은데
	   				  // 기존에 title 말고 이벤트가 몇 개 이상이면 나타나던 +more은 이미지랑 영역이 겹치니까 그보다는 직접 구현하는 쪽이 좋을 듯.
	   				  // 
		   			  tdObj.append(str);
	   			  }
	   		  } else {
	   			  console.log("세 번 이상의 이벤트가 존재");

	   			  if(!$(".fc-day[data-date='" + info.event.extendedProps.dateFormat + "'] button").length) {
	   				  console.log("button이 없는 상태");
		   			  str += "<div style='display:inline-block; position:relative; float:right; width:20%;'>";
		   			  str += "   <button class='plus' data-toggle='modal' data-target='#" + targetDate + "' style='width:100%; height:20%; border:transparent; background-color:lightgray; color:white;'>+</button>";
		   			  str += "</div>"; 
		   			  tdObj.append(str); 
	   			  }
	   		  }
	   		/* <button id="modalBtn" type="button" data-toggle="modal" data-target="#calModal">달력보기</button> */
	   		  
	   		  $(".fc-content-skeleton table").css("table-layout", "fixed");
	   		  // gridMonth형에서 title은 나타나지 않도록 한다.
	   		  // .fc-content-skeleton을 display를 none으로 하면 날짜까지 지워지고, tbody까지를 택하면 css가 적용되지 않는 문제.
	   		  /* $(".fc-content-skeleton table tbody").css("display", "none"); */
	   		  /* $(".fc-content-skeleton table tbody").css("display", "");  */
	   		  /* $(".fc-event-container").css("display", "none");  */
	   		  
	   	  },
	   	  
	   	  eventLimit: 0, 
	   	  eventLimitText: '',
	
	   	  eventClick: function(info) {
	   		  info.jsEvent.preventDefault();
	   	  },
	   	  
	      loading: function(bool) {
	        /* document.getElementById('loading').style.display =
	          bool ? 'block' : 'none'; */
	         if(bool) {
	         } else {
	        	 
	        	 setTimeout(function() {
	        		 
	        	  	$(".fc-event-container").css("display", "none");
		        	 /* $(".fc-content-skeleton table tbody").css("display", "none"); */
	        	 }, 100);
	         }
	      } 
	
	  });
		
	    
	  setTimeout(function() {
			
		  calendar.render();
      }, 200);
 	  
 	  $("#modalBtn").on("click", function() { 
	 		  
		    setTimeout(function() {
		    	// 처음 버튼을 눌렀을 때도 달력이 온전히 뜨도록 함
		    	$(".fc-dayGridMonth-button").click();

				calendar.updateSize();
				$(".fc-event-container").css("display", "none");
		    }, 200);
 	  });
 	 
 	// 아니면 #calendar 안에 있는 버튼이 눌리면 $(".fc-event-container").css("display", "none"); 하면 ???
 	  
 	  
 	 $("#calendar").on("click", "img", function() {
 		 location.href = "/warm/reviewPerBook?isbn=" + $(this).attr('id');
 	 });
 	 
 	(function() {
		 
		$.getJSON("/warm/comments/recent", function(arr) {
			
					// 최근 댓글 5개를 가져온다.
					// arr에 담긴 댓글을 댓글 영역에 집어넣는다.
					var recentCmt = $(".recent-comments-list");
					var str = "";
					
					$(arr).each(function(i, cmt) {
						str += "<li class='comment'><div class='comment-wrap clearfix'><div class='comment-wrap clearfix'>";
						str += "<div class='comment-avatar'>";
						str += "<img src='/warm/resources/Vertex/img/team/t" + (i+1) + ".png' class='avatar' height='30' width='30' />";
						str += "</div>";
						str += "<div class='comment-content'><div class='comment-body'>";
						str += "<a href='warm/reviewSelectOne?review_no=" + cmt.review_no + "'>";
						str += " <p style='overflow:hidden; text-overflow:ellipsis'>" + cmt.review_cmt_content + "</p></a></div>";
						str += "<div class='comment-meta'>";
						str += "<span class='comment-author'>" + cmt.user_id + "</span>";
						str += "<span class='comment-date'>" + displayTime(cmt.review_cmt_modified_date) + "</span>";
						str += "</div></div></div></li>";
						str += "";
					});
					if(str=="") {
						str = "댓글이 없습니다.";
					}
					recentCmt.html(str);
					
		}); // end getJSON
	})(); // end function
  });
	
	$(".recent-comments-list").on("click", "a", function(e) {
		e.preventDefault();
		alert($(this).attr("href"));
	});
		 
  
	var actionForm = $("#actionForm");
	
	$(".page-link").on("click", function(e) {
		
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	 });
	
	
	$(document).ready(function() {
		
		// document가 로드되면 즉시 실행 함수로 가져온 목록으로 모달을 만든다.
	   
	    let preDate = '';
	   				  
		(function() {
			
			$.getJSON("/warm/calendar.json",
					function(data) {
						// json데이터를 받아서 해야 하는 일.
						// data의 완독일 값이 true면 events에 추가하기.
						
						// 모달에 뿌려야 하는 것은 책 제목과 지은이, 완독일.
						// 날짜가 같은 데이터는 하나의 모달에 넣어야 함.
						// 어차피 날짜 역순, 로그 역순으로 불러오고 있기 때문에
						// preDate와 날짜가 같으면 불러온 내용만 추가하고,
						// preDate와 날짜가 다르면 <div>로 모달 생성 후 안에 넣는 것으로.
						
						$.each(data, function(i, obj){
							
							var finDate = tsToDate(obj.start_date);
							if(preDate != obj.start_date) {
								  preDate = obj.start_date;
								  
								  var modals = '';
						   		  
						   		  modals += "<div class='modal fade loglist' id='" + finDate + "' tabindex='-1' role='dialog' aria-labelledby='smallModalLabel' aria-hidden='true'>";
						   		  modals += "    <div class='modal-content' style='max-width:300px; top:30%; left:40%;'>";
						   		  modals += "        <div class='modal-body post-content' style='background-color:#FFFCD8'>";
						   		  modals += "        	 	<div class='post-header form-header'>";
						   		  modals += "					<div id='logsHere'>";
						   		  
						   		  modals += "<button type='button' align='right'>x</button>";
						   		  modals += "					    <div align='right'><strong>" + finDate + "</strong></div>";
						   		  modals += "						<div>" + obj.book_title + "</div>";
						   		  
						   		  modals += "					</div>";
						   		  modals += "            </div>";
						   		  modals += "        </div>";
						   		  modals += "    </div>";
						   		  modals += "</div>";
						   		  
								  $(".eventSpace").append(modals);
								  
							} else {
								// 같은 날 완독 기록이 있을 경우
								$("#" + finDate).find("#logsHere").append("<div>" + obj.book_title + "</div>");
							}
						}); // end of $.each
				}); // end of getJSON
		  })(); // end of function
		  
	});
	
	$(document).click(function() {
		
		$(".loglist").hide();
	});
	
	
	/* $(".eventSpace").on("click", "button", function() {
		
		
	}); */

	$(".plus").click(function(e) {
		
		e.stopPropagation();
		var num = $(this).index();
		$(".loglist").eq(num).show();
	});
	
	function tsToDate(timestamp) {
		
		    var tempDate = new Date(timestamp);
		    
			var year = tempDate.getFullYear();
			var month = tempDate.getMonth() + 1;
			var date = tempDate.getDate();
			
			if(month<10) {
				month = '0' + month;
			}
			if(date<10) {
				date = '0' + date;
			}
			
			return year + "-" + month + "-" + date;
	}
	
	
//	작성한 지 24시간이 지난 댓글은 날짜로, 이내의 글은 몇 초/분/시간 전에 달았는지 알려주기
	function displayTime(timeValue) {
	
		var today = new Date();
		var dateObj = new Date(timeValue);
		
		var gap = today.getTime() - timeValue;
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) { // 24시간 이하면
			
			if(gap > 1000 * 60 * 60) { // 1시간 이상이면
				return Math.round(gap/(1000*60*60)) + '시간 전';
			} else if(gap > 1000 * 60) { // 1분 이상이면
				return Math.round(gap/(1000*60)) + '분 전';
			} else { // 초단위
				return Math.round(gap/1000) + '초 전';
			}			
		} else {
			
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	};
</script>


<%@ include file="includes/footer/footer-1.jsp"%>