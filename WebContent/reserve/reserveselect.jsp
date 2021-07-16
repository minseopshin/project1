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
	height:900px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}

</style>

<c:import url="../top2.jsp"/>
<div id="third">
	 <p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>
	
	
	<p align="center"> <img src="../jejuinfo.jpg" width="1100" height="500"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve">
	 
		 	 <caption style="padding-bottom:30px"> [ 나의 예약 조회  ] </caption>
	

		<tr>
	<c:if test="${userid != null }"> 
			<td colspan="2"><span style="cursor:pointer;" onclick="location='../reserve/reserve_join_check.jsp'"> <input type="submit" class="submit_form2" value="신청한 예약"></span></td>
		</c:if>
		 <c:if test="${userid == null }">
	<td colspan="2"> <span style="cursor:pointer;" onclick="location='../login/login.jsp'"><input type="submit" class="submit_form2" value="로그인">  </span></td>
  </c:if>
                                
        </tr>
        
        
        		<tr>
	<c:if test="${userid != null }"> 
			<td colspan="2"><span style="cursor:pointer;" onclick="location='../reserve/reserve_check.jsp'"> <input type="submit" class="submit_form2" value="작성한 예약"></span></td>
		</c:if>
		 <c:if test="${userid == null }">
	<td colspan="2"> 로그인 후 확인이 가능합니다 </td>
  </c:if>
                                
        </tr>
        
        

	</table>
	</div>
	
	
	     
                       
                                
                                
	
	
	
</div>
<c:import url="../bottom.jsp"/>