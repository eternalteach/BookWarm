<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list}" var="list">
		book_title : <p><c:out value="${list.book_title}" /></p>
		cart_cnt : <p><c:out value="${list.cart_cnt}" /></p>
		total : <p><c:out value="${list.total}" /></p>
	</c:forEach>
</body>
</html>