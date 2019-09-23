<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/logintest.js"></script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>
<div>
	<form action="communityBoardSaveReplyWrite" method="post">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<input type="text" hidden='hidden' name="comm_group"
				value="${replyWriteCommunityBoardPost.comm_group}">
			<input type="text" hidden='hidden' name="comm_indent"
				value="${replyWriteCommunityBoardPost.comm_indent}">
			<input type="text" hidden='hidden' name="comm_step"
				value="${replyWriteCommunityBoardPost.comm_step}">
			<input type='text' hidden='hidden' id='pageNum' name='pageNum'
				value='${criteria.pageNum}'>
			<input type='text' hidden='hidden' id='amount' name='amount'
				value='${criteria.amount}'>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="user_id" value=""></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="comm_title" placeholder="${replyWriteCommunityBoardPost.comm_title}"></td>
			</tr>
			<tr>
				<td>말머리</td>
				<td><input type="text" name="comm_subject" placeholder="${replyWriteCommunityBoardPost.comm_subject}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="comm_content" placeholder="${replyWriteCommunityBoardPost.comm_content}"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장">&nbsp;&nbsp;
					<a href="communityboard">List</a> &nbsp;&nbsp;
			</tr>
		</table>
	</form>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>