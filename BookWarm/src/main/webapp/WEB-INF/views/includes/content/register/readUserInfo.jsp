<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal.username" var="user_id"/>
<div id="container" class="v-bg-color">
    <div class="body-sign">
        <div class="container">
            <div class="row">
				<form class="v-signup v-register" action="modifyUserInfo" method="post" id="form">
					<!-- <div class="form-group">
						<h2 class="mb-2 mt-0"><strong>내 정보 수정</strong></h2>
					</div> -->
					<div class="form-group">
						<label for="user_name">이름<span class="required">*</span></label>
						<input type="text" class="form-control" name="user_name" id="user_name" maxlength="100" readonly="readonly"> 
					</div>
					<div class="form-group">
						<label>이메일<span class="required">*</span></label>
						<div class="form-inline">
                            <input type="text" class="form-control col-sm-5" value="" id="user_mail1" maxlength="50" readonly="readonly">
                            <span class="col-sm-2">@</span>
                            <input type="text" class="form-control col-sm-5" value="" id="user_mail2" maxlength="50" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label for="user_id">아이디<span class="required">*</span></label>
						<input type="text" class="form-control col-sm-12" name="user_id" id="user_id" readonly="readonly" value="${userinfo.user_id}" maxlength="50">
					</div>
					<div class="form-group">
						<label for="user_nickname">닉네임<span class="required">*</span></label>
						<input type="text" class="form-control col-sm-12" name="user_nickname" id="user_nickname" readonly="readonly" maxlength="100">
					</div>
					<div class="form-group">
						<label>생년월일<span class="required">*</span></label>
  						<div class="form-inline">
							<input type="text" class="form-control col-sm-2" id="year" maxlength="20"  readonly="readonly"><div style="margin:15px;">년</div>
							<input type="text" class="form-control col-sm-2" id="month" maxlength="20"  readonly="readonly"><div style="margin:15px;">월</div>
							<input type="text" class="form-control col-sm-2" id="day" maxlength="20"  readonly="readonly"><div style="margin:15px;">일</div>
                       	</div>
					</div>
					<div class="form-group">
					    <label for="user_sex">성별<span class="required">*</span></label>
					    <input type="text"  class="form-control col-sm-2" name="user_sex" id="user_sex" readonly="readonly">
					</div>
					<div class="form-group">
						<label>휴대폰 번호<span class="required">*</span></label>
						<div class="form-inline">
							<input type="text" class="form-control col-sm-2" id="user_phone1" maxlength="3"><div style="margin:15px;">-</div>
							<input type="text" class="form-control col-sm-2" id="user_phone2" maxlength="4"><div style="margin:15px;">-</div>
							<input type="text" class="form-control col-sm-2" id="user_phone3" maxlength="4">
							<input type="text" hidden="hidden" id="user_phone" name="user_phone">
						</div>
					</div>
					<div class="form-group">
						<label>주소<span class="required">*</span></label>
						<div class="row">
							<div class="col-sm">
							<input type="text" id="sample4_postcode" name="user_zipcode" class="form-control col-sm-3" placeholder="우편번호">
						</div>
					</div>
					<div class="row">
						<div class="col-sm">
							<input type="text" id="sample4_roadAddress" name="user_addr" class="form-control" placeholder="도로명주소" >
						</div>
					</div>
					<div class="row">
						<div class="col-sm">
							<input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" >
						</div>
					</div>
					<span id="guide" style="color:#999;display:none"></span>
						<div class="row">
							<div class="col-sm">
								<input type="text" id="sample4_detailAddress" name="user_addr_detail" class="form-control">
							</div>
							<div class="col-sm">
								<input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목" >
							</div>
						</div>
					</div>
					<c:if test="${user_id==userinfo.user_id}">
						<div class="row">
							<div class="col-4 pull-right">
								<button type="button" class="btn btn-primary pull-right no-margin-bottom no-margin-right" id="submitBtn">수정</button>
							</div>
						</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</div>

