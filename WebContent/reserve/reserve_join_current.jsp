<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveJoinDto" %>
<%	ReserveDao rdao = new ReserveDao();
	ReserveJoinDto rjdto = rdao.reserve_join_current(request,session);
	pageContext.setAttribute("rjdto", rjdto);
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("day", day);
	
%> 

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">


<style>
#third{
	width:2000px;
	height:1100px;
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
	 
	 	 <caption style="padding-bottom:30px"> 예약 정보 </caption>
	 
		<tr height="70">
			<td>제목 ></td>
			<td>${rjdto.title}</td>
		</tr>
		<tr height="100">
			<td>내용 ></td>
			<td>${rjdto.content}</td>
		</tr>
		<tr height="60">
			<td>인원 ></td>
			<td>${rjdto.num}/${rjdto.max}</td>
		</tr>
		<tr height="60">
			<td>예약날짜 ></td>
			<td>${rjdto.date}</td>
		<tr height="60">
			<td>작성자 이메일 ></td>
			<td>${rjdto.email}</td>
		</tr>
		<tr height="60">
			<td>작성자 카카오톡 ></td>
			<td>${rjdto.kakao}</td>
		</tr>	
		<tr>
					<td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;">
<input type="button" class="submit_form2" onclick="location='reserve_board.jsp?year=${year}&month=${month}&day=${day}'" value="목록으로"></td>
		</tr>
	</table>
	</div>
</div>
<c:import url="../bottom.jsp"/>