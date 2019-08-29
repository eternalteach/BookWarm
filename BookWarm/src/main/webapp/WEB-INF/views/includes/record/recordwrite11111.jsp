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
							values : [ 0, 420 ], // <-- insert page info
							slide : function(event, ui) {
								$("#amounts").val(
										"p." + ui.values[0] + " - p."
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

<form method="post" action="/" id="smart-form">
	<div class="form-body p-none pb-40">
		<div class="smart-forms">
			<section class="sidebar-widget bordered-sidebar">
				<div class="heading">
					<h4 class="title">Reading range</h4>
				</div>
				<div class="section">
					<div class="spacer-b15">
						<input type="text" id="amounts" class="slider-input">
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
				<div class="section">
					<label class="field prepend-icon"> <input type="text"
						id="ddFormat" name="ddFormat" class="gui-input"
						placeholder="Format DD/MM/YY"> <span class="field-icon"><i
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