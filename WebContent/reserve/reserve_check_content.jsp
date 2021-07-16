<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>    
<%	ReserveDao rdao = new ReserveDao();
	ReserveDto rdto = rdao.reserve_content(request);
	String userid = (String) session.getAttribute("userid");
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	pageContext.setAttribute("rdto",rdto);
	pageContext.setAttribute("userid",userid);
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("day", day);
	
%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:2000px;
	height:1200px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}

</style>

<c:import url="../top2.jsp"/>
<div id="third">
	<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>
	
	<p align="center"> <img src="../jejustep.png" width="800" height="200"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 

	 	 <caption style="padding-bottom:30px"> 내용보기  </caption>
	 
		<tr align="center">
			<td>날짜</td>
			<td>${rdto.date}</td>
			<td>인원</td>
			<td>${rdto.min}/ ${rdto.max}</td>
		</tr>
		<tr align="center" height="60">
			<td>제목</td>
			<td colspan="4">${rdto.title}</td>
		</tr>
		<tr align="center" height="80">
			<td>내용</td>
			<td colspan="4">${rdto.content}</td>
		</tr>
		<tr align="center">
			<td colspan="4"><input type="button"  class="submit_form2" onclick="location='reserve_join.jsp?id=${rdto.id}&year=${year}&month=${month}&day=${day}'" value="예약"></td>
		</tr>
		<c:if test="${rdto.userid == userid}">
		
		
	
		</c:if>
	</table>
	
			<tr style="border-bottom:1px solid white;padding-left:500px;"  height="80">
			<td><input type="button" class="submit_form4" onclick="location='password_reserve_check_content.jsp?id=${rdto.id}'" value="수정/삭제"></td>
			<td><input type="button" class="submit_form4" onclick="location='reserve_check.jsp'" value="목록으로"></td>
		</tr>
		
		
	</div>
</div>
<c:import url="../bottom.jsp"/>