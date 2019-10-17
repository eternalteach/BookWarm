<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>

<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/warm/resources/js/library.js"></script>
<script type="text/javascript" src="/warm/resources/js/book.js"></script>
</head>

	<div role="main" class="main">
		<section class="page-header" style="padding-top:20px; margin-top:20px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
			<div class="container">
				<div class="row align-items" style="margin-left:900px;">
<!-- 						<div class="aa" style="width:1000px;font-size:15px;">
							<a data-toggle="modal" data-target="#bookshop"><strong>책 검색하기&nbsp;</strong></a>
						</div> -->
                                <div class="form-group">
                                    <input class="form-control" type="text" value="" name="books" id="booki" placeholder="Search" />
                                </div>
                                    <i class="icon icon-magnifier fa-lg" id="booksearch" data-toggle="modal" data-target="#bookshop" 
                                    	style="padding-left: 0px;width:40px;padding-top:10px;border:0.5px solid #EAEAEA;height: 41px;"></i>
                                    	
				</div>
			</div>
		</section>

		<div class="v-page-wrap has-right-sidebar has-one-sidebar" style="margin-bottom:100px;margin-top:30px;">
			<div class="container">
				<!--Horizontal Tab - Clean-->
				<div class="row">
					<div class="col-sm-12">
						<!-- <div class="v-heading-v2">
							<h3>bookwarm</h3>
						</div> -->
					</div>

					<!-- 책 정렬 제목  -->
					<div class="col-sm-12">
						<ul class="nav nav-tabs nav-tabs-default nav-tabs-centered "
							role="tablist">
							<!-- 제목순 -->
							<li class="nav-item"><a class="nav-link active" 
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0" 
								data-toggle="tab"
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00" role="tab"
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								aria-expanded="true">베스트셀러</a></li>
								
							<!-- 낮은가격 -->	
							<li class="nav-item"><a class="nav-link"
								id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1"
								data-toggle="tab"								
								href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tab" 
								aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11"
								aria-expanded="true">제목순</a></li>
								
							<!-- 베스트셀러 -->
    						<li class="nav-item">
                           	 <a class="nav-link" 
                           	 id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2" 
                           	 data-toggle="tab"
                           	 href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" 
                           	 role="tab" aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" aria-expanded="true">별점순</a>
                        	</li>
                        	
                        	<!-- 좋아한 책  -->
                        	 <li class="nav-item">
                           	 <a class="nav-link" 
                           	 id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a3" 
                           	 data-toggle="tab"
                           	 href="#TabId_65bc62a8-988b-4121-b45f-8f5645399c8a33" 
                           	 role="tab" aria-controls="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a33" aria-expanded="true">나의 좋아요</a>
                        	</li>
                        	
								
						</ul>
						<!-- ul끝  -->
						<div class="tab-content">
							<div class="tab-pane fade show active" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a00"
								role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a0">
								<!-- 베스트셀러  -->
								<div class="row">
									<c:forEach items="${bookpricelist2}" var="shop">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${shop.isbn}">
														<img style="max-width:80%;align:center;height:177px;" src="${shop.book_img}"  onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="text-align:center;">
													<h3 class="product-name" style="margin-bottom: 0px;">
													<a style="font-size:15px;text-align:center;overflow: hidden;text-overflow: ellipsis;
													display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-wrap:break-word; 
													line-height: 1.4em;height: 2.7em;" href="shopproduct?isbn=${shop.isbn}">${shop.book_title}</a></h3>
													<span class="product-price" style="padding-bottom: 10px;">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${shop.book_price}" pattern="###,###,###" /></span>원<br>
													</span>	
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 제목순  -->
							<div class="tab-pane fade" id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a11" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a1">
								<div class="row">
									<c:forEach items="${shoptitlelist}" var="shop_title">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${shop_title.isbn}">
														<img style="max-width:80%; align:center;height:177px" src="${shop_title.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="text-align:center;">
													<h3 class="product-name" style="margin-bottom: 0px;">
													<a style="font-size:15px;text-align:center;overflow: hidden;text-overflow: ellipsis;
													display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-wrap:break-word; 
													line-height: 1.4em;height: 2.7em;" href="shopproduct?isbn=${shop_title.isbn}">${shop_title.book_title}</a></h3>
													<span class="product-price" style="padding-bottom: 20px;"><span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${shop_title.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
												</div>
											</figure>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 낮은 가격순-->
								 <div class="tab-pane fade " id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a22" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a2">
                                     <div class="row">
                                     <c:forEach items="${bookpricelist}" var="bookpricelist2">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${bookpricelist2.isbn}">
														<img style="max-width:80%; align:center;height:177px" src="${bookpricelist2.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="text-align:center;">
													<h3 class="product-name" style="margin-bottom: 0px;">
													<a style="font-size:15px;text-align:center;overflow: hidden;text-overflow: ellipsis;
													display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-wrap:break-word; 
													line-height: 1.4em;height: 2.7em;" href="shopproduct?isbn=${bookpricelist2.isbn}">${bookpricelist2.book_title}</a></h3>
													<span class="product-price" style="padding-bottom: 20px;"><span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${bookpricelist2.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
													</div>
												</figure>
											</div>
										</c:forEach>
                                    </div>
                                </div>
                                <!-- 나의 좋아요순 -->
                                <div class="tab-pane fade " id="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a33" role="tabpanel" aria-labelledby="TabId_65bc62a8-988b-4121-b45f-8f5645399c8a3">
                                     <div class="row">
                                     <c:forEach items="${booklike}" var="booklike">
										<div class="col-md-2" style="margin-top: 20px;">
											<figure class="product-shadows product-item">
												<div class="product-media">
													<div class="img-wrap first-image">
														<a style="text-align: center;" href="shopproduct?isbn=${booklike.isbn}">
														<img style="max-width:80%; align:center;height:177px" src="${booklike.book_img}" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
													</div>
												</div>
												<div class="product-details" style="text-align:center;">
													<h3 class="product-name" style="margin-bottom: 0px;">
													<a style="font-size:15px;text-align:center;overflow: hidden;text-overflow: ellipsis;
													display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-wrap:break-word; 
													line-height: 1.4em;height: 2.7em;" href="shopproduct?isbn=${booklike.isbn}">${booklike.book_title}</a></h3>
													<span class="product-price" style="padding-bottom: 20px;"><span class="product-amount">
														<span class="product-price-currency">정가&nbsp;<fmt:formatNumber value="${booklike.book_price}" pattern="###,###,###" /></span>원<br>
													</span>
													</span>
													</div>
												</figure>
											</div>
										</c:forEach>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				<!--End Horizontal Tab - Clean-->
			</div>
		</div>
	</div>

<!-- library Modal -->
<div class="modal fade" id="bookshop" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
				 <div id="getBookTable"></div>
            </div>
        </div>
    </div>
</div>

<script>
//searchBook Btn Event
$(document).on("click","#booksearch",function(){
	console.log	("북샵에서 책 검색");
	var searchT=$('#booki').val();
	bookService.searchTitle(searchT,function(result){
		bookService.addBookData(result);
		makeBookTable(result);
	});
});
//책 클릭시 상세페이지로 이동하기
$(document).ready(function(){
	getBookTable.on("click", "button", function(e){
		var targetISBN = $(this).closest("tr").attr("class");
		console.log("targetISBN : "+targetISBN);
		location.href="shopproduct?isbn=" + targetISBN;
	});
});




let bookData="";
var getBookTable=$("#getBookTable");

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
					td.html("<button class='search-books card'>"+row[fieldInfo.field]+"</button>");
				}else{
				td.html( row[fieldInfo.field]);
				}
			}
 	    });
 	});
 }//end makeBookTable
 
</script>

