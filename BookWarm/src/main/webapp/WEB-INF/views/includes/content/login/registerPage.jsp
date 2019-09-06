<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 이메일 하나 당, 계정 하나 만들 수 있음 -->
<!-- 필수입력항목 입력 안 했을 때 다음으로 못 넘어가도록 만들어주기 -->
<% String path1 = request.getContextPath(); %>
<div id="container" class="v-bg-color">
    <div class="padding-100 body-sign">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">

                    <form class="v-signup v-register" action="<%=path1 %>/registerSuccess" method="post" id="form">
                        <div class="form-group">
                            <h2 class="mb-2 mt-0"><strong>회원가입</strong></h2>
                        </div>
                        
                        
                        <div class="form-group">
                            <label>이름<span class="required">*</span></label>
                            <input type="text" class="form-control" value="${user_name}" name="user_name" id="user_name" maxlength="100" readonly>
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
                            <input type="text" class="form-control" name="user_id" id="user_id" placeholder="ID" maxlength="50">
                            <!-- 아이디 중복 확인 버튼 구현하기 -->
                            <button type="button" id="chkDuplicatedId">중복 확인</button>
                        </div>
                        
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
                            <!-- 닉네임 중복 확인 버튼 추가하기 -->
                        </div>
                        <div class="form-group">
                            <label>생년월일<span class="required">*</span></label><!-- jquery로 년월일 넣어주기 -->
                            <div class="row">
	                            <div class="col-sm"><select id="year"></select>년</div>
	                            <div class="col-sm"><select id="month"></select>월</div>
	                            <div class="col-sm"><select id="day"></select>일</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>성별<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-6"><input type="radio" name="user_sex" id="user_sex_f" value="f">여자</div>
	                            <div class="col-sm-6"><input type="radio" name="user_sex" id="user_sex_m" value="m">남자</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>휴대폰 번호<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-3"><input type="text" class="form-control" id="user_phone1" maxlength="3"></div>-
	                            <div class="col-sm-4"><input type="text" class="form-control" id="user_phone2" maxlength="4"></div>-
	                            <div class="col-sm-4"><input type="text" class="form-control" id="user_phone3" maxlength="4"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>주소<span class="required">*</span></label>
                           	<div class="row">
                           		<div class="col-sm">
                               	   <input type="text" id="sample4_postcode" name="user_zipcode" class="form-control" placeholder="우편번호">
                                </div>
                                <div class="col-sm">
                                	<input type="button" class="btn btn-primary pull-right no-margin-bottom no-margin-right" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                               	</div>
                            </div>
                             
                             <div class="row">
                                <div class="col-sm">
                               		<input type="text" id="sample4_roadAddress" name="user_addr" class="form-control" placeholder="도로명주소">
                                </div>
                             </div>
                             
                             <div class="row">
                                <div class="col-sm">
                                   <input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소">
                                </div>
                             </div>
                                
                                <span id="guide" style="color:#999;display:none"></span>
                                
                             <div class="row">
                                <div class="col-sm">
                                   <input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소">
                                </div>

                                <div class="col-sm">
                                   <input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목">
                                </div>
                             </div>
                        </div>
                        
                        <!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->
                        <!-- 전송버튼 -->
                        <div class="row">
                            <div class="col-4 pull-right">
                                <button type="button" class="btn btn-primary pull-right no-margin-bottom no-margin-right" id="submitBtn">가입</button>
                            </div>
                        </div>

                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</div>

<script>
	$(document).ready(function() {
		// 전송 버튼 클릭시
		$('#submitBtn').on('click', function() {
			// 1. 메일 주소
			var mail1 = $('#user_mail1').val();
			var mail2 = $('#user_mail2').val();
			var mail = mail1 + "@" + mail2;
			
			$('#form').append("<input type='hidden' name='user_mail' value='"+mail+"'>");
			
			
			// 2. 생년월일 >> String으로 보내서 httpServletRequest로 받아야 한다.
			var year = $('#year').val();
			var month = $('#month').val();
			var day = $('#day').val();
			var bday = year+"-"+month+"-"+day;
			$('#form').append("<input type='hidden' name='user_bday' value='"+bday+"'>");
			
			
			// 3. 폰번호
			var phone1 = $('#user_phone1').val();
			var phone2 = $('#user_phone2').val();
			var phone3 = $('#user_phone3').val();
			var phone = phone1+"-"+phone2+"-"+phone3;
			
			$('#form').append("<input type='hidden' name='user_phone' value='"+phone+"'>");
			
			
			// 4. 주소(상세주소+참고항목)
			var detailAddr = $('#sample4_detailAddress').val(); // 상세주소
			var cfAddr =  $('#sample4_extraAddress').val(); // 참고항목
			var user_addr_detail = detailAddr+cfAddr;
			$('#form').append("<input type='hidden' name='user_addr_detail' value='"+user_addr_detail+"'>");
			
			
		 	// 모든 창 안 채워져있으면 경고창
			var user_name = $('#user_name').val(); // 이름
		 	// mail; // 이메일
			var user_id = $('#user_id').val(); // 아이디
			var user_pw = $('#user_pw').val(); // 비번
			var user_nickname = $('#user_nickname').val(); // 닉네임
			// bday; // 생일
			var user_sex_f = $('#user_sex_f'); // 성별_여
			var user_sex_m = $('#user_sex_m'); // 성별_남
			// phone; // 폰번호
			var sample4_postcode = $('#sample4_postcode').val(); // 우편번호
			var sample4_roadAddress = $('#sample4_roadAddress').val(); // 도로명주소
			// user_addr_detail; // 상세주소+참고항목
			
			if((user_name==""||mail==""||user_id==""||user_pw==""||user_nickname==""||bday==""
					||sample4_postcode==""||sample4_roadAddress==""||user_addr_detail=="")
					|| (user_sex_f.prop('checked')==false && user_sex_m.prop('checked') == false) 
					) {
				// 하나라도 안 채워져 있는 경우
				alert("모든 폼을 작성해주세요.");
			}else {
				alert("good.");
				$(this).attr('type', 'submit');
			}
		
		})
	})
	
</script>
