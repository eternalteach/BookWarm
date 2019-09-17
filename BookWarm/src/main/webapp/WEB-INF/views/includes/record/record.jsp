<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=path%>/resources/js/record.js"></script>
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
							<!-- open more record modal -->
								<span>Record</span>&nbsp; &nbsp;
								<a href="javascript:openModal('modal-more-record')"><strong class="primary-color" data-to="${recordNum}" data-plugin-options="{&quot;decimals&quot;: 0}">${recordNum}</strong></a>
							</div>
							<div class="special-heading text-left">
							<!-- open add record modal -->
								<a href="javascript:openModal('modal-add-record')">&nbsp; &nbsp;<strong class="primary-color">Record write</strong>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


	<%@ include file="./modal-record-script.jsp"%>
<div id='overlay' >
	<div id="modal" class="modal">
	<!-- 기록 보는 모달창 -->
	<%@ include file="./modal-more-record.jsp"%>
	<!-- 기록 쓰는 모달창 -->
	<%@ include file="./modal-add-record.jsp"%>
	</div>
</div>
