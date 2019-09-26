<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="wrapper">
	<div class="page">
		<div class="page-inner p-none">
			<div class="section-primary">
				<div class="container" style="padding-top: 100px;">
					<div class="row">
						<div class="col-md-11">
							<div class="special-heading word-underline-2">
								<h1 class="special-heading-inner">
									<span>주문 내역</span>
								</h1>
							</div>

							<div class="clearfix">
								<p class="fs-24 lh-34 e-custom-heading">주문이 정상적으로 완료되었습니다.:)</p>
							</div>
						</div>
					</div>

					<hr class="invisible pb-15" />

					<div class="row">
						<div class="col-md-4">
							<div class="special-heading underline">
								<h2 class="fs-36 special-heading-inner fw-6">
									<!-- <span>Thank You!</span></br> -->
									<img src="/warm/resources/img/first_page/firstPage.jpg">
								</h2>
							</div>
						</div>
						<div class="col-md-4">
							<!-- 이전 페이지(결제 폼)에서 받을 때
								 받는 사람, 휴대폰번호, 주소 >> postVO.post_name, postVO.post_phone, postVO.post_zipcode + postVO.post_addr + postVO.post_addr_detail
								 주문 도서명, 수량 >> isbn, cart_cnt(model객체로 넘겨준다.)
								 총 결제 금액 >> ordersVO.orders_total
								 결제 방법 >> ordersVO.orders_payment -->
							<p><strong>** 배송지 정보 **</strong></p>
							<p>받으시는 분 : ${postVO.post_name}</p>
							<p>휴대폰 번호 : ${postVO.post_phone}</p>
							<p>주소 : (우편번호 : ${postVO.post_zipcode}) ${postVO.post_addr} ${postVO.post_addr_detail}</p><br>
							
							<p><strong>** 주문 도서 **</strong></p>
							<c:forEach items="${isbn}" var="isbn" varStatus="idx">
								<!-- <p>도서명 수량 표기</p> -->
								<p>${isbn}, ${cart_cnt[idx.index]}권</p>
							</c:forEach>
							<p>총 금액 : ${ordersVO.orders_total}</p>
							결제 방법 :<p id="orders_payment">${ordersVO.orders_payment}</p><br>
							
							<div id="depositInfo">
								<p><strong>** 입금 정보 **</strong></p>
								<p>ABC은행 000-000000-00-000</p>
								<p>${limit}까지 입금해주세요.</p>
							</div>
							
							<div>
								
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>