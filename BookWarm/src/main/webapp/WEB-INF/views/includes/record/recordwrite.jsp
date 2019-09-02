<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br />
<br />
<br />
<br />
<br />
<form method="post" id="submitloging" action="boardLogWriteSave">
	<table style="margin-left:auto; margin-right:auto;">
		<tr>
			<td>isbn : <input type="text" name="isbn" value="${bookCoverVO.isbn}"><br /></td>&nbsp;책 이미지 넣기
		</tr>
		<tr>
			<td>start_page : <input type="number" id="start_page" name="start_page" value="1"><br /></td>
		</tr>
		<tr>
			<td>end_page : <input type="number"  id="end_page" name="end_page" value="2"><br /></td>
		</tr>
		<tr>
			<td>Reading_date : <input type="date" min="2000-01-01"
				max="2030-12-31" name="start_date" value=""><br />
			</td>
		</tr>
		<!-- 추후 date 선택시 오늘 날짜 초과는 입력불가 추가하기 -->
		<tr>
			<td>완독일 : <input type="checkbox" name="end_date"><br />
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
		if(start_page>end_page){
			alert("시작 페이지는 종료 페이지보다 클 수 없습니다.");
			return false;
			}
		return true;
	});
});
</script>