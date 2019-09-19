<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 기록 쓰는 모달창 -->
<div id="modal-add-record" class="modal-add-record modal-record">
	<div class="row">
		<div class="con">
			<div class="col-sm-15 v-blog-wrap">
				<div class="v-blog-items-wrap blog-standard">
					<ul class="v-blog-items row standard-items clearfix">
						<li class="v-blog-item col-sm-12">
							<div class="post-content no-thumb clearfix">
								<div class="post-header">

									<form id="submitloging" >
										<table style="margin-left: auto; margin-right: auto;">
											<tr>
												<td><input type="text" id="isbn" name="isbn" hidden='hidden' value="${bookVO.isbn}"><br /></td>
											</tr>
											<tr>
												<td>start_page : <input type="number" id="start_page" name="start_page"><br /></td>
											</tr>
											<tr>
												<td>end_page : <input type="number" id="end_page" name="end_page"><br /></td>
											</tr>
											<tr>
												<td>Reading_date : <input type="date" id="start_date" value=""><br />
												<input type="text" hidden='hidden' id="submit_start_date" name="start_date" value="">
												<input type="datetime-local" hidden='hidden' id="datetime" name="" value="">
												</td>
											</tr>
											<!-- 추후 date 선택시 오늘 날짜 초과는 입력불가 추가하기 -->
											<tr>
												<td>완독여부 : <input type="checkbox" id="end_date" name="end_date"><br />
												</td>
											</tr>
											<tr>
												<td><button type="submit" class="button btn-primary">Record</button>
												</td>
											</tr>
										</table>
									</form>

									<script>
										// submit -> check start_page > end_page -> submit
										$(document).ready(function() {
															$('#submitloging').submit(
																			function(e) {
																				e.preventDefault();
																				var isbn = $("#isbn").val();
																				var start_page = $("#start_page").val();
																				var end_page = $("#end_page").val();
																				var start_date = $("#start_date").val();
																				var datetime = $("#datetime")
																				var end_date=$("#end_date").prop("checked");
																				start_date += "T00:00:00.000+09:00";
																				$("#submit_start_date").val(start_date);
																				alert("start_date3" + $("#submit_start_date").val());
																				
																				if (start_page > end_page) {
																					alert("시작 페이지는 종료 페이지보다 클 수 없습니다.");
																					return false;
																				}
																				
																				var logingVO={
																						isbn:isbn,
																						start_page:start_page,
																						end_page:end_page,
																						start_date:start_date,
																						end_date:end_date
																				};
																				
																				recordService.add(logingVO,function(result){
																					alert(result);
																					// showlist 해야한다.
																				});
																				// modal-add-record 숨기기
																				$(".modal-add-record").hide();
																				$("#isbn").val("");
																				$("#start_page").val("");
																				$("#end_page").val("");
																				$("#start_date").val("");
																				$("#end_date").prop("checked",false);
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
