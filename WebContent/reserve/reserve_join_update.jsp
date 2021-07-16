<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveJoinDto" %>
<%	ReserveDao rdao = new ReserveDao(); 
	ReserveJoinDto rjdto = rdao.reserve_join_update(request,session);
	
	pageContext.setAttribute("rjdto", rjdto);

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
	<form method="post" action="reserve_join_update_ok.jsp">
	<input type="hidden" value="${rjdto.id}" name="id">
		<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
	 
			<tr>
				<td>제목</td>
				<td>${rjdto.title}</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>${rjdto.date}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${rjdto.content}</td>
			</tr>
			<tr>
				<td>인원</td>
				<td>
					<select name="joinnum">
					<c:forEach var="i" begin="1" end="5">
						<option value="${i}">${i}</option>
					</c:forEach>
					</select>
				</td>
			<tr>
				<td><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</div>

</div>

<c:import url="../bottom.jsp"/>