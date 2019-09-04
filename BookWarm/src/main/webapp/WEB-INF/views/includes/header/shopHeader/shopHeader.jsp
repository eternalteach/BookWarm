
<%
	String context = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Vertex - Responsive HTML5 Bootstrap Template</title>
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Vertex - Responsive HTML5 Template">
<meta name="author" content="bootstraptemplates.net">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="shortcut icon"
	href="<%=context%>/resources/VertexEx/img/favicon.png"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="<%=context%>/resources/VertexEx/img/apple-touch-icon.png">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700|Cabin:400,600,700"
	rel="stylesheet">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/tether/tether.min.css" />
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/bootstrap/css/glyphicon.css" />
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/ion-icons/css/ionicons.min.css" />
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/owl-carousel/owl.theme.css" />
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/owl-carousel/owl.carousel.css" />
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/vendor/lite-tooltip/css/litetooltip.css" />

<!-- Theme CSS -->
<link href="<%=context%>/resources/VertexEx/css/main.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/main-shortcodes.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/header.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/shop.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/bg-stylish.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/form-element.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/animation.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/font-icons.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/responsive.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/utilities.css"
	rel="stylesheet" />
<link href="<%=context%>/resources/VertexEx/css/skins/default.css"
	rel="stylesheet" />
<link
	href="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/css/smart-addons.css"
	rel="stylesheet" />
<link
	href="<%=context%>/resources/VertexEx/smartforms/Templates/css/smart-forms.css"
	rel="stylesheet" />

<!-- Theme Custom CSS -->
<link rel="stylesheet"
	href="<%=context%>/resources/VertexEx/css/custom.css">

<!-- Style Swicher -->
<link
	href="<%=context%>/resources/VertexEx/vendor/style-switcher/style-switcher.css"
	rel="stylesheet" />
<link
	href="<%=context%>/resources/VertexEx/vendor/style-switcher/bootstrap-colorpicker/css/bootstrap-colorpicker.css"
	rel="stylesheet" />


<!-- Vendor -->
<script src="<%=context%>/resources/VertexEx/vendor/jquery/jquery.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/jquery/jquery.nav.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/jquery/jquery.validate.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/jquery.appear/jquery.appear.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/jquery.easing/jquery.easing.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/jquery-cookie/jquery-cookie.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/magnific-popup/jquery.magnific-popup.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/modernizr/modernizr.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/tether/tether.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/menuzord/menuzord.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/sticky/jquery.sticky.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/isotope/jquery.isotope.min.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/respond/respond.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/images-loaded/imagesloaded.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/owl-carousel/owl.carousel.js"></script>
<script src="<%=context%>/resources/VertexEx/vendor/wow/wow.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/vendor/lite-tooltip/js/litetooltip.js"></script>
<script src="<%=context%>/resources/VertexEx/js/theme-plugins.js"></script>

<!-- Smart Form Elements -->
<script
	src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-custom.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery.placeholder.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/select2.full.min.js"></script>
<script
	src="<%=context%>/resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-combo.min.js"></script>


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
		$('.fa-trash').on('click', function() {
			// 1. 클릭한 것의 id를 가져온다
			var getId = "#item-" + $(this).prop("id");
			alert($(getId).prop("class"));
			// 2. 그 id와 동일한 id를 가진 tr을 hidden
			$(getId).attr("hidden", true);
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

<!-- shopChargePage.jsp에서 사용 -->
<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//해당 코드는 사용자가 클릭한것을 반환해준다 (도로명 클릭시 도로명 반환,지번 클릭시 지번반환)
	//기본적으로 다음 API는 (시,구,동만 반환해준다 상세정보 반환X) 하지만 풀주소는 반환해준다 
	//따라서 풀주소로 시,구,동,상세주소를 파싱해주자..
    function getAddressInfo(){
        new daum.Postcode({
            oncomplete: function(data) {
                var value;
                var jusoSangsae="";
                var str = data.jibunAddress;   // 풀주소 저장
                str = str.split(" ");          // 공백으로 짤라준다
 
                // -> 공백으로 짜르는 이유는 해당 API에서 (서울특별시 강남동 강남구99-9) 이런식으로 띄어쓰기로 시 군 구 를 반환해주기 때문.
                // -> 서울특별시 강남동 강남구99-9를 띄어쓰기로 파싱하면 {"서울특별시","강남동","강남구","99-9"} 이런으로 파싱된다                
 
 
                if(data.userSelectedType == "J"){   // 사용자가 지번을 클릭했다면
                    for(var i =0;i<str.length;i++){
                        if(str[i]==data.bname){     //  data.bname 즉 동정보하고 str[i]가 동일 문자일시
                            value=i;                // 그위치를 저장한다
                        }
                    }
                }else{
                    str = data.roadAddress;        // 사용자가 도로명을 클릭했다면
                    str = str.split(" ");         
                    for(var i=0;i<str.length;i++){
                        if(str[i]==data.roadname){ // data.roadname 즉 도로명의 동정보하고 str[i]가 동일 문자일시
                            value=i;               // 그위치를 저장한다
                        }
                    }
                }
 
                for(var i=value;i<str.length;i++){  // 동위치부터 끝까지
                    jusoSangsae = jusoSangsae+str[i];
                    // 지번주소 기준으로 설명을 덧붙이자면.
                    // 풀주소를 띄어쓰기로 split시 {"서울특별시","강남동","강남구","99-9"} 이렇게 나온다
                    // 내가 하고자 했던것은 "강남구"의 위치를 찾은뒤 그위치부터 끝까지 출력한것이다
                }
 
 
 
                alert(data.sido); //서울특별시
                alert(data.sigungu); // 은평구
                alert(jusoSangsae ); // 갈현1동 xxx-xxx 3층
                
            },
        shorthand : false
     	// -> 해당 옵션은 기본적으로 true이며, true로 지정시 축약형 주소가 나옴(서울특별시 -> 서울)
        }).open();
    }

</script>
<!-- /shopChargePage.jsp에서 사용 -->


<!-- Theme Initialization -->
<script src="<%=context%>/resources/VertexEx/js/theme.js"></script>

<!-- Custom JS -->
<script src="<%=context%>/resources/VertexEx/js/custom.js"></script>