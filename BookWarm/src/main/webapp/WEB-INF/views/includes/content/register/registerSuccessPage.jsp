<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

계정 만들기 성공!<br><br>
아이디 : ${userVO.user_id}<br>
비밀번호 : ${userVO.user_pw}<br>
이름 : ${userVO.user_name}<br>
이메일 : ${userVO.user_mail}<br>
닉네임 : ${userVO.user_nickname}<br>
생일 : ${userVO.user_bday}<br>
성별 : ${userVO.user_sex}<br>
전화번호 : ${userVO.user_phone}<br>
우편번호 : ${userVO.user_zipcode}<br>
주소 : ${userVO.user_addr}<br>
상세주소 : ${userVO.user_addr_detail}<br>
		


<a href="/warm/index">로그인 하러 가기</a><br><br>
