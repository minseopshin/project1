<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>
<%	ReserveDao rdao = new ReserveDao();
	ReserveDto rdto = rdao.reserve_board_current(session);
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	pageContext.setAttribute("rdto", rdto);
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("day", day);
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
			<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
			 <caption style="padding-bottom:30px"> 예약모집글 확인</caption>

		<tr height="60">
			<td>제목</td>
			<td>${rdto.title}</td>
		<tr height="80">
			<td>내용</td>
			<td>${rdto.content}</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${rdto.date}</td>
		<tr>
			<td>현재인원</td>
			<td>${rdto.min}</td>
		</tr>
		<tr>
			<td>최대인원</td>
			<c:if test="${rdto.max == 100}">
			<td>상관없음</td>
			</c:if>
			<c:if test="${rdto.max != 100}">
			<td>${rdto.max}</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;">
			<input type="button" class="submit_form2" onclick="location='reserve_board.jsp?year=${year}&month=${month}&day=${day}'" value="목록으로"></td>
		</tr>
	</table>
	</div>
</div>
<c:import url="../bottom.jsp"/>