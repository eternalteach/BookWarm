<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 기록 보는 모달창 -->
<div class="post-header form-header">
	<h3> <span class="blog-author minor-meta"> Posted by 
		<span class="entry-author-link"> 
			<span class="vcard author">
				<span class="v-blog-item-details"> <a href="#" title="Posts by HB-Themes" rel="author">${user_id}</a></span>
			</span>
		</span>
	</span></h3>

	<div class="center" style="overflow:auto; width:340px; height:250px;">
		<!-- recordView는 JS로 처리 -->
		<div class="recordView"></div>
	</div>
	<div class="form-horizontal center">
		<br/>
		<button type="button" class="close col-sm-6" data-dismiss="modal">Close</button>
		<br/>
	</div>
</div>


