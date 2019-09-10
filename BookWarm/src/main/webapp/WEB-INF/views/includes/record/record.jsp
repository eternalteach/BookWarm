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
								<a href="boardlogwrite?isbn=${bookVO.isbn}">&nbsp; &nbsp;<strong
									class="primary-color">Record write</strong>
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
	width: 365px;
	height: 530px;
	padding-left: 15px;
	padding-right: 15px;
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
														</span> <span class="text-sep">&nbsp;|&nbsp;</span> 
														<a class="move" href="${loginglist.write_no}">Modify</a>
														</span>
													</div>
												</c:forEach>
												<br />
												<!-- paging -->

												<div class="row">
													<nav aria-label="Page navigation example">
														<ul class="pagination" style="text-align: center;">
															<c:if test="${pageMaker.prev}">
																<li class="modalPaging page-item"><a
																	class="modalPaging page-link"
																	href="${pageMaker.startPage-1}">Previous</a></li>
															</c:if>

															<c:forEach var="num" begin="${pageMaker.startPage}"
																end="${pageMaker.endPage}">
																<li
																	class="modalPaging page-item ${pageMaker.cri.pageNum==num?"active":""}">
																	<a class="modalPaging page-link" href="${num}">${num}</a>
																</li>
															</c:forEach>

															<c:if test="${pageMaker.next}">
																<li class="modalPaging page-item"><a
																	class="modalPaging page-link"
																	href="${pageMaker.endPage+1}">Next</a></li>
															</c:if>
														</ul>
													</nav>
													<form id='actionForm' action='boardlog' method='get'>
														<input type='hidden' id='pageNum' name='pageNum'
															value='${pageMaker.cri.pageNum}'> <input
															type='hidden' id='amount' name='amount'
															value='${pageMaker.cri.amount}'> <input
															type='hidden' id='isbn' name='isbn'
															value='${bookVO.isbn}'> <input type='hidden'
															id='modalOpen' name='modalOpen' value='${modalOpen}'>
													</form>
												</div>
												<br />
												<button type='button' class='modalClose'>
													<a href="#" rel="modal:close">Close</a>
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
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		var modalOpen = $('#modalOpen').val();
		if (modalOpen == "open") {
			$("#modalRecordDetail").modal("open");
		}

		$(".modalPaging a").on("click", function(e) {
			e.preventDefault(); // a태그 클릭해도 페이지 이동 없도록
			console.log('click');
			$('#modalOpen').val('open');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			// 1. 페이지 리로딩 막기
			// 내부에 있는 값 바꾸려면 ajax사용하기
			// ajax사용해서 해당 부분 html을 바꿔줘야한다.
			// $('#modalRecordDetail').innerHTML()
		});

		
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='write_no' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","boardlogmodify");
			actionForm.submit();
		})
		
		$(".modalClose").on("click", function() {
			$('#modalOpen').val("close");
		});
	});
</script>