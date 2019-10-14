<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 이메일 하나 당, 계정 하나 만들 수 있음 -->
<!-- 필수입력항목 입력 안 했을 때 다음으로 못 넘어가도록 만들어주기 -->
<div class="smart-wrap" style="position:absolute; left:35vw; top:5vh;">
	<div class="smart-forms smart-container wrap-3">
		<div class="form-header header-primary">
			<h4><i class="fa fa-sign-in"></i> Register</h4>
		</div>
		<form action="/warm/register/registerSuccess" method="post" id="form">
			<div class="form-body">
				<div class="spacer-b30">
					<div class="tagline "><span class="text-secondary"> Info </span></div>
				</div>
				<div class="section">
					<label class="field prepend-icon">
						<input type="text" name="user_name" id="user_name" class="gui-input" value="${user_name}" readonly="readonly">
						<span class="field-icon"><i class="fa fa-user"></i></span>
					</label>
				</div><!-- end section -->
				<div class="section">
					<label class="field prepend-icon">
						<input type="text" name="user_mail" id="user_mail" class="gui-input" value="${user_mail}" readonly="readonly">
						<span class="field-icon"><i class="ion-ios-email-outline"></i></span>
					</label>
				</div><!-- end section -->
				<div style="padding-top:20px;">
					<div class="spacer-b30">
						<div class="tagline "><span class="text-secondary"> Detail </span></div>
					</div>
				</div>
				<div class="section">
					<label>아이디<span class="required">*</span></label>
					<label class="field prepend-icon">
						<input type="text" name="user_id" id="user_id" class="gui-input" placeholder="ID" maxlength="50">
					</label>
					<div class="row">
						<div class="col-sm"><span id="idConfirmMsg"></span></div>
					</div>
				</div><!-- end section -->
				<div class="form-group">
					<div class="row">
						<div class="col-sm-6">
							<label>비밀번호<span class="required">*</span></label>
							<input type="password" class="form-control input-lg" name="user_pw" id="user_pw" placeholder="Password" maxlength="100">
						</div>
						<div class="col-sm-6">
							<label>비밀번호 확인<span class="required">*</span></label>
							<input type="password" class="form-control input-lg" id="pwConfirm" placeholder="Confirm Password" maxlength="100">
						</div>
					</div>
					<div class="row">
						<div class="col-sm"><span id="pwConfirmMsg" style="color:red">비밀번호가 일치하지 않습니다.</span></div>
					</div>
				</div>
				<div class="form-group">
					<label>닉네임<span class="required">*</span></label>
					<input type="text" class="form-control" name="user_nickname" id="user_nickname" placeholder="nickname" maxlength="100">
					<div class="row">
						<div class="col-sm"><span id="nicknameConfirmMsg"></span></div>
					</div>
				</div>
				<div class="form-group">
					<label>생년월일<span class="required">*</span></label><!-- jquery로 년월일 넣어주기 -->
					<div class="row">
						<div class="col-sm-3"><select id="year"></select>년</div>
						<div class="col-sm-3"><select id="month"></select>월</div>
						<div class="col-sm-3"><select id="day"></select>일</div>
					</div>
				</div>
				<div class="section">
					<label>성별<span class="required">*</span></label>
					<label class="field prepend-icon">
					<input type="radio" name="user_sex" id="user_sex_f" value="f">여자
					<span style="margin:10px;"></span>
					<input type="radio" name="user_sex" id="user_sex_m" value="m">남자
					<span class="field-icon"></span>
					</label>
				</div><!-- end section -->
				<div class="section">
					<label>휴대폰 번호<span class="required">*</span></label>
					<div class="form-inline">
						<input type="text" class="form-control col-sm-2" id="user_phone1" maxlength="3"><span style="margin:10px;"> </span>-<span style="margin:10px;"> </span>
						<input type="text" class="form-control col-sm-2" id="user_phone2" maxlength="4"><span style="margin:10px;"> </span>-<span style="margin:10px;"> </span>
						<input type="text" class="form-control col-sm-2" id="user_phone3" maxlength="4">
					</div>
				</div><!-- end section -->
				<div class="form-group">
					<label>주소<span class="required">*</span></label>
					
					
					
					<div class="section form-inline">
						<label class="field prepend-icon">
							<input type="text" id="sample4_postcode" name="user_zipcode" class="btn-sm col-md-6 pull-left" placeholder="우편번호" readonly><span style="margin:10px;"> </span>
							<button type="button" class="btn btn-sm no-margin-bottom no-margin-right" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" id="sample4_roadAddress" name="user_addr" class="form-control" placeholder="도로명주소" readonly>
							<span class="field-icon"></span>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" readonly>
							<span class="field-icon"></span>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소">
							<span class="field-icon"></span>
						</label>
					</div><!-- end section -->
					<div class="section">
						<label class="field prepend-icon">
							<input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목" readonly>
							<span class="field-icon"></span>
						</label>
					</div><!-- end section -->
					
					
					
					
					
					
					
					
					<div class="pull-right">
						<button type="button" class="btn pull-right no-margin-bottom no-margin-right" id="submitBtn"><span class="col-lg-4"></span>회원가입<span class="col-lg-4"></span></button>
					</div>
				</div>
			</div><!-- end .form-body section -->
		</form>
	</div><!-- end .smart-forms section -->
</div>
