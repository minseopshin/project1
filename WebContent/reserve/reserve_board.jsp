<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>
<%@	page import="java.util.ArrayList" %>
<%@	page import="java.time.LocalDate" %> 
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
	ArrayList<ReserveDto> list = rdao.reserve_board(request,session,index);
	pageContext.setAttribute("list", list);
	int cnt = rdao.page_count(request);
	int page_cnt = cnt/10;
	if(cnt%10 != 0 )	{
		page_cnt++;
	}
	if(page_cnt < pageend){
		pageend = page_cnt;
	}
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	int y = Integer.parseInt(year);
	int m = Integer.parseInt(month);
	int d = Integer.parseInt(day);
	
	LocalDate reserveday = LocalDate.of(y, m, d);
	LocalDate nextday = reserveday.plusDays(1);
	LocalDate preday = reserveday.minusDays(1);
	
	int ny = nextday.getYear();
	int nm = nextday.getMonthValue();
	int nd = nextday.getDayOfMonth();
	
	int py = preday.getYear();
	int pm = preday.getMonthValue();
	int pd = preday.getDayOfMonth();
	
	
	pageContext.setAttribute("year", year);
	pageContext.setAttribute("month", month);
	pageContext.setAttribute("day", day);
	pageContext.setAttribute("page1", page1);
	pageContext.setAttribute("pagestart", pagestart);
	pageContext.setAttribute("pageend", pageend);
	pageContext.setAttribute("cnt", cnt);
	pageContext.setAttribute("page_cnt", page_cnt);
	pageContext.setAttribute("py", py);
	pageContext.setAttribute("pm", pm);
	pageContext.setAttribute("pd", pd);
	pageContext.setAttribute("ny", ny);
	pageContext.setAttribute("nm", nm);
	pageContext.setAttribute("nd", nd);
	
%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:2000px;
	height:1500px;
	margin:auto;
	text-align:center;	/*???????????????????????? ????????? ?????? */
	
}

</style>
<c:import url="../top2.jsp"/>
<script>
	function gender_fail()	{
		alert("????????? ?????? ????????????.")
	}

</script>
<div id="third">


	<form method="post">
	<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>
	
	<p align="center"> <img src="../jejustep.png" width="800" height="200"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
	 	 <caption style="padding-bottom:30px"> ?????? ?????? </caption>
	 
	
	  
        
	
		<tr text-align="center">
			<td><a href="reserve_board.jsp?year=${py}&month=${pm}&day=${pd}"> ???  </a></td>
			
			<td>${year}??? ${month}??? ${day}??? </td>
			<td>????????????</td>
			<td><a href="reserve_board.jsp?year=${ny}&month=${nm}&day=${nd}"> ???  </a></td>
			
		</tr>
		<c:forEach var="rdto" items="${list}">
		<tr height="100px">
			<td>${rdto.title}</td>

		
			<c:if test="${rdto.gender == 0 }">
			<td> ?????? : ????????????</td>
			</c:if>
			<c:if test="${rdto.gender == 1 }">
			<td> ?????? : ?????????</td>
			</c:if>
			<c:if test="${rdto.gender == 2 }">
			<td> ?????? : ?????????</td>
			</c:if>
			<td>?????? : ${rdto.num +rdto.min} / ${rdto.max}</td>
			
						<td> 
			<c:if test="${rdto.gender == 0 or rdto.gender == rdto.gd}">
				<input type="button" class="submit_form5" onclick="location='reserve_content.jsp?id=${rdto.id}&year=${year}&month=${month}&day=${day}'" value="??????">
			</c:if>
			<c:if test="${rdto.gender != rdto.gd and rdto.gender != 0}">
				<button onclick="gender_fail()" class="submit_form5" > ?????? </button>
			</c:if>
			</td>
			
		</tr>
		</c:forEach>

		
		
	</table>
	<td style="border-bottom:1px solid white;padding-top:150px;" > 
			<c:forEach var="i" begin="${pagestart}" end="${pageend}">
			<c:if test="${page1 == i}">
			 	<span style="color:red;font-size:20px;">${i}</span>
			 </c:if>
			 <c:if test="${page1 != i}">
				<a href="reserve_board.jsp?page1=${i}&year=${year}&month=${month}&day=${day}">${i}</a>
			</c:if>
			</c:forEach>
			</td>
			<p>
			
	<tr align="center" style="padding-top:200px;border-bottom:1px solid white;">
			<td><input type="button" class="submit_form4" onclick="location='reserve.jsp?year=${year}&month=${month}'" value="??????"></td>
			
			
			<td><input type="button" class="submit_form4" onclick="location='reserve_write.jsp?year=${year}&month=${month}&day=${day}'" value="?????????"></td>
		</tr>
		
	</div>
	
	</form>
</div>
<c:import url="../bottom.jsp"/>