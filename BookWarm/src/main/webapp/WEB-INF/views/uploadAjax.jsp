<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Upload with Ajax</h1>

<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>
	
</div>

<button id='uploadBtn'>Upload</button>


    <!-- // jQuery 사용을 위해 cdn 추가 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		
		$("#uploadBtn").on("click", function(e) {
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			console.log("inputFile: " + inputFile);
			var files = inputFile[0].files;
			
			console.log(files);
			
			//add filedate to formData
			for(var i=0; i<files.length; i++) {
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/warm/uploadAjaxAction',
				processData: false,
				contentType: false,
				data:formData,
				type: 'POST',
				success: function(result) {
					alert("Uploaded");
				}
			}); // end of ajax
		}); // end of uploadBtn on click
	}); // end of document ready
</script>    

</body>
</html>