<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% String path1 = request.getContextPath(); %>

<!-- 이메일 하나 당, 계정 하나 만들 수 있음 -->

<div id="container" class="v-bg-color">
    <div class="padding-100 body-sign">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">

                    <form class="v-signup v-register" action="<%=path1%>/register/checkDuplicated">
                    
                        <div class="form-group">
                            <h2 class="mb-2 mt-0"><strong>회원가입(중복 확인)</strong></h2>
                            <%-- <span style="color:red">${msg}</span> --%>
                            <input type="hidden" id="msg" value="${msg}">
                        </div>
                        
                        
                        <div class="form-group">
                            <label>이름<span class="required">*</span></label>
                            <input type="text" class="form-control" name="user_name" id="user_name" placeholder="name" maxlength="100">
                        </div>
                        <div class="form-group">
                            <label>이메일<span class="required">*</span></label>
                            <div class="row">
	                            <div class="col-sm-6"><input type="text" class="form-control" name="user_mail1" id="user_mail1" placeholder="E-mail" maxlength="50"></div>@
	                            <div class="col-sm-6"><input type="text" class="form-control" name="user_mail2" id="user_mail2" placeholder="select your email."></div>
	                            <div class="col-sm-5">
		                            <select id="selectEmail">
		                            	<option>선택</option>
		                            	<option value="naver.com">naver.com</option>
		                            	<option value="gmail.com">gmail.com</option>
		                            	<option value="hanmail.com">hanmail.net</option>
		                            	<option value="typeEmail">직접 입력하기</option>
		                            </select>
		                        </div>
                            </div>
                        </div>
                        
                        
                        <!-- 전송버튼 -->
                        <div class="row">
                            <div class="col-4 pull-right">
                                <button type="button" class="btn btn-primary pull-right no-margin-bottom no-margin-right" id="chkDuplicatedBtn">중복 확인</button>
                            </div>
                        </div>

                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</div>
