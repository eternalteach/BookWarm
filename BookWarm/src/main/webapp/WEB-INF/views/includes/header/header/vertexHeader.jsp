<%@page import="com.book.warm.service.RegisterService"%>
<% String path = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="utf-8">
    <title>Venue - Responsive HTML5 Template</title>
    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Venue - Responsive HTML5 Template">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" type="image/png" href="img/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Web Fonts  -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600" rel="stylesheet">

    <!-- Libs CSS -->
    <link href="<%=path %>/resources/Vertex/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/style.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/font-awesome.min.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/streamline-icon.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/header.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/portfolio.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/blog.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/v-animation.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/v-bg-stylish.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/font-icons.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/shortcodes.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/utilities.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/css/theme-responsive.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/plugins/aos/aos.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/plugins/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="<%=path %>/resources/Vertex/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" />

    <!-- Skin -->
    <link rel="stylesheet" href="<%=path %>/resources/Vertex/css/skin/default.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=path %>/resources/Vertex/css/custom.css">
    
    <!-- Libs -->
    <script src="<%=path %>/resources/Vertex/js/jquery.min.js"></script>
    <script src="<%=path %>/resources/Vertex/js/popper.js"></script>
    <script src="<%=path %>/resources/Vertex/js/bootstrap.min.js"></script>
    <script src="<%=path %>/resources/Vertex/js/jquery.flexslider-min.js"></script>
    <script src="<%=path %>/resources/Vertex/js/jquery.easing.js"></script>
    <script src="<%=path %>/resources/Vertex/js/jquery.fitvids.js"></script>
    <script src="<%=path %>/resources/Vertex/js/jquery.carouFredSel.min.js"></script>
    <script src="<%=path %>/resources/Vertex/js/jquery.validate.js"></script>
    <script src="<%=path %>/resources/Vertex/js/theme-plugins.js"></script>
    <script src="<%=path %>/resources/Vertex/js/jquery.isotope.min.js"></script>
    <script src="<%=path %>/resources/Vertex/js/imagesloaded.js"></script>
    <script src="<%=path %>/resources/Vertex/js/view.min.js?auto"></script>
    <script src="<%=path %>/resources/Vertex/plugins/aos/aos.js"></script>

    <script src="<%=path %>/resources/Vertex/js/theme-core.js"></script>
    <script src="<%=path %>/resources/Vertex/js/theme.js"></script>
    <script src="<%=path %>/resources/Vertex/js/theme.init.js"></script>
    
    
    <!-- registerPage.jsp에서 사용하는 스크립트 -->
    <!-- 다음 주소 api 따오기 위한 script -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    // 다음 주소 api
  	// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // data는 사용자가 선택한 주소 정보를 담고 있는 객체.
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr  + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
  
  	
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
    	
    	var idExp = /^[a-zA-Z0-9_]{3,10}$/; // id 정규식(숫자&알파벳 대소문자&"_" 사용 가능, 4자리 이상 20자리 이하 )
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
    		var url = "<%=path%>/register/idCheck?user_id=" + user_id;
    		var idConfirmMsg = $('#idConfirmMsg');
    		
    		// 아이디 형식 검사(4자리 이상, 20자리 이하)
    		if(idExp.test(user_id)) {
	    		// 아이디 중복검사
	    		chkDuplicated(url, idConfirmMsg, "아이디");
    		}else {
    			idConfirmMsg.text("숫자 또는 알파벳 대소문자 또는 '_'를 사용하여 3자리 이상 10자리 이하의 아이디를 입력해주세요.");
    			idConfirmMsg.css("color", "red");
    		}
    	})
    	
    	// 닉네임 중복검사(ajax)
    	$('#user_nickname').on('blur', function(){
    		var user_nickname = $('#user_nickname').val();
    		var url = "<%=path%>/register/nicknameCheck?user_nickname=" + user_nickname;
    		var nicknameConfirmMsg = $('#nicknameConfirmMsg');
    		chkDuplicated(url, nicknameConfirmMsg, "닉네임");
    	})
    	
    	
    	
    	
    	
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
				alert("중복된 아이디가 존재합니다. 다른 아이디를 등록해주세요.");
			} else if(user_pw!=pwConfirm) {
				// 비번 불일치
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
			} else if(nicknameConfirmMsg!="") {
				// nickname 중복인 경우
				alert("중복된 닉네임이 존재합니다. 다른 닉네임을 등록해주세요.");
			} else if(!phoneExp.test(phone)) {
				// 폰번호에 3-4-4 자리수로 넣지 않은 경우
				alert(phone);
				alert("휴대폰 번호를 잘못 입력했습니다. 다시 한번 확인해주세요.");
			} else {
				$(this).attr('type', 'submit');
			}
		
		})
    	
    })
    
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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- checkDuplicatedRegisterPage.jsp -->
    <script>
    	$(document).ready(function() {
    		
    		// 중복메세지 받아오기
    		var message = $('#msg');
    		if(message.val()=='true') {
    			alert("id, pw가 이미 존재하는 유저입니다.");
    		}
    		
    		// 이메일 선택
    		$('#selectEmail').on('click', function() {
    			var selected = $(this).val();
    			var user_mail2 = $('#user_mail2');
    			
    			if(selected=="선택") {
    				// 선택창 아직 선택하기 이전 >> 입력창 비우기
    				user_mail2.val('');
    			}else if(selected=="typeEmail"){
    				// 직접 입력하기 선택 >> 입력창 비우기
    				user_mail2.val('');
    				user_mail2.attr('placeholder', 'type your email here!')
    			}else {
    				// 네이버, 구글, 다음 주소 선택 >> input창에 넣어주기
    				user_mail2.val(selected);
    			}
    		})
    		
    		// 전송 버튼 클릭시 >> 모든 창 안 채워져있으면 경고창
    		$('#chkDuplicatedBtn').on('click', function() {
    			var user_name = $('#user_name').val();
    			var user_mail1 = $('#user_mail1').val();
    			var user_mail2 = $('#user_mail2').val();
    			var mail = user_mail1+"@"+user_mail2;
    			
    			var mailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    			
    			if(user_name=="" || user_mail1=="" || user_mail2=="") {
    				alert("모든 폼을 작성해주세요.");
    			}else if(user_mail2.split('.').length!=2 || !mailExp.test(mail)) {
	    			// 이메일 직접 입력하기 선택시 경고창
	    			// 1. @뒷부분에 ooo.ooo 형태로 안 되어있는경우
	    			// 2. 특문 들어간 경우
	    			// 3. 한글 들어간 경우
    				alert("이메일 주소의 형식이 잘못 되었습니다.");
    			}else {
    				$(this).attr('type', 'submit');
    			}
    			
    			
    		})
    		
    	})
	</script>