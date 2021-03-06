﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/warm/resources/js/library.js"></script>
<script type="text/javascript" src="/warm/resources/js/book.js"></script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body style="background-image:url('/warm/resources/img/library/table/table-3.png'), url('/warm/resources/img/library/background/Draft-4.png'); background-size:100% 30%, 100% 109%; background-position:0px 115% ,0px 0px; background-repeat:no-repeat;">
	<div class="header top-padding-3vh" align="center">
		<div>
			<a data-toggle="modal" data-target="#modal-library" class="library-font">Search Books</a>
			<a href="reviewMain" class="library-font">감상 메인</a>
			<a href="shop/shoplist" class="fa fa-book fa library-font">서점</a>
			<a href="message" class="icon-mail-2 library-font">쪽지</a>
			<a href="customLogout" class="library-font">로그아웃</a>
		</div>
	</div>
	
	<div class="decoration-books-position">
		<img class="decoration-books" src="/warm/resources/img/library/books/books-3.png" >
	</div>
	
	<div class="bookshelf-position bookshelf-div">
		<table class="margin-zero bookshelf-table">
			<tr class="bookshelf-table-topspace">
				<td rowspan="11" class="bookshelf-table-side"></td><td colspan="15" class="bookshelf-table-centerbar"></td><td class="bookshelf-table-side" rowspan="11"></td>
			</tr>
			<c:forEach var="row" begin="0" end="2">
				<tr class="bookshelf-table-booktop">
					<td colspan="15" class="bookshelf-table-centerbar"></td>
				</tr>
				<tr class="bookshelf-table-books">
					<c:forEach var="colum" begin="0" end="4">
						<td class="library_emptySpace"></td>
							<td class="tdnum${row*4+colum} book-position bookshelf-table-books" valign="bottom"align="center"></td>
						<td class="library_emptySpace"></td>
					</c:forEach>
				</tr>
				<tr class="bookshelf-table-bottom">
				<td colspan="15" class="bookshelf-table-centerbar"></td>
				</tr>
			</c:forEach>
				<tr class="bookshelf-table-bottomSpace">
					<td colspan="15" class="bookshelf-table-bar"></td>
				</tr>
		</table>
	</div>
	
<!-- library Modal -->
<div class="modal fade" id="modal-library" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
             		  제목 검색 : <input id='search' name='search' type='text' class="col-sm-9">
				<button class="searchBtn">검색</button>
                <div id="getBookTable"></div>
            </div>
        </div>
    </div>
</div>
<div id="modalDiv">
	<c:forEach var="UserBooks" items="${libraryBooks}">
	<div class="modal fade" id="modal${UserBooks.isbn}" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
	    <div class="modal-dialog undefined">
	        <div class="modal-content">
	            <div class="modal-body post-content">
					<div class="form-inline">
						<img class="book-thumbnail" src="<c:out value="${UserBooks.list_img_src}"/>">
						<div class="cont">
							<a href="reviewPerBook?isbn=${UserBooks.isbn}"><h4>Review</h4></a>
							<a href="record?isbn=${UserBooks.isbn}"><h4>Record</h4></a>
							<button class="deleteMyBook" data-isbn="${UserBooks.isbn}">Delete</button>
						</div>
					</div>
	            </div>
	        </div>
	    </div>
	</div>
	</c:forEach>
</div>
<!-- End library Modal -->

<script>
$(document).ready(function(){
	showList();
	let bookData="";
	var getBookTable=$("#getBookTable");
	
	// 책 데이터 받아오면 받은걸로 테이블 만들기
	function makeBookTable(bookData){
		console.log("makeBookTable에서 받은 "+bookData);
		 let option = [
	 	    {field:"isbn"},
	 	    {field:"thumbnail"},
	 	    {field:"title"},
	 	    {field:"authors"},
	 	    {field:"datetime"}
	 	];

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
	 }//end makeBookTable
	
	 $(document).ready(function(){
		// 1. 모달 추가하는 함수 만들기
		// 2. 페이지 시작시 불러다 붙여넣기
		 // 모달 추가할 영역 modalDiv
		 var modalDiv=$("#modalDiv");
		function addBookModal(isbn){
			console.log("========== addBookModal()")
			
			bookService.getBookInfo(isbn,function(result){
				let addModalHTML="";
				
				addModalHTML+="<div class=\"modal fade\" id=modal"+result.isbn+" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"smallModalLabel\" aria-hidden=\"true\">";
				addModalHTML+="<div class=\"modal-dialog undefined\">";
				addModalHTML+="<div class=\"modal-content\">";
				addModalHTML+="<div class=\"modal-body post-content\">";
				addModalHTML+="<div class=\"form-inline\">";
				addModalHTML+="<img class=\"book-thumbnail\" src="+result.book_img+">";
				addModalHTML+="<div class=\"cont\">";
				addModalHTML+="<a href="+result.isbn+"><h4>Review</h4></a>";
				addModalHTML+="<a href=\"record?isbn="+result.isbn+"><h4>Record</h4></a>";
				addModalHTML+="<button class=\"deleteMyBook\" data-isbn="+result.isbn+">Delete</button>";
				addModalHTML+="</div></div></div></div></div></div>";
				modalDiv.append(addModalHTML);
			})
			// 2. 그 안에서 str로 모달 추가
		}
		
		 // 찾은 책 클릭시 추가, 삭제 이벤트
	 	getBookTable.on("click","button",function(e){
		 	var targetISBN = $(this).closest("tr").attr("class");
		 	var userAddBook={isbn:targetISBN};
		 	console.log("targetISBN"+targetISBN);
	 		bookService.addUserBook(userAddBook,function(result){
		 		alert(result);
		 		showList();
		 		addBookModal(targetISBN);
		 		});
	 	});
	 	
	 	$(".deleteMyBook").on("click",function(){
			let isbn=$(this).closest("button").attr("data-isbn");
			console.log("deleteMyBook.closest('button').isbn"+isbn);
			libraryService.removeBookOnLibrary(isbn,function(result){
				alert(result);
				// close modal
				$(".fade").hide();
				showList();
			});
		}); // end deleteMyBook
		
		//searchBook Btn Event
		$(".searchBtn").on("click",function(){
		var searchT=$('#search').val();
			bookService.searchTitle(searchT,function(result){
				console.log("result : "+result);
				bookService.addBookData(result);
				makeBookTable(result);
			});
		});
	 }); //end ready
	 
	
	// show library book list
	function showList(){
		libraryService.getUserBooksList(function(libraryBooks){
			for(let index=0;index<20;index++){
				let bookDiv=".tdnum"+index;
				if(index<libraryBooks.length){
				$(bookDiv).html("<a data-toggle=\"modal\" data-target=\"#modal"+libraryBooks[index].isbn+"\"><img class=\"book-thumbnail\" src=\""+libraryBooks[index].list_img_src+"\"></a>");
				}else{
					$(bookDiv).html("");
				}
			}
		});
	}
});
</script>
</body>
</html>