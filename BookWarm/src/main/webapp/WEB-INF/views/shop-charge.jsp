<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="./includes/header/header-vertexEx.jsp"%>
</head>
<body>
    <%@ include file="./includes/header/script-vertexEx.jsp"%>
	<%@ include file="./includes/header/header-topnav.jsp"%>
	<%@ include file="./includes/content/shopContent/shopChargePage.jsp"%>
	<%@ include file="./includes/addressAPI/getAddress.jsp" %>
	<%@ include file="./includes/shop/shopChargePage-script.jsp" %> 
 	<%@ include file="./includes/footer/footer-1.jsp"%>
</body>
</html>
