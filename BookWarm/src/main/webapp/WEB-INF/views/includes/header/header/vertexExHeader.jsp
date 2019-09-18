<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String context = request.getContextPath();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	String todayAll = formatter.format(new Date());
	String[] today = todayAll.split("-", 3);
	int year = Integer.parseInt(today[0]);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Vertex - Responsive HTML5 Bootstrap Template</title>
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Vertex - Responsive HTML5 Template">
<meta name="author" content="bootstraptemplates.net">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="shortcut icon" href="<%=context%>/resources/VertexEx/img/favicon.png" type="image/x-icon" />
<link rel="apple-touch-icon" href="<%=context%>/resources/VertexEx/img/apple-touch-icon.png">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700|Cabin:400,600,700" rel="stylesheet">

<!-- Vendor -->
<script src="<%=context%>/resources/VertexEx/vendor/jquery/jquery.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/jquery/jquery.nav.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/jquery/jquery.validate.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/jquery.appear/jquery.appear.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/jquery-cookie/jquery-cookie.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/magnific-popup/jquery.magnific-popup.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/modernizr/modernizr.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/tether/tether.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/menuzord/menuzord.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/sticky/jquery.sticky.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/isotope/jquery.isotope.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/respond/respond.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/images-loaded/imagesloaded.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/owl-carousel/owl.carousel.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/wow/wow.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/lite-tooltip/js/litetooltip.js"></script>
<script src="<%=context%>/resources/VertexEx/js/theme-plugins.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/smoothscroll/smooth.scroll.min.js"></script>

<!-- Vendor CSS -->
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/tether/tether.min.css" />
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/bootstrap/css/glyphicon.css" />
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/ion-icons/css/ionicons.min.css" />
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/owl-carousel/owl.theme.css" />
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/owl-carousel/owl.carousel.css" />
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/vendor/lite-tooltip/css/litetooltip.css" />

<!-- Current Page CSS -->
<link href="<%=context%>/resources/VertexEx/smartforms/Templates/css/smart-forms.css" rel="stylesheet" />

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="<%=context%>/resources/VertexEx/css/custom.css">

<!-- Style Swicher -->
<link href="<%=context%>/resources/VertexEx/vendor/style-switcher/style-switcher.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/vendor/style-switcher/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" />

<!-- Theme CSS -->
<link href="<%=context%>/resources/VertexEx/css/main.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/main-shortcodes.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/header.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/shop.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/bg-stylish.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/form-element.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/animation.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/font-icons.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/responsive.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/utilities.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/skins/default.css" rel="stylesheet" />


<link href="<%=context%>/resources/Vertex/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/style.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/font-awesome.min.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/streamline-icon.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/header.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/portfolio.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/blog.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/v-animation.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/v-bg-stylish.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/font-icons.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/shortcodes.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/css/utilities.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/main-shortcodes.css" rel="stylesheet" /><!-- modal -->
<link href="<%=context%>/resources/Vertex/css/theme-responsive.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/plugins/aos/aos.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/plugins/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="<%=context%>/resources/Vertex/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" />

<link href="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/css/smart-addons.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/smartforms/Templates/css/smart-forms.css" rel="stylesheet" />

<!-- Smart Form Elements -->
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-custom.min.js"></script>
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery.placeholder.min.js"></script>
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/select2.full.min.js"></script>
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-combo.min.js"></script>

