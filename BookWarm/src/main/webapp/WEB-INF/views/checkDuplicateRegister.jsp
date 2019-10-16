<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="includes/header/header-vertexEx.jsp"%>
<%@ include file="includes/header/script-vertexEx.jsp"%>
<title> Register</title>
</head>
<body class="v-bg-color">
	<div class="smart-wrap" style="position:absolute; left:38vw; top:26vh;">
		<div class="smart-forms smart-container wrap-3">
			<div class="form-header header-primary">
				<h4><i class="fa fa-sign-in"></i>BOOK & WARM</h4>
				<input type="hidden" id="msg" value="${msg}">
			</div>
			<form method="post" action="/warm/register/checkDuplicated">
				<div class="form-body">
					<div class="spacer-b30">
						<div class="tagline "><span class="text-secondary"> Info </span></div><!-- .tagline -->
					</div>
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" name="user_name" id="user_name" class="gui-input" placeholder="Enter username">
							<span class="field-icon"><i class="fa fa-user"></i></span>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" name="user_mail" id="user_mail" class="gui-input" placeholder="Enter E-mail">
							<span class="field-icon"><i class="ion-ios-email-outline"></i></span>
						</label>
					</div><!-- end section -->
					<button type="submit" class="button btn-secondary" id="chkDuplicatedBtn">Next</button>
				</div><!-- end .form-body section -->
			</form>
		</div><!-- end .smart-forms section -->
	</div>
<script>
   	$(document).ready(function() {
   		var message = $('#msg');
   		if(message.val()=='true') {
   			alert("이미 존재하는 유저입니다.");
   		}
   		
   		$('#chkDuplicatedBtn').on('click', function(e) {
   			var user_name = $('#user_name').val();
   			var user_mail = $('#user_mail').val();
   			var mailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
   			let frontEmail=user_mail.split('@')[0];
   			let backEmail=user_mail.split('@')[1];
   			
   			if(user_name=="" || user_mail=="") {
   				alert("모든 폼을 채워주세요");
   				e.preventDefault();
   			}else if(!(backEmail.split('.').length==2 || backEmail.split('.').length==3) || user_mail.match(mailExp)==null) {
   				alert("메일을 다시 입력해주세요");
   				console.log("backEmail.split('.').length : "+backEmail.split('.').length);
   				console.log("(backEmail.split('.').length==2 || backEmail.split('.').length==3) : "+(backEmail.split('.').length==2 || backEmail.split('.').length==3));
   				console.log("mailExp.test(frontEmail) : "+mailExp.test(frontEmail));
   				console.log("mailExp.test(backEmail.split('.')[0]) : "+mailExp.test(backEmail.split('.')[0])+backEmail.split('.')[0]);
   				console.log("mailExp.test(backEmail.split('.')[1]) : "+mailExp.test(backEmail.split('.')[1])+backEmail.split('.')[1]);
   				console.log("mailExp.test(backEmail.split('.')[2]) : "+mailExp.test(backEmail.split('.')[2])+backEmail.split('.')[2]);
   				e.preventDefault();
   			}else {
   				$(this).attr('type', 'submit');
   			}
   		})
   	})
</script>
</body>
</html>