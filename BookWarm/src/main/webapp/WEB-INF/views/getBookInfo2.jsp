<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=context%>/resources/js/getbook.js"></script>
<style>
table.tmp {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
}
table.tmp thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #e7708d;
}
table.tmp thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}
table.tmp tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #fcf1f4;
}
table.tmp td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
제목 검색 : <input id='search' name='search' type='text'>
<button onclick="searchTitle($('#search').val());">검색</button>
<div id="getBookTable"></div>

<script>
let bookData="";

function searchTitle(title){
alert($('#search').val());
alert(title);
    event.preventDefault();
    if(title !== undefined && title !== ""){
        $.ajax({
          url: "https://dapi.kakao.com/v3/search/book",
          headers: {'Authorization': 'KakaoAK a419f03c87401f1ade43abeb89afac92'},
          type : "get",
          data:{
              query: title,
              page:1,
              size:20,
             target:'title'
          },
          success : function(result){
     		 bookData=result;
     		getBookService.getBookData(bookData, function(result){
     			alert(result);
     		});
     		makeBookTable(result);
          }
      });
    }
}    

 function makeBookTable(bookData){
	 let option = [
 	    {field:"isbn", width:100},
 	    {field:"title",      width:200},
 	    {field:"authors", width:100},
 	    {field:"translators", width:100},
 	    {field:"publisher", width:100},
 	    {field:"datetime",   width:100},
 	    {field:"price", width:100},
 	    {field:"sale_price", width:100},
 	    {field:"contents", width:100},
 	    {field:"thumbnail", width:100},
 	    {field:"url", width:100},
 	    {field:"status", width:100}
 	];

 	var getBookTable = $("#getBookTable");
 	getBookTable.html("");
 	var table = $("<table class='tmp'>").appendTo(getBookTable);
 	$.each( bookData.documents, function( index, row) {
		var tr = $("<tr>").appendTo(table);
		$.each( option, function( i, fieldInfo ) {
			var td = $("<td>").appendTo(tr);
			td.html( row[fieldInfo.field]);
 	    });
 	});
 	
 	$.each( bookData.documents, function( index, row) {
		var tr = $("<tr>").appendTo(table);
		$.each( option, function( i, fieldInfo ) {
			var td = $("<td>").appendTo(tr);
			td.html( row[fieldInfo.field]);
 	    });
 	});
 }
</script>
</body>