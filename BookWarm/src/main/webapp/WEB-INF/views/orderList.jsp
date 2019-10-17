<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Order List</title>
 	<%@include file="./includes/header/header-vertexEx.jsp" %>
 	<%-- <%@include file="./includes/header/header-vertex.jsp" %> 둘 중 하나 알아서 쓰시오--%>
</head>
<body>
<div class="footer-wrap">
	<%@ include file="includes/header/header-topnav.jsp"%>
	<%@ include file="./includes/content/userInfo/orderListPage.jsp"%>
</div>
	<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>