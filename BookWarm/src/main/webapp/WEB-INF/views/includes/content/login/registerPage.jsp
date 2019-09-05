<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="container" class="v-bg-color">
    <div class="padding-100 body-sign">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">

                    <form class="v-signup v-register">
                        <div class="form-group">
                            <span>DON'T HAVE AN ACCOUNT?</span>
                            <h2 class="mb-2 mt-0">회원가입</h2>
                        </div>
                        <div class="form-group">
                            <label>Name <span class="required">*</span></label>
                            <input type="text" value="" placeholder="Name" maxlength="100" class="form-control" name="name" id="name">
                        </div>
                        <div class="form-group">
                            <label>E-mail Address <span class="required">*</span></label>
                            <input type="text" value="" placeholder="E-mail Address" maxlength="100" class="form-control" name="website" id="website">
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>Password</label>
                                    <input name="pwd" type="password" placeholder="Password" class="form-control input-lg">
                                </div>
                                <div class="col-sm-6">
                                    <label>Confirm Password</label>
                                    <input name="pwd_confirm" placeholder="Confirm Password" type="password" class="form-control input-lg">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8">
                                <div class="checkbox-custom checkbox-default">
                                    <input id="RememberMe" name="rememberme" type="checkbox">
                                    <label for="AgreeTerms">I agree with <a class="v-link" href="#">terms of use</a></label>
                                </div>
                            </div>
                            <div class="col-4 pull-right">
                                <button type="submit" class="btn btn-primary pull-right no-margin-bottom no-margin-right">Sign In</button>
                            </div>
                        </div>

                        <span class="line-thru text-center text-uppercase pull-bottom-small pull-top-small">
                            <span>or</span>
                        </span>

                        <div class="mb-xs text-center">
                            <a class="btn btn-facebook">Connect <i class="fa fa-facebook ml-1"></i></a>
                            <a class="btn btn-twitter">Connect <i class="fa fa-twitter ml-1"></i></a>
                        </div>

                        <p class="text-center pull-top-small">
                            Don't have an account yet? <a class="v-link" href="#">Sign Up!</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    
</div>
