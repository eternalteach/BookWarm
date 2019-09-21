<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 기록 보는 모달창 -->
<div id="modal-more-record" class="modal-more-record modal-record" >
	<div class="row">
		<div class="con">
			<div class="col-sm-15 v-blog-wrap">
				<div class="v-blog-items-wrap blog-standard">
					<ul class="v-blog-items row standard-items clearfix">
						<li class="v-blog-item col-sm-12">
							<div class="post-content no-thumb clearfix" >
								<div class="post-header"style="overflow:auto; width:370px; height:250px;">
									<span class="blog-author minor-meta"> Posted by 
										<span class="entry-author-link"> 
											<span class="vcard author">
												<span class="v-blog-item-details"> <a href="#" title="Posts by HB-Themes" rel="author">${user_id}</a></span>
											</span>
										</span>
									</span>
									<!-- recordView는 JS로 처리 -->
									<br/>
									<br/>
									<div class="recordView"></div>
									<br />
									<br />
									<button type='button' class='modal-close'>
										<a href="javascript:;" class="close">Close</a>
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
