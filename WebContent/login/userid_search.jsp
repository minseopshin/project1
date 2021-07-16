<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#third{
	width:1100px;
	height:750px;
	margin:auto;
}
</style>

<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
	<!--  새로운 시트 바뀔 때마다 요 중간 부분만 바뀐다!!  -->
<p align="center"> <img src="../worldslide.jpg" width="1100" height="320"> <p>
<c:if test="${idid == null}">
<%
	pageContext.setAttribute("chk", request.getParameter("chk"));
%>
  <form method="post" action="userid_search_ok.jsp">
 
   
      
	<div class="board_list_wrap">
	 <table class="board_list">
	 <caption style="padding-bottom:30px"> 아이디 찾기 </caption>
      
      <tr>
        <td> <input type="text" name="email" class="text_form2" placeholder="이메일"> </td>
      </tr>
      <tr>
        <td> <input type="text" name="phone" class="text_form2" placeholder="전화번호"> </td>
      </tr>
    <c:if test="${chk == 1}">
      <tr>
        <td style="color:red"> 이메일 또는 전화번호가 일치하지 않습니다. </td>
      </tr>
    </c:if>
      <tr>
        <td> <input type="submit" class="submit_form2" value="아이디 찾기" > </td>
      </tr>  
    </table>
    
    
  </form>
</c:if>
<c:if test="${idid != null}">
  <p align="center"> ID : ${idid} </p>
</c:if>

</div>

<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  
  
