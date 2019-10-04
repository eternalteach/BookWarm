<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accessError</title>
</head>
<body>

<h1> ACCESS DENIED. </h1>

<h2> <sec:authentication property="principal.user.user_name" />
		(아이디: <sec:authentication property="principal.user.user_id" />) </h2>
<h2> 님이 넘볼 페이지가 아닙니다 돌아가세여 문의는 해랑씨에게 하세요 집에가지말란소리에요</h2>
<h2> 가진 권한 : <sec:authentication property="principal.user.authList" var="list"/></h2>


<p>principal : <sec:authentication property="principal" /></p>
<p>UserVO : <sec:authentication property="principal.user" /></p>

<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2>
<h2><c:out value="${msg}"/></h2>

</body>
</html>