<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div role="main" class="main">
	<section class="page-header">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-8 text-left">
					<!-- <span class="tob-sub-title text-color-primary d-block">LITLE
						BIT ABOUT US</span> -->
					<h1>나의 주문 내역</h1>
				</div>
				<div class="col-md-4">
					<ul
						class="breadcrumb justify-content-start justify-content-md-end mb-0">
						<li><a href="/warm/myInfo">내 정보</a></li>
						<li class="active">나의 주문 내역</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<div class="v-page-wrap has-left-sidebar has-one-sidebar">

		<div class="container">
			<div class="row">

				<div class="col-sm-9">

					<div class="v-heading-v2 col-sm-8 offset-sm-2 row center-text">
						<h4 class="v-search-result-count">총 ${cnt}건의 주문</h4>
					</div>

					<div class="row" id="insertList">
						<!-- <div class="search-item-content"> -->
						<!-- -----------------리스트 start----------------------- -->
						<c:set var="cnt" value="0" />
						<c:forEach items="${list}" var="list1" varStatus="idx">
						
						<%-- <input type="hidden" class="orders_no" value="${list1.orders_no}"> --%>
							
							<!-- idx는 0부터 시작 -->
							<!-- 이전 객체의 주문번호 -->
							<c:set value="${list[idx.index-1].orders_no}" var="next"/>
							
							<!-- 처음 리스트 : div태그 열어주기만 -->
							<!-- 중간 리스트 : (현재 리스트의 주문번호!=이전 리스트의 주문 번호)열린 태그 닫아주고 다시 div태그 열어주기 -->
							<c:choose>
								<c:when test="${idx.first eq true}" >
									<div class="search-item-content" id="${idx.index}">
									
									<h3 class="search-item-caption">
										<a href="#">주문번호 : ${list1.orders_no}</a>
									</h3>
									<div class="search-item-meta">
										<ul class="list-inline">
											<li class="list-inline-item time">결제 금액 : ${orderList[cnt].orders_total}원</li>
											<li class="list-inline-item time">${list1.orders_date}</li>
										</ul>
									</div>
									<c:set var="cnt" value="${cnt+1}" />
								</c:when>
								<c:when test="${list1.orders_no != next}" >
									</div>
									<div class="search-item-content" id="${idx.index}">
									
									<h3 class="search-item-caption">
										<a href="javascript:">주문번호 : ${list1.orders_no}</a>
									</h3>
									<div class="search-item-meta">
										<ul class="list-inline">
											<li class="list-inline-item time">결제 금액 : ${orderList[cnt].orders_total}원</li>
											<li class="list-inline-item time">${list1.orders_date}</li>
										</ul>
									</div>
									<c:set var="cnt" value="${cnt+1}" />
								</c:when>
							</c:choose>
							
							<div class="col-sm-12">
								<ul class="v-search-items">
									<li class="search-item">
										<div class="search-item-img">
											<a href="#"> <img src="${list1.book_img}"
												width="70" height="70">
											</a>
										</div>
	
										<div class="search-item-content">
											<div>
												${list1.book_title}, ${list1.item_cnt}권
											</div>
	
											<div class="search-item-meta-down">
												<ul class="list-inline">
													<li class="list-inline-item">${list1.orders_total}원</li>
												</ul>
												<ul class="list-inline">
													<li class="list-inline-item" style="color: red">${list1.orders_status}</li>
												</ul>
											</div>
										</div>
									</li>
	
									
								</ul>
							</div>
							<!-- 마지막 리스트 뿌려주고 div태그 닫아주기 -->
							<c:choose>
								<c:when test="${idx.last eq true}" >
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- -----------------리스트 end----------------------- -->
						
						<!-- 페이징 -->
						<div class="col-sm-10 offset-sm-1">
							<div class="v-pagination">
								<ul class="pagenavi bar-styling">
									<li><a href="#" class="current" title="1">1</a></li>
									<li><a href="#" title="2">2</a></li>
									<li><a href="#" title="3">3</a></li>
									<li><a href="#" title="...">...</a></li>
									<li><a href="#" title="40">40</a></li>
									<li><a href="#" title="41">41</a></li>
									<li class="next"><a href="#">Next <i
											class="fa fa-angle-right"></i></a></li>
								</ul>
							</div>
						</div>
						<!-- 페이징 end -->
						
					</div>
				</div>

				<!-- orderList-side-bar include -->
				<%@ include file="./orderList-side-bar.jsp" %>
			</div>
		</div>
	</div>

</div>