<!-- Custom JS -->
<script src="<%=context%>/resources/VertexEx/js/custom.js"></script>
<!-- Theme Initialization -->
<script src="<%=context%>/resources/VertexEx/js/theme.js"></script>
<!-- Style Swicher -->
<link href="<%=context%>/resources/VertexEx/vendor/style-switcher/style-switcher.css" rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/vendor/style-switcher/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" />
	<!-- Smart Form Elements -->
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-custom.min.js"></script>
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery.placeholder.min.js"></script>
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/select2.full.min.js"></script>
<script src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-combo.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(
			function($) {
				$(".example-tags").select2({
					tags : true
				});

				$("#ddFormat").datepicker({
					prevText : '<i class="fa fa-chevron-left"></i>',
					nextText : '<i class="fa fa-chevron-right"></i>',
					dateFormat : "dd/mm/yy"
				});

				$("#yyFormat").datepicker({
					prevText : '<i class="fa fa-chevron-left"></i>',
					nextText : '<i class="fa fa-chevron-right"></i>',
					dateFormat : "yy/mm/dd"
				});

				$("#city").combobox();
				$("#region").combobox();

				$("#slider").slider({
					range : "min",
					min : 10,
					max : 100,
					value : 80
				});
				$("#slider1").slider({
					range : true,
					values : [ 17, 83 ]
				});

				$("#slider2").slider({
					range : "min",
					value : 140,
					min : 1,
					max : 800,
					slide : function(event, ui) {
						$("#amount").val("$" + ui.value);
					}
				});

				$("#amount").val("$" + $("#slider2").slider("value"));

				$("#slider3").slider({
					range : "max",
					min : 1,
					max : 10,
					value : 2,
					slide : function(event, ui) {
						$("#bedrooms").val(ui.value);
					}
				});

				$("#bedrooms").val($("#slider3").slider("value"));

				//var select = $("#guests");
				//var guestnumber = $("#slider4").slider({
				//	min: 1,
				//	max: 10,
				//	range: "min",
				//	value: select[0].selectedIndex + 1,
				//	slide: function(event, ui) {
				//		select[0].selectedIndex = ui.value - 1;
				//	}
				//});

				$("#guests").change(function() {
					guestnumber.slider("value", this.selectedIndex + 1);
				});

				$("#slider5").slider({
					value : 100,
					min : 0,
					max : 500,
					step : 50,
					range : "min",
					slide : function(event, ui) {
						$("#donation").val(ui.value);
					}
				});

				$("#donation").val($("#slider5").slider("value"));
				$("#donation").blur(function() {
					$("#slider5").slider("value", $(this).val());
				});

				$("#slider6").slider({
					orientation : "vertical",
					range : "min",
					min : 0,
					max : 100,
					value : 60,
					slide : function(event, ui) {
						$("#volume").val(ui.value);
					}
				});

				$("#volume").val($("#slider6").slider("value"));

				$("#slider7").slider(
						{
							orientation : "vertical",
							range : true,
							values : [ 27, 67 ],
							slide : function(event, ui) {
								$("#sales").val(
										"$" + ui.values[0] + " - $"
												+ ui.values[1]);
							}
						});
				$("#sales").val(
						"$" + $("#slider7").slider("values", 0) + " - $"
								+ $("#slider7").slider("values", 1));

				$("#eq > .sliderv-wrapper").each(function() {
					var value = parseInt($(this).text(), 10);
					$(this).empty().slider({
						value : value,
						range : "min",
						animate : true,
						orientation : "vertical"
					});
				});

				$("#eq2 > .sliderv-wrapper").each(function() {
					var value = parseInt($(this).text(), 10);
					$(this).empty().slider({
						value : value,
						range : "min",
						animate : true,
						orientation : "vertical"
					});
				});

				$('#slider8').slider(
						{
							range : true,
							values : [ 500, 1500 ],
							min : 10,
							max : 2000,
							step : 10,
							slide : function(event, ui) {
								$("#budget").val(
										"$" + ui.values[0] + " - $"
												+ ui.values[1]);
							}
						});

				$("#budget").val(
						"$" + $("#slider8").slider("values", 0) + " - $"
								+ $("#slider8").slider("values", 1));

				var initialYear = 1980;
				var yearTooltip = function(event, ui) {
					var curYear = ui.value || initialYear
					var yeartip = '<span class="slider-tip">' + curYear
							+ '</span>';
					$(this).find('.ui-slider-handle').html(yeartip);
				}

				$("#slider10").slider({
					value : initialYear,
					range : "min",
					min : 1950,
					max : 2020,
					step : 1,
					create : yearTooltip,
					slide : yearTooltip
				});

				$("#slider-range").slider(
						{
							range : true,
							min : 0,
							max : 500,
							values : [ 50, 420 ],
							slide : function(event, ui) {
								$("#amounts").val(
										"$" + ui.values[0] + " - $"
												+ ui.values[1]);
							}
						});

				$("#amounts").val(
						"$" + $("#slider-range").slider("values", 0) + " - $"
								+ $("#slider-range").slider("values", 1));

				$("#slider11").slider(
						{
							min : 100,
							max : 1000,
							step : 10,
							values : [ 300, 700 ],
							range : true,
							slide : function(event, ui) {
								for (var i = 0; i < ui.values.length; ++i) {
									$(".sliderValue[data-index=" + i + "]")
											.val(ui.values[i]);
								}
							}
						});

				$(".sliderValue").change(
						function() {
							var $this = $(this);
							$("#slider11").slider("values",
									$this.data("index"), $this.val());
						});

				var valtooltip = function(sliderObj, ui) {
					val1 = '<span class="slider-tip">'
							+ sliderObj.slider("values", 0) + '</span>';
					val2 = '<span class="slider-tip">'
							+ sliderObj.slider("values", 1) + '</span>';
					sliderObj.find('.ui-slider-handle:first').html(val1);
					sliderObj.find('.ui-slider-handle:last').html(val2);
				};

				$("#slider-range2").slider(
						{
							range : true,
							min : 0,
							max : 500,
							values : [ 50, 450 ],
							create : function(event, ui) {
								valtooltip($(this), ui);
							},
							slide : function(event, ui) {
								valtooltip($(this), ui);
								$("#amountx").val(
										"$" + ui.values[0] + " - $"
												+ ui.values[1]);
							},
							stop : function(event, ui) {
								valtooltip($(this), ui);
							}

						});

				$("#amountx").val(
						"$" + $("#slider-range2").slider("values", 0) + " - $"
								+ $("#slider-range2").slider("values", 1));

				var initialSpark = 60;
				var sparkTooltip = function(event, ui) {
					var curSpark = ui.value || initialSpark
					var sparktip = '<span class="slider-tip">' + curSpark
							+ '</span>';
					$(this).find('.ui-slider-handle').html(sparktip);
				}

				$("#slider9").slider({
					orientation : "vertical",
					range : "min",
					min : 1,
					max : 100,
					step : 1,
					value : initialSpark,
					create : sparkTooltip,
					slide : sparkTooltip
				});

			});
