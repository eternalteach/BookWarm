<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<% String path1 = request.getContextPath(); %>
<div class="wrapper">

      <div class="page body-sign">

         <div class="page-inner p-none no-border">

            <section class="section-big" style="background:url(/warm/resources/VertexEx/img/new/corinne-kutz.jpg);background-size:cover">

               <div class="container">
                  <div class="row">

                     <div class="col-md-6 offset-md-3">

                        <div class="smart-wrap">
                           <div class="smart-forms smart-container wrap-3">

                              <div class="form-header header-primary">
                                 <h4><i class="fa fa-sign-in"></i>Login</h4>
                              </div><!-- end .form-header section -->
                              <form method="post" action="login" id="contact">
                                 <div class="form-body">
									  <p style="color:red"><c:out value="${error}"/></p>
									  <p style="color:red"><c:out value="${logout}"/></p>

                                    <div class="section">
                                       <label class="field prepend-icon"> <!-- 아이디 입력하는 부분 -->
                                          <input type="text" name="username" id="username" class="gui-input" placeholder="Enter username" value="admin9">
                                          <span class="field-icon"><i class="fa fa-user"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section">
                                       <label class="field prepend-icon"> <!-- 비밀번호 입력하는 부분 -->
                                          <input type="password" name="password" id="user_pw" class="gui-input" placeholder="Enter password" value="123123123">
                                          <span class="field-icon"><i class="fa fa-lock"></i></span>
                                       </label>
                                    </div><!-- end section -->
                                    
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									
                                    <div class="section">
                                       <label class="switch block">
                                          <input type="checkbox" name="remember-me" id="remember-me" checked> <!-- null 또는 on값이 들어간다. -->
                                          <span class="switch-label" for="remember-me" data-on="YES" data-off="NO"></span>
                                          <span> 자동 로그인 </span>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end .form-body section -->
                                 <div class="form-footer">
                                    <button type="submit" class="button btn-primary btn-success">로그인</button>
                                    <a href="<%=path1 %>/register/checkDuplicateRegister"><button type="button" class="button btn-primary">회원가입</button></a>
                                 </div><!-- end .form-footer section -->
                              </form>
                           </div><!-- end .smart-forms section -->
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
      </div>
   </div>
   
 <script>
 	
/*  $(".btn-success").on("click", function(e) {
	e.preventDefault();
	$("#contact").submit();
 }); */ 
 </script>
