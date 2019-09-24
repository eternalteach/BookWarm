<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 <%@ include file="includes/header/header/header-from-vertex.jsp" %>
 
    <div role="main" class="main">

        <section class="page-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                        <span class="tob-sub-title text-color-primary d-block">OUR FEATURES</span>
                        <h1>Blog Standard</h1>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="col-md-4">
                        <ul class="breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="./resources/Vertex/index.html">Home</a></li>
                            <li><a href="./resources/Vertex/index.html">blog</a></li>
                            <li class="active">Blog Standard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <div class="v-page-wrap">
            <div class="container">
                <div class="row">
                    
					<div class="col-sm-9 v-blog-wrap" style="position:relative; margin:auto">

                        <div class="v-blog-items-wrap blog-standard">

                            <ul class="v-blog-items row standard-items clearfix">
                            	
                            	
                            	<li>
                            	
                            		<!-- 작성 페이지. -->
                            		<form action="register" method="POST">
										<input type="hidden" name="user_id" value="${review.user_id}">
										
										
										
										<!-- isbn은 책별 리뷰 페이지에서 작성을 눌렀을 때는 값이 넘어오니까 그 값을 hidden처리해줄까? 아니면 -->
										<!-- 선택만 그걸로 되게 하고.. 그 목록을 선택지로 띄울까. -->
										
										<select name="isbn">
											<option value="">책 선택</option>
											<%-- <c:forEach item=""></c:forEach> --%>
										</select>
										
										<input type="hidden" name="isbn" value="${review.isbn}">
										<!-- 작성 시간과 수정 시간은 알아서 데이터 입력시에 들어가니 여기엔 필요 없음 -->
                            		
                            			<table style="table-layout:fixed">
                            				<tr>
                            					<td>제목</td>
                            					<td><input type="text" name="review_title"></td>
                            				</tr>
                            				<tr>
                            					<td nowrap>관련 페이지</td>
                            					<td><input type="number" name="review_ref" min="0" max="99999" step="1" value="0" onkeypress="keyEvent(event)" onkeyup="delChar(event)" style="ime-mode:disabled">
                            						(0페이지 입력시 관련 페이지가 표시되지 않습니다.)
                            					</td>
                            				</tr>
                            				<tr>
                            					<td>공개여부</td>
                            					<td><input type="checkbox" name="review_open"></td>
                            				</tr>
                            				<tr>
                            					<td>내용</td>
                            					<td><textarea name="review_content" style="width:100%" rows="10"></textarea></td>
                            				</tr>
                            				<tr>
                            					<td>이미지 첨부</td>
                            					<td>
                            						<div class="panel-body" style="background-color:#b5b5b5;">
                            							<div class="form-group uploadDiv">
                            								<input type="file" name='uploadFile' multiple>
                            							</div>
                            							<div class='uploadResult'>
                            								<ul>
                            								
                            								</ul>
                            							</div>
                            							<!-- end form-group uploadDiv -->
                            						</div> 
                            						<!-- end panel-body -->
                            					</td>
                            				</tr>
                            				<tr>
                            					<td></td>
                            					<td>
	                            					<button type='submit' class="btn btn-outline-secondary">
								                      	<span class="text ls-1">
						                            		등록하기
							                                <i class="icon icon-pen-3"></i>
						                            	</span>    
								                    </button>
					                            </td>
                            				</tr>
                            			</table>
                            			
                            			
										                    		
                            		</form>
                            	</li>
                            
                            
                            
	                            <!-- <!-- 감상 작성 버튼 추가 -->
	                            <!-- <li class="v-blog-item col-sm-12">
	                            <button class="btn btn-outline-secondary">
	                            	<a href="">
			                            
			                            	<span class="text ls-1">
			                            		Write Review
				                                <i class="icon icon-pen-3"></i>
			                            	</span>
			                            
	                            	</a>
	                            </button>
	                            </li> -->
                            
                            </ul>

                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Footer-Wrap-->
        <div class="footer-wrap">
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <section class="widget">
                                <img alt="Vertex" src="./resources/Vertex/img/logo-white.png" style="height: 40px; margin-bottom: 20px;">
                                <p class="pull-bottom-small">
                                    Donec quam felis, ultricies nec, pellen tesqueeu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel aliquet nec, vulputate eget aliquet nec, arcu.
                                </p>
                                <p>
                                    <a href="./resources/Vertex/page-about-us-2.html">Read More →</a>
                                </p>
                            </section>
                        </div>
                        <div class="col-sm-3">
                            <section class="widget v-twitter-widget">
                                <div class="widget-heading">
                                    <h4>Latest Tweets</h4>
                                    <div class="horizontal-break"></div>
                                </div>
                                <ul class="v-twitter-widget">
                                    <li>
                                        <div class="tweet-text">
                                            <a href="#" target="_blank">@Vertex</a>
                                            Lorem ipsum dolor sit amet, consec adipiscing elit onvallis dignissim.
                                        </div>
                                        <div class="twitter_intents">
                                            <a class="timestamp" href="#" target="_blank">3 hours ago</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="tweet-text">
                                            <a href="#" target="_blank">@Vertex</a>
                                            Sed blandit conval dignissim. pharetra velit eu velit et erat pharetra.
                                        </div>
                                        <div class="twitter_intents">
                                            <a class="timestamp" href="#" target="_blank">5 days ago</a>
                                        </div>
                                    </li>
                                </ul>
                            </section>
                        </div>
                        <div class="col-sm-3">
                            <section class="widget v-recent-entry-widget">
                                <div class="widget-heading">
                                    <h4>Recent Posts</h4>
                                    <div class="horizontal-break"></div>
                                </div>
                                <ul>
                                    <li>
                                        <a href="./resources/Vertex/blog-standard-post.html">Amazing Standard Post</a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/blog-full-width-post.html">Full Width Media Post</a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/blog-video-post.html">Perfect Video Post</a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/blog-slideshow-post.html">Amazing Slideshow post</a>
                                    </li>
                                </ul>
                            </section>
                        </div>
                        <div class="col-sm-3">
                            <section class="widget">
                                <div class="widget-heading">
                                    <h4>Recent Works</h4>
                                    <div class="horizontal-break"></div>
                                </div>
                                <ul class="portfolio-grid">
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-1.jpg" />
                                            <span class="tooltip">Phasellus enim libero<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-2.jpg" />
                                            <span class="tooltip">Phasellus enim libero<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-3.jpg" />
                                            <span class="tooltip">Phasellus enim<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-4.png" />
                                            <span class="tooltip">Lorem Imput<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-5.jpg" />
                                            <span class="tooltip">Phasellus Enim libero<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="./resources/Vertex/portfolio-single.html" class="grid-img-wrap">
                                            <img src="./resources/Vertex/img/thumbs/project-6.jpg" />
                                            <span class="tooltip">Phasellus Enim<span class="arrow"></span></span>
                                        </a>
                                    </li>
                                </ul>
                            </section>
                        </div>
                    </div>
                </div>
            </footer>

            <div class="copyright">
                <div class="container">
                    <p>© Copyright 2018 by Vertex. All Rights Reserved.</p>

                    <div class="clearfix pull-right">
                        <a href="#" class="social-icon si-borderless si-facebook mb-0" title="Facebook">
                            <i class="si-icon-facebook"></i>
                            <i class="si-icon-facebook"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-twitter mb-0" title="Twitter">
                            <i class="si-icon-twitter"></i>
                            <i class="si-icon-twitter"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-instagram mb-0" title="Instagram">
                            <i class="si-icon-instagram"></i>
                            <i class="si-icon-instagram"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-vk mb-0" title="Vk">
                            <i class="si-icon-vk"></i>
                            <i class="si-icon-vk"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--End Footer-Wrap-->
    </div>
    
    // jQuery 사용을 위해 cdn 추가
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
    <script>
    	
    	// input number에서 '-', '.'을 입력하지 못하도록 함
    	function keyEvent(event) {
    		console.log(event.keyCode);
    		event = event || window.event;
    		var code = event.keyCode;
    		if(code < 48 || code > 57) {
				event.preventDefault();
    		} 
    		
    	}
    	// 한글 입력시 초기화, 99999페이지를 넘어가면 초기화
    	function delChar(event) {
    		var eVal = event.target.value;
    		eVal = eVal.replace(/[^0-9]/g, "");
    		
    		/* var korChk = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    		if(korChk.test(eVal)) {
    			alert("ID에 한글이 포함되어 있습니다.");
    			return;
    		} */
    		var eVal = event.target.value;
    		if(eVal > 99999) {
    			alert("0~99999 사이의 값을 입력해주세요.");
    			event.target.value = "";
    		}
    	}
    
    	$(document).ready(function(){
    		
    		var formObj = $("form");
    		// 파일 업로드를 위해 폼 제출 기본 동작 막음
    		$("button[type='submit']").on("click", function(e){
    			
    			e.preventDefault();
    			console.log("submit clicked");
    			
    			var str = "";
    			
    			$(".uploadResult ul li").each(function(i, obj){
    				var jobj = $(obj);
    				console.dir(jobj);
    				
    				str += "<input type='hidden' name='attachList[" + i + "].fileName' value ='" + jobj.data("filename") + "'>";
    				str += "<input type='hidden' name='attachList[" + i + "].uuid' value ='" + jobj.data("uuid") + "'>";
    				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value ='" + jobj.data("path") + "'>";
    			});

    			if($.trim($("input[name='review_title']").val()) == '') {
    				alert("제목을 입력해주세요.");
    			} else if ($.trim($("textarea").val()) == '') {
    				alert("내용을 입력해주세요.");
    			} else if ($.trim($("input[type='number']").val()) == '') {
    				$("input[type='number']").val(0); 
    			} else {
    				
	    			formObj.append(str).submit();
    			}
    			
    		});
    		// 이미지 파일만을 등록할 수 있도록.
    		var regex = new RegExp("(.*?)\.(jpeg|jpg|png|gif|bmp)$")
    		
    		/* var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); */
    		var maxSize = 5242880; //5MB. 추후 수정.
    		
    		// 파일 사이즈 및 타입 체크
    		function checkExtension(fileName, fileSize) {
    			
    			if(fileSize >= maxSize) {
    				alert("파일 사이즈 초과");
    				return false;
    			}
    			
    			if(!regex.test(fileName)) {
    				alert("이미지 파일만 등록할 수 있습니다.");
    				return false;
    			}
    			return true;
    		}
    		
    		$("input[type='file']").change(function(e) {
    			
    			var formData = new FormData();
    			var inputFile = $("input[name='uploadFile']");
    			var files = inputFile[0].files;
    			console.log(files);
    			
    			for(var i=0; i<files.length; i++) {
    				
    				if(!checkExtension(files[i].name, files[i].size)) {
    					return false;
    				}
    				formData.append("uploadFile", files[i]);
    			}
    			
    			$.ajax({
    				url: '/warm/uploadAjaxAction',
    				processData: false,
    				contentType: false,
    				data: formData,
    				type: 'POST',
    				dataType: 'json',
    				success: function(result){
    					console.log(result);
    					showUploadResult(result);
    				}
    			}); //$.ajax
    		});
    		
    		// 업로드 결과를 화면에 섬네일 등을 만들어 처리
    		
    		function showUploadResult(uploadResultArr) {
    			
    			if(!uploadResultArr || uploadResultArr.length == 0) { return; }
    			
    			var uploadUL = $(".uploadResult ul");
    			var str = "";
    			
    			$(uploadResultArr).each(function(i, obj) {

					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
    					
    				str += "<li data-path ='" + obj.uploadPath + "'";
    				str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'><div>";
    				str += "<span> " + obj.fileName + "</span>";
    				str += "<button type='button' data-file=\'" + fileCallPath + "\' class='btn btn-warning btn-circle'>";
    				str += "<i class='fa fa-times'></i></button><br>";
    				str += "<img src='/warm/display?fileName=" + fileCallPath + "'>";
    				str += "</div>";
    				str += "</li>";
    			});
    			
    			uploadUL.append(str);
    		}
    		
    		$(".uploadResult").on("click", "button", function(e) {
    			
    			var targetFile = $(this).data("file");
    			var targetLi = $(this).closest("li");
    			
    			$.ajax({
    				url: '/warm/deleteFile',
    				data: {fileName: targetFile},
    				dataType: 'text',
    				type: 'POST',
    				success: function(result) {
    					alert(result);
    					targetLi.remove();
    				}
    			}); // end of ajax
    		});
    	}); // end of document.ready
    </script>
	
	

    <!-- Libs -->
    <script src="./resources/Vertex/js/jquery.min.js"></script>
    <script src="./resources/Vertex/js/popper.js"></script>
    <script src="./resources/Vertex/js/bootstrap.min.js"></script>
    <script src="./resources/Vertex/js/jquery.flexslider-min.js"></script>
    <script src="./resources/Vertex/js/jquery.easing.js"></script>
    <script src="./resources/Vertex/js/jquery.fitvids.js"></script>
    <script src="./resources/Vertex/js/jquery.carouFredSel.min.js"></script>
    <script src="./resources/Vertex/js/jquery.validate.js"></script>
    <script src="./resources/Vertex/js/theme-plugins.js"></script>
    <script src="./resources/Vertex/js/jquery.isotope.min.js"></script>
    <script src="./resources/Vertex/js/imagesloaded.js"></script>

    <script src="./resources/Vertex/js/view.min.js?auto"></script>
    <script src="./resources/Vertex/plugins/aos/aos.js"></script>
    <script src="./resources/Vertex/js/theme-core.js"></script>
    <script src="./resources/Vertex/js/theme.js"></script>
    <script src="./resources/Vertex/js/theme.init.js"></script>
</body>
</html>