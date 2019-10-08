<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="includes/header/header-vertexEx.jsp"%>
<%@ include file="includes/header/script-vertexEx.jsp"%>
</head>
<body class="v-bg-color">
	<div class="smart-wrap" style="position:absolute; left:35vw; top:30vh;">
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
   		// ì¤ë³µë©ì¸ì§ ë°ìì¤ê¸°
   		var message = $('#msg');
   		if(message.val()=='true') {
   			alert("id, pwê° ì´ë¯¸ ì¡´ì¬íë ì ì ìëë¤.");
   		}
   		
   		// ì ì¡ ë²í¼ í´ë¦­ì >> ëª¨ë  ì°½ ì ì±ìì ¸ìì¼ë©´ ê²½ê³ ì°½
   		$('#chkDuplicatedBtn').on('click', function() {
   			var user_name = $('#user_name').val();
   			var user_mail = $('#user_mail').val();
   			var mailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
   			if(user_name=="" || user_mail=="") {
   				alert("ëª¨ë  í¼ì ìì±í´ì£¼ì¸ì.");
   			}else if(user_mail.split('.').length!=2 || !mailExp.test(user_name)) {
    			// ì´ë©ì¼ ì§ì  ìë ¥íê¸° ì íì ê²½ê³ ì°½
    			// 1. @ë·ë¶ë¶ì ooo.ooo ííë¡ ì ëì´ìëê²½ì°
    			// 2. í¹ë¬¸ ë¤ì´ê° ê²½ì°
    			// 3. íê¸ ë¤ì´ê° ê²½ì°
   				alert("ì´ë©ì¼ ì£¼ìì íìì´ ìëª» ëììµëë¤.");
   			}else {
   				$(this).attr('type', 'submit');
   			}
   		})
   	})
</script>
</body>
</html>