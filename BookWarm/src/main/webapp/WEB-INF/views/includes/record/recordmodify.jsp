<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<form method="post" action="boardLogModifySave">
	isbn : <input type="text" name="isbn" value="${willModifyLoging.isbn}"><br/>
	start_page : <input type="text" name="start_page" value="${willModifyLoging.start_page}"><br/>
	end_page : <input type="text" name="end_page" value="${willModifyLoging.end_page}"><br/>
	<fmt:parseDate value="${willModifyLoging.start_date}" var="start_date" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${start_date}" pattern="yyyy-MM-dd"/>
    start_date : <input type="date" min="2000-01-01" max="2030-12-31" name="start_date" value="<fmt:formatDate value="${start_date}" pattern="yyyy-MM-dd"/>"><br/> <!-- 추후 date 선택시 오늘 날짜 초과는 입력불가 추가하기 -->
	완독일 : <input type="checkbox" name="end_date" ><br/>
	<input type="text" name="write_no" value="${willModifyLoging.write_no}" hidden="hidden">
	<button type="submit" class="button btn-primary">RE Record</button>
	<a href="boardLogDelete?write_no=${willModifyLoging.write_no}"><button type="button" class="button btn-primary">Delete</button></a>	
	</form>
