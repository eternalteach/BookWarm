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
    	
    	
    	$('#user_pw').on('keyup', function() {
	    	var pw = $('#user_pw').val();
	    	var pwConfirm = $('#pwConfirm').val();
    		chkPw(pw, pwConfirm);
    	})
    	
    	$('#pwConfirm').on('keyup', function() {
	    	var pw = $('#user_pw').val();
	    	var pwConfirm = $('#pwConfirm').val();
    		chkPw(pw, pwConfirm);
    	})
    	
    	
    	
    })
    
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
    
 	
    	
    
    </script>
    
    <!-- checkDuplicatedRegisterPage.jsp -->
    <script>
    	$(document).ready(function() {
    		
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
    			
    			if(user_name=="" || user_mail1=="" || user_mail2=="") {
    				alert("모든 폼을 작성해주세요.");
    			}else {
    				$(this).attr('type', 'submit');
    			}
    		})
    		
    	})
	</script>