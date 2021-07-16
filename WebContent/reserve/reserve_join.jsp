<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>
<%	ReserveDao rdao = new ReserveDao();
	ReserveDto rdto = rdao.reserve_join(request);

	String userid = (String) session.getAttribute("userid"); 
	String id = request.getParameter("id");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	pageContext.setAttribute("id",id);
	pageContext.setAttribute("rdto",rdto);
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
	<form method="post" action="reserve_join_ok.jsp">
	
		<p align="center"> <img src="../bluebg.png" width="2000" height="20"> <p>
	
	<p align="center"> <img src="../jejustep.png" width="800" height="200"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
	 	 <caption style="padding-bottom:30px"> 예약 현황 </caption>
	 
	
	
	<input type="hidden" value="${id}" name="reserveid">
	<input type="hidden" value="${year}" name="year">
	<input type="hidden" value="${month}" name="month">
	<input type="hidden" value="${day}" name="day">
	
		<tr align="center" height="70">
			<td>예약할 아이디</td>
			<td>${userid}</td>
		</tr>
		<tr align="center" height="70">
			<td>예약할 인원</td>
			<td>
			<select name="joinnum">
				<c:forEach var="i" begin="1" end="${rdto.max - rdto.min}">
					<option value="${i}">${i}명</option>
				</c:forEach>
			</select>
			</td>			
		</tr>
		<tr align="center">
		
		<td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;">
			<input type="submit" class="submit_form2" value="예약"></td>
		</tr>
	</table>
	</div>
	</form>
</div>
<c:import url="../bottom.jsp"/>s