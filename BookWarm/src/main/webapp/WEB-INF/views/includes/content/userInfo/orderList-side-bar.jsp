<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<aside class="sidebar right-sidebar col-sm-3">
	<section class="widget v-category-widget clearfix">
		<div class="widget-heading clearfix">
			<h4 class="v-heading">
				<span>Categories</span>
			</h4>
		</div>
		<ul>
			<li><a href="/warm/myInfo">내 정보</a></li>
			<li><a href="/warm/modifyMyInfo">내 정보 수정</a></li>
			<li><a href="/warm/orderList">나의 주문 내역</a></li>
			<li id="out"><a href="/warm/dropOut">탈퇴하기</a></li>
		</ul>
	</section>
</aside>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#out").on("click", function(e){
			if(confirm("탈퇴하시겠습니까?") == true){
	 			
				}else{
	 				e.preventDefault(e);
	 			}
		});
	});

</script>
