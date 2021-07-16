
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao" %>
<%@ page import="project.dto.BoardDto" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	BoardDao bdao=new BoardDao();
	BoardDto bdto=bdao.content(request);
	pageContext.setAttribute("bdto",bdto);
%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">



<style>
#third {
	width:1100px;
	height:1000px;
	margin:auto; 
}
</style>


<c:import url="../top2.jsp"/>

<div id="third">
<!-- 모든 문서의 내용 시작 -->

<form method="post" action="update_ok.jsp" enctype="multipart/form-data">
		 
	 
<p align="center"> <img src="../bluebg.png" width="1100" height="20"> <p>
	
	 	<div class="board_list_wrap">
	 <table class="board_list">

		 <input type="hidden" name="id" value="${bdto.id}">
<caption style="padding-bottom:30px"> 게시물 수정하기 </caption>

	  <tr>
	  	<td> 작성자 </td>
	  	<td> ${bdto.userid} </td>
	  </tr>
	  <tr height="60">
	  	<td> 제목 </td>
	  	<td> <input type="text" name="title" class="text_form2"  value="${bdto.title}"> </td>
	  </tr>
	  <tr height="400">
	  	<td> 내용 </td>
	  	<td> <textarea cols="40" rows="5" class="text_form3" name="content">${bdto.content}</textarea> </td>
	  </tr>
	  <!-- 사진 수정 tr 추가 -->
	  <tr height="100">
			<td> 사진 </td>
			<td> <img src="img/${bdto.fname}" width="80">
				<span onclick="chg_view()" id="hand" style="cursor:pointer;"> 사진변경하기 </span>
			</td>
		</tr>
		<tr style="display:none;" id="file">
			<td> 수정 첨부 </td>
			<td> <input type="file" name="fname"> </td>
		</tr>
	  <tr>
	  	<td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;"> <input type="submit" class="submit_form2" value="글 수정하기"> </td>
	  </tr>
	
<!-- 함수추가(수정첨부) -->
	<script>
		function chg_view()
		{
			document.getElementById("file").style.display="table-row";
		}
	</script>

 		</table>

	 	</form>
	</div>
	 
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>



