<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="./header/vertexExHeader.jsp"%>
</head>
<body>
	<div class="wrapper">
		<!--header start-->
		<header id="header" class="header-narrow header-transparent" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 1, 'stickySetTop': '1'}">
			<div class="header-body">
				<div class="header-container container">
					<div class="header-row">
						<div class="header-column justify-content-center">
							<div class="header-row">
								<div class="header-nav header-nav-top-line justify-content-center">
									<div align="center">
										<a href="library"> <img alt="logo" width="80" height="100" src="<%=path%>/resources/img/header/Alice_rabbit03.png"></a>
									</div>
									<div class="header-nav-main header-nav-main-effect-2 header-nav-main-sub-effect-1">
										<!-- 탑 메뉴 -->
										<%@ include file="./include-header-top-nav.jsp"%>
									</div>
									<button class="btn header-btn-collapse-nav"
										data-toggle="collapse" data-target=".header-nav-main nav">
										<i class="fa fa-bars"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!--header end-->
	</div>