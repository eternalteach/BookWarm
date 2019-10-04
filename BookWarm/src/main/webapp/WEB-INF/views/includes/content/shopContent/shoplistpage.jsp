<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>

<link rel="stylesheet" href="resources/css/main.css" />

<body>

	<div role="main" class="main">
		<section class="page-header">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-8 text-left">
						<span class="tob-sub-title text-color-primary d-block">LITLE BIT ABOUT US</span>
						<h1>Tabs Control</h1>
						<p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
					<div class="col-md-4">
						<ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
							<li><a href="index.html">Elements</a></li>
							<li class="active">Tabs Control</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="v-page-wrap has-right-sidebar has-one-sidebar">
			<div class="container">
				<!--Horizontal Tab - Clean-->
				<div class="row">
					<div class="col-sm-12">
						<div class="v-heading-v2">
							<h3>bookwarm</h3>
						</div>
					</div>

					<!-- 책 정렬 제목  -->
					<div class="col-sm-12">
						<ul class="nav nav-tabs nav-tabs-default nav-tabs-centered "
							role="tablist">
							<!-- isbn순 -->
							<li class="nav-item"><a class="nav-link active" 
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0" 
								data-toggle="tab"
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00" role="tab"
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								aria-expanded="true">제목순</a></li>
								
							<!-- 제목순 -->	
							<li class="nav-item"><a class="nav-link"
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1"
								data-toggle="tab"								
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tab" 
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
								aria-expanded="true">낮은 가격순</a></li>
							<!-- test//아직 아무것도 없음 -->
    						<li class="nav-item">
                           	 <a class="nav-link " 
                           	 id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2" 
                           	 data-toggle="tab" 
                           	 href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" 
                           	 role="tab" 
                            	aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" 
                           	 aria-expanded="true">높은 가격순</a>
                        	</li>
								
						</ul>
						<!-- ul끝  -->

						<div class="tab-content">
						
							<div class="tab-pane fade show active" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0">
								<!-- shoptitlelist  -->
								<div class="row">
									<c:forEach items="${shoptitlelist}" var="shop">
										<div class="col-md-2"">
											<figure class="product-shadows product-item">
												<p>&nbsp;${shop.isbn}</p>
												
												<!-- 책 이미지 누르면 책 상세정보로 이동 -->
												<div class="product-media">
													<div class="img-wrap first-image">
														<a href="shopproduct?isbn=${shop.isbn}">
														<img src="${shop.book_img}"></a>
													</div>
												</div>

												<div class="product-details">
													<h3 class="product-name">
														<a href="#">${shop.book_title}</a>
													</h3>
													<span class="product-posted_in">
													<a rel="tag">${shop.writer_name}&nbsp;저</a></span>
													<span class="product-posted_in">
													<a rel="tag" id="translastor_name"><%-- ${shop.translator_name}&nbsp;저 --%></a></span>
													<span class="product-price"> <span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${shop.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
								
							</div>
							<!-- 끝 -->

								
							<!-- 가격순 책 불러오기  -->
							<div class="tab-pane fade" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
								role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1">
								<!-- bookpricelist 책 불러오기 -->
								<div class="row">
									<c:forEach items="${bookpricelist}" var="shop_title">
										<div class="col-md-2">
											<figure class="product-shadows product-item">
												<p>&nbsp;${shop_title.isbn}</p>
												<div class="product-media">
													<div class="img-wrap first-image">
														<!-- 책 이미지 누르면 책 상세 페이지로 이동 -->
														<a href="shopproduct?isbn=${shop_title.isbn}"><img src="${shop_title.book_img}"></a>
													</div>
												</div>

												<div class="product-details">
													<h3 class="product-name"><a href="shopproduct?isbn=${shop_title.isbn}">${shop_title.book_title}</a></h3>
													<span class="product-posted_in"><a href="#" rel="tag">${shop_title.writer_name}&nbsp;저</a></span>
													<span class="product-price"> <span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${shop_title.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- bookpricelist 불러오기 끝  -->
							
							<!-- 높은 가격순   -->
								 <div class="tab-pane fade " id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2">

                                     <div class="row">
                                     <c:forEach items="${bookpricelist2}" var="bookpricelist2">
										<div class="col-md-2">
											<figure class="product-shadows product-item">
												<p>&nbsp;${bookpricelist2.isbn}</p>
												<div class="product-media">
													<div class="img-wrap first-image">
														<!-- 책 이미지 누르면 책 상세 페이지로 이동 -->
														<a href="shopproduct?isbn=${bookpricelist2.isbn}"><img src="${bookpricelist2.book_img}"></a>
													</div>
												</div>

												<div class="product-details">
													<h3 class="product-name"><a href="shopproduct?isbn=${bookpricelist2.isbn}">${bookpricelist2.book_title}</a></h3>
													<span class="product-posted_in"><a href="#" rel="tag">${bookpricelist2.writer_name}&nbsp;저</a></span>
													<span class="product-price"> <span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${bookpricelist2.book_price}" pattern="###,###,###" /></span>원<br>
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

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</body>
</html>
