<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>

	<div role="main" class="main">
		<section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-top:20px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-8 text-left">
					</div>
					<div class="col-md-4">
						<ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
							<li><a href="shoplist">책</a></li>
							<li class="active">책 리스트</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="v-page-wrap has-right-sidebar has-one-sidebar" style="margin-bottom:100px;margin-top:30px;">
			<div class="container">
				<!--Horizontal Tab - Clean-->
				<div class="row">
					<div class="col-sm-12">
						<!-- <div class="v-heading-v2">
							<h3>bookwarm</h3>
						</div> -->
					</div>

					<!-- 책 정렬 제목  -->
					<div class="col-sm-12">
						<ul class="nav nav-tabs nav-tabs-default nav-tabs-centered "
							role="tablist">
							<!-- 제목순 -->
							<li class="nav-item"><a class="nav-link active" 
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0" 
								data-toggle="tab"
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00" role="tab"
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								aria-expanded="true">제목순</a></li>
								
							<!-- 낮은가격 -->	
							<li class="nav-item"><a class="nav-link"
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1"
								data-toggle="tab"								
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tab" 
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
								aria-expanded="true">낮은 가격순</a></li>
								
							<!-- 높은 가격 -->
    						<li class="nav-item">
                           	 <a class="nav-link" 
                           	 id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2" 
                           	 data-toggle="tab"
                           	 href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" 
                           	 role="tab" aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" aria-expanded="true">높은 가격순</a>
                        	</li>
                        	
                        	<!-- 좋아한 책  -->
                        	 <li class="nav-item">
                           	 <a class="nav-link" 
                           	 id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a3" 
                           	 data-toggle="tab"
                           	 href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a33" 
                           	 role="tab" aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a33" aria-expanded="true">좋아요</a>
                        	</li>
                        	
								
						</ul>
						<!-- ul끝  -->
						<div class="tab-content">
							<div class="tab-pane fade show active" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0">
								<!-- shoptitlelist  -->
								<div class="row">
									<c:forEach items="${shoptitlelist}" var="shop">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${shop.isbn}">
														<img style="max-width:80%;align:center;" src="${shop.book_img}"  onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="font-size:13px;text-align: center; padding-bottom:0px;">
													<h3 class="product-name" style="margin-bottom: 0px;"><a style="font-size:15px;text-align: center;line-height:20px;">${shop.book_title}</a></h3>
													<span class="product-price" style="padding-bottom: 10px;">
														<span class="product-price-currency" style="text-align: center;">정가&nbsp;<fmt:formatNumber value="${shop.book_price}" pattern="###,###,###" /></span>원<br>
													</span>	
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 가격순 책 불러오기  -->
							<div class="tab-pane fade" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1">
								<div class="row">
									<c:forEach items="${bookpricelist}" var="shop_title">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${shop_title.isbn}">
														<img style="max-width:80%; align:center;" src="${shop_title.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="font-size:13px;text-align: center; padding-bottom:0px;">
													<h3 class="product-name" style="margin-bottom: 0px;"><a style="font-size:15px;text-align:center;line-height:20px;" href="shopproduct?isbn=${shop_title.isbn}">${shop_title.book_title}</a></h3>
													<span class="product-price" style="padding-bottom: 20px;"><span class="product-amount">
														<span class="product-price-currency" style="text-align: center;">정가&nbsp;<fmt:formatNumber value="${shop_title.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 높은 가격순   -->
								 <div class="tab-pane fade " id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2">
                                     <div class="row">
                                     <c:forEach items="${bookpricelist2}" var="bookpricelist2">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${bookpricelist2.isbn}">
														<img style="max-width:80%; align:center;" src="${bookpricelist2.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="font-size:13px;text-align: center; padding-bottom:0px;">
													<h3 class="product-name" style="margin-bottom: 0px;"><a style="font-size:15px;text-align: center;line-height:20px;" href="shopproduct?isbn=${bookpricelist2.isbn}">${bookpricelist2.book_title}</a></h3>
												<%-- 	<span class="product-posted_in"><a style="font-size:13px;text-align: center;line-height:15px;" rel="tag">${bookpricelist2.writer_name}&nbsp;저</a></span> --%>
													<span class="product-price" style="padding-bottom: 20px;"><span class="product-amount">
														<span class="product-price-currency" style="text-align: center;">정가&nbsp;<fmt:formatNumber value="${bookpricelist2.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
													</div>
												</figure>
											</div>
										</c:forEach>
                                    </div>
                                </div>
                                <!-- 좋아요순 -->
                                <div class="tab-pane fade " id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a33" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a3">
                                     <div class="row">
                                     <c:forEach items="${booklike}" var="booklike">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${booklike.isbn}">
														<img style="max-width:80%; align:center;" src="${booklike.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="font-size:13px;text-align: center; padding-bottom:0px;">
													<h3 class="product-name" style="margin-bottom: 0px;"><a style="font-size:15px;text-align: center;line-height:20px;" href="shopproduct?isbn=${booklike.isbn}">${booklike.book_title}</a></h3>
												<%-- 	<span class="product-posted_in"><a style="font-size:13px;text-align: center;line-height:15px;" rel="tag">${bookpricelist2.writer_name}&nbsp;저</a></span> --%>
													<span class="product-price" style="padding-bottom: 20px;"><span class="product-amount">
														<span class="product-price-currency" style="text-align: center;">정가&nbsp;<fmt:formatNumber value="${booklike.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
													</div>
												</figure>
											</div>
										</c:forEach>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				<!--End Horizontal Tab - Clean-->
			</div>
		</div>
	</div>

