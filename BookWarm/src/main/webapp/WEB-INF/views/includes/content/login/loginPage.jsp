<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                              <div class="form-header header-primary">
                                 <h4><i class="fa fa-sign-in"></i>Login</h4>
                              </div><!-- end .form-header section -->
                              <form method="post" action="login" id="contact">
                                 <div class="form-body">
									  <p style="color:red"><c:out value="${error}"/></p>
									  <p style="color:red"><c:out value="${logout}"/></p>
                                    <div class="section">
                                       <label class="field prepend-icon"> <!-- 아이디 입력하는 부분 -->
                                          <span class="field-icon col-sm-2"><i class="fa fa-user"></i></span>
                                          <input type="text" name="username" id="username" class="gui-input col-sm-8" placeholder="Enter username" value="admin9">
                                       </label>
                                    </div><!-- end section -->
                                    <div class="section">
                                       <label class="field prepend-icon"> <!-- 비밀번호 입력하는 부분 -->
                                          <span class="field-icon col-sm-2"><i class="fa fa-lock"></i></span>
                                          <input type="password" name="password" id="user_pw" class="gui-input col-sm-8" placeholder="Enter password" value="123123123">
                                       </label>
                                    </div><!-- end section -->
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="section">
                                       <label class="switch block">
                                         <span class="col-sm-2"> <input type="checkbox" name="remember-me" id="remember-me" checked></span> <!-- null 또는 on값이 들어간다. -->
                                          <span class="switch-label" for="remember-me" data-on="YES" data-off="NO"></span>
                                          <span> Remember </span>
                                       </label>
                                    </div><!-- end section -->
                                 </div><!-- end .form-body section -->
                                 <div class="form-footer center">
                                    <button type="submit" class="button btn-sm btn-outline-secondary">Login</button>
                                    <a href="/warm/register/checkDuplicateRegister"><button type="button" class="button btn-sm btn-outline-secondary">Register</button></a>
                                 </div><!-- end .form-footer section -->
                              </form>
