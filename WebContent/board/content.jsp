<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao" %>
<%@ page import="project.dto.BoardDto" %>
<%
	BoardDao bdao=new BoardDao();
	BoardDto bdto=bdao.content(request);
	pageContext.setAttribute("bdto",bdto);
	/* String chk=request.getParameter("chk");
	pageContext.setAttribute("chk",chk); */
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:1100px;
	
	height:1200px;
	margin:auto;
}
</style>

<script>
	function loginhae()
	{
		if(window.confirm("신고하시겠습니까?"))
		{
			location.href="singo.jsp?id=${bdto.id}&state=${bdto.state}";
		}
		else
		{
			window.alert("게시물로 돌아갑니다.")		
		}
			/* alert("신고하시겠습니까?");
			location.href="singo.jsp?id=${bdto.id}&state=${bdto.state}"; */
	}
</script>
<c:import url="../top2.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 -->
 <p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>

  	<div class="my_list_wrap">
	<table class="my_list">
	 <caption style="padding-bottom:30px"> 여행후기 보기 </caption>
		<tr height="30">
			<td> 작성자 </td>
			<td> ${bdto.userid} </td>
			<td> 조회수 </td>
			<td> ${bdto.viewcount} </td>
			<td> 작성 날짜 </td>
			<td> ${bdto.reportingdate} </td>
		</tr>
		<tr height="60">
			<td style="text-align:center;"> 제목 </td>
			<td colspan="5"> ${bdto.title} </td>
		</tr>
		<tr height="200">
		
			<td> 내용 </td>
			<td colspan="5"> ${bdto.content} </td>
		</tr>
		<!-- 사진 td 추가 -->
		<c:if test="${bdto.fname != null}" >
		<tr height="430">
			<td> 사진 </td>
			<td colspan="5"> <img src="img/${bdto.fname}" width="300" height="300"> </td>
		</tr>
		</c:if>
		<tr>
		 <td colspan="6" align="center" style="padding-top:80px;border-top:2px solid navy;border-bottom:1px solid white;word-spacing:30px;">
		 	<input type="button" value="목록가기" class="submit_form2" onclick="location.href='list.jsp'">
			<c:if test="${userid == bdto.userid }">
			<input type="button" value="수정하기" class="submit_form2" onclick="location.href='update.jsp?id=${bdto.id}'">
			<input type="button" value="삭제하기" class="submit_form2" onclick="location.href='delete.jsp?id=${bdto.id}'">
			</c:if>
			<c:if test="${id == bdto.userid }">
			</c:if>
			<!-- 수정  관리자권한 게시판 게시물 삭제(0506) -->
			<c:if test="${userid == 'admin'}">
			<input type="button" value="삭제하기" class="submit_form2" onclick="location.href='delete.jsp?id=${bdto.id}'">
			</c:if>
			<!-- 수정끝 -->
			<!-- 신고하기 버튼 -->
			<c:if test="${userid != 'admin' && bdto.userid != userid && not empty userid}">
			<input type="button" value="신고하기" class="submit_form2" onclick="loginhae()">
			</c:if>
		 </td>
		</tr>
	</table>
	</div>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>