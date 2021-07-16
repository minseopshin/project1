<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="project.dao.JejuCafeDao" %>
<%@ page import="project.dto.JejuCafeDto" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%   int page1;
   if(request.getParameter("page1") == null)   {
      page1 = 1;
   }
   else   {
      page1 = Integer.parseInt(request.getParameter("page1"));
   }
   int index = (page1-1)*5;   
   int pagestart = page1/10;
   if(page1%5 == 0)   {
      pagestart = pagestart-1;
   }
   pagestart = Integer.parseInt(pagestart+"1");
   int pageend = pagestart+9;
   
   JejuCafeDao jdao = new JejuCafeDao(); 
   ArrayList<JejuCafeDto> jlist = jdao.jejucafe_search(request,index);
   
   int cnt = jdao.jeju_cafe_search_cnt(request);
   int page_cnt = cnt/10;
   if(cnt%10 != 0 )   {
      page_cnt++;
   }
   if(page_cnt < pageend){
      pageend = page_cnt;
   }
   
   String search = request.getParameter("search");
   String searchmenu = request.getParameter("searchmenu");
   
   pageContext.setAttribute("searchmenu",searchmenu);
   pageContext.setAttribute("search",search);
   pageContext.setAttribute("jlist",jlist);
   pageContext.setAttribute("page1", page1);
   pageContext.setAttribute("pagestart", pagestart);
   pageContext.setAttribute("pageend", pageend);
   pageContext.setAttribute("cnt", cnt);
   pageContext.setAttribute("page_cnt", page_cnt);
%>  



<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">




 
 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      <div style="padding-left:50px; margin:auto;display: inline-block;text-align:center;" >
      <c:forEach var="jdto" items="${jlist}">
            <div style="float:left; padding-left:40px; margin:auto;"><a href="jeju_cafe_content.jsp?id=${jdto.id}" target=".parent"><img id="pho" src="${jdto.imgpath}" width="300" height="200"></a><p>
            <span id="title"><a href="jeju_cafe_content.jsp?id=${jdto.id}" target=".parent">${jdto.title}</a></span>
            </div>

      </c:forEach>
      
      
      
      

      
      
      
      
      
      
      
      <div>
      <c:if test="${cnt == 0}">
         <div> 검색결과가 없습니다. </div>
      </c:if>
      </div>
      
      
      </div>
      
      
      <tr >
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;더 둘러보기 ▶▶</td>
<td >
 <c:forEach var="i" begin="${pagestart}" end="${pageend}">
      <c:if test="${page1 == i}">
          <span style="color:red;font-size:20px;text-decoration:none;">${i}</span>
      </c:if>
      <c:if test="${page1 != i}">
         <span style="color:black;font-size:20px;text-decoration:none;"><a href="jeju_cafe_search.jsp?searchmenu=${searchmenu}&search=${search}&page1=${i}" style="text-decoration:none;color:black;">${i}</a></span>
      </c:if>
   </c:forEach>
   </td>
      
    
   </tr>  
   
   
   
   
   
   
   
   

   
   
</body>
</html>

<!-- 모든 문서의 내용 끝 -->