</script>

<!-- shopContent.jsp에서 사용 -->
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
		$('.totAllItems').html("<strong>" + initTotal + "원</strong>");
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

		// 수량을 올릴 때마다 UI에 반영 & db에 반영
		/* $('.cnt').click(function() {
			var price;
			var cnt;
			var tot;
			var totAllItems = 0;
			var changeSubTotal = 0;
			
			// 모든 튜플의 수량을 가져온다.
			$('.cnt').each(function(index, item) {
				price = $('.price').eq(index).html();
				cnt = item.value;
				tot = price * cnt; // 각 튜플마다의 총액
				totAllItems = totAllItems + tot; // 장바구니 총액
				
				// 각각 물품 총액에 반영
				$('.tot').eq(index).html(tot);
				
				// 체크박스 O -> subtotal 적용
				// 체크박스 X -> subtotal 적용 X
				if($('.chkbox').eq(index).prop('checked')==true) {
					changeSubTotal = changeSubTotal + parseInt($('.tot').eq(index).html());
				}
			})
			
			// 장바구니 총액에 반영
			$('.totAllItems').html("<strong>" + totAllItems + "원</strong>");
			// subTotal에 반영
			$('.subTotal').html(changeSubTotal+"원");
		}) */

		// 삭제 버튼 클릭 >> 클릭한거 hidden처리
		//$('.fa-trash').on('click', function() {
		//	// 1. 클릭한 것의 id를 가져온다
		//	var getId = "#item-" + $(this).prop("id");
		//	alert($(getId).prop("class"));
		////	// 2. 그 id와 동일한 id를 가진 tr을 hidden
		//	$(getId).attr("hidden", true);
		//})
		
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
			$('#sendForm').submit();
		})
		
	})
	
	function delivery() {
		var subTotal = $('.subTotal').html();
		var fee;
		
		// 배송비 -> 5만원 이상 무료
		if(subTotal!=null && parseInt(subTotal.split("원", 1)) >= 50000) {
			fee = "무료";
		}else {
			fee = "2500원";
		}
		$('.delivery').html(fee);
		$('#delivery').attr('value', fee);
	}
	
</script>
<!-- /shopContent.jsp에서 사용 -->

<!-- shopChargePage.jsp에서 사용(daum 주소 api) -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // data는 사용자가 선택한 주소 정보를 담고 있는 객체.
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr  + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script>
  	$(document).ready(function() {
  		
  		// 적립금 사용
  		$('#applyPoint').on('click', function() {
  			var point = $('#point').val(); // 사용하려고 입력한 포인트
  			var availablePoint = parseInt($('#availablePoint').text()); // 가용포인트
  			var numExp = /[0-9]/; // 숫자만 입력하는 정규식
  			
  			if(numExp.test(point)) {
  				// 받아온 값이 숫자면 parseInt 해준다.
  				point = parseInt(point);
   			
  				if(availablePoint<point) {
     			// 가용포인트<사용하려는 포인트 -> 경고창
   				alert("가용 포인트는 "+availablePoint+"p 입니다.");
   				$('#point').val('');
   			}else {
   				// 가용포인트>=사용포인트 -> 사용 포인트에 입력
   				$('#usePoint').text(point);
   				// 최종금액에 반영
   				$('#discountPoint').text("<td class='cart-product-name'>-<span class='amount' id='discount'>"+point+"(포인트)</span></td>");
   			}
  			}else {
  				// 숫자가 아닌 값 입력 시 -> 경고창, 입력부분 비워버리기
  				alert('숫자만 입력 가능합니다.');
  				alert(point);
  				$('#point').val('');
  			}
  			
  		})
  		
  		// 카드 결제 >> expired year (현재년도~10년뒤)
  		for(var i = <%=year%>; i < <%=year+10%>; i++) {
  			$('#cardyear').append('<option value='+i+'>'+i+'</option>')
  		}
  		
  		// 쿠폰선택 클릭했을 때, 
  		$('#pickCoupon').on('click', function() {
  			window.open('<%=context%>/shop/pickCoupon','pickCoupon','width=430,height=500,location=no,status=no,scrollbars=yes');
  		})
  	})
</script>
