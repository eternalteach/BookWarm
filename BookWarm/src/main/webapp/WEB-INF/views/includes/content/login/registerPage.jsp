<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 이메일 하나 당, 계정 하나 만들 수 있음 -->

<div id="container" class="v-bg-color">
    <div class="padding-100 body-sign">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">

                    <form class="v-signup v-register" action="">
                        <div class="form-group">
                            <h2 class="mb-2 mt-0"><strong>회원가입</strong></h2>
                        </div>
                        
                        
                        <div class="form-group">
                            <label>이름<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_name" placeholder="name" maxlength="100">
                        </div>
                        <div class="form-group">
                            <label>이메일<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-6"><input type="text" class="form-control" name="user_mail" placeholder="E-mail" maxlength="50"></div>@
	                            <div class="col-sm-5">
		                            <select name="user_mail">
		                            	<option>naver.com</option>
		                            	<option>gmail.com</option>
		                            	<option>hanmail.net</option>
		                            	<option>직접 입력하기</option>
		                            </select>
		                        </div>
                            </div>
                        </div>
                        <!-- ------------------------------------------------------------------------------------------------------------ -->
                        <div class="form-group">
                            <label>아이디<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_id" placeholder="ID" maxlength="50">
                            <!-- 아이디 중복 확인 버튼 추가하기 -->
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>비밀번호<span class="required">*</span></label>
                                    <input type="password" class="form-control input-lg" name="user_pw" id="pw" placeholder="Password" maxlength="100">
                                </div>
                                <div class="col-sm-6">
                                    <label>비밀번호 확인<span class="required">*</span></label>
                                    <input type="password" class="form-control input-lg" id="pwConfirm" placeholder="Confirm Password" maxlength="100">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control" name="user_nickname" placeholder="nickname" maxlength="100">
                            <!-- 닉네임 중복 확인 버튼 추가하기 -->
                        </div>
                        <div class="form-group">
                            <label>생년월일<span class="required">*</span></label><!-- jquery로 년월일 넣어주기 -->
                            <div class="row">
	                            <div class="col-sm"><select name="user_bday_year" id="year"></select>년</div>
	                            <div class="col-sm"><select name="user_bday_month" id="month"></select>월</div>
	                            <div class="col-sm"><select name="user_bday_day" id="day"></select>일</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>성별<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-6"><input type="radio" name="user_sex" value="f">여자</div>
	                            <div class="col-sm-6"><input type="radio" name="user_sex" value="m">남자</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>휴대폰 번호<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-3"><input type="text" class="form-control" name="user_phone1" maxlength="3"></div>-
	                            <div class="col-sm-4"><input type="text" class="form-control" name="user_phone2" maxlength="4"></div>-
	                            <div class="col-sm-4"><input type="text" class="form-control" name="user_phone3" maxlength="4"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>주소<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_name" placeholder="E-mail Address" maxlength="100">
                            <div class="section colm colm8">
                                   		<label class="field prepend-icon">
                                    	   <input type="text" id="sample4_postcode" class="gui-input" placeholder="우편번호">
	                                       <span class="field-icon"><i class="fa fa-building-o"></i></span>
	                                    </label>
                                    </div>
                                    <div class="section colm colm4">
	                                    <label class="field prepend-icon">
	                                    	<span class="field-icon"><i class="fa fa-map-marker"></i></span>
	                                    	<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	                                    </label>
                                   	</div>
	                             </div>
	                             <div class="frm-row">
                                    <div class="section colm colm6">
                                       		<input type="text" id="sample4_roadAddress" class="gui-input" placeholder="도로명주소">
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_jibunAddress" class="gui-input" placeholder="지번주소">
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                                 <span id="guide" style="color:#999;display:none"></span>
	                             <div class="frm-row">
                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_detailAddress" class="gui-input" placeholder="상세주소">
                                    </div><!-- end section -->

                                    <div class="section colm colm6">
                                       <input type="text" id="sample4_extraAddress" class="gui-input" placeholder="참고항목">
                                    </div><!-- end section -->
                                 </div><!-- end frm-row section -->
                        </div>
                        
                        <!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->
                        <!-- 전송버튼 -->
                        <div class="row">
                            <div class="col-4 pull-right">
                                <button type="submit" class="btn btn-primary pull-right no-margin-bottom no-margin-right">가입</button>
                            </div>
                        </div>

                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</div>
