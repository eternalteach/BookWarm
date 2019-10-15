<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" href="./resources/css/index.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="includes/header/header-vertexEx.jsp"%>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<title> BOOK & WARM </title>
</head> 
<body style="background-color:white">
	<div style="top:17vw; left:77vh; position:absolute;">
		<a href="javascript:openModal('login-modal');"><img style="width:21vw" src="/warm/resources/img/background/books.png"></a>
	</div>	
	<div style="top:29vw; left:84vh; position:absolute;">
		<h1 style="font-family: Museo500Regular, Arial, Helvetica, Tahoma, sans-serif;font-size: 2.1vw;" >BOOK & WARM</h1>
	</div>
		
<div id="modal">
   <div class="modal-library login-modal">
      <div class="modal-content con">
         <a href="javascript:;" class="close">X</a>
         <%@include file="./includes/content/login/loginPage.jsp"%>
      </div>
   </div>
</div>
<script type="text/javascript">
 // open Login Modal
      function openModal(modalname) {
         $("#modal").fadeIn(200);
         $("." + modalname).fadeIn(200);
      }
      $(document).ready(function() {
         $("#modal").hide();

         $(".close").on('click', function() {
            $("#modal").fadeOut(200);
            $(".login-modal").fadeOut(200);
         });
      });
   </script>
</body>
</html>