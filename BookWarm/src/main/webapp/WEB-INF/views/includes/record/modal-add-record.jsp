<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 기록 쓰는 모달창 -->
<div id="modal-add-record" class="modal-add-record modal-record">
	<div class="row">
		<div class="post-content ">
			<div class="post-header form-header">
				<form id="submitloging" class="form-horizontal" >
					<div class="form-body">
						<input type="text" id="isbn" name="isbn" hidden='hidden' value="${bookVO.isbn}"><br />
						<input type="text" hidden='hidden' id="submit_start_date" name="start_date" value="">
						<input type="datetime-local" hidden='hidden' id="datetime" name="" value="">
						<div class="form-group form-inline">
							<div class="col-sm-4 special-heading word-underline-2">
								<span class="close">Record</span>
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="start_page" class="col-sm-4 control-label">Start Page</label>
							<div class="col-sm-8">
								<input type="number" id="start_page" class="col-sm-10 btn-outline-secondary" name="start_page">
							</div>
						</div>
													
						<div class="form-group form-inline">
							<label for="end_page" class="col-sm-4 control-label">End Page</label>
							<div class="col-sm-8">
								<input type="number" id="end_page" class="col-sm-10 btn-outline-secondary" name="end_page">
							</div>
						</div>
												
						<div class="form-group form-inline">
							<label for="start_date" class="col-sm-4 control-label">읽은 날</label>
							<div class="col-sm-8">
								<input type="date" id="start_date" class="col-sm-10 btn-outline-secondary" name="start_date">
							</div>
						</div>
													
						<div class="form-group form-inline">
							<label for="end_date" class="col-sm-4 control-label">완독여부</label>
							<div>
								<input type="checkbox" id="end_date" class="col-sm-10" name="end_date">
							</div>
						</div>
					</div>
					
					<div class="form-footer form-inline pull-right">
						<div class="form-inline">
						<button type="submit" class="close">Record</button>
						</div>
						<div class="col-sm-1"></div>
						<div class="cta-btn form-inline">
						<button type="button" class="modal-close close" >Close</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
