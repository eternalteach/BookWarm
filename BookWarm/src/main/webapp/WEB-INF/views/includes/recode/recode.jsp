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
				<div class="progress-bars v2">
					<div class="progress-label">
						<span>Reading</span>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-primary"
							data-appear-progress-animation="${reading}%">
						</div>
							<span class="progress-bar-tooltip">${reading}%</span>
					</div>
					<div class="content-grid-item col-md-6">
						<div>
							<div class="progress-label">
								<span>ReadingPage</span>&nbsp &nbsp<strong class="primary-color" data-to="${readPageNum}">${readPageNum}</strong>
							</div>
						</div>
						<div>
							<div class="progress-label">
								<span>TotalPage</span>&nbsp &nbsp<strong class="primary-color" data-to="${bookTotalPage}">${bookTotalPage}</strong>
							</div>
						</div>
						<div>
							<div class="progress-label">
								<span>Record</span>&nbsp &nbsp<strong class="primary-color" data-to="${recordNum}">${recordNum}</strong>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>