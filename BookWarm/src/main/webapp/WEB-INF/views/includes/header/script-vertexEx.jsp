<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String context = request.getContextPath();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	String todayAll = formatter.format(new Date());
	String[] today = todayAll.split("-", 3);
	int year = Integer.parseInt(today[0]);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

