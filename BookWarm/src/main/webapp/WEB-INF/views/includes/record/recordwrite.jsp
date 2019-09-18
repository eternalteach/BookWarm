<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br />
<br />
<br />
<br />
<br />

<form method="post" id="submitloging" action="recordWriteSave">
	<table style="margin-left:auto; margin-right:auto;">
		<tr>
			<td><input type="text" name="isbn" hidden='hidden' value="${bookVO.isbn}"><br /></td>&nbsp;책 이미지 넣기
		</tr>
		<tr>
			<td>start_page : <input type="number" id="start_page" name="start_page"><br /></td>
		</tr>
		<tr>
			<td>end_page : <input type="number"  id="end_page" name="end_page" ><br /></td>
		</tr>
		<tr>
			<td>Reading_date : <input type="date" id="start_date" value=""><br />
			</td>
			<td>Reading_date : <input type="text" hidden = 'hidden' id="submit_start_date" name="start_date" value=""><br />
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
$(document).ready(function(){
	$('#submitloging').submit(function(){
		var start_page=$('#start_page').val();
		var end_page=$('#end_page').val();
		var start_date=$("#start_date").val();
		alert("start_date1" + start_date);
		start_date+=" 00:00:00";
		alert("start_date2" + start_date);
		$("#submit_start_date").val(start_date);
		alert("start_date3" + $("#submit_start_date").val());
		if(start_page>end_page){
			alert("시작 페이지는 종료 페이지보다 클 수 없습니다.");
			return false;
			}
		return true;
	});
});
</script>