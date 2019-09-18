<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
<form method="post" id="submitloging" action="recordModifySave">
	<input type="text" name="write_no" value="${willModifyLoging.write_no}" hidden="hidden">
	<table style="margin-left:auto; margin-right:auto;">
		<tr>
			<td>isbn : <input type="text" name="isbn" value="${willModifyLoging.isbn}"><br /></td>
		</tr>
		<tr>
			<td>start_page : <input type="number" id="start_page" name="start_page" value="${willModifyLoging.start_page}"><br /></td>
		</tr>
		<tr>
			<td>end_page : <input type="number"  id="end_page" name="end_page" value="${willModifyLoging.end_page}"><br /></td>
		</tr>
		<fmt:parseDate value="${willModifyLoging.start_date}" var="start_date" pattern="yyyy-MM-dd HH:mm:ss"/>
		<tr>
			<td>Reading_date : <input type="date" min="2000-01-01"
				max="2030-12-31" name="start_date" value="<fmt:formatDate value="${start_date}" pattern="yyyy-MM-dd"/>"><br />
			</td>
		</tr>
		<!-- 추후 date 선택시 오늘 날짜 초과는 입력불가 추가하기 -->
		<tr>
			<td> 완독여부 : <input type="checkbox" name="end_date" ${willModifyLoging.end_date} ></td>
		</tr>
		<tr>
			<td><button type="submit" class="button btn-primary">Re Record</button>
	<a href="recordDelete?write_no=${willModifyLoging.write_no}"><button type="button" class="button btn-primary">Delete</button></a>	
			</td>
		</tr>
	</table>
<input type='hidden' name='modalOpen' value='<c:out value="open"/>'>
<input type='hidden' name='pageNum' value='<c:out value="${criteria.pageNum}"/>'>
<input type='hidden' name='amount' value='<c:out value="${criteria.amount}"/>'>
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