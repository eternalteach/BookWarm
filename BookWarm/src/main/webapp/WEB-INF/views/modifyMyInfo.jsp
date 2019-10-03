<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<%@ include file="./includes/header/header/vertexHeader.jsp"%>
</head>
<body>
   <%@ include file="./includes/header/shopHeader/shopHeaderNav.jsp"%>
   <div role="main" class="main">
    <section class="page-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8 text-left">
                    <h1>내 정보</h1>
                </div>
                <div class="col-md-4">
                    <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                        <li><a href="index.html">내 정보</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="v-page-wrap has-right-sidebar has-one-sidebar">
        <div class="container">
            <div class="row">
				<div class="row col-sm-9">
					<%@ include file="./includes/content/register/readUserInfo.jsp" %>
						<div class="v-spacer col-sm-12 v-height-standard"></div>
                </div>
               <%@ include file="./includes/content/userInfo/orderList-side-bar.jsp" %>
            </div>
        </div>
    </div>
</div>

   <%@ include file="./includes/footer/shopFooter/shopFooterNav.jsp"%>
</body>
</html>