<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">

<%
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	String todayAll = formatter.format(new Date());
	String[] today = todayAll.split("-", 3);
	int year = Integer.parseInt(today[0]);
%>
<style>
	/* 테이블 헤드 가운데정렬 */
	th {
		text-align: center;
	}
</style>

<script>
	$(document).ready(function() {

		// 처음에 최종금액란, subTotal에 뿌려줄 금액
		var initTotal = 0;
		var totEach = 0;
		var cntItems = 0;
		$('.tot').each(function(index, item) {
			// 각 항목의 총액
			totEach = parseInt($(item).html());
			
			// 최종 금액
			// 1. 각각의 총액을 더해준다
			initTotal = initTotal + totEach;
			cntItems = index+1;
			$('.o-6').html("("+ cntItems +" items)");
		})
		
		// 2. UI의 total, subTotal로 보여지는 부분에 뿌려준다.
		$('.totAllItems').html(initTotal + "원");
		$('.subTotal').html(initTotal + "원");
		$('#subTotal').attr("value", initTotal + "원");
		
		delivery();
		
		
		
		
		// 체크박스 클릭할 때마다 검사
		var chkbox = $('.chkbox');
		chkbox.on('click', function() {
			// 1. 체크박스들을 가져온다(배열)
			var subTotal = 0;
			chkbox.each(function(index, item) {
				// 체크가 되어있는 것이 있다면
				if ($(item).prop('checked') == true) {
					// 2. 같은 줄에 있는 총액을 int형으로 바꾸어 checkedTotal에 더해준다.
					subTotal = subTotal + parseInt($('.tot').eq(index).html());
				}

				// 3. 더한 subTotal을 UI의 subTotal부분에 뿌려준다.
				$('.subTotal').html(subTotal + '원');
				$('#subTotal').attr("value", subTotal);
			})
			delivery();
		})

		
		// 상단에 있는 체크박스 클릭시 >> 모두 선택 or 모두 선택 해제
		$('#selectAll').on('click', function() {
			if($(this).prop('checked')==true) {
				// 선택한 경우 >> 모두 선택
				$('.chkbox').prop('checked', true);
				// subtotal에 전체 금액 찍어주기
				$('.subTotal').html($('.totAllItems').html());
			}else {
				// 선택해제한 경우 >> 모두 선택 해제
				$('.chkbox').prop('checked', false);
				// subTotal에 0원 찍어주기
				$('.subTotal').html("0원");
			}
			delivery();
		})
		
		$('#charge').on('click', function() {
			var chkbox = $('.chkbox'); // 체크박스들을 가져온다.
			var cntChkbox = 0; // 체크된 책의 개수
			chkbox.each(function(index, item) {
				// 체크가 되어있는 것이 있다면
				if ($(item).prop('checked') == true) {
					cntChkbox += 1;
				}
			})
			
			// 체크박스 하나도 클릭 안한 경우 & 장바구니에 아무것도 없는 경우 >> 경고창
			if(cntChkbox == 0) {
				alert("구매하려는 물품이 없습니다.");
			}else {
				$('#sendForm').submit();
			}
			
		})
		
	})
	
	function delivery() {
		var subTotal = $('.subTotal').html();
		var fee;
		var deliveryFee;
		// 배송비 -> 5만원 이상 무료
		if(subTotal!=null && parseInt(subTotal.split("원", 1)) >= 50000) {
			fee = "무료";
			deliveryFee = "0";
		}else {
			deliveryFee = "2500";
		}
		$('.delivery').html(fee);
		$('#delivery').attr('value', deliveryFee);
	}
	
</script>
	
