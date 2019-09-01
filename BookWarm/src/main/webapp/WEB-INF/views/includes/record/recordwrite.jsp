<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<form method="post" action="boardLogWriteSave">
	isbn : <input type="text" name="isbn" value="1"><br/>
	start_page : <input type="text" name="start_page" value="1"><br/>
	end_page : <input type="text" name="end_page" value="2"><br/>
	start_date :  <input type="date" min="2000-01-01" max="2030-12-31" name="start_date" value=""><br/>  <!-- 추후 date 선택시 오늘 날짜 초과는 입력불가 추가하기 -->
	완독일 : <input type="checkbox" name="end_date" ><br/>
	<button type="submit" class="button btn-primary">Record</button>
	</form>