<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 이메일 하나 당, 계정 하나 만들 수 있음 -->
<!-- 필수입력항목 입력 안 했을 때 다음으로 못 넘어가도록 만들어주기 -->
<div id="container" class="v-bg-color">
    <div class="body-sign">
        <div class="container">
            <div class="row">
						<!-- 회원정보 수정하는 주소로 action 보내기 -->
                    <form class="v-signup v-register" action="modifyUserInfo" method="post" id="form">
                        <div class="form-group">
                            <h2 class="mb-2 mt-0"><strong>회원 정보</strong></h2>
                        </div>
                        <div class="form-group">
                            <label>이름<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_name" id="user_name" maxlength="100" readonly> 
                        </div>
                        <div class="form-group">
                            <label>이메일<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-5"><input type="text" class="form-control" value="${user_mail1}" id="user_mail1" maxlength="50"  readonly></div>@
	                            <div class="col-sm-5"><input type="text" class="form-control" value="${user_mail2}" id="user_mail2"  readonly></div>
                            </div>
                        </div>
                        <!-- ------------------------------------------------------------------------------------------------------------ -->
                        <div class="form-group">
                            <label>아이디<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_id" id="user_id" readonly="readonly" maxlength="50">
                            <!-- 버튼 구현 x, 문자 뜨도록 만들꺼임 -->
                            <div class="row">
                                <div class="col-sm"><span id="idConfirmMsg"></span></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>닉네임<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_nickname" id="user_nickname" readonly="readonly" maxlength="100">
                            <div class="row">
                                <div class="col-sm"><span id="nicknameConfirmMsg"></span></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>생년월일<span class="required">*</span></label><!-- jquery로 년월일 넣어주기 -->
                            <div class="row form-inline">
	                            <div class="col-sm"><input type="text" class="form-control" id="year" maxlength="20"  readonly>년</div>
	                            <div class="col-sm"><input type="text" class="form-control" id="month" maxlength="20"  readonly>월</div>
	                            <div class="col-sm"><input type="text" class="form-control" id="day" maxlength="20"  readonly>일</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>성별<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-6"><input type="text"  class="form-control" name="user_sex" id="user_sex"readonly="readonly"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>휴대폰 번호<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-3"><input type="text" class="form-control" id="user_phone1" maxlength="3"readonly="readonly"></div>-
	                            <div class="col-sm-4"><input type="text" class="form-control" id="user_phone2" maxlength="4"readonly="readonly"></div>-
	                            <div class="col-sm-4"><input type="text" class="form-control" id="user_phone3" maxlength="4"readonly="readonly"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>주소<span class="required">*</span></label>
                           	<div class="row">
                           		<div class="col-sm">
                               	   <input type="text" id="sample4_postcode" name="user_zipcode" class="form-control" placeholder="우편번호" readonly>
                                </div>
                            </div>
                             
                             <div class="row">
                                <div class="col-sm">
                               		<input type="text" id="sample4_roadAddress" name="user_addr" class="form-control" placeholder="도로명주소" readonly>
                                </div>
                             </div>
                             
                             <div class="row">
                                <div class="col-sm">
                                   <input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" readonly>
                                </div>
                             </div>
                                
                                <span id="guide" style="color:#999;display:none"></span>
                                
                             <div class="row">
                                <div class="col-sm">
                                   <input type="text" id="sample4_detailAddress" class="form-control" readonly="readonly">
                                </div>

                                <div class="col-sm">
                                   <input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목" readonly>
                                </div>
                             </div>
                        </div>
                        <!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->
                        <!-- 전송버튼 -->
                        <div class="row">
                            <div class="col-4 pull-right">
                                <button type="button" class="btn btn-primary pull-right no-margin-bottom no-margin-right" id="submitBtn">수정</button>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>
