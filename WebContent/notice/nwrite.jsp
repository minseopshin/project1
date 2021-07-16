<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">



<style>
#third{
	width:1100px;
	height:700px;
	margin:auto;
}
</style>

<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
	<form method="post" action="nwrite_ok.jsp">

<p align="center"> <img src="../orangebg.png" width="1100" height="20"> <p>
	
	 	<div class="board_list_wrap">
	 <table class="board_list">
    <caption style="padding-bottom:30px">관리자 글쓰기 </caption>

	  <tr align="center">
	  	<td> 제목 </td>
	  	<td align="center"> <input type="text" name="title" class="text_form2" > </td>
	  </tr>
	  <tr>
	  	<td> 내용 </td>
	  	<td align="center"> <textarea  cols="40" rows="5" name="content" class="text_form3"></textarea> </td>
	  </tr>
	 <tr align="center">
        <td colspan="2" align="center"> <input type="submit" class="submit_form2" value="저장하기"> </td>
      </tr>
	  
	      
	  
	  
	 </table>
	 
	 </form>
	</div> 
	
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  
  
  
  
  
  
  
  