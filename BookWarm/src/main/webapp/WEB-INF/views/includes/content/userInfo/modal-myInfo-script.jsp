<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style>
	#modal, #setCouponModal {
		display:none;
		background-color:white;
		position:fixed;
		width: 365px;
		height: 530px;
		padding-left: 15px;
		padding-right: 15px;
		left: 50%;
		top: 30%;
	}
</style>
<script>
	// 쿠폰 선택 버튼 눌렀을 때 실행
	function pickCoupon() {
		$('#modal').fadeIn(500);
	
		$.ajax({
			url : '/warm/shop/pickCoupon',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				// data(쿠폰 객체를 담은 list)를 받아와서 couponList.jsp페이지에 값을 넘겨줘야함.
				var couponList = data;
				var str = "";
				str += "<div class='smartforms-modal-header'>";
	 			str += "<h3>내 쿠폰</h3>";
				str += "<a href='javascript:hideModal()' class='smartforms-modal-close' style='text-align:right'>&times;</a>";
				str += "</div>";
				
				str += "<div class='smartforms-modal-body'>";
				str += "<div class='smart-wrap'>";
				str += "<div class='smart-forms smart-container wrap-full'>";
				str += "<div class='form-body'>";
				str += "<div class='frm-row'>";
				for(var i=0; i<couponList.length; i++) {
					str += "<div class='author-info-wrap clearfix col-sm-12' style='margin-top: 0px;'>"
					str += "<div class='section'>";
					str += "쿠폰 번호 : "+couponList[i].coupon_no+"<br>";
					str += "</div>";
					str += "<div class='section'>";
					str += "쿠폰 이름 : "+couponList[i].coupon_name+"<br>";
					str += "</div>";
					str += "<div class='section'>";
					str += "쿠폰 사용 가능 회원 level : ";
					for(var j=couponList[i].coupon_req; j<=3; j++) {
						if(j==3) {
							str = str + j;
						}else {
							str = str + j + ", ";
						}
					}
					str += "</div>";
					str += "<div class='section'>";
					str += couponList[i].coupon_use_req+"이상 구매시 사용 가능";
					str += "</div>";
					str += "<div class='section'>";
					str += "할인율 : "+couponList[i].coupon_discount_percent+"<br>";
					str += "</div>";
					str += "<div class='section'>";
					str += "유효기간 : "+couponList[i].coupon_validate;
					str += "</div>";
					str += "</div><br>";
				}
				str += "</div>";
				str += "</div>";
				str += "</div>";
				str += "</div>";
				
				// 할인 및 적립>쿠폰 창에 쿠폰 이름 입력
				$('#modal').html(str);
				
			}, error : function() {
				console.log("error!");
			}
		})
	}
	
	
	// 모달 창 끄기
	function hideModal() {
		$('#modal').fadeOut();
	}
	
	// 쿠폰 등록 modal open
	function enrollCouponNo() {
		$('#setCouponModal').fadeIn(500);
	}
	
	// 입력받은 쿠폰 번호를 모달에 띄우기
	function searchCoupon(couponNo) {
		$.ajax({
			url : '/warm/searchCoupon?coupon_no='+couponNo,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				if(data!=null) {
					
					var str = "";
					
					str += "<div class='frm-row'>";
					str += "<div class='author-info-wrap clearfix col-sm-12' style='margin-top: 0px;'>"
					str += "<div class='section'>";
					str += "쿠폰 번호 : "+data.coupon_no+"<br>";
					str += "</div>";
					str += "<div class='section'>";
					str += "쿠폰 이름 : "+data.coupon_name+"<br>";
					str += "</div>";
					str += "<div class='section'>";
					str += "쿠폰 사용 가능 회원 level : ";
					for(var j=data.coupon_req; j<=3; j++) {
						if(j==3) {
							str = str + j;
						}else {
							str = str + j + ", ";
						}
					}
					str += "</div>";
					str += "<div class='section'>";
					str += data.coupon_use_req+"이상 구매시 사용 가능";
					str += "</div>";
					str += "<div class='section'>";
					str += "할인율 : "+data.coupon_discount_percent+"<br>";
					str += "</div>";
					str += "<div class='section'>";
					str += "유효기간 : "+data.coupon_validate;
					str += "</div><br>";
					str += "<div class='smartforms-modal-footer'>";
					str += "<form action='/warm/selectCoupon'>";
					str += "<input type='hidden' name='coupon_no' value="+data.coupon_no+">";
					str += "<input type='submit' class='select btn v-btn standard lightgrey standard' value='선택'>";
					str += "</form>";
					
					str += "</div>";
					str += "</div>";
					
					
					$('#showCoupons').html(str);
					
				}else {
					alert("검색하신 쿠폰이 존재하지 않습니다.");
				}
			}, error : function() {
				console.log("error!");
			}
		})
	}
	
	
	
	
	$(document).ready(function() {
		$("#modal").hide();
		$("#setCouponModal").hide();
	});
	

</script>