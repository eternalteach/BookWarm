<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 읽어온 날짜를 형식에 맞게 자르기 위해 taglib 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="includes/header/header-vertex.jsp" %>
<body>
<%@ include file="includes/header/header-topnav.jsp"%>
<sec:authentication property="principal.username" var="user_id"/>
 
    <div role="main" class="main">

	<section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-top:-70px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 text-left">
                    </div>
                    <div class="col-md-4">
                        <ul class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                            <li><a href="/warm/library?user_id=${user_id}">내 서재</a></li>
                            <li class="active"><a href="/warm/reviewMain">감상 메인</a></li>
                            <li class="active">감상 수정</li>
                        </ul>
                    </div>
                </div>
            </div>
     </section>
        
        <div class="v-page-wrap">
            <div class="container">
                <div class="row">
                    
					<div class="col-sm-9 v-blog-wrap" style="margin:auto; position:relative">

                        <div class="v-blog-items-wrap blog-standard">

                            <ul class="v-blog-items row standard-items clearfix">
                            	
                            	<li>
                        
                            		<!-- 작성 페이지. -->
                            		<form id="operForm" action="modify">
										<input type="hidden" name="user_id" value="${review.user_id}">
										<input type="hidden" name="isbn" value="${review.isbn}">
                            			<input type="hidden" name="review_no" value="${review.review_no}">
                            			<input type="hidden" name="pageNum" value="${cri.pageNum}">
                            			<input type="hidden" name="amount" value="${cri.amount}">
										<!-- 작성 시간과 수정 시간은 알아서 데이터 입력시에 들어가니 여기엔 필요 없음 -->

                            			<table style="table-layout:fixed">
                            				<tr>
                            					<td nowrap>제목</td>
                            					<td><input type="text" maxlength="66" name="review_title" value="${review.review_title}"></td>
                            				</tr>
                            				<tr>
                            					<td nowrap>관련 페이지</td>
                            					<td><input type="number" name="review_ref" min="0" step="1" value="${review.review_ref}" onkeypress="keyEvent(event)" onkeyup="delChar(event)">
                            						(0페이지 입력시 관련 페이지가 표시되지 않습니다.)
                            					</td>
                            				</tr>
                            				<tr>
                            					<td>공개여부</td>
                            					<td><input type="checkbox" name="review_open" id="review_open" ${review.review_open}></td>
                            				</tr>
                            				<tr>
                            					<td>내용</td>
                            					<td><textarea maxlength="1333" name="review_content" style="width:100%" rows="10">${review.review_content}</textarea></td>
                            				</tr>
                            				<tr>
                            					<td>첨부 이미지</td>
                            					<td>
                            						<div class="panel-body" style="background-color:#b5b5b5">
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
	                            					<button class="btn btn-outline-secondary" data-oper='modify' >
								                      	<span class="text ls-1">
						                            		저장하기
							                                <i class="i fa fa-check"></i>
						                            	</span>    
								                    </button>
								                    <button class="btn btn-outline-secondary" data-oper='list' >
								                      	<span class="text ls-1">
						                            		취소하기
							                                <i class="i fa fa-undo"></i>
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

        <!--Footer-Wrap-->
        <div class="footer-wrap">
    
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
    
    
    <script type="text/javascript">
	
    $(document).ready(function() {
    	
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
    		if(eVal > 99999) {
    			alert("0~99999 사이의 값을 입력해주세요.");
    			event.target.value = "";
    		}
    	}
    	
    	// 첨부 파일을 불러오기 위한 즉시실행함수
    	(function() {
    		var review_no = '<c:out value="${review.review_no}"/>';
    		
    		$.getJSON("/warm/getAttachList", {review_no: review_no}, function(arr) {
    			
    			var str = "";
    			
    			$(arr).each(function(i, attach) {
    				
    				var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
    				
    				str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "'><div>";
    				str += "<span>" + attach.fileName + "</span>";
    				str += "<button type='button' data-file=\'" + fileCallPath + "\'";
    				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
    				str += "<img src='/warm/display?fileName=" + fileCallPath + "'>";
    				str += "</div>";
    				str += "</li>";
    			});
    			
    			$(".uploadResult ul").html(str);
    		}); // end getJSON
    	})(); // end function
    	
    	// 화면상에서의 파일 삭제. 실제 수정을 누르기 전엔 실제 파일이 삭제되지 않음.
    	$(".uploadResult").on("click", "button", function(e) {
    		
    		if(confirm("파일을 삭제하시겠습니까?")) {
    			var targetLi = $(this).closest("li");
    			targetLi.remove();
    		}
    	});
    	
    	
    	var operForm = $("#operForm");
		
		$('button').on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			console.log(operation);
        										  
			if(operation === 'list') {
			// "목록으로"
			// -> 요청할 주소 : reviewPerBook
			// -> 넘겨야 하는 정보 : user_id, review_no, isbn(해당 게시물을 다시 조회하기 위함)
			//							Criteria(pageNum, amount) (들어올 때의 페이지로 돌아가기 위함)
			//							isbn(reviewPerBook 페이지에서 책 리뷰를 다시 조회하기 위함)
				
				operForm.attr("action", "reviewSelectOne");
			
				/* var user_id = $("input[name='user_id']").clone();
				var review_no = $("input[name='review_no']").clone();
				var isbn = $("input[name='isbn']").clone();
				var pageNum = $("input[name='pageNum']").clone();
				var amount = $("input[name='amount']").clone();
				
				operForm.empty();
				
				operForm.append(userid);
				operForm.append(review);
				operForm.append(isbn);
				operForm.append(pageNum);
				operForm.append(amount); */
			}
			// "수정하기"
			// -> 요청할 주소 : modify
			// -> 넘겨야 하는 정보 : user_id, review_no, user_
			//							Criteria(pageNum, amount) (들어올 때의 페이지로 돌아가기 위함)
			
			if($.trim($("input[name='review_title']").val()) == '') {
    				alert("제목을 입력해주세요.");
    			} else if ($.trim($("textarea").val()) == '') {
    				alert("내용을 입력해주세요.");
    			} else if ($.trim($("input[type='number']").val()) == '') {
    				$("input[type='number']").val(0); 
    			} else {
    				
    				var str = "";
    				
    				$(".uploadResult ul li").each(function(i, obj) {
    					
    					var jobj = $(obj);
    					
    					str += "<input type='hidden' name='attachList[" + i + "].fileName' value ='" + jobj.data("filename") + "'>";
        				str += "<input type='hidden' name='attachList[" + i + "].uuid' value ='" + jobj.data("uuid") + "'>";
        				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value ='" + jobj.data("path") + "'>";
        			
    				});
					operForm.append(str).submit();
    			}
			
			
		}); // end of button.on click
		
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
		
    }); // end of document ready
    
    
    
    </script>

<%@ include file="includes/header/header-vertex.jsp" %>
<%@ include file="includes/footer/footer-1.jsp"%>