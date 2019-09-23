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
<%@ include file="includes/header/script-vertexEx.jsp"%>
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body style="background-image: url('/warm/resources/img/background/star01.gif');">
	<button type="button" class="btn" data-toggle="modal" data-target="#modal-library">modal-library</button>
	<a href="reviewMain?user_id=aaa"><button>감상 메인페이지</button></a>
	<a href="shop/shoplist"><button>책 리스트</button></a>
	<div class="library-body">
		<table class="library-table margin-zero" style="width: 795px; height: 1001px;">
			<tr style="height: 43px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			<c:forEach var="row" begin="0" end="4">
			<tr style="height: 71px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			<tr style="height: 100px;">
				<c:forEach var="colum" begin="0" end="3">
					<td class="library_emptySpace"></td>
					<td class="tdnum${row*4+colum}"></td>
				</c:forEach>
				<td class="library_emptySpace"></td>
			</tr>
			<tr style="height: 20px;">
				<td colspan="9" style="width: 795px;"></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<script>
	$(document).ready(function(){
		showList();
		
		
		$(".deleteMyBook").on("click",function(){
			let isbn=$(this).closest("button").attr("data-isbn");
			console.log("deleteMyBook.closest('button').isbn"+isbn);
			libraryService.remove(isbn,function(result){
				alert(result);
				showList();
			})
		})
		
		// show library book list
		function showList(){
			libraryService.getList(function(libraryBooks){
				console.log("libraryService.getList 안");
				for(let i=0;i<20;i++){
					let str=".tdnum"+i;
					if(i<libraryBooks.length){
					console.log("str : "+str);
					$(str).html("<a data-toggle=\"modal\" data-target=\"#modal"+libraryBooks[i].isbn+"\"><img class=\"book-thumbnail\" src=\""+libraryBooks[i].list_img_src+"\"></a>");
					}else{
						$(str).html("");
					}
				}
				// 모달 닫기
				$(".fade").hide();
			});
		}
		
		
	});
	</script>
	
<!-- library Modal -->
<div class="modal fade" id="modal-library" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
                <%@ include file="includes/book/search-book.jsp"%>
            </div>
        </div>
    </div>
</div>

<c:forEach var="UserBooks" items="${libraryBooks}">
<div class="modal fade" id="modal${UserBooks.isbn}" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				<div class="form-inline">
					<img class="book-thumbnail" src="<c:out value="${UserBooks.list_img_src}"/>">
					<div class="cont">
						<a href="reviewMain?isbn=${UserBooks.isbn}"><h4>Review</h4></a>
						<a href="record?isbn=${UserBooks.isbn}"><h4>Record</h4></a>
						<button class="deleteMyBook" data-isbn="${UserBooks.isbn}">Delete</button>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
</c:forEach>
<!-- End library Modal -->
</body>