<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="./includes/header/header-vertexEx.jsp" %>
	<%@ include file="./includes/header/script-vertexEx.jsp" %>
</head>

<body>
	<%@ include file="./includes/addressAPI/getAddress.jsp" %>
	<%@ include file="./includes/content/register/registerPage.jsp" %>
	<script>
   $(document).ready(function() {
   	var dt = new Date();
   	var year = $('#year');
   	var month = $('#month');
   	var day = $('#day');
   	year.append('<option>년도</option>');
   	for(var i=1950; i<=dt.getFullYear(); i++){
   		year.append("<option value='"+i+"'>"+i+"</option>")
   	}
   	month.append('<option>월</option>');
   	for(var i=1; i<=12; i++){
   		month.append("<option value='"+i+"'>"+i+"</option>")
   	}
   	day.append('<option>일</option>');
   	for(var i=1; i<=31; i++){
   		day.append("<option value='"+i+"'>"+i+"</option>")
   	}
   	
   	$('#chkDuplicatedId').on('click', function() {
   		var user_id = $('#user_id').val();
   		
   		if(user_id==null) {
   			alert("아이디를 입력해주세요.")
   		}
   		
   	})
   	
   	var idExp = /^[a-z0-9_]{3,10}$/; // id 정규식(숫자&알파벳 대소문자&"_" 사용 가능, 4자리 이상 20자리 이하 )
   	var pwExp = /^[a-zA-Z0-9_]{8,16}$/; // pw 정규식(숫자&알파벳 대소문자&"_" 사용 가능, 4자리 이상 20자리 이하 )
   	
   	// 비밀번호 일치 여부 판단
   	$('#user_pw').on('keyup', function() {
    	var pw = $('#user_pw').val();
    	var pwConfirm = $('#pwConfirm').val();
    	var pwConfirmMsg = $('#pwConfirmMsg');
    	
   		// 비밀번호 형식 체크
   		if(!pwExp.test(pw)) {
   			pwConfirmMsg.text("숫자 또는 알파벳 대소문자 또는 '_'를 사용하여 8자리 이상 16자리 이하의 비밀번호를 입력해주세요.");
   			pwConfirmMsg.css("color", "red");
   		}else {
    		chkPw(pw, pwConfirm);
   		}
   	})
   	
   	$('#pwConfirm').on('keyup', function() {
    	var pw = $('#user_pw').val();
    	var pwConfirm = $('#pwConfirm').val();
    	var pwConfirmMsg = $('#pwConfirmMsg');
   		
   		// 비밀번호 형식 체크
   		if(!pwExp.test(pw)) {
   			pwConfirmMsg.text("숫자 또는 알파벳 대소문자 또는 '_'를 사용하여 8자리 이상 16자리 이하의 비밀번호를 입력해주세요.");
   			pwConfirmMsg.css("color", "red");
   		}else {
    		chkPw(pw, pwConfirm);
   		}
   	})
   	
   	
   	// 아이디 중복검사(ajax)
   	$('#user_id').on('blur', function() {
   		var user_id = $('#user_id').val();
   		var url = "/warm/register/idCheck?user_id=" + user_id;
   		var idConfirmMsg = $('#idConfirmMsg');
   		
   		// 아이디 형식 검사(4자리 이상, 20자리 이하)
   		if(idExp.test(user_id)) {
    		// 아이디 중복검사
    		chkDuplicated(url, idConfirmMsg, "아이디");
   		}else {
   			idConfirmMsg.text("숫자 또는 알파벳 소문자 또는 '_'를 사용하여 3자리 이상 10자리 이하의 아이디를 입력해주세요.");
   			idConfirmMsg.css("color", "red");
   		}
   	})
   	
   	// 닉네임 중복검사(ajax)
   	$('#user_nickname').on('blur', function(){
   		var user_nickname = $('#user_nickname').val();
   		var url = "/warm/register/nicknameCheck?user_nickname=" + user_nickname;
   		var nicknameConfirmMsg = $('#nicknameConfirmMsg');
   		chkDuplicated(url, nicknameConfirmMsg, "닉네임");
   	})
   	
   	// 전송 버튼 클릭시
	$('#submitBtn').on('click', function() {
		// 1. 메일 주소
		var mail = $('#user_mail').val();
		// 2. 생년월일 >> String으로 보내서 httpServletRequest로 받아야 한다.
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		var bday = year+"-"+month+"-"+day;
		$('#form').append("<input type='hidden' name='user_bday_string' value='"+bday+"'>");
		
		// 3. 폰번호
		var phone1 = $('#user_phone1').val();
		var phone2 = $('#user_phone2').val();
		var phone3 = $('#user_phone3').val();
		var phone = phone1+"-"+phone2+"-"+phone3;
		var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // 폰번호 정규식
		
		if(phoneExp.test(phone)) {
			$('#form').append("<input type='hidden' name='user_phone' value='"+phone+"'>");
		}
		
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
		var pwConfirm = $('#pwConfirm').val(); // 비번 확인
		var user_nickname = $('#user_nickname').val(); // 닉네임
		// bday; // 생일
		var user_sex_f = $('#user_sex_f'); // 성별_여
		var user_sex_m = $('#user_sex_m'); // 성별_남
		// phone; // 폰번호
		var sample4_postcode = $('#sample4_postcode').val(); // 우편번호
		var sample4_roadAddress = $('#sample4_roadAddress').val(); // 도로명주소
		// user_addr_detail; // 상세주소+참고항목
		var idConfirmMsg = $('#idConfirmMsg').html(); // id 중복 메세지("" : 중복X)
		var nicknameConfirmMsg = $('#nicknameConfirmMsg').html(); // nickname 중복 메세지("" : 중복X)
		
		if((user_name==""||mail==""||user_id==""||user_pw==""||user_nickname==""
				||year=="년도"||month=="월"||day=="일"||sample4_postcode==""
				||sample4_roadAddress==""||phone1==""||phone2==""||phone3=="")
				|| (user_sex_f.prop('checked')==false && user_sex_m.prop('checked') == false)
			) {
			// 하나라도 안 채워져 있는 경우
			alert("모든 폼을 작성해주세요.");
		} else if(idConfirmMsg!="") {
			// id 중복인 경우
			alert("다른 아이디를 등록해주세요.");
		} else if(user_pw!=pwConfirm) {
			// 비번 불일치
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
		} else if(nicknameConfirmMsg!="") {
			// nickname 중복인 경우
			alert("중복된 닉네임이 존재합니다. 다른 닉네임을 등록해주세요.");
		} else if(!phoneExp.test(phone)) {
			// 폰번호에 3-4-4 자리수로 넣지 않은 경우
			alert("휴대폰 번호를 잘못 입력했습니다. 다시 한번 확인해주세요.");
		} else {
			$(this).attr('type', 'submit');
		}
		alert("phone : "+phone);
	});
   });
   
   // 비번 일치 확인
   function chkPw(pw, pwConfirm) {
   	if(pw==pwConfirm) {
   		// 비번 == 비번확인
   		$('#pwConfirmMsg').html('<span>비밀번호가 일치합니다.</span>');
   		$('#pwConfirmMsg').attr('style', 'color:blue');
   	}else {
   		// 비번 != 비번확인
   		$('#pwConfirmMsg').html('<span>비밀번호가 일치하지 않습니다.</span>');
   		$('#pwConfirmMsg').attr('style', 'color:red');
   	}
   }
   
   // 아이디, 닉네임 중복확인
   function chkDuplicated(getUrl, location, msg) {
	$.ajax({
		url : getUrl,
		type : 'get',
		dataType : 'json',
		success : function(data) {
			console.log("1 = 중복 O / 0 = 중복 X : " + data);
			
			if(data==1) {
				// 1 : 아이디 중복
				// 메세지 띄운다.
				location.text("사용중인 "+msg+" 입니다.");
				location.css("color", "red");
				// 폼 다 채우고 가입 버튼 눌러도 다음으로 못 넘어가도록 만든다.
				// $('#submitBtn').attr("disabled", true);
			} else {
				// 0 : 아이디 중복 X
				// 메세지 띄우고, submit버튼 활성화
				location.text("");
				$('#submitBtn').attr("disabled", false);
			}
		}, error : function() {
			console.log("error!");
		}
	})
}
</script>
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>