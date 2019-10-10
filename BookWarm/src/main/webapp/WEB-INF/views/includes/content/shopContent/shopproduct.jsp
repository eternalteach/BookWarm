<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>

<script type="text/javascript" src="/warm/resources/js/BookLike.js"></script>



	<div role="main" class="main">
		<section class="ddd" style="padding-top:10px; padding-bottom:0px; margin-top:20px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-8 text-left">
					</div>
					<div class="col-md-4" >
						<ul class="breadcrumb justify-content-start justify-content-md-end mb-0" style="background-color:transparent">
							<li><a href="shoplist">책</a></li>
							<li class="active"><a href="#">책 상세정보</a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	
   <div class="wrapper">
      <div class="page has-z has-left-sidebar bordered single-product-wrap">
         <div class="no-border" style="padding-top: 10px;">
            <div class="container single-product-inner" style="padding-top: 0px;margin-bottom: 0px;">
               <div class="row" style="margin-left: 120px;">
                  <div class="col-md-3" style="padding-right: 30px;margin-right: 80px;margin-left: 20px;">
                  	<div class="img" style="padding-top: 20px;">
                    <img src="${bookdetail.book_img}" style="width: 180px;height: 261px;margin-top: 30px;" onerror="this.src='/warm/resources/img/책장군2.png'">
                    </div>
                  </div>

                  <div class="col-md-7">
                     <ol class="breadcrumb clean-breadcrumb">
                        <li><i class="fa fa-home" aria-hidden="true"></i>${bookdetail.book_title}</li>
                     </ol>
                     <div class="product-details">
                        <h2 class="product-name">${bookdetail.book_title}</h2>
                        <div class="product-price-wrap" style="margin-bottom: 15px;">
                           <span class="product-price">
                              <del class="product-amount"><span class="product-price-currency">정가&nbsp<fmt:formatNumber value="${bookdetail.book_price}" pattern="###,###,###" /></span>원</del><br>
                              <ins> 
                                 <span class="product-amount">
                                    <span class="product-price-currency">할인가&nbsp<fmt:formatNumber value="${bookdetail.book_price_for_sale}" pattern="###,###,###" /></span>원
                                 </span>
                            </ins>
                           </span><br>
                           <span class="product-price-currency">
                           </span>
                        </div>

                        <div class="product-summary">
                         <p style="margin-bottom: 0px;">${bookdetail.writer_name}&nbsp저</p>
                          <c:if test="${bookdetail.translator_name != '[]'}">
 						 <p>${bookdetail.translator_name}&nbsp역</p>
 						 </c:if>
                        </div>

							<!-- 장바구니로 이동  -->
							<form name ="form1" method="get" action="/warm/shop/insertcart"  style="float:left;">
								<select class="input-text qty text" name = "cart_cnt">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
								</select>
	                           <button id="cart" type="submit" name="isbn" value="${bookdetail.isbn }" class="btn btn-outline-secondary btn-sm" style="left: 10px;">                      
	                           <span>장바구니</span>
	                           </button>
                           </form>
                           <input type="text" id="isbn" value="${bookdetail.isbn }" hidden="hidden">
                       		<!-- 목록버튼 클릭하면 책 목록으로 이동. -->
						    <a href="/warm/shop/shoplist"><button type="submit" class="btn btn-outline-secondary btn-sm" style="left: 10px;">
                          	<span>책 리스트</span>
                           </button></a>
						   <button type="button" id="bookLikeBtn" class="btn btn-outline-secondary btn-sm" style="left: 10px;">
                          	<i class="fa fa-heart" aria-hidden="true"></i>
                           </button>
                           
                           <script>
                	 			var isbn=$("#isbn").val();
                	 			bookLike={isbn:isbn};
                	 			
                        	  $(document).on("click","#bookLikeBtn",function(){
                	 			bookLikeService.addBookLike(bookLike,function(result){
                	 				$("#bookLikeBtn").html("좋아요 취소");
                	 				$("#bookLikeBtn").attr("id","bookDisLikeBtn");
                	 			});
                        	  });
                        	  
                        	  $(document).on("click","#bookDisLikeBtn",function(){
                	 			bookLikeService.removeBookLikeAboutISBN(isbn,function(result){
                	 				$("#bookDisLikeBtn").html("<i class=\"fa fa-heart\" aria-hidden=\"true\"></i>");
                	 				$("#bookDisLikeBtn").attr("id","bookLikeBtn");
                	 			});
                        	  });
                        	  
                        	  $(document).ready(function(){
                        		  bookLikeService.checkBookLikeAboutISBN(isbn,function(result){
                       				console.log("check Book Like : " + result);
                       				if(result=='1'){
	                   					$("#bookLikeBtn").html("좋아요 취소");
	                   	 				$("#bookLikeBtn").attr("id","bookDisLikeBtn");
                      				}
                        		  });
                        	  });
                           </script>
		                     <div class="product_meta mb-40">
		                           <span class="tagged_as">
		                           </span>
		                     </div>

            		    <!-- 줄거리/목차부분  -->
                        <div class="clearfix">
                           <div class="tab-wrap clean-tab">
                              <ul class="nav nav-tabs" role="tablist">
                                 <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#About" role="tab">줄거리</a>
                                 </li>
                              </ul>
                              <div class="tab-content">
                                 <div class="tab-pane active" id="About" role="tabpanel">
                                    <p>${bookdetail.book_story}</p>
                                 </div>
                              </div> 
                           </div>
                        </div>
                       <!-- 줄거리/목차 끝  -->
                     </div>
                  </div>
               </div>
            </div>

			<!-- 대표저서  -->
             <section class="section-big main-color">
               <div class="container" style=" width: 830px;">
                  <div class="row center">
                     <div class="col-md-12">
                        <h3 class="section-title" style="margin-bottom:20px;margin-left: 20px;font-size:24px;">대표 저서</h3>
                     </div>
                  </div>

                  <div class="row" style="margin-top:10px;">
                  	
	                    <c:forEach items="${bookwritername}" var="bookwriter">
	                     <div class="col-md-2">
							<figure class="product-shadows product-item">
	                        <div class="product-shadows product-item">
	                                 <figure class="product-shadows product-item">
	                                       <div class="img-wrap first-image">
	                                         <a href="shopproduct?isbn=${bookwriter.isbn}"><img src="${bookwriter.book_img}" style="width: 130px;" onerror="this.src='/warm/resources/img/책장군2.png'"></a>
	                                       </div>
										
	                                    <div class="product-details">
	                                       <h3 class="product-name" style="font-size: 14px;line-height:1.3em;margin-top:10px;margin-bottom:0px; text-align: center;">${bookwriter.book_title}</h3>
	                                       <div class="product-price-currency" style="text-align:center;"><fmt:formatNumber value="${bookwriter.book_price}" pattern="###,###,###" />원</div>
	                                    </div> 
	                                 </figure>
	                         </div>
	                         </figure>
	                     </div>
	                    </c:forEach>
                 </div>
              </div>
		    </section>
		    <!-- 대표저서 끝  --> 
		</div>
      </div>
     </div>
   </div>
      
     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
     <script>
 		//버튼 클릭시 이벤트
 		$(document).ready(function(){
	 		$("#cart").on("click", function(e){
	 			/* alert("장바구니에 추가되었습니다!");  */
	 		});
 			
	 		$("#pay").on("click", function(e){
				alert("구매로 이동하시겠습니까?");
				
				});
 			});
 	/* 	//amount넘기기
 		$(document).ready(function(){
 		    $("#cart_cnt").on("change", function(){
 		    	alert("안돼")
 		    	var val = $(this).val(); 		    	
 		     	var pre = $("#cart_get").attr("href");
 		     	console.log(pre.toString()  + val.toString());     	 
 		     	$("#cart_get").attr("href",pre.toString()  + val.toString());     	
 		        console.log($(this).val());
 		    });
 		}); */
 		//즐겨찾기 기능하기
 		$(document).ready(function(){
 	 		  //흰색이 검정색으로 바뀌기
 	 		  var booklover = $(".booklover");
 	 		  
 	 		booklover.on("click", "i", function(e){
 	 			 alert("하트눌름");
 	 			 var icon =  $("i[class='fa fa-star-o']");
 	 			 var item = $(this).attr("data-i");
 	 			 if(item ==  "white"){
 	 			 var str = "";
 	 			 str += "<i id='loveicon' class='fa fa-star' data-i='black'></i>";
 	 		  	/*  booklover.html(str); */
 	 			 };
 	 			 if(item == "black"){
 	 				var str = "";
 	 	 			 str += "<i id='loveicon' class='fa fa-star-o' data-i='white'></i>";
 	 			 };
 	 	 		  	 booklover.html(str);
 	 		  });
 		});
      </script>
