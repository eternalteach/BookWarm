<% String context = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

</head>

<div class="wrapper">
	<div class="page">
		<div class="page-inner p-none">
			<section
				class="section-medium section-arrow--bottom-center section-arrow-primary-color bg-primary">






				<div class="container">
					<div class="row">



						<div class="col-md-12 text-white text-center">
							<h2 class="section-title ">쪽지함이에여!!</h2>
							<p class="section-sub-title">
								<!--                            We are a passionate digital design agency that specializes in beautiful and easy-to- <br>
                           use digital design &amp; web development services. -->
							</p>
						</div>
					</div>
				</div>
			</section>

			<section class="section-primary t-bordered">

				<div class="container">

					<div class="row testimonial-three testimonial-three--col-three">

						<c:forEach items="${msglist}" var="msglist">
							<div class="col-md-4 testimonial-three-col">
								<div class="testimonial-inner">
									<div class="testimonial-image" itemprop="image">
										<img width="180" height="180"
											src="./resources/VertexEx/img/avatars/a1.jpeg">
									</div>
									<div class="testimonial-content">
										<p>${msglist.msg_content}</p>
									</div>
									<div class="testimonial-meta">
										<strong class="testimonial-name" itemprop="name">${msglist.msg_title}</strong>
										<span class="testimonial-job-title" itemprop="jobTitle">${msglist.msg_send_id}</span>
										– <a class="testimonial-link" href="#" target="_blank">Media
											Wiki</a>
									</div>
								</div>
							</div>
						</c:forEach>

						<div class="col-md-4 testimonial-three-col">
							<div class="testimonial-inner">
								<div class="testimonial-image" itemprop="image">
									<img width="180" height="180"
										src="./resources/VertexEx/img/avatars/a2.jpeg">
								</div>

								<div class="testimonial-content">
									<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae,
										justo. Nullam dictum felis eu pede mollis pretium. Integer
										tincidunt. Cras dapibus.</p>
								</div>

								<div class="testimonial-meta">
									<strong class="testimonial-name" itemprop="name">Anna
										Vandana</strong> <span class="testimonial-job-title"
										itemprop="jobTitle">CEO</span> – <a class="testimonial-link"
										href="#" target="_blank">Media Wiki</a>
								</div>
							</div>
						</div>

						<div class="col-md-4 testimonial-three-col">
							<div class="testimonial-inner">
								<div class="testimonial-image" itemprop="image">
									<img width="180" height="180"
										src="./resources/VertexEx/img/avatars/a3.jpeg">
								</div>
								<div class="testimonial-content">
									<p>Nulla consequat massa quis enim. Donec pede justo,
										fringilla vel, aliquet nec, vulputate eget, arcu. In enim
										justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
										dictum felis eu pede mollis pretium.</p>
								</div>
								<div class="testimonial-meta">
									<strong class="testimonial-name" itemprop="name">Anna
										Vandana</strong> <span class="testimonial-job-title"
										itemprop="jobTitle">CEO</span> – <a class="testimonial-link"
										href="#" target="_blank">Media Wiki</a>
								</div>
							</div>
						</div>

						<div class="col-md-4 testimonial-three-col">
							<div class="testimonial-inner">
								<div class="testimonial-image" itemprop="image">
									<img width="180" height="180"
										src="./resources/VertexEx/img/avatars/a4.jpg">
								</div>

								<div class="testimonial-content">
									<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae,
										justo. Nullam dictum felis eu pede mollis pretium. Integer
										tincidunt. Cras dapibus.</p>
								</div>

								<div class="testimonial-meta">
									<strong class="testimonial-name" itemprop="name">Anna
										Vandana</strong> <span class="testimonial-job-title"
										itemprop="jobTitle">CEO</span> – <a class="testimonial-link"
										href="#" target="_blank">Media Wiki</a>
								</div>
							</div>
						</div>

						<div class="col-md-4 testimonial-three-col">
							<div class="testimonial-inner">
								<div class="testimonial-image" itemprop="image">
									<img width="180" height="180"
										src="./resources/VertexEx/img/avatars/a5.jpg">
								</div>
								<div class="testimonial-content">
									<p>Nulla consequat massa quis enim. Donec pede justo,
										fringilla vel, aliquet nec, vulputate eget, arcu. In enim
										justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
										dictum felis eu pede mollis pretium.</p>
								</div>
								<div class="testimonial-meta">
									<strong class="testimonial-name" itemprop="name">Anna
										Vandana</strong> <span class="testimonial-job-title"
										itemprop="jobTitle">CEO</span> – <a class="testimonial-link"
										href="#" target="_blank">Media Wiki</a>
								</div>
							</div>
						</div>

						<div class="col-md-4 testimonial-three-col">
							<div class="testimonial-inner">
								<div class="testimonial-image" itemprop="image">
									<img width="180" height="180"
										src="./resources/VertexEx/img/avatars/a6.jpeg">
								</div>

								<div class="testimonial-content">
									<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae,
										justo. Nullam dictum felis eu pede mollis pretium. Integer
										tincidunt. Cras dapibus.</p>
								</div>

								<div class="testimonial-meta">
									<strong class="testimonial-name" itemprop="name">Anna
										Vandana</strong> <span class="testimonial-job-title"
										itemprop="jobTitle">CEO</span> – <a class="testimonial-link"
										href="#" target="_blank">Media Wiki</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			

			<section class="section-primary p-none">
				<div class="row fw-row">
					<div class="xpromo-wrap col-sm-12">
						<div class="xpromo-bar promo-button bg-primary">
							<a id="send" class="btn standard transparent-light" href="#myModal" target="self" data-toggle="modal">
							<span class="text"><i class="fa fa-cart-plus mr-5"></i>쪽지 보내기</span>
							</a>
							<!-- <a class="btn standard transparent-light" href="#"	target="_self"> <span class="text">
							<i class="fa fa-cart-plus mr-5"></i> Purchase now!</span>
							</a> -->
						</div>
					</div>
				</div>
			</section>	
		</div>

	</div>
</div>

<!-- Modal -->
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

	<div class="modal-dialog modal-sm">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>보낸사람</td>
						<td><input class="form-control" id="msg_send_id" type="text"></td>
					</tr>
					<tr>
						<td>받는사람</td>
						<td><input class="form-control" id="msg_get_id" type="text"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" id="contents" rows="10"></textarea></td>
					</tr>
				</table>
			</div>
			
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-success">보내기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div> 


<script src="<%=context%>/resources/js/messgae.js" type="text/javascript"></script>


</body>
</html>