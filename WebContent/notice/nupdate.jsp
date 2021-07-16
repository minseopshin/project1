<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">



<style>
#third {
	width:1100px;
	height:800px;
	margin:auto; 
}
</style>
<%@ page import="project.dao.NoticeDao" %>
<%@ page import="project.dto.NoticeDto" %>
<%
	NoticeDao ndao=new NoticeDao();
	NoticeDto ndto=ndao.ncontent(request);
	pageContext.setAttribute("ndto",ndto);
%>
<c:import url="../top2.jsp"/>

<div id="third">
<!-- 모든 문서의 내용 시작 -->

	<form method="post" action="nupdate_ok.jsp">
	 
	 
	 
<p align="center"> <img src="../orangebg.png" width="1100" height="20"> <p>
	
	 	<div class="board_list_wrap">
	 <table class="board_list">
	 
	  <input type="hidden" name="id" value="${ndto.id}">
	 <caption style="padding-bottom:30px"> 게시물 수정하기 </caption>
	  <tr height="80">
	  	<td> 제목 </td>
	  	<td> <input type="text" name="title" class="text_form2" value="${ndto.title}"> </td>
	  </tr>
	  <tr height="200">
	  	<td> 내용 </td> <!-- placeholder=> 값 -->
	  	<td> <textarea  cols="40" rows="5" class="text_form3" name="content" >${ndto.content}</textarea> </td>
	  </tr>
	  <tr align="center">
	  	<td colspan="2"> <input type="submit" class="submit_form2" value="수정하기"> </td>
	  </tr>
	 </table>
	 </form>
</div>
	 
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>