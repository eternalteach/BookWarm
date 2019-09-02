<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <section class="section-small main-color"> background white-->
<!-- <section class="section-primary alternate-color b-bordered"> -->
<section class="section-primary alternate-color b-bordered">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="special-heading word-underline">
					<h4 class="special-heading-inner">
						<span> Reading Record </span>
					</h4>
				</div>
				<article class="v_blog-item">
					<div class="v_blog-item-inner row">
						<div class="v_blog-item-media col-md-12">
							<a href="#"> <img src="${bookVO.book_img}" />
							</a>
						</div>
					</div>
				</article>
				<div class="progress-bars v2">
					<div class="progress-label">
						<span>Reading</span>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-primary"
							data-appear-progress-animation="${reading}%"></div>
						<span class="progress-bar-tooltip">${reading}%</span>
					</div>
					<div class="content-grid-item col-md-12">
						<div class="counters">
							<div class="progress-label">
								<span>ReadingPage</span>&nbsp; &nbsp;<strong
									class="primary-color" data-to="${readPageNum}"
									data-plugin-options="{&quot;decimals&quot;: 0}">${readPageNum}</strong>
							</div>
						</div>
						<div class="counters">
							<div class="progress-label">
								<span>TotalPage</span>&nbsp; &nbsp;<strong class="primary-color"
									data-to="${bookVO.book_tot_page}"
									data-plugin-options="{&quot;decimals&quot;: 0}">${bookVO.book_tot_page}</strong>
							</div>
						</div>
						<div class="counters">
							<div class="progress-label">
								<span>Record</span>&nbsp; &nbsp;<a href="#modalRecordDetail"
									rel="modal:open"><strong class="primary-color"
									data-to="${recordNum}"
									data-plugin-options="{&quot;decimals&quot;: 0}">${recordNum}</strong></a>
							</div>
							<div class="special-heading text-left">
								<a href="boardlogwrite?isbn=${bookVO.isbn}">&nbsp;
									&nbsp;<strong class="primary-color">Record write</strong>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<style>
#modalRecordDetail {
	left: 20%;
	top: 20%;
}
</style>

<div class="col-md-8 right-side-sidebar v_blog-medium pt-70">
	<!-- article space -->
	<div class="row">
		<div class="has-right-sidebar has-one-sidebar">
			<div class="container">
				<div class="row">
					<div id="modalRecordDetail" class="modal">
						<div class="col-sm-15 v-blog-wrap">
							<div class="v-blog-items-wrap blog-standard">
								<ul class="v-blog-items row standard-items clearfix">
									<li class="v-blog-item col-sm-12">
										<div class="post-content no-thumb clearfix">
											<!-- 박스 -->
											<div class="post-header">
												<span class="blog-author minor-meta"> Posted by <span
													class="entry-author-link"> <span
														class="vcard author"> <span
															class="v-blog-item-details"> <a href="#"
																title="Posts by HB-Themes" rel="author">작성자</a>
														</span>
													</span>
												</span>
												</span>
												<div class="form-body p-none pb-40">
													<div class="smart-forms">
														<section class="sidebar-widget bordered-sidebar">
															<div class="heading">
																<h4 class="title">Reading range</h4>
															</div>
															<div class="section">
																<div class="spacer-b15">
																	<input type="text" id="startRead" class="slider-input"
																		value="${startPage}" hidden="hidden"> <input
																		type="text" id="endRead" class="slider-input"
																		value="${endPage}" hidden="hidden"> <input
																		type="text" id="bookTotalPage"
																		value="${bookVO.book_tot_page}" hidden="hidden">
																</div>
																<!-- end .spacer -->
																<div class="slider-wrapper">
																	<div id="slider-range"></div>
																</div>
																<br /> <span>Total &nbsp; p.${startPage} -
																	p.${endPage}</span>
																<!-- end .slider-wrapper -->
															</div>
															<!-- end section -->
														</section>
													</div>
												</div>

												<c:forEach items="${loginglist}" var="loginglist">
													<div class="post-meta-info">
														<span class="blog-categories minor-meta"> <span
															class="comment-container minor-meta"> <fmt:parseDate
																	value="${loginglist.start_date}" var="start_date"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${start_date}" pattern="yyyy-MM-dd" />
														</span> <span class="comment-container minor-meta">
																&nbsp;&nbsp;p.${loginglist.start_page}&nbsp;&nbsp;-&nbsp;p.${loginglist.end_page}
														</span> <span class="text-sep">&nbsp;|&nbsp;</span> <a
															href="boardlogmodify?write_no=${loginglist.write_no}">Modify</a>
														</span>
													</div>
												</c:forEach>

												<!-- paging -->
												<div class="row">
													<div class="col-md-12">
														<nav aria-label="Page navigation example">
															<ul class="pagination">
																<c:if test="${pageMaker.prev}">
																	<li class="page-item disabled"><a
																		class="page-link" href="#" tabindex="-1">Previous</a></li>
																</c:if>

																<c:forEach var="num" begin="${pageMaker.startPage}"
																	end="${pageMaker.endPage}">
																	<li class="page-item"><a class="page-link"
																		href="#">1</a></li>
																</c:forEach>

																<c:if test="${pageMaker.next}">
																	<li class="page-item"><a class="page-link"
																		href="#">Next</a></li>
																</c:if>
															</ul>
														</nav>

													</div>
												</div>

											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>