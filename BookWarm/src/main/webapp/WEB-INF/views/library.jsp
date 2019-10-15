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
<title> Library </title>
</head>
<body style="overflow:auto; background-image:url('/warm/resources/img/library/library_bookshelf2.jpg'); background-size:100% 100%; background-position:0px 0px; background-repeat:no-repeat;" >
<div class="page-loading"></div>
	<div style="position:absolute; top:8vh; left:58.5vw; ">
		<a data-toggle="modal" data-target="#modal-library" style="cursor:pointer; color:white; font-size:1.3vw"><strong>책 검색하기&nbsp;<i class="glyphicon icon icon-magnifier" style="font-size:1.5vw!important; color:white"></i></strong></a>
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
				<tr class="books-row">
					<c:forEach var="colum" begin="0" end="4">
						<td class="tdnum${row*5+colum} book-position bookshelf-table-books_col${colum}" valign="bottom"align="center"></td>
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
	<a id="modal-library-list-btn" title="담은 책 모두 보기" data-toggle="modal" data-target="#modal-library-list" style="cursor:pointer; position:absolute; left:35.3vw; top:76.3vh"><strong><i class="glyphicon icon icon-document-box-1" style="color:white; font-size:5vw!important;"></i></strong></a>

	<div style="position:absolute; top:79vh; left:68vw; width:31vw">
		<a href="message" title="메시지"><i class="lib-menu glyphicon icon icon-plane-paper-1"></i></a>
		<a href="myInfo" title="내 정보"><i class="lib-menu glyphicon icon icon-user-1"></i></a>
		<a href="reviewMain" title="감상 메인"><i class="lib-menu glyphicon icon icon-bookmark-2-1"></i></a>
		<a href="shop/shoplist" title="서점"><i class="lib-menu glyphicon icon icon-shopping-bag-3"></i></a>
		<a href="customLogout" title="로그아웃"><i class="lib-menu glyphicon icon icon-log-out-1"></i></a>
	</div>
	
<!-- library Modal -->
<div class="modal fade" id="modal-library" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content"  style="left:-63vh;">
            <div class="modal-body post-content">
             		  제목 검색 : <input id='search' name='search' type='text' class="col-sm-9">
				<button class="searchBtn">검색</button>
                <div id="getBookTable"></div>
            </div>
        </div>
    </div>
</div>

<!-- library Modal -->
<div class="modal fade" id="modal-library-list" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
             	<div id="past-library-list"></div>
            </div>
        </div>
    </div>
</div>

<!-- 서재의 책 클릭시 뜨는 모달 생성되는 영역 -->
<div id="modalDiv"></div>
<!-- End library Modal -->

<script>
$(document).ready(function(){
$("#modal-library-list-btn").on("click",function(){
	showPastList();
});

$(document).on("click",".deletePastBook",function(){
	let isbn=$(this).closest("button").attr("data-isbn");
	libraryService.removeMyBook(isbn,function(){
		showPastList();
	});
});

function showPastList(){
	libraryService.getMyBooks(function(result){
		let addModalHTML="";
		let addPastBookInfoHTML="";
		addPastBookInfoHTML+="<div class=\"form-inline\">";
		for(let index=0;index<result.length;index++){
			var addedDate = new Date(result[index].list_added_date).toLocaleDateString();
			addPastBookInfoHTML+="<div class='card center no-border'>";
			if(result[index].list_img_src == null) {
				result[index].list_img_src = "/warm/resources/img/happyGeneralB_dark3.png";
			}
			addPastBookInfoHTML+="<a title='등록일: " + addedDate + "' href=\"reviewPerBook?isbn="+result[index].isbn+"\"><img class=\"book-thumbnail\" src=\""+result[index].list_img_src+"\"></a>";
			addPastBookInfoHTML+="<button class='btn btn-sm addOnLibrary close m-0 pt-3 pb-1' data-isbn='"+result[index].isbn+"'>등록</button>";
			addPastBookInfoHTML+="<button class='btn btn-sm deletePastBook close m-0 pt-1 pb-3' data-isbn='"+result[index].isbn+"'>삭제</button>";
			addPastBookInfoHTML+="</div>";
		}
		addModalHTML+=addPastBookInfoHTML;
		$("#past-library-list").html(addModalHTML);
		showList();
	});
}

$(document).on("click",".addOnLibrary",function(){
	let isbn=$(this).closest("button").attr("data-isbn");
	libraryService.reAddBookOnLibrary(isbn);
	showList();
});
	showList();
	let bookData="";
	var getBookTable=$("#getBookTable");
	
	// 책 데이터 받아오면 받은걸로 테이블 만들기
	function makeBookTable(bookData){
		console.log("makeBookTable에서 받은 "+bookData);
		console.log(bookData);
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
						if(row[fieldInfo.field] == "") {
							row[fieldInfo.field] = "/warm/resources/img/happyGeneralB_dark3.png";
						}
						img.attr("src", src=row[fieldInfo.field]);
					}else if (fieldInfo.field=="datetime"){
						td.html( row[fieldInfo.field].substring(0,10));
					} else if (fieldInfo.field=="title"){
						td.html("<button class='search-books card'>"+row[fieldInfo.field]+"</button>");
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
			addModalHTML+="<div class=\"modal-content\" style=\"width:320px;top:9.5vh; left:33vw;\">";
			addModalHTML+="<div class=\"modal-body post-content\">";
			addModalHTML+="<div class=\"form-inline post-content\">";
			if(result.book_img == "") {
				result.book_img = "/warm/resources/img/happyGeneralB_dark3.png";
			}
			addModalHTML+="<img class=\"book-thumbnail\" src="+result.book_img+">";
			addModalHTML+="<div class=\"modal-body\">";
			addModalHTML+="<a href=\"reviewPerBook?isbn="+result.isbn+"\"><h4>Review</h4></a>";
			addModalHTML+="<a class=\"deleteMyBook\" data-isbn="+result.isbn+"><h4>Delete</h4></a>";
			addModalHTML+="</div></div></div></div></div></div>";
			modalDiv.append(addModalHTML);
		});
	}
	
	// remove book on bookshelf
	$(document).on("click",".deleteMyBook",function(){
 		console.log("========== delete my book on library");
		let isbn=$(this).closest("a").attr("data-isbn");
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
			for(let index=0;index<24;index++){
				let bookDiv=".tdnum";
				if(index<20) {
					bookDiv += index;					
				} else {
					bookDiv += (index+1);
				}
				if(index<libraryBooks.length){
					// insert into bookImg  
					if(libraryBooks[index].list_img_src == null) {
						libraryBooks[index].list_img_src = "/warm/resources/img/happyGeneralB_dark3.png";
					}
					$(bookDiv).html("<a style='cursor:pointer' data-toggle=\"modal\" data-target=\"#modal"+libraryBooks[index].isbn+"\"><img class=\"book-thumbnail\" src=\""+libraryBooks[index].list_img_src+"\"></a>");
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
    <script>
    $(window).load(function(){
        $(".page-loading").fadeOut();
    });
    </script>
</body>
</html>
