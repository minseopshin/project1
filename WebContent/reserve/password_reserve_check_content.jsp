<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@	page import="project.dao.MemberDao" %>
<%	String id = request.getParameter("id"); 
	
	pageContext.setAttribute("id", id);
%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:1100px;
	height:800px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}
</style>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function password_check()	{
		var chk = new XMLHttpRequest();
		var url = "password_check_ok.jsp?password="+document.pwd_chk.password.value;
		chk.open("get",url);
		chk.send();
		chk.onreadystatechange=function()	{
			if(chk.readyState == 4)	{
				if(chk.responseText.trim() == "1")	{
					document.getElementById("ok").innerText = "비밀번호가 일치합니다."
					document.getElementById("ok").style.color = "blue"
					document.getElementById("update_delete").style.display="";
				}
				else	{
					document.getElementById("ok").style.color = "red"
					document.getElementById("ok").innerText = "비밀번호가 일치하지않습니다."
				}
			}
		}	
	}
</script>
</head>
<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->

	<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>


<body>
 <caption style="padding-bottom:30px"> 비밀번호 확인하기 </caption>
 
	<form name="pwd_chk" method="post">
	<input type="password" class="text_form6" name="password">
	<input type="button" onclick="password_check()" class="submit_form4" value="확인하기">
	
	<div id="ok"></div>
	<div id="update_delete" style="display:none;">
		<input type="button" onclick="location='reserve_update.jsp?id=${id}'"  class="submit_form5" value="수정">
		<input type="button" onclick="location='reserve_delete.jsp?id=${id}'" class="submit_form5" value="삭제">
	</div>
	<div style="padding-top:50px;">
	<input type="button" onclick="location='../reserve/reserve_check_content.jsp?id=${id}'" class="submit_form2" value="돌아가기">
	</div>
	</form>
</body>

</div>
</html>

<c:import url="../bottom.jsp"/>