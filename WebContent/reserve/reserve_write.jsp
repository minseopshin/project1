<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String date = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("day", day);
	pageContext.setAttribute("date", date);
%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">


<style>
#third{
	width:2000px;
	height:800px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}

</style>

<c:import url="../top2.jsp"/>
<div id="third">
	<form method="post" action="reserve_write_ok.jsp">
	
	<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
		 	 <caption style="padding-bottom:30px"> 예약 모집 글쓰기 </caption>
	
	<input type="hidden" value="${date}" name="date">
	<input type="hidden" value="${year}" name="year">
	<input type="hidden" value="${month}" name="month">
	<input type="hidden" value="${day}" name="day">
	
		<tr>
			<td> 제 목 </td>
			<td><input type="text" name="title" class="text_form2"></td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td><textarea name="content" class="text_form4"></textarea></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${date}</td>
		</tr>
		<tr>
			<td> 원하는 성별</td>
			<td>
				<input type="radio" name="gender" value="0"> 상관없음
				<input type="radio" name="gender" value="1"> 남자만
				<input type="radio" name="gender" value="2"> 여자만
			</td>
		</tr>
		<tr>
			<td>작성자 동행인원</td>
			<td>
				<select name="min">
					<c:forEach var="j" begin="1" end="6">
						<option value="${j}">${j}명</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>최대인원</td>
			<td>
				<select name="max">
					<c:forEach var="i" begin="2" end="6">
						<option value="${i}"> ${i}명</option>
					</c:forEach>
						<option value="100">상관없음</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="submit_form2" value="저장"></td>
		</tr>
	</table>
	</div>
	</form>
</div>
<c:import url="../bottom.jsp"/>