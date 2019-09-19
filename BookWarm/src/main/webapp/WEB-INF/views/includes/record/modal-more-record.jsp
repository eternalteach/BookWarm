<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 기록 보는 모달창 -->
<div id="modal-more-record" class="modal-more-record modal-record">
	<div class="row">
		<div class="con">
			<div class="col-sm-15 v-blog-wrap">
				<div class="v-blog-items-wrap blog-standard">
					<ul class="v-blog-items row standard-items clearfix">
						<li class="v-blog-item col-sm-12">
							<div class="post-content no-thumb clearfix">
								<div class="post-header">
									<span class="blog-author minor-meta"> Posted by <span
										class="entry-author-link"> <span class="vcard author">
												<span class="v-blog-item-details"> <a href="#"
													title="Posts by HB-Themes" rel="author">작성자</a>
											</span>
										</span>
									</span>
									</span>
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
												<div class="slider-wrapper">
													<div id="slider-range"></div>
												</div>
												<br />
												<div style="text-align: center;">
													<span>Total &nbsp; p.${startPage} - p.${endPage}</span><br />
												</div>
											</div>
										</section>
									</div>

									<c:forEach items="${loginglist}" var="loginglist">
										<div class="post-meta-info" style="text-align: center;">
											<span class="blog-categories minor-meta"> <span
												class="comment-container minor-meta"> <fmt:parseDate
														value="${loginglist.start_date}" var="start_date"
														pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
														value="${start_date}" pattern="yyyy-MM-dd" />
											</span> <span class="comment-container minor-meta">
													&nbsp;&nbsp;p.${loginglist.start_page}&nbsp;&nbsp;-&nbsp;p.${loginglist.end_page}
											</span> <span class="text-sep">&nbsp;|&nbsp;</span> <a class="move"
												href="recordmodify?write_no=${loginglist.write_no}">Modify</a>
											</span>
										</div>
									</c:forEach>
									<br />
									<!-- paging -->

									<br />
									<button type='button' class='modalClose'>
										<a href="javascript:;" class="close">Close</a>
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
