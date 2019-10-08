<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<%@ include file="./includes/header/header-vertexEx.jsp" %>
	<%@ include file="./includes/header/script-vertexEx.jsp" %>
</head>

<body>
	<div class="smart-wrap" style="position:absolute; left:35vw; top:5vh;">
		<div class="smart-forms smart-container wrap-3">
			<div class="form-header header-primary">
				<h4><i class="fa fa-sign-in"></i> Register Success</h4>
			</div>
			<div class="form-body">
				<div class="spacer-b30">
					<div class="tagline "><span class="text-secondary"> Info </span></div>
				</div>
				<div class="section">
					<label class="field prepend-icon">
						<input type="text" name="user_name" id="user_name" class="gui-input" value="${userVO.user_name}" readonly="readonly">
						<span class="field-icon"><i class="fa fa-user"></i></span>
					</label>
				</div><!-- end section -->
				<div class="section">
					<label class="field prepend-icon">
						<input type="text" name="user_mail" id="user_mail" class="gui-input" value="${userVO.user_mail}" readonly="readonly">
						<span class="field-icon"><i class="ion-ios-email-outline"></i></span>
					</label>
				</div><!-- end section -->
				<div style="padding-top:20px;">
					<div class="spacer-b30">
						<div class="tagline "><span class="text-secondary"> Detail </span></div>
					</div>
				</div>
				<div class="section">
					<label>아이디</label>
					<label class="field prepend-icon">
						<input type="text" name="user_id" id="user_id" class="gui-input" value="${userVO.user_id}" maxlength="50" readonly="readonly">
					</label>
					<div class="row">
						<div class="col-sm"><span id="idConfirmMsg"></span></div>
					</div>
				</div><!-- end section -->
				<div class="section">
					<label>닉네임</label>
					<input type="text" class="form-control" name="user_nickname" id="user_nickname" value="${userVO.user_nickname}" maxlength="100" readonly="readonly">
					<div class="row">
						<div class="col-sm"><span id="nicknameConfirmMsg"></span></div>
					</div>
				</div>
				<div class="section">
					<label>생년월일</label><!-- jquery로 년월일 넣어주기 -->
					<div class="section">
						<input type="hidden" class="form-control col-sm-6" name="user_bday" id="user_bday1" value="${userVO.user_bday}" maxlength="100" readonly="readonly" >
						<input type="text" class="form-control col-sm-6" name="user_bday" id="user_bday2" maxlength="100" readonly="readonly">
					</div>
				</div>
				<div class="section">
					<label>성별</label>
					<div class="section">
						<input type="text" class="form-control col-sm-3" name="user_sex" id="user_sex" maxlength="100" readonly="readonly">
						<input type="hidden" class="form-control col-sm-3" name="user_sex2" id="user_sex2" value="${userVO.user_sex}" maxlength="100" readonly="readonly">
					</div>
				</div>
				<div class="section">
					<label>휴대폰 번호</label>
					<div class="form-inline">
						<input type="text" class="form-control col-sm-6" id="user_phone" value=" ${userVO.user_phone}" readonly="readonly">
					</div>
				</div><!-- end section -->
				<div class="section">
					<label>주소</label>
					<div class="section from-inline">
						<label class="field prepend-icon">
							<input type="text" id="sample4_postcode" name="user_zipcode" class="btn-sm col-md-6 pull-left" value="${userVO.user_zipcode}" readonly>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" id="sample4_roadAddress" name="user_addr" class="form-control" value="${userVO.user_addr}" readonly>
							<span class="field-icon"></span>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" id="sample4_detailAddress" class="form-control" value="${userVO.user_addr_detail}" readonly="readonly">
							<span class="field-icon"></span>
						</label>
					</div><!-- end section -->
					<div class="center"style="padding-top:10px;">
						<button type="button" onclick="location.href='/warm/index'" class="btn center no-margin-bottom no-margin-right"><span class="col-lg-4"></span>Go to Index<span class="col-lg-4"></span></button>
					</div>
				</div>
			</div><!-- end .form-body section -->
		</div><!-- end .smart-forms section -->
	</div>
	<script>
	$(document).ready(function(){
		let userbday="";
		userbday=$("#user_bday1").val();
		userbday=birthSubstring(userbday);
		$("#user_bday2").val(userbday);
		
		let userSex="";
		userSex=$("#user_sex2").val();
		userSex=sexToString(userSex);
		$("#user_sex").val(userSex);
	});
	
	function birthSubstring(birthday){
		birthday=birthday.substring(0,11);
		return birthday;
	}
	
	function sexToString(userSex){
		if(userSex=='f'){
			userSex='여성';
		}else(userSex='남성');
		return userSex;
	}
	</script>
</body>
</html>