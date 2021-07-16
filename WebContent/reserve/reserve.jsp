<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="java.time.LocalDate" %>    
<%	int year,month;
	if(request.getParameter("year") == null )	{
		LocalDate today = LocalDate.now();
		year = today.getYear();
		month = today.getMonthValue();
	}
	else	{
      year=Integer.parseInt(request.getParameter("year"));
      month=Integer.parseInt(request.getParameter("month"));
    }
	
	
	LocalDate firstday = LocalDate.of(year,month,1);
	double total_days = firstday.lengthOfMonth();
	
	int firstdate = firstday.getDayOfWeek().getValue();
	if (firstdate == 7 )	{
		firstdate = 0;
	}
	
	int week = (int)Math.ceil((total_days+firstdate)/7);
	
	pageContext.setAttribute("year",year);
	pageContext.setAttribute("month",month);
	pageContext.setAttribute("total_days",total_days);
	pageContext.setAttribute("week",week);
	pageContext.setAttribute("firstdate",firstdate);
	
%> 

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">


<style>
#third{
	width:2000px;
	height:980px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}

</style>

   
<c:import url="../top2.jsp"/>
<div id="third">
	<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>	

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" height="50px" align="center">
	 
	 	 <caption style="padding-bottom:30px" align="center"> 예약 일정  </caption>
	 
		<tr height="60px" style="border-bottom:2px solid navy;">
			<td>
			<c:if test="${month == 1}">
				<a href="reserve.jsp?year=${year-1}&month=12"> ◀ </a>
			</c:if>
			<c:if test="${month != 1}">
				<a href="reserve.jsp?year=${year}&month=${month-1}"> ◀ </a>
			</c:if>
			</td>
			<td colspan="5" align="center">${month}월</td>
			<td>
			<c:if test="${month == 12}">
				<a href="reserve.jsp?year=${year+1}&month=1"> ◀  </a>
			</c:if>
			<c:if test="${month != 12}">
				<a href="reserve.jsp?year=${year}&month=${month+1}"> ▶  </a>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		<c:set var="day" value="1"/>
		<c:forEach var="i" begin="0" end="${week-1}">
		<tr>
			<c:forEach var="j" begin="0" end="6">
				<c:if test="${((firstdate > j && i == 0) || (total_days < day))}">
					<td>&nbsp;</td>
				</c:if>
				
				<c:if test="${!((firstdate > j && i == 0) || (total_days < day))}">
					<c:if test="${userid != null}">
					 <td><a href="reserve_board.jsp?year=${year}&month=${month}&day=${day}">${day}</a></td>
					</c:if>
					<c:if test="${userid == null}">
					 <td><a href="../login/login.jsp?year=${year}&month=${month}&day=${day}">${day}</a></td>
					</c:if>
					<c:set var="day" value="${day+1}"/>
				</c:if>
			</c:forEach>
		</c:forEach>
		
	</table>
	</div>
		<p align="center"> <img src="../jejulogo.jpg" width="950" height="320"> <p>
</div>
<c:import url="../bottom.jsp"/>