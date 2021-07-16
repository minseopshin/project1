<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%   request.setCharacterEncoding("utf-8");
   String search = request.getParameter("search"); 
   String searchmenu = request.getParameter("searchmenu"); 

   pageContext.setAttribute("search", search);
   pageContext.setAttribute("searchmenu", searchmenu);
%>    

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   iframe {border: none; }
   
#third{
   width:1800px;
   height:3500px;
   margin:auto;
   text-align:center;
}

</style>
</head>


<c:import url="../top2.jsp"/>
   <div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
      <p align="center"> <img src="../bluebg.png" width="1800" height="35"> <p>
<body>
   <div style="font-size:32px;"> 검색 결과 보기 </div>
   
   <form method="post" action="jeju_search_result.jsp" style="padding-top:40px;">
   <select name="searchmenu">
      <option value="title">이름</option>
      <option value="addr">지역</option>
   </select>
   <input type="text" class="text_form2" value="${search}" name="search">
   <input type="submit" class="submit_form2" value="검색">
   </form>

   <div style="font-size:27px;padding-top:100px;">[ food ]</div>
   <iframe src="jeju_food_search.jsp?searchmenu=${searchmenu}&search=${search}" width="1200" height="600"></iframe>
   <hr>
   <div style="font-size:27px;padding-top:100px;">[ cafe ]</div>
   <iframe src="jeju_cafe_search.jsp?searchmenu=${searchmenu}&search=${search}" width="1200" height="600"></iframe>
   <hr>
   <div style="font-size:27px;padding-top:100px;">[ place ]</div>
   <iframe src="jeju_place_search.jsp?searchmenu=${searchmenu}&search=${search}" width="1200" height="600"></iframe>
   <hr>
   <div style="font-size:27px;padding-top:100px;">[ activity ]</div>
   <iframe src="jeju_activity_search.jsp?searchmenu=${searchmenu}&search=${search}" width="1200" height="600"></iframe>
</body>
</html>

</div>
<c:import url="../bottom.jsp"/>
