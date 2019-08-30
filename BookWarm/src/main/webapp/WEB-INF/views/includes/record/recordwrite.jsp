<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<br>2<br />2
</div>
<!-- Theme CSS -->
<link rel="stylesheet"
	href="./resources/VertexEx/vendor/bootstrap/css/glyphicon.css" />
<link href="./resources/VertexEx/css/main.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/main-shortcodes.css"
	rel="stylesheet" />
<link href="./resources/VertexEx/css/header.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/shop.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/bg-stylish.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/form-element.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/animation.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/streamline-icon.css"
	rel="stylesheet" />
<link href="./resources/VertexEx/css/font-icons.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/responsive.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/utilities.css" rel="stylesheet" />
<link href="./resources/VertexEx/css/skins/default.css" rel="stylesheet" />
<link
	href="./resources/VertexEx/smartforms/JavascriptTemplates/css/smart-addons.css"
	rel="stylesheet" />
<link
	href="./resources/VertexEx/smartforms/Templates/css/smart-forms.css"
	rel="stylesheet" />

<!-- Style Swicher -->
<link
	href="./resources/VertexEx/vendor/style-switcher/style-switcher.css"
	rel="stylesheet" />
<link
	href="./resources/VertexEx/vendor/style-switcher/bootstrap-colorpicker/css/bootstrap-colorpicker.css"
	rel="stylesheet" />

<!-- Smart Form Elements -->
<script
	src="./resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-custom.min.js"></script>
<script
	src="./resources/VertexEx/smartforms/JavascriptTemplates/js/jquery.placeholder.min.js"></script>
<script
	src="./resources/VertexEx/smartforms/JavascriptTemplates/js/select2.full.min.js"></script>
<script
	src="./resources/VertexEx/smartforms/JavascriptTemplates/js/jquery-ui-combo.min.js"></script>

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

				$("#bedrooms").val($("#slider3").slider("value"));

				$("#guests").change(function() {
					guestnumber.slider("value", this.selectedIndex + 1);
				});



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

				var initialYear = 1980;
				var yearTooltip = function(event, ui) {
					var curYear = ui.value || initialYear
					var yeartip = '<span class="slider-tip">' + curYear
							+ '</span>';
					$(this).find('.ui-slider-handle').html(yeartip);
				}

				$("#slider-range").slider({
					range : true,
					min : 0,
					max : 500, //<--책의 토탈 페이지
					values : [ $("#startRead").val(), $("#endRead").val() ], // <-- insert page info
					slide : function(event, ui) {
						$("#startRead").val("p." + ui.values[0]);
						$("#endRead").val("p." + ui.values[1]);
					}
				});

				$("#startRead").val("p." + $("#slider-range").slider("values", 0));
				$("#endRead").val("p." + $("#slider-range").slider("values", 1));


				var valtooltip = function(sliderObj, ui) {
					val1 = '<span class="slider-tip">'
							+ sliderObj.slider("values", 0) + '</span>';
					val2 = '<span class="slider-tip">'
							+ sliderObj.slider("values", 1) + '</span>';
					sliderObj.find('.ui-slider-handle:first').html(val1);
					sliderObj.find('.ui-slider-handle:last').html(val2);
				};

			});
</script>

<form method="post" action="boardLogWriteSave" id="smart-form">
	<div class="form-body p-none pb-40">
		<div class="smart-forms">
			<section class="sidebar-widget bordered-sidebar">
				<div class="heading">
					<h4 class="title">Reading range</h4>
				</div>
				<div class="section">
					<div class="spacer-b15">
						Start Page : <input type="text" id="startRead" class="slider-input" value="260"> 
						End Page : <input type="text" id="endRead" class="slider-input" value="280">
					</div>
					<!-- end .spacer -->
					<div class="slider-wrapper">
						<div id="slider-range"></div>
					</div>
					<!-- end .slider-wrapper -->
				</div>
				<!-- end section -->

			</section>
			<section class="sidebar-widget bordered-sidebar">
				<div class="heading">
					<h4 class="title">Date Range</h4>
				</div>
				<div class="section mb-0">
					<label class="field prepend-icon"> 
					<input type="text" id="yyFormat" name="yyFormat" class="gui-input"
						placeholder="Format YY/MM/DD"> <span class="field-icon"><i
							class="fa fa-calendar"></i></span>
					</label>
				</div>
				<div class="section mb-0">
					<label class="field prepend-icon"> <input type="text"
						id="yyFormat" name="yyFormat" class="gui-input"
						placeholder="Format YY/MM/DD"> <span class="field-icon"><i
							class="fa fa-calendar"></i></span>
					</label>
				</div>
				<!-- end section -->

			</section>
			<section class="sidebar-widget bordered-sidebar">
				<div class="heading">
					<h4 class="title">책갈피</h4>
				</div>
				<label class="field"> <select
					class="example-tags smart-select2" multiple="multiple">
						<option selected="selected" value="1">Arua</option>
						<option value="2">Amuria</option>
						<option selected="selected" value="3">Bukedia</option>
						<option value="4">Bushenyi</option>
				</select>
				</label>
			</section>
			<button type="submit" class="button btn-primary">Record</button>
		</div>
	</div>
	<!-- end .form-body section -->
</form>