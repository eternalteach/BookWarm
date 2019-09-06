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
                                 <span style="color:red">${msg}</span>
                              </div><!-- end .form-header section -->

                              <form method="post" action="/warm/loginAction" id="contact">
                                 <div class="form-body">

                                    <div class="section">
                                       <label class="field prepend-icon"> <!-- 아이디 입력하는 부분 -->
                                          <input type="text" name="user_id" id="user_id" class="gui-input" placeholder="Enter username">
                                          <span class="field-icon"><i class="fa fa-user"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section">
                                       <label class="field prepend-icon"> <!-- 비밀번호 입력하는 부분 -->
                                          <input type="password" name="user_pw" id="user_pw" class="gui-input" placeholder="Enter password">
                                          <span class="field-icon"><i class="fa fa-lock"></i></span>
                                       </label>
                                    </div><!-- end section -->

                                    <div class="section">
                                       <label class="switch block">
                                          <input type="checkbox" name="remember" id="remember" checked> <!-- null 또는 on값이 들어간다. -->
                                          <span class="switch-label" for="remember" data-on="YES" data-off="NO"></span>
                                          <span> 자동 로그인 </span>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end .form-body section -->
                                 <div class="form-footer">
                                    <button type="submit" class="button btn-primary">로그인</button>
                                    <a href="<%=path1 %>/checkDuplicateRegister"><button type="button" class="button btn-primary">회원가입</button></a>
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
