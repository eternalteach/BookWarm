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
								<div class="post-header">

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
												<td><button type="submit" class="button btn-primary">Re Record</button>
												</td>
											</tr>
										</table>
									</form>

									<script>
										// submit -> check start_page > end_page -> submit
										$(document).ready(function() {
															$('#submitModifyRecord').submit(
																			function(e) {
																				e.preventDefault();
																				var write_no = $("#modifyWrite_no").val();
																				var start_page = $("#modifyStart_page").val();
																				var end_page = $("#modifyEnd_page").val();
																				var start_date = $("#modifyStart_date").val();
																				var user_id = $("#modifyUser_id").val();
																				alert(user_id);
																				start_date += "T00:00:00.000+09:00";
																				$("#submit_start_date").val(start_date);
																				var end_date=$("#modifyEnd_date").prop("checked");
																				if (start_page > end_page) {
																					alert("시작 페이지는 종료 페이지보다 클 수 없습니다.");
																					return false;
																				}
																				
																				var logingVO={
																						write_no:write_no,
																						user_id:user_id,
																						start_page:start_page,
																						end_page:end_page,
																						start_date:start_date,
																						end_date:end_date
																				};
																				
																				recordService.update(logingVO,function(result){
																				console.log("update 안");
																					alert(result);
																					// showlist 해야한다.
																				});
																				
																				
																				$(".modal").fadeOut(300);
																				$(".modal-modify-record").fadeOut(300);
																				
																				$("#modifyWrite_no").val("");
																				$("#modifyStart_date").val("");
																				$("#modifyEnd_page").val("");
																				$("#modifyStart_page").val("");
																				$("#modifyEnd_date").prop("checked",false);
																			// modal-more-record 를 다시 호출하기
																			});
														});
									</script>

									<button type='button' class='modalClose'><a href="javascript:;" class="close">Close</a></button>
									
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
