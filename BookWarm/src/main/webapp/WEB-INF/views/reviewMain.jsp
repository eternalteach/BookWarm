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
<%@ include file="includes/header/header-vertexEx.jsp"%>

<link href='http://unpkg.com/@fullcalendar/core/main.css' rel='stylesheet' />
<link href='http://unpkg.com/@fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='http://unpkg.com/@fullcalendar/list/main.css' rel='stylesheet' />
<script src='http://unpkg.com/@fullcalendar/core/main.js'></script>
<script src='http://unpkg.com/@fullcalendar/interaction/main.js'></script>
<script src='http://unpkg.com/@fullcalendar/daygrid/main.js'></script>
<script src='http://unpkg.com/@fullcalendar/list/main.js'></script>
<title> review Main </title>
</head>
<body class="m-0">
<%@ include file="includes/header/header-topnav.jsp"%>

<sec:authentication property="principal.username" var="user_id"/>

	<div role="main" class="main">

	<section class="page-header pb-0 pt-2 mt-2 mb-2" style="border-bottom-color:transparent; background-color:transparent">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                    </div>
                    <div class="col-md-4">
                        <ul class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="/warm/library?user_id=${user_id}">내 서재</a></li>
                            <li class="active">감상 메인</li>
                        </ul>
                    </div>
                </div>
            </div>
     </section>
	
      <div class="page has-sidebar has-right-sidebar bordered">
