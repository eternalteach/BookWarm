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
<script type="text/javascript" src="/warm/resources/js/library.js"></script>
<script type="text/javascript" src="/warm/resources/js/book.js"></script>
<%@ include file="includes/header/header-vertexEx.jsp"%>
</head>
<body style="background-image:url('/warm/resources/img/library/library_bookshelf2.jpg'); background-size:100% 100%; background-position:0px 0px; background-repeat:no-repeat;" >

	<div style="position:absolute; top:9vh; left:59vw">
		<div>
			<a data-toggle="modal" data-target="#modal-library" style="color:white; font-size:2vh"><strong>책 검색하기&nbsp;<i class="glyphicon icon icon-magnifier" style="font-size:25px!important; color:white"></i></strong></a>
		</div>
	</div>
	<div class="bookshelf-position bookshelf-div">
		<table class="margin-zero bookshelf-table">
			<tr class="bookshelf-table-topspace">
				<td rowspan="17" class="bookshelf-table-left-side"></td><td colspan="5" class="bookshelf-table-centerbar"></td><td class="bookshelf-table-right-side" rowspan="17"></td>
			</tr>
			<c:forEach var="row" begin="0" end="4">
				<tr class="bookshelf-table-booktop-${row}">
					<td colspan="5" class="bookshelf-table-centerbar"></td>
				</tr>
				<tr>
					<c:forEach var="colum" begin="0" end="4">
						<td class="tdnum${row*5+colum} book-position bookshelf-table-books_col${colum}" valign="bottom"align="center"></td>
						<%-- <td class="library_emptySpace_col${colum}"></td>
							<td class="tdnum${row*5+colum} book-position bookshelf-table-books" valign="bottom"align="center"></td>
						<td class="library_emptySpace_col${colum}"></td> --%>
					</c:forEach>
				</tr>
				<tr class="bookshelf-table-bottom">
				<td colspan="5" class="bookshelf-table-centerbar"></td>
				</tr>
			 </c:forEach>
			 <tr class="bookshelf-table-bottomSpace">
				<td colspan="7" class="bookshelf-table-bar"></td>
			 </tr>
		</table>
	
	</div>
	
	<div style="position:absolute; top:76%; left:70vw; width:28vw">
		<a href="message"><i class="lib-menu glyphicon icon icon-plane-paper-1"></i></a>
		<a href="reviewMain"><i class="lib-menu glyphicon icon icon-bookmark-2-1" style=""></i></a>
		<a href="shop/shoplist"><i class="lib-menu glyphicon icon icon-shopping-bag-3"></i></a>
		<a href="customLogout"><i class="lib-menu glyphicon icon icon-log-out-1"></i></a>
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
<!-- 서재의 책 클릭시 뜨는 모달 생성되는 영역 -->
<div id="modalDiv"></div>
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
			addModalHTML+="<a href=reviewPerBook?isbn="+result.isbn+"><h4>Review</h4></a>";
			addModalHTML+="<button class=\"deleteMyBook\" data-isbn="+result.isbn+">Delete</button>";
			addModalHTML+="</div></div></div></div></div></div>";
			modalDiv.append(addModalHTML);
		});
	}
	
	// remove book on bookshelf
	$(document).on("click",".deleteMyBook",function(){
 		console.log("========== delete my book on library");
		let isbn=$(this).closest("button").attr("data-isbn");
		console.log("isbn : "+isbn);
		libraryService.removeBookOnLibrary(isbn,function(result){
			alert(result);
			// close modal
			$(".fade").hide();
			showList();
		});
	}); // end deleteMyBook
	
	//searchBook Btn Event
	$(document).on("click",".searchBtn",function(){
		console.log("click SearchBookBtn");
		var searchT=$('#search').val();
		bookService.searchTitle(searchT,function(result){
			bookService.addBookData(result);
			makeBookTable(result);
		});
	});
	
	 $(document).ready(function(){
		 // 찾은 책 클릭시 추가, 삭제 이벤트
	 	getBookTable.on("click","button",function(e){
		 	var targetISBN = $(this).closest("tr").attr("class");
		 	var userAddBook={isbn:targetISBN};
		 	console.log("targetISBN"+targetISBN);
		 	//중복검사하기
	 		bookService.addUserBook(userAddBook,function(result){
		 		alert(result);
		 		showList();
		 		addBookModal(targetISBN);
		 		});
	 	});
	 }); //end ready
	 
	
	// show library book list
	function showList(){
		libraryService.getUserBooksList(function(libraryBooks){
			for(let index=0;index<25;index++){
				let bookDiv=".tdnum"+index;
				if(index<libraryBooks.length){
					// insert into bookImg  
					$(bookDiv).html("<a data-toggle=\"modal\" data-target=\"#modal"+libraryBooks[index].isbn+"\"><img class=\"book-thumbnail\" src=\""+libraryBooks[index].list_img_src+"\"></a>");
					// 저장한 책 이미지 클릭시 모달창 띄우기
					addBookModal(libraryBooks[index].isbn);
				}else{
					$(bookDiv).html("");
				}
			}
		});
	}
});
</script>
<%@ include file="includes/header/script-vertexEx.jsp"%>
</body>
</html>
