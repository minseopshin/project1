<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>    
<%	ReserveDao rdao = new ReserveDao();
	ReserveDto rdto = rdao.reserve_content(request);
	int c =rdao.reserve_content2(request,session);
	String userid = (String) session.getAttribute("userid");
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	pageContext.setAttribute("rdto",rdto);
	pageContext.setAttribute("userid",userid);
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("day", day);
	pageContext.setAttribute("c", c);
	
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
<script>
	function already()	{
		alert ("이미 예약되어있는 동행입니다.");
	}
</script>
<c:import url="../top2.jsp"/>
<div id="third">
	<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>
	
	<p align="center"> <img src="../jejustep.png" width="800" height="200"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 

	 	 <caption style="padding-bottom:30px"> 내용보기  </caption>
	 
		<tr align="center" height="50">
			<td>날짜</td>
			<td>${rdto.date}</td>
			<td>인원</td>
			<td>${rdto.min+rdto.num}/ ${rdto.max}</td>
		</tr>
		<tr align="center" height="50">
			<td>제목</td>
			<td colspan="4">${rdto.title}</td>
		</tr>
		<tr align="center" height="100">
			<td>내용</td>
			<td colspan="4">${rdto.content}</td>
		</tr>
		<tr align="center">
			<c:if test="${c == 0}">
			<td colspan="6" align="center" style="padding-top:30px;border-top:2px solid navy;border-bottom:1px solid white;"><input type="button"  class="submit_form2" onclick="location='reserve_join.jsp?id=${rdto.id}&year=${year}&month=${month}&day=${day}'" value="예약"></td>
			</c:if>
			<c:if test="${c == 1}">
			<td colspan="6" align="center" style="padding-top:30px;border-top:2px solid navy;border-bottom:1px solid white;"><button class="submit_form2" onclick="already()"> 예약 </button></td>
			</c:if>
		</tr>
		
	</table>
	
	
		<tr style="border-bottom:1px solid white;">
			
			<td>
			<c:if test="${rdto.userid == userid}">
			<input type="button" class="submit_form4" onclick="location='password_reserve_check_content.jsp?id=${rdto.id}'" value="수정/삭제">
			</c:if>
			<input type="button" class="submit_form4" onclick="location='reserve_board.jsp?year=${year}&month=${month}&day=${day}'" value="목록으로"></td>
		</tr>
	</div>
</div>
<c:import url="../bottom.jsp"/>