<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<h3>Centered</h3>
					</div>
				</div>

				<div class="col-sm-12">

					<ul class="nav nav-tabs nav-tabs-default nav-tabs-centered "
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0"
							data-toggle="tab"
							href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00" role="tab"
							aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
							aria-expanded="true">베스트셀러</a></li>
						<li class="nav-item"><a class="nav-link "
							id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1"
							data-toggle="tab"
							href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tab"
							aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
							aria-expanded="true">제목순</a></li>
						<li class="nav-item"><a class="nav-link "
							id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2"
							data-toggle="tab"
							href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" role="tab"
							aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22"
							aria-expanded="true">Events</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active"
							id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00" role="tabpanel"
							aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0">


							<!-- 베스트 순서로 책불러오기  -->
							<div class="row">
								<c:forEach items="${list}" var="shop">
									<div class="col-md-2"">
										<figure class="product-shadows product-item">
											<p>&nbsp;${shop.book_list}</p>
											<div class="product-media">
												<div class="img-wrap first-image">
													<img src="${shop.book_img}">
												</div>
												<div class="img-wrap second-image">
													<img src="${shop.book_img}">
												</div>

												<div class="cart-overlay clearfix">
													<div class="shop-actions clearfix">
														<div
															class="shop-action-item add-to-cart-wrap lite-tooltip"
															data-title="Add to cart" data-location="top">
															<a href="#"> <i class="fa fa-shopping-basket"></i>
															</a>
														</div>
														<div
															class="shop-action-item add-to-wishlist-wrap lite-tooltip"
															data-title="Add to wishlist" data-location="top">
															<a href="#"> <i class="fa fa-heart"></i>
															</a>
														</div>
													</div>
												</div>
											</div>

											<div class="product-details">
												<h3 class="product-name">
													<a href="#">${shop.book_title}</a>
												</h3>
												<span class="product-posted_in"><a href="#" rel="tag">${shop.writer_name}&nbsp;저</a></span>
												<span class="product-price"> <span
													class="product-amount"> <span
														class="product-price-currency">${shop.book_price_for_sale}</span>원
												</span>
												</span>
											</div>
										</figure>
									</div>
								</c:forEach>
							</div>
							<!-- 책 불러오는 부분 끝 -->


						</div>
						<div class="tab-pane fade "
							id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tabpanel"
							aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1">


							<!-- 제목순으로 책 불러오기 -->
							<div class="row">
								<c:forEach items="${list_title}" var="shop_title">
									<div class="col-md-2">
										<figure class="product-shadows product-item">
											<p>&nbsp;${shop_title.book_list}</p>
											<div class="product-media">
												<div class="img-wrap first-image">
													<img src="${shop_title.book_img}">
												</div>
												<div class="img-wrap second-image">
													<img src="${shop_title.book_img}">
												</div> 
<!-- 
												<div class="cart-overlay clearfix">
													<div class="shop-actions clearfix">
														<div
															class="shop-action-item add-to-cart-wrap lite-tooltip"
															data-title="Add to cart" data-location="top">
															<a href="#"> <i class="fa fa-shopping-basket"></i>
															</a>
														</div>
														<div
															class="shop-action-item add-to-wishlist-wrap lite-tooltip"
															data-title="Add to wishlist" data-location="top">
															<a href="#"> <i class="fa fa-heart"></i>
															</a>
														</div>
													</div>
												</div> -->
											</div>

											<div class="product-details">
												<h3 class="product-name">
													<a href="#">${shop_title.book_title}</a>
												</h3>
												<span class="product-posted_in"><a href="#" rel="tag">${shop_title.writer_name}&nbsp;저</a></span>
												<span class="product-price"> <span
													class="product-amount"> <span
														class="product-price-currency">${shop_title.book_price_for_sale}</span>원
												</span>
												</span>
											</div>
										</figure>
									</div>
								</c:forEach>
							</div>
						</div>
						
						<div class="tab-pane fade "
							id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" role="tabpanel"
							aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2">

							<div class="row">
								<div class="col-sm-12">
									<p>Aliquam erat volutpat. Etiam tortor sapien, elementum
										quis semper eu, convallis eget justo. Nulla facilisi.
										Curabitur cursus vestibulum turpis eget sagittis. Phasellus
										tempus semper tellus, sed ullamcorper libero sodales a. Fusce
										vulputate varius quam. Curabitur erat orci, gravida eu tempus
										sed, pretium non ante. Vestibulum augue nisi, vulputate
										pellentesque posuere id, gravida et est. Suspendisse
										vestibulum scelerisque metus, ut bibendum lorem pharetra nec.
										Phasellus vitae faucibus nisi. Aliquam erat volutpat. Etiam
										sed neque massa. Pellentesque at augue sed neque faucibus
										tincidunt sit amet nec nisl. Aliquam erat volutpat. Etiam
										tortor sapien, elementum quis semper eu, convallis eget justo.
										Nulla facilisi. Curabitur cursus vestibulum turpis eget
										sagittis.</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Etiam aliquam massa quis mauris sollicitudin commodo venenatis
										ligula commodo. Sed blandit convallis dignissim. Pellentesque
										pharetra velit eu velit elementum et convallis erat vulputate.
										Sed in nulla ut elit mollis posuere. Praesent a felis accumsan
										neque interdum molestie ut id massa. In hac habitasse platea
										dictumst. Nulla ut lorem ante. In convallis, felis eget
										consequat faucibus, mi diam consequat augue, quis porta nibh
										leo a massa. Sed quam nunc, vulputate vel imperdiet vel,
										aliquet sit amet risus. Maecenas nec tempus velit. Praesent
										gravida mi et mauris sollicitu.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End Horizontal Tab - Clean-->

		</div>
	</div>
</div>

