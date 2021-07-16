
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao2" %>
<%@ page import="project.dto.BoardDto2" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	BoardDao2 bdao2=new BoardDao2();
	BoardDto2 bdto2=bdao2.content2(request);
	pageContext.setAttribute("bdto2",bdto2);
%>




<style>
#third {
	width:1100px;
	height:1000px;
	margin:auto; 
}
</style>


<c:import url="../top3.jsp"/>

<div id="third">
<!-- 모든 문서의 내용 시작 -->

<form method="post" action="update_ok2.jsp" enctype="multipart/form-data">
		 
	 
<p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>
	
	 	<div class="board_list_wrap">
	 <table class="board_list">

		 <input type="hidden" name="id" value="${bdto2.id}">
<caption style="padding-bottom:30px;font-size:40px;"> 修改文章 </caption>

	  <tr height="60">
	  	<td> 作者 </td>
	  	<td> ${bdto2.userid} </td>
	  </tr>
	  <tr height="70">
	  	<td> 题目 </td>
	  	<td> <input type="text" name="title" class="text_form2"  value="${bdto2.title}"> </td>
	  </tr>
	  <tr height="400">
	  	<td> 内容  </td>
	  	<td> <textarea cols="40" rows="5" class="text_form3" name="content">${bdto2.content}</textarea> </td>
	  </tr>

	  <tr height="100">
			<td> 相片 </td>
			<td> <img src="img/${bdto2.fname}" width="80">
				<span onclick="chg_view()" id="hand" style="cursor:pointer;"> 照片变更 </span>
			</td>
		</tr>
		<tr style="display:none;" id="file">
			<td> 附照片 </td>
			<td> <input type="file" name="fname"> </td>
		</tr>
	  <tr>
	  	<td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;"> <input type="submit" class="submit_form2" value="修改"> </td>
	  </tr>
	

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



