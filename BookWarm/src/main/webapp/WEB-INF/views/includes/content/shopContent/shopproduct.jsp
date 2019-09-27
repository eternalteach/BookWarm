<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authentication property="principal.username" var="user_id"/>
<body class="bg-white">
   <div class="wrapper">
      <div class="page has-sidebar has-left-sidebar bordered single-product-wrap">
         <div class="page-inner no-border">
            <div class="container single-product-inner">
               <div class="row">
                  <div class="col-md-4">
                  	<div class="img">
                    <img src="${bookdetail.book_img}">
                    </div>
                  </div>

                  <div class="col-md-6">
                     <ol class="breadcrumb clean-breadcrumb">
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>${bookdetail.book_title}</a></li>
                     </ol>
                     <div class="product-details">
                        <h2 class="product-name"><a href="#" id="booktitle">${bookdetail.book_title}</a></h2>
                        <div class="product-price-wrap">
                           <span class="product-price">
                              <del class="product-amount"><span class="product-price-currency">정가&nbsp<fmt:formatNumber value="${bookdetail.book_price}" pattern="###,###,###" /></span>원</del><br>
                              <ins> 
                                 <span class="product-amount">
                                    <span class="product-price-currency">할인가&nbsp<fmt:formatNumber value="${bookdetail.book_price_for_sale}" pattern="###,###,###" /></span>원
                                 </span>
                            </ins>
                           </span><br>
                           <span class="product-price-currency">
                           <span class="product-star-rating" title="Rated 4.67 out of 5">
                           <!-- 나중에 booksatr로 가져올거임 별점수  -->
<!--                               <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i> -->
                           </span>
                           </span>
                        </div>

                        <div class="product-summary">
                      <%--    <c:if test="${empty bookdetail.author}">
      					</c:if> --%>
                         <p>${bookdetail.writer_name}&nbsp저</p>
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
	                           <button id="cart" type="submit" 
	                           name="isbn" value="${bookdetail.isbn }" 
	                           class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="장바구니로 이동" data-location="top">
	                           <i class="fa fa-shopping-basket" data-title="장바구니로 이동" data-location="top"></i>
	                           <span>장바구니</span>
	                           </button>
                           </form>
                           
							<!-- 구매로이동  -->
                            <!-- <a href="/warm/shop/charge"><button id="pay" type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="구매로 이동" data-location="top">
                          	<span>구매</span>
                           </button></a>  -->
                           
                       		<!-- 목록버튼 클릭하면 책 목록으로 이동. -->
						    <a href="/warm/shop/shoplist"><button type="submit" class="btn btn-outline-primary btn-md product-btn lite-tooltip" data-title="목록으로 이동" data-location="top">
                          	<span>목록</span>
                           </button></a>
                           
                           <a class="booklover" href="#">
                           		<i id="loveicon" class="fa fa-star-o" data-i="white"></i>
                           </a>
                           
                     <div class="product_meta mb-40">
                           <span class="tagged_as">
                              <!-- Tags:
                              <a href="#" rel="tag">Sweaters</a>,
                              <a href="#" rel="tag">Turtleneck</a>,
                              <a href="#" rel="tag">Wool</a> --> 
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

               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <h2 class="section-title mb-5 fs-26">
                           	 대표 저서
                        </h2>
                     </div>
                  </div>

                  <div class="row">
                    <c:forEach items="${bookwritername}" var="bookwriter">
                     <div class="col-md-2">
						<figure class="product-shadows product-item">
                        <div class="product-shadows product-item">
                                 <figure class="product-shadows product-item">
                                    <div class="product-media">
                                       <div class="img-wrap first-image">
                                         <a href="shopproduct?isbn=${bookwriter.isbn}"><img src="${bookwriter.book_img}"></a>
                                       </div>
                                    </div>
									
                                    <div class="product-details">
                                       <h3 class="product-name"><a href="#">${bookwriter.book_title}</a></h3>
                                          <class="product-amount">
                                          	 <class="product-price-currency"><fmt:formatNumber value="${bookwriter.book_price}" pattern="###,###,###" />원</class>
                                       <div class="product-star-rating" title="Rated 4.67 out of 5">
                                        <!--   <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i> -->
                                       </div>
                                    </div> 
                                 </figure>
                              </div>
                              </figure>
                             </div>
                            </c:forEach>
                         </div>
                         <!-- row끝 -->
                        </div>
		            </section> 
				</div>
              </div>
         </div>
   <!--       
     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
     <script>
 		//버튼 클릭시 이벤트
 		$(document).ready(function(){
 			
 		$("#cart").on("click", function(e){
			alert("장바구니에 등록하시겠습니까?");
			});
 		$("#pay").on("click", function(e){
			alert("구매로 이동하시겠습니까?");
			
			});
 		});
 		
 		//amount넘기기
 		$(document).ready(function(){
 		    $("#cart_cnt").on("change", function(){
 		    	alert("안돼")
 		    	var val = $(this).val(); 		    	
 		     	var pre = $("#cart_get").attr("href");
 		    	
 		     	console.log(pre.toString()  + val.toString());     	 
 		     	$("#cart_get").attr("href",pre.toString()  + val.toString());     	
 		        console.log($(this).val());
 		    });
 		});
 		
 		
 		
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
</body>
