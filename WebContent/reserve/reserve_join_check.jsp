<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveJoinDto" %>
<%@	page import="java.util.ArrayList" %>    
<%	int page1;
if(request.getParameter("page1") == null)	{
	page1 = 1;
}
else	{
	page1 = Integer.parseInt(request.getParameter("page1"));
}
int index = (page1-1)*10;	
int pagestart = page1/10;
if(page1%10 == 0)	{
   pagestart = pagestart-1;
}
pagestart = Integer.parseInt(pagestart+"1");
int pageend = pagestart+9;

	
	ReserveDao rdao = new ReserveDao();
	ArrayList<ReserveJoinDto> rjlist = rdao.reservejoin_check(session,index);
	int cnt = rdao.joinpage_check_count(session);

	int page_cnt = cnt/10;
	if(cnt%10 != 0 )	{
		page_cnt++;
	}
	if(page_cnt < pageend){
		pageend = page_cnt;
	}
	
	pageContext.setAttribute("rjlist",rjlist);
	pageContext.setAttribute("pagestart", pagestart);
	pageContext.setAttribute("pageend", pageend);
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
	 
			 <caption style="padding-bottom:30px"> [ 예약 확인  ]  </caption>
		<!-- <tr>
			<td align="center">내가 예약</td>
		</tr> -->
		<tr>
			<td>제목</td>
			<td>성별</td>
			<td>인원</td>
			<td>날짜</td>
		</tr>
		<c:forEach var="rjdto" items="${rjlist}">
		<tr>
			<td><a href="reserve_join_check_content.jsp?id=${rjdto.reserveid}">${rjdto.title}</a></td>
			<c:if test="${rjdto.gender == 0}">
				<td>상관없음</td>
			</c:if>
			<c:if test="${rjdto.gender == 1}">
				<td>남자만</td>
			</c:if>
			<c:if test="${rjdto.gender == 2}">
				<td>여자만</td>
			</c:if>
			<td>${rjdto.num + rjdto.min}/${rjdto.max}</td>
			<td>${rjdto.date}</td>
		</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="4"> 
				<c:forEach var="i" begin="${pagestart}" end="${pageend}">
				<c:if test="${page1 == i}">
			 		<span style="color:red">${i}</span>
			 	</c:if>
			 	<c:if test="${page1 != i}">
					<a href="reserve_join_check.jsp?page1=${i}">${i}</a>
				</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
	</div>
</div>
<c:import url="../bottom.jsp"/>