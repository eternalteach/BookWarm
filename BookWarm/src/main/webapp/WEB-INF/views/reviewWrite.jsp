<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="includes/header/header-vertex.jsp" %>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>
<sec:authentication property="principal.username" var="user_id"/>
 
    <div role="main" class="main">

	<section class="page-header pb-0 pt-2 mt-2 mb-2" style="border-bottom-color:transparent; background-color:transparent">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                    </div>
                    <div class="col-md-4">
                        <ul class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="/warm/library?user_id=${user_id}">내 서재</a></li>
                            <li class="active"><a href="/warm/reviewMain">감상 메인</a></li>
                            <li class="active">감상 작성</li>
                        </ul>
                    </div>
                </div>
            </div>
     </section>

     <div class="v-page-wrap">
         <div class="container">
             <div class="row">
                 
				<div class="col-sm-12 v-blog-wrap" style="position:relative; margin-left:10%; margin-right:10%">
		
		             <div class="v-blog-items-wrap blog-standard">
		
		                 <ul class="v-blog-items row standard-items clearfix">
		                 	<li class="w-75">
		                 		<!-- 작성 페이지. -->
		                 		<form action="register" method="POST">
									<input type="hidden" name="user_id" value="${user_id}">
									<!-- 작성 시간과 수정 시간은 알아서 데이터 입력시에 들어가니 여기엔 필요 없음 -->
		                 		
		                 			<table class="w-100">
		                 				<tr>
		                 					<td>책</td>
		                 					<td>
		                 					
											<!-- isbn은 책별 리뷰 페이지에서 작성을 눌렀을 때는 넘어온 값이 선택,
												 리뷰 메인에서 넘어온 경우 책 선택이 default값으로 선택돼있도록. -->
		
		                  					<select name="isbn">
												<option value="">책 선택</option>
												
												<c:forEach items="${myList}" var="book">
												
													<c:choose>
														<c:when test="${not empty review.isbn && review.isbn == book.isbn}">
															<option value="${book.isbn}" selected="selected">${book.book_title}</option>
														</c:when>
														<c:when test="${empty review.isbn || review.isbn != book.isbn}">
															<option value="${book.isbn}">${book.book_title}</option>
														</c:when>
													</c:choose>
												
												</c:forEach>
											</select>
		                 					</td>
		                 				</tr>
		                 				<tr>
		                 					<td>제목</td>
		                 					<td><input type="text" maxlength="66" name="review_title"></td>
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
		                 					<td><textarea maxlength="1333" name="review_content" style="width:100%" rows="10"></textarea></td>
		                 				</tr>
		                 				<tr>
		                 					<td>이미지 첨부</td>
		                 					<td>
		                 						<div class="panel-body" style="background-color:#b5b5b5">
		                 							<div class="form-group uploadDiv">
		                 								<input type="file" name='uploadFile' multiple>
		                 							</div>
		                 							<div class='uploadResult'>
		                 								<ul></ul>
		                 							</div>
		                 							<!-- end form-group uploadDiv -->
		                 						</div> 
		                 						<!-- end panel-body -->
		                 					</td>
		                 				</tr>
		                 				<tr>
		                 					<td></td>
		                 					<td class="pull-right">
		                  					<button type='submit' class="btn btn-outline-secondary">
							                   	<span class="text ls-1">등록하기<i class="icon icon-pen-3"></i>
							                    </span>    
							                </button>
							                </td>
		                 				</tr>
		                 			</table>
		                 		</form>
		                 	</li>
		                 </ul>
		                 
		             </div>
                 </div>
             </div>
         </div>
     </div>


    </div>
    
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
    		
    		if($("select option").length == 1) {
				// 감상 작성 시도시 서재에 등록된 책이 없는 경우 라이브러리로 가서 책을 등록하게 함
				alert("내 서재에 책을 추가한 후 감상을 작성할 수 있습니다.");
				location.href="/warm/library";
			}
    		
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
				
    			
    			if ($("select").val() == '') {
    				alert("책을 선택해주세요.");
    				
    			} else if ($.trim($("input[name='review_title']").val()) == '') {
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
	
	
<%@ include file="includes/header/script-vertexEx.jsp"%> 
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>
