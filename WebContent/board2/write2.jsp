<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="project.dao.BoardDao2" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.dto.BoardDto2" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<style>
#third {
	width:1100px;
	height:900px;
	margin:auto; 
}
</style>


<c:import url="../top3.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 -->
	<form method="post" action="write_ok2.jsp" enctype="multipart/form-data">
		 
<p align="center"> <img src="../bluebg.png" width="1100" height="20"> <p>
	
	 	<div class="board_list_wrap">
	 <table class="board_list">
	 
<caption style="padding-bottom:30px;font-size:35px;"> 写作 </caption> 
	  <tr>
	  	<td> 题目 </td>
	  	<td> <input type="text" name="title" size="38" class="text_form2"> </td>
	  </tr>
	  <tr>
	  	<td> 作者 </td>
	  	<td> ${userid} </td>
	  </tr>
	  <tr>
	  	<td> 内容  </td>
	  	<td> <textarea  cols="40" rows="5" name="content" class="text_form3"></textarea> </td>
	  </tr>
	  <tr>
		<td> 相片 </td>
		<td> <input type="file" name="fname" id="fname"> </td>
		</tr>
	  <tr align="center">
	  	<td colspan="6" align="center" style="padding-top:50px;border-top:2px solid navy;border-bottom:1px solid white;"><input type="submit" class="submit_form2" value="保存"> </td>
	  </tr>
	 </table>
	 </div>
	 </form>
</div>
<c:import url="../bottom.jsp"/>