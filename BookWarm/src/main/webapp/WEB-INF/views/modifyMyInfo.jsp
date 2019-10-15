<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify My Info</title>
 	<%@ include file="./includes/header/header-vertexEx.jsp"%>
</head>
<body>
<div class="footer-wrap">
<%@ include file="./includes/header/header-topnav.jsp"%>
   <div role="main" class="main">
    <section class="page-header" style="padding-top:10px; padding-bottom:0px; margin-top:20px; margin-bottom:10px; border-bottom-color:transparent; background-color:transparent">
        <div class="container">
			<div class="row align-items-center">
				<div class="col-sm">
                     <ol class="bar-breadcrumb justify-content-start justify-content-md-end mb-0">
                        <li>내 정보</li>
                        <li>내 정보 수정</li>
                     </ol>
                  </div>
			</div>
		</div>
    </section>

    <div class="v-page-wrap has-one-sidebar">
        <div class="container">
            <div class="row">
				<div class="row col-lg-12">
					<div style="margin: 100px; margin-top:0px;">
						<%@ include file="./includes/content/register/readUserInfo.jsp" %>
					</div>
                </div>
               <%@ include file="./includes/content/userInfo/orderList-side-bar.jsp" %>
            </div>
        </div>
    </div>
</div>
</div>
   <%@ include file="./includes/header/script-vertexEx.jsp"%>
   <%@ include file="./includes/addressAPI/getAddress.jsp"%>
<script type="text/javascript" src="/warm/resources/js/admin.js"></script>
<script type="text/javascript" src="/warm/resources/js/DateJsonToJsp.js"></script>
<script>
$(document).ready(function(){
	// ajax로 회원 아이디 검사해서 있으면 모달로 띄워주고, 없으면 없다고 띄워주기
	let user_id=$("#user_id").val();
	adminService.getUser(user_id,function(result){
		$("#user_name").val(result.user_name);
		let user_mail1=result.user_mail.split('@')[0];
		$("#user_mail1").val(user_mail1);
		let user_mail2=result.user_mail.split('@')[1];
		$("#user_mail2").val(user_mail2);
		$("#user_id").val(result.user_id);
		//비밀번호는 어떻게할래? user_pw  user_pw
		$("#user_nickname").val(result.user_nickname);
		let userbday=displayTimeService.displayTime(result.user_bday);
		userbday=userbday.split('-');
		$("#year").val(userbday[0]);
		$("#month").val(userbday[1]);
		$("#day").val((userbday[2].substring(0,2)));
		let phoneNum=result.user_phone.split('-');
		$("#user_phone1").val(phoneNum[0]);
		$("#user_phone2").val(phoneNum[1]);
		$("#user_phone3").val(phoneNum[2]);
		let user_sex='';
		if(result.user_sex=='m'){
			user_sex='여자';
		}else{user_sex='남자';}
		$("#user_sex").val(user_sex);
		$("#sample4_postcode").val(result.user_zipcode);
		$("#sample4_roadAddress").val(result.user_addr);
		$("#sample4_detailAddress").val(result.user_addr_detail);
	});
	
	let submitBtn=$("#submitBtn");
	submitBtn.on("click",function(){
		let user_phone="";
		user_phone+=$("#user_phone1").val()+"-";
		user_phone+=$("#user_phone2").val()+"-";
		user_phone+=$("#user_phone3").val();
		
		$("#user_phone").val(user_phone);
		alert("수정되었습니다.");
		$("#form").submit();
	});
});
</script>
<%@ include file="includes/footer/footer-1.jsp"%>
</body>
</html>