<%-- <section class="section-primary alternate-color b-bordered" style="min-width:170px"></section> --%>
         <div class="page-inner has-left-sidebar has-one-sidebar">
            <div class="container" style="max-width:90vw!important; margin-left:10vw; margin-right:10vw">
            
            
               <div class="row">
               
                 <div class="col-md-2 pt-0" style="border-right-color: transparent!important;">
                    <aside class="sidebar w-100">
                    
					<section class="m-0 mt-4">
						<div class="pb-1 pl-3">
							<div class="widget-heading clearfix">
								<ul>
									<h4 class="v-heading"><a href="/warm/myInfo">${user_id}</a>'s Log Main</h4>
								</ul>	
								<ul class="text-center w-75 pt-1">
									
									<c:choose>
										<c:when test="${empty libNewbie}">
											<li class="mt-1 mb-2">서재가 비어있습니다.<br></li>
											<li id="libNewbie" class="mt-1">	
											<a href="/warm/library" title="책 담으러 가기"><i style="font-size:5vw!important;" class="glyphicon icon icon-book-3"></i></a>
											</li>
										</c:when>
										<c:when test="${!empty libNewbie && empty libNewbie.book_img}">
											<li class="mt-1 mb-2">막 서재에 담았어요!<br></li>
											<li id="libNewbie" class="mt-1">
											<c:set var="imgSrc" value="/warm/resources/img/happyGeneralB_dark3.png"/>
											<a href="/warm/reviewPerBook?isbn=${libNewbie.isbn}" title="${libNewbie.book_title}"><img style="width:80px" src="${imgSrc}"></a>
											</li>
										</c:when>	
										<c:when test="${!empty libNewbie && !empty libNewbie.book_img}">
											<li class="mt-1 mb-2">막 서재에 담았어요!<br></li>
											<li id="libNewbie" class="mt-1">
											<a href="/warm/reviewPerBook?isbn=${libNewbie.isbn}" title="기록하러 가기"><img style="width:80px" src="${libNewbie.book_img}"></a>
											</li>
										</c:when>
									</c:choose>
									
									<li class="">이 달 펼친 책 : <h4 class="mt-2 mb-0 list-inline-item">${logCPM}</h4> 권</li>
									<li class="">이 달 다 읽은 책 : <h4 class="mb-0 list-inline-item" id="logCPM_F"></h4> 권</li>
								</ul>
							</div>
						</div>
					</section> 
							
					<section class="widget widget_sf_recent_custom_comments clearfix m-0 pt-0" style="padding:6%">
                           <div class="widget-heading clearfix">
                               <h4 class="v-heading"><span>Recent Comments</span></h4>
                           </div>
						   <!-- 최근 댓글 영역 -->
                           <ul class="recent-comments-list"></ul>
                    </section>
					
                    </aside>
                 </div>
               	  
               
               
               
              <!-- 달력 영역 -->
              <div style="width:50vw !important; margin-top:20px; margin-bottom:50px">
		          <div>
		              <div>
		              	 <div class="post-header form-header">
  							<div id='calendar'></div>
		                 </div>
		              </div>
		          </div>
		      </div>
		      
		      <!-- 최근 리뷰 영역 -->
              <div class="col-md-2 pt-0 pr-2" style="border-right-color: transparent!important;">
                     <aside class="sidebar w-100">
               
               			<section class="m-0 mt-4">
							<div class="widget-heading clearfix mb-4">
                                <h4 class="v-heading pl-4"><span>Recent Reviews</span></h4>
                                <a class="pull-right" href="/warm/reviewWrite">
			                      	<span class="text ls-1">작성하기<i class="icon icon-pen-3"></i></span>
				                </a>
                            </div>	
                            
							<!-- 책별 데이터 불러오고 그 중 가장 최근 데이터 하나만 불러오기. -->
							<div id="recentReview"></div>
							
							<!-- 최근 리뷰 페이징 처리 -->	
							<div id="pagingArea" class="ml-4 mr-0 mb-4 p-3"></div>
						</section>
               		</aside>
               </div>
                 
				

               </div>
               <!-- end of row -->
            </div>
            <!-- end of container -->
         </div>
         <!-- end of page inner -->
   
       </div>  
       <!-- end of page -->
       
       <div class="eventSpace">
       	<!-- 여기에 이벤트 모달을 집어넣는다. -->
       </div>
      
	</div>
	<!-- end of div main -->
   
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
	  						let logCPM_F = 0;
	  						var nowFormat = tsToDate();
	  						// 이번 달에 완독한 책의 수를 세어야 함. ajax로 받아오는 것은 내가 완독한 책 전부.
	  						// 내가 받아온 목록의 연, 월이 sysdate의 연, 월과 일치하면 ++를 해준다. 0으로 시작해서 for문을 도는 동안 하나씩 ++.
	  						// 반영하는 것은 for문을 다 돌았을 때.
	  						
	  						$.each(data, function(i, obj){
		  						let firstImg = false;
	  							console.log("i: " +i);
	  							console.log("obj.isbn: " + obj.isbn);
	  							
	  							// timestamp를 원하는 날짜 형식으로 변환하는 함수 호출
	  							var dateFormat = tsToDate(obj.start_date);
	  							// 완독 기록의 연월이 현재 연월과 같으면 logCPM_F ++;
	  							if(dateFormat.substring(0,7) == nowFormat.substring(0,7))
	  								logCPM_F++;
	  							
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
											backgroundColor:'transparent', 
											borderColor:'transparent',
											firstImg:firstImg,
											imageurl:obj.book_img,
											dateFormat:dateFormat
										}
								);
	  						});
	  						// 이 달 완독한 책 수를 표시
	  						$("#logCPM_F").html(logCPM_F);
	   						successCallback(events);
		   				}).fail(function(xhr, status, err) {
			   				if(err) {
			   					failureCallback(err);
			   				}
		   		});
	   	  }, 
	   	  
	   	  eventRender: function(info) {
	   		  console.log("info.event.id:" + info.event.id);
	   		  console.log("info.event.title : " + info.event.title);
	   		  console.log("표지 : " + info.event.extendedProps.imageurl);
	   		  console.log("info.event.extendedProps.dateFormat: " +  info.event.extendedProps.dateFormat);
	   		  
	   		  var tdObj = $(".fc-day[data-date='" + info.event.extendedProps.dateFormat + "']");
	   		  var targetDate = tsToDate(info.event.start);
	   		  var coverStr = "";
	   		  
	   		  if(info.event.extendedProps.imageurl != '') {
	   			  
	   			  console.log("============ 완독한 책 이미지 뿌려주기 =============");
	   			coverStr = "<div style='width:40%; display:inline-block; position:relative; vertical-align:bottom'><img style='position:absolute; cursor: pointer;' title='" + info.event.title + "' id='" + info.event.id + "' src='" + info.event.extendedProps.imageurl + "'></div>"; 
	   			  
	   			  if(info.event.extendedProps.firstImg) {
	   				  // rerender시 표지가 반복적으로 추가되지 않도록 html에 새로 뿌려준다.
		   			  tdObj.html(coverStr);
	   			  } else {
		   			  tdObj.append(coverStr);
	   			  }
	   		  } else {
  				  // 이벤트가 몇 개 이상이면 나타나는 +more은 이미지랑 영역이 겹치므로 
  				  // 당일 이벤트가 3개 이상인 경우 +버튼이 나타나도록 따로 구현.
	   			  if(!$(".fc-day[data-date='" + info.event.extendedProps.dateFormat + "'] button").length) {
	   				coverStr += "<div style='display:inline-block; position:relative; float:right; width:20%;'><button style='width:100%; height:20%; border:transparent; background-color:lightgray;'></button></div><div style='display:inline-block; position:relative; float:right; width:20%;'>";
	   				coverStr += "   <button class='plus' data-toggle='modal' data-target='#" + targetDate + "' style='width:100%; height:20%; border:transparent; background-color:lightgray; color:white;'>+</button>";
	   				coverStr += "</div>"; 
		   			tdObj.append(coverStr); 
	   			  }
	   		  }
	   		  // gridMonth형에서 title은 나타나지 않도록 한다.
	   		  setTimeout(function() {
	        	  	$(".fc-event-container a").css("display", "none");
	        	  	calendar.updateSize();
	          }, 100);
	   	  },
	   	  
	   	  eventLimit: 0, 
	   	  eventLimitText: '',
	   	  eventClick: function(info) {
	   		  info.jsEvent.preventDefault();
	   	  }
	
	  });
		
	 calendar.render();  
 	  
 	 $("#calendar").on("click", "img", function() {
 		 location.href = "/warm/reviewPerBook?isbn=" + $(this).attr('id');
 	 });
 	 
  });
	
	$(".recent-comments-list").on("click", "a", function(e) {
		e.preventDefault();
		var reviewNo = $(this).attr("href");
		
		// 최신 댓글 클릭시 글 번호로 해당 감상의 책 isbn을 받아와 reviewSelectOne페이지로 이동
		(function(reviewNo, callback, error) {
			$.get("/warm/review/" + reviewNo + ".json", function(result){
				location.href='/warm/reviewSelectOne?review_no=' + reviewNo + '&isbn=' + result.isbn;
				
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
		})(reviewNo);
	});
  
	var actionForm = $("#actionForm");
	$(".page-link").on("click", function(e) {
		
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	 });
	
	$(document).ready(function() {
	   
	    let preDate = '';
	    // document가 로드되면 즉시 실행 함수로 필요한 정보들을 가져와 뿌린다.
		(function() {
			
				// 가져온 완독 목록을 바탕으로 모달을 만든다.
				$.getJSON("/warm/calendar.json",
					function(data) {
						// json데이터를 받아 data의 완독일 값이 true면 events에 추가하기.
						
						// 모달에 뿌려야 하는 것은 책 제목과 지은이, 완독일.
						// 날짜가 같은 데이터는 하나의 모달에 넣어야 함.
						// 어차피 날짜 역순, 로그 역순으로 불러오고 있기 때문에
						// preDate와 날짜가 같으면 불러온 내용만 추가하고, preDate와 날짜가 다르면 <div>로 모달 생성 후 안에 넣는 것으로.
						
						$.each(data, function(i, obj){
							
							var finDate = tsToDate(obj.start_date);
							if(preDate != obj.start_date) {
								  preDate = obj.start_date;
								  
								  var modals = '';
						   		  
						   		  modals += "<div class='modal loglist' id='" + finDate + "' tabindex='-1' role='dialog' aria-labelledby='smallModalLabel' aria-hidden='true'>";
						   		  modals += "    <div class='modal-content' style='max-width:300px; top:30%; left:40%;'>";
						   		  modals += "        <div class='modal-body post-content' style='background-color:#FFFCD8'>";
						   		  modals += "        	 	<div class='post-header form-header'>";
						   		  modals += "					<div id='logsHere'>";
						   		  modals += "					    <div align='right'><strong>" + finDate + "</strong></div>";
						   		  modals += "						<div><a href='/warm/reviewPerBook?isbn=" + obj.isbn + "'>- " + obj.book_title + "</a></div>";
						   		  modals += "					</div>";
						   		  modals += "            </div>";
						   		  modals += "        </div>";
						   		  modals += "    </div>";
						   		  modals += "</div>";
						   		  
								  $(".eventSpace").append(modals);
								  
							} else {
								// 같은 날 완독 기록이 있을 경우
								$("#" + finDate).find("#logsHere").append("<div><a href='/warm/reviewPerBook?isbn=" + obj.isbn + "'>- " + obj.book_title + "</a></div>");
							}
						}); // end of $.each
				}); // end of making modals

				
				// 최근 댓글 5개를 가져온다.
		 		$.getJSON("/warm/comments/recent", function(arr) {
					
					var recentCmt = $(".recent-comments-list");
					var str = "";
					
					$(arr).each(function(i, cmt) {
						str += "<li class='comment'><div class='comment-wrap clearfix pr-1' style='padding-top:5px'>";
						str += "<div class='comment-avatar mt-1'>";
						str += "<img src='/warm/resources/Vertex/img/team/t" + (i+1) + ".png' class='avatar' style='height:35px; width:35px' />";
						str += "</div>";
						str += "<div class='comment-content mb-1'><div class='comment-body'>";
						str += "<a href='" + cmt.review_no + "'>";
						str += " <p style='overflow:hidden; display: -webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:1; line-height:1.8em; max-height:1.8em; '>" + cmt.review_cmt_content + "</p></a></div>";
						str += "<div class='comment-meta'>";
						str += "<span class='comment-author'>" + cmt.user_id + "</span>&nbsp;&nbsp;&nbsp;";
						str += "<span class='comment-date'>" + displayTime(cmt.review_cmt_modified_date) + "</span>";
						str += "</div></div></li>";
						str += "";
					});
					if(str=="") {
						str = "<p class='pl-5 pt-8'>댓글이 없습니다.</p>";
					}
					recentCmt.html(str);
					
				}); // get Recent Comments
				
		  })(); // end of function
	
		// 최근 리뷰 ajax로 페이징 처리.
		// 페이징에 필요한 것들: 리뷰 수, 페이지 번호, criteria(한 페이지에 몇 개씩 표시할 것인가), pagingDTO(페이지는 한 번에 몇 개까지 보여줄 것인가).
		// ajax로 보내야 하는 건 페이지 번호. 받는 건 해당 페이지 범위에 속하는 리뷰 3개.
		// 데이터를 받을 때 변경되어야 하는 것은 리뷰 영역.
		
		var pageNum = 1;
		var recentReview = $("#recentReview");
		// 리뷰 총 개수는 이 화면에서 변경될 일이 없으므로 처음에 모델에 담아온 값을 쓰기로 한다.
		var reviewCnt = ${total};
		var pagingArea = $("#pagingArea");
		reviewPaging(pageNum, reviewCnt, recentReview);
		showRecentReview(-1);
		
		function showRecentReview(page) {
			
			(function(reviewCnt, page) {
				getRecentReviewsWithPaging(page, function(list) {
					if(page==-1) {
						pageNum = Math.ceil(reviewCnt/3.0);
						showRecentReview(pageNum);
						return;
					}
					if(list == null || list.length == 0) {
						recentReview.html("<p class=\"text-center pt-8\">작성된 리뷰가 없습니다.</p>");
						return;
					}
					var recentReviewStr = "";
					
					for(var i=0, len = list.length||0; i<len; i++) {
						
						recentReviewStr += "<div class='post-content no-thumb clearfix ml-4 mr-0 mb-4 p-3' style='max-width:95%'>";
						recentReviewStr += "    <article class='v_blog-item'>";
						recentReviewStr += "        <div class=\"v_blog-item-inner row\">";
		
						/* 이미지 들어가는 부분 */
						recentReviewStr += "           <div class=\"v_blog-item-media col-md-3\" style=\"padding-left:5%; padding-right:3%\">";
						recentReviewStr += "              <a href=\"/warm/reviewPerBook?isbn=" + list[i].isbn + "\">";
						recentReviewStr += "                 <img class=\"w-100\" src=\"" + list[i].book_img + "\"></a></div>";
						
						/* 최근 작성한 리뷰가 들어가는 부분 */
						recentReviewStr += "           <div class=\"v_blog-item-content col-md-8\" style=\"padding-left:5%; padding-right:3%\">";
						recentReviewStr += "              <div class=\"v_blog-item-header\">";
						recentReviewStr += "                 <ul class=\"v_blog-item-meta pl-0\" style=\"list-style-type: none\">";
						recentReviewStr += "                    <li class=\"v_blog-item-date\">";
						recentReviewStr += "                       <time datetime=\"2018-06-30T10:47:48+00:00\">";
						recentReviewStr += "                       	" + new Date(list[i].review_modify_date).toLocaleDateString();
						recentReviewStr += "                       </time></li></ul></div>";
						
						recentReviewStr += "              <div itemprop=\"articleBody\">";
						recentReviewStr += "                 <p style=\"overflow:hidden; display: -webkit-box; -webkit-box-orient:vertical; -webkit-line-clamp:2; line-height:1.8em; max-height:3.6em; margin-top:15px; margin-bottom:30px\">";
						recentReviewStr += "                 	" + list[i].review_content + "</p>";
						recentReviewStr += "                 <a class=\"v_blog-item-read-more\" style=\"position:absolute; bottom:0; right:0; color:gray\" href=\"/warm/reviewPerBook?isbn=" + list[i].isbn + "\">";
						recentReviewStr += "                    <span>감상 더보기</span></a></div></div></div></article></div>   ";
					}
					recentReview.html(recentReviewStr);
					reviewPaging(page, reviewCnt, pagingArea);
				});
			})(reviewCnt, page);
			
		}
		
		function getRecentReviewsWithPaging(page, callback, error) {
			
			$.getJSON("/warm/recentReviews/pages/" + page + ".json", function(list) {
				
				callback(list);
			}).fail(function(xhr, status, err) {
				if(error)
					error();
			});
		}
		
		function reviewPaging(pageNum, reviewCnt, pagingArea) {
			
			var endNum = Math.ceil(pageNum/3.0)*3;
			var startNum = endNum - 2;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 3 >= reviewCnt) {
				endNum = Math.ceil(reviewCnt/3.0);
			}
			
			if(endNum * 3 < reviewCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination px-2'>";
			
			if(prev) {
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'><</a></li>";
			}
			for(var i=startNum; i<=endNum; i++) {
				var active = pageNum == i? "active": "";
				str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>></a></li>";
			}
			str += "</ul></div>";
			pagingArea.html(str);
		}
		
		pagingArea.on("click", "a", function(e) {
			e.preventDefault();
			showRecentReview($(this).attr("href"));
		});
	});
	
	
	
	
	function tsToDate(timestamp) {
			
			if(typeof timestamp == 'undefined') {
				var tempDate = new Date();
			} else {
		    	var tempDate = new Date(timestamp);
			}
		    
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


<%@ include file="includes/header/script-vertexEx.jsp"%> 
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>
