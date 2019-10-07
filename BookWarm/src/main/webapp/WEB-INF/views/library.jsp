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
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body style="background-color:#eaeaea">
<!--  style="background-image:url('/warm/resources/img/library/background/Draft-4.png'); background-size:100% 109%; background-position:0px 0px; background-repeat:no-repeat;" -->
	<div class="header top-padding-3vh" align="center">
		<div>
			<a data-toggle="modal" data-target="#modal-library" class="library-font">Search Books</a>
			<a href="reviewMain" class="library-font">감상 메인</a>
			<a href="shop/shoplist" class="fa fa-book fa library-font">서점</a>
			<a href="myInfo" class="fa fa-user-circle library-font">내 정보</a>
			<a href="message" class="icon-mail-2 library-font" style="color: white">쪽지</a>
			<a href="customLogout" class="library-font">로그아웃</a>
		</div>
	</div>
	<div>
		<img src="/warm/resources/img/library/background/lamp2.png" style="width:12%; max-width:30%; transform:rotate(180deg);position:fixed;top:-30px; left:40px;">
		<img src="/warm/resources/img/library/background/lamp2.png" style="width:12%; max-width:30%; transform:rotate(180deg);position:fixed;top:-80px; right:70px;">
		<img src="/warm/resources/img/library/background/lamp3.png" style="width:12%; max-width:30%; transform:rotate(180deg);position:fixed;top:-35px; right:10px;">
		<img src="/warm/resources/img/logo.png" style="width:10%; max-width:30%; position:fixed;top:112px; left:360px;">
	</div>
	<div>
		<img src="/warm/resources/img/library/bookshelf/3.png" style="width:60%; max-width:50%; margin-top:6.3%; margin-left:25%; margin-right:auto">
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
<!-- 서재의 책 클릭시 뜨는 모달 생성되는 영역 -->
<div id="modalDiv"></div>
<!-- End library Modal -->
</body>
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
			for(let index=0;index<20;index++){
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