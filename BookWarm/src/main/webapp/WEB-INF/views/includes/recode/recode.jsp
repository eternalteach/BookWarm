<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <section class="section-small main-color"> background white-->
<section class="section-primary alternate-color b-bordered">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="special-heading word-underline">
					<h4 class="special-heading-inner">
						<span> Reading Record </span>
					</h4>
				</div>
				<div class="progress-bars v2">
					<div class="progress-label">
						<span>읽은 기록</span>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-primary"
							data-appear-progress-animation="${boardlog.amount}%">
							<span class="progress-bar-tooltip">${boardlog.amount}%</span>
						</div>
					</div>
					<div class="progress-label">
						<span>Design</span>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-primary"
							data-appear-progress-animation="85%"
							data-appear-animation-delay="300">
							<span class="progress-bar-tooltip">85%</span>
						</div>
					</div>

					<div class="progress-label">
						<span>Photoshop</span>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-primary"
							data-appear-progress-animation="65%"
							data-appear-animation-delay="500">
							<span class="progress-bar-tooltip">65%</span>
						</div>
					</div>
					<div class="progress-label">
						<span>Bootstrap</span>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-primary"
							data-appear-progress-animation="95%"
							data-appear-animation-delay="700">
							<span class="progress-bar-tooltip">95%</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="section-primary alternate-color b-bordered">
	<div class="container">
		<div class="row">
			<div class="col-md-6 counters v2">
				<div class="content-grid custom-content-grid mt-35">
					<div class="row content-grid-row">
						<div class="content-grid-item col-md-6">
							<div class="counter text-right">
								<strong class="fs-42 primary-color" data-to="${boardlog.amount}"
									data-plugin-options="{&quot;decimals&quot;: 2}">${boardlog.amount}</strong>
								<span>읽은 페이지</span>
							</div>
						</div>
						<div class="content-grid-item col-md-6">
							<div class="counter text-left">
								<strong class="fs-42 primary-color" data-to="${book.readingNum}">${book.readingNum}</strong> <span>함께 읽는 독자 수</span>
							</div>
						</div>
					</div>
					<div class="row content-grid-row">
						<div class="content-grid-item col-md-6">
							<div class="counter text-right">
								<strong class="fs-42 primary-color" data-to="${boardlog.recordNum}">${boardlog.recordNum}</strong>
								<span>감상문 수</span>
							</div>
						</div>
						<div class="content-grid-item col-md-6">
							<div class="counter text-left">
								<strong>기록 추가</strong>
								<span></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>