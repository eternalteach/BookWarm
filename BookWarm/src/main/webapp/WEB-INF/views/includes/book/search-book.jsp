<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/warm/resources/js/getbook.js"></script>
<script type="text/javascript" src="/warm/resources/js/addBook.js"></script>
제목 검색 : <input id='search' name='search' type='text' class="col-sm-9">
<button class="searchBtn" onclick="getBookService.searchTitle($('#search').val());">검색</button>



<div id="getBookTable"></div>

<script>
let bookData="";

 function makeBookTable(bookData){
	 let option = [
 	    {field:"isbn"},
 	    {field:"thumbnail"},
 	    {field:"title"},
 	    {field:"authors"},
 	    {field:"datetime"}
 	];

 	var getBookTable = $("#getBookTable");
 	getBookTable.html("");
 	var table = $("<table class='tmp'>").appendTo(getBookTable);
 	
  	$.each( bookData.documents, function( index, row) {
		var tr = $("<tr>").appendTo(table);
		let isbn="";
		$.each( option, function( i, fieldInfo ) {
			if(fieldInfo.field=="isbn"){
				
				tr.attr("class",row[fieldInfo.field].substring(11));
				isbn=row[fieldInfo.field].substring(11);
				
			} else {
				
			var td = $("<td>").appendTo(tr);
			
			if(fieldInfo.field=="thumbnail"){
				
			var img=$("<img class='bookCover'>").appendTo(td);
			img.attr("src", src=row[fieldInfo.field]);
				
			}else if (fieldInfo.field=="datetime"){
				
			td.html( row[fieldInfo.field].substring(0,10));
			
			} else if (fieldInfo.field=="title"){
				td.html("<button class='search-books'>"+row[fieldInfo.field]+"</button>");
				
			}else{
				
			td.html( row[fieldInfo.field]);
			
			}
			}
			
 	    });
 	});
  
 }

 var getBookTable=$("#getBookTable");
 $(document).ready(function(){
 	
 	getBookTable.on("click","button",function(e){
 	var targetISBN = $(this).closest("tr").attr("class");
 	console.log("targetISBN"+targetISBN);
 	var userAddBook={
 			isbn:targetISBN
 	};
 		addBookService.add(userAddBook,function(result){
 		alert(result);
 	
 		});
 	});
 });


</script>
