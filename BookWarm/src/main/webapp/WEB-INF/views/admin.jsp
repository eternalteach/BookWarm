<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- 
	구현해야 할 것
	1. 사용자 클릭시 사용자 세부 정보 띄우기(회원정보 불러오기)
	2. 게시판 관리이던, 사용자 관리이던 검색으로 사용자 정보 찾아서 모달창으로 사용자 정보 띄워 정보 수정할 수 있게 하기

 -->
<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>

<div class="wrapper">
	<div class="page has-sidebar has-left-sidebar bordered">
		<div class="page-inner alternate-color">
			<div class="container">
				<div class="row">
					<div class="col-md-3 left-side-sidebar pt-70">
						<aside class="sidebar">
							<section class="sidebar-widget">
								<button class="administrator-BoardBtn"data-Action="administrator-board"> 게시판 관리 </button>
								<button class="administrator-UserBtn" data-Action="administrator-user"> 사용자 관리 </button>
							</section>
						</aside>
					</div>
				
					<!-- administrator-statistics -->
					<div class="col-md-9 right-side-sidebar pt-70 ">
						<!-- administrator-board -->
						<div id="administrator-board" class="administrator">
							<ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
								<li class="nav-item active" data-option-value="*"><a class="nav-link" href="#">Show All</a></li>
								<li class="nav-item" data-option-value=".community"><a class="nav-link" href="#">Community Board</a></li>
								<li class="nav-item" data-option-value=".review"><a class="nav-link" href="#">Review</a></li>
							</ul>
							<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
								<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
									<c:forEach items="${adminBoard}" var="postList">
										<div class="col-lg-4 isotope-item ${postList.board_name}">
											<article class="v_blog-item v_blog-item-related v_blog-grid">
												<div class="v_blog-item-inner">
													<div class="v_blog-item-content">
														<div class="v_blog-item-header">
															<ul class="v_blog-item-meta">
																<li class="v_blog-item-date">
																	<time class="entry-meta" datetime="${postList.board_written_time}">
		                                                			   ${postList.board_written_time}
																	</time>
																</li>
															</ul>
															<a><h2 class="v_blog-item-title" itemprop="name headline">${postList.board_title}</h2></a>
														</div>
														<div itemprop="articleBody">
															<p>${postList.board_content}</p><hr/>
															<p class="v_blog-item-author">
																<!-- 유저정보 볼 수 있게하는 a태그 추가하기 -->
																<span>${postList.user_id}</span>
															</p>
														</div>
													</div>
												</div>
											</article>
										</div>
									</c:forEach>
								</div>
								<div class="row">
									<div class="col-md-12">
									<hr class="invisible" />
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
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
										</nav>
									</div>
								</div>
							</div>
						</div>
					<!-- End administrator-board -->
					<!-- administrator-user -->
						<div id="administrator-user" class="administrator">
							<ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
								<li class="nav-item active" data-option-value="*"><a class="nav-link" href="#">Show All</a></li>
								<li class="nav-item" data-option-value=".authNum3"><a class="nav-link" href="#">관리자</a></li>
								<li class="nav-item" data-option-value=".authNum2"><a class="nav-link" href="#">매니저</a></li>
								<li class="nav-item" data-option-value=".authNum1"><a class="nav-link" href="#">사용자</a></li>
								<li class="nav-item" >
									<input type="text" class="nav-link"  style="text-transform: lowercase;" id="searchUser" name="searchUser" placeholder=" 사용자 검색"><button id="searchUserBtn"type="button" class="btn-sm nav-link" data-toggle="modal" data-target="#openUserInfo">검색</button>
								</li>
							</ul>
							<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
								<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
								
									<c:forEach items="${userList}" var="user">
									<div class="col-lg-4 isotope-item authNum${user.authList.size()}">
										<article class="v_blog-item v_blog-item-related v_blog-grid">
												<div class="v_blog-item-inner">
													<div class="v_blog-item-content">
														<div class="v_blog-item-header">
															<ul class="v_blog-item-meta">
																<li class="v_blog-item-date">
																	<h2 class="v_blog-item-title" itemprop="name headline">${user.user_id}</h2>
																</li>
															</ul>
														</div>
														<div itemprop="articleBody">
															
															<p class="v_blog-item-author"><span>user_name : ${user.user_name}</span></p>
															<p class="v_blog-item-author"><span>권한 : ${user.authList.size()}</span></p>
															<p class="v_blog-item-author"><span>record 게시글 수  : 0</span></p>
															<p class="v_blog-item-author"><span>Review 게시글 수  : 0</span></p>
															<p class="v_blog-item-author"><span>구매 수  : 0</span></p>
														</div>
													</div>
												</div>
											</article>
									</div>
									</c:forEach>
								</div>
								
								<div class="row">
									<div class="col-md-12">
									<hr class="invisible" />
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
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
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End administrator-user -->
					
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="openUserInfo" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
                <%@ include file="includes/content/register/readUserInfo.jsp"%>
            </div>
        </div>
    </div>
</div>
	<script type="text/javascript">
					$(document).ready(function(){
							$(".administrator").hide();
							$("#administrator-user").show();
							
							$("button").on("click",function(){
								let btnId=$(this).attr("data-Action");
							$(".administrator").hide();
							$("#"+btnId).show();
							});
					});
					
					$("#searchUserBtn").on("click",function(){
						let searchID=$("#searchUser").val();
						alert("Click SearchUserBtn ID : "+searchID);
						
						// ajax로 회원 아이디 검사해서 있으면 모달로 띄워주고, 없으면 없다고 띄워주기
						adminService.getUser(searchID,function(result){
							
							
						});
					});
					</script>
</body>
</html>