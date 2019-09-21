<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 기록 수정하는 모달창 -->
<div id="modal-modify-record" class="modal-modify-record modal-record">
	<div class="row">
		<div class="con">
			<div class="col-sm-15 v-blog-wrap">
				<div class="v-blog-items-wrap blog-standard">
					<ul class="v-blog-items row standard-items clearfix">
						<li class="v-blog-item col-sm-12">
							<div class="post-content no-thumb clearfix">
								<div class="post-header smart-wrap">

									<form id="submitModifyRecord" >
										<table style="margin-left: auto; margin-right: auto;">
											<tr>
												<!-- 여기에 write_no 불러와서 추가하기 -->
												<td><input type="text" id="modifyWrite_no" name="write_no" hidden='hidden' ><br /></td>
												<td><input type="text" id="modifyUser_id" name="user_id" hidden='hidden' ><br /></td>
											</tr>
											<tr>
												<td>start_page : <input type="number" id="modifyStart_page" name="start_page"><br /></td>
											</tr>
											<tr>
												<td>end_page : <input type="number" id="modifyEnd_page" name="end_page"><br /></td>
											</tr>
											<tr>
												<td>Reading_date : <input type="date" id="modifyStart_date" value=""><br />
												<input type="text" hidden='hidden' id="submit_start_date" name="start_date" value="">
												<input type="datetime-local" hidden='hidden' id="datetime" name="" value="">
												</td>
											</tr>
											<!-- 추후 date 선택시 오늘 날짜 초과는 입력불가 추가하기 -->
											<tr>
												<td>완독여부 : <input type="checkbox" id="modifyEnd_date" name="end_date"><br />
												</td>
											</tr>
											<tr>
												<td><button type="submit" class='close'>Re Record</button>
												</td>
											</tr>
										</table>
									</form>

									<script>
										// submit -> check start_page > end_page -> submit
										
									</script>

									<button type='button' class='modal-close close' >CLOSE</button>
									
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
