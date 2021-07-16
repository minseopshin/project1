<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.NoticeDao" %>
<%@ page import="project.dto.NoticeDto" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	NoticeDao ndao=new NoticeDao();
	NoticeDto ndto=ndao.ncontent(request);
	pageContext.setAttribute("ndto",ndto);
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">


<style>
#third{
	width:1100px;
	height:900px;
	margin:auto;
}
</style>
<c:import url="../top2.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 -->
 <p align="center"> <img src="../partyslide.jpg" width="1100" height="140"> <p>

  	<div class="my_list_wrap">
	 <table class="my_list">
	 
 <caption style="padding-bottom:30px"> 게시물 보기 </caption>
	
		<tr height="30" style="text-align:center;">
			<td> 작성자 </td>
			<td> 펜션지기 </td>
			<td> 조회수 </td>
			<td> ${ndto.viewcount} </td>
			<td> 작성 날짜 </td>
			<td> ${ndto.reportingdate} </td>
		</tr>
		<tr height="30">
			<td style="text-align:center;"> 제목 </td>
			<td colspan="5"> ${ndto.title} </td>
		</tr>
		<tr>
			<td style="text-align:center;"> 내용 </td>
			<td colspan="5" height="200"> ${ndto.content} </td>
		</tr>
		<tr>
		
		 <td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;">
			<c:if test="${userid == 'admin'}">
			<input type="button" class="submit_form2" value="목록가기" onclick="location.href='nlist.jsp'">
			<input type="button" class="submit_form2" value="수정하기" onclick="location.href='nupdate.jsp?id=${ndto.id}'">
			<input type="button" class="submit_form2" value="삭제하기" onclick="location.href='ndelete.jsp?id=${ndto.id}'">
			</c:if>
			
			<c:if test="${userid != 'admin'}">
			<input type="button" class="submit_form2" value="목록가기" onclick="location.href='nlist.jsp'">
			</c:if>
		 </td>
		</tr>

	</table>
	</div>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>