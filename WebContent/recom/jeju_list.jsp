<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ page import="project.dao.JejuCafeDao" %>
<%@ page import="project.dto.JejuCafeDto" %>
<%@ page import="java.util.ArrayList" %>
<%   int page1;
   if(request.getParameter("page1") == null)   {
      page1 = 1;
   }
   else   {
      page1 = Integer.parseInt(request.getParameter("page1"));
   }
   int index = (page1-1)*10;   
   int pagestart = page1/10;
   if(page1%10 == 0)   {
      pagestart = pagestart-1;
   }
   pagestart = Integer.parseInt(pagestart+"1");
   int pageend = pagestart+9;
   
   JejuCafeDao jcdao = new JejuCafeDao(); 
   ArrayList<JejuCafeDto> jlist = jcdao.jeju_list(request,index);
   
   int cnt = jcdao.jeju_list_count(request);
   int page_cnt = cnt/10;
   if(cnt%10 != 0 )   {
      page_cnt++;
   }
   if(page_cnt < pageend){
      pageend = page_cnt;
   }
   String menu = request.getParameter("menu");
   
   pageContext.setAttribute("menu", menu);
   pageContext.setAttribute("jlist", jlist);
   pageContext.setAttribute("page1", page1);
   pageContext.setAttribute("pagestart", pagestart);
   pageContext.setAttribute("pageend", pageend);
   pageContext.setAttribute("cnt", cnt);
   pageContext.setAttribute("page_cnt", page_cnt);
%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
   width:2000px;
   height:2000px;
   margin:auto;
}



.parent {padding-left:50px; display: inline-block;}
   span {display: table-cell;  padding-left:12px; vertical-align:center;}
   
   
</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>

 
 
<c:import url="../top2.jsp"/>
   <div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
   <!--  새로운 시트 바뀔 때마다 요 중간 부분만 바뀐다!!  -->
    <p align="center"> <img src="../bluebg.png" width="2000" height="45"> <p>   
 
 <p align="center "> <img src="../placetoptop.png" width="1300" height="305"> <p>

<c:if test="${menu == 'cafe'}">
<h1 style="color:black;font-size:50px;margin-left:250px;margin-left:750px;padding-bottom:30px;"  >[ 투어 추천 카페 BEST ]</h1>

<h3 style="color:black;font-size:30px;margin-left:250px;margin-left:450px;padding-bottom:30px;"  >제주도에서 제일 핫한 카페들만 엄선! 새로운 친구들과 함께 여행 계획을 세워보세요</h3>
</c:if>
<c:if test="${menu == 'place'}">
<h1 style="color:black;font-size:50px;margin-left:250px;margin-left:750px;padding-bottom:30px;"  >[ 투어 추천  관광명소 BEST ]</h1>

<h3 style="color:black;font-size:30px;margin-left:250px;margin-left:450px;padding-bottom:30px;"  >제주도에서 제일 핫한 관광명소들만 엄선! 새로운 친구들과 함께 여행 계획을 세워보세요</h3>
</c:if>
<c:if test="${menu == 'food'}">
<h1 style="color:black;font-size:50px;margin-left:250px;margin-left:750px;padding-bottom:30px;"  >[ 투어 추천 맛집 BEST ]</h1>

<h3 style="color:black;font-size:30px;margin-left:250px;margin-left:450px;padding-bottom:30px;"  >제주도에서 제일 핫한 맛집들만 엄선! 새로운 친구들과 함께 여행 계획을 세워보세요</h3>
</c:if>
<c:if test="${menu == 'activity'}">
<h1 style="color:black;font-size:50px;margin-left:250px;margin-left:750px;padding-bottom:30px;"  >[ 투어 추천 액티비티 BEST ]</h1>

<h3 style="color:black;font-size:30px;margin-left:250px;margin-left:450px;padding-bottom:30px;"  >제주도에서 제일 핫한 액티비티들만 엄선! 새로운 친구들과 함께 여행 계획을 세워보세요</h3>
</c:if>
<body>
<form method="post" action="jeju_search_result.jsp" style="width:1300px;margin-left:320px;">
   <div style="float:left;">
    <input type="button" class="submit_form6" style="cursor:pointer;" onclick="location='total_map.jsp?menu=${menu}&region=aaaa'" value="지도로 보기">

   </div>
   <div style="float:right;">
   <select name="searchmenu">
      <option value="title" selected>이름</option>
      <option value="addr">지역</option>
   </select>
   
   
    <input type="text" class="text_form6" style="cursor:pointer;" name="search">
    <input type="submit" class="submit_form2" style="cursor:pointer;" value="검색">
   </div>
   

</form>

	<c:if test="${menu == 'cafe'}">
   <div style="width:1400px; display: inline-block; font-size:20px;margin-left:270px;">
   <c:forEach var="jdto" items="${jlist}">
      <div style="float:left; padding-left:40px; display: inline-block; margin:auto;"><img id="pho" src="${jdto.imgpath}" width="300" height="200" style="padding-top:80px;"onclick="location='jeju_cafe_content.jsp?id=${jdto.id}'">
      <span id="title" style="padding-top:25px;text-align:center;"><a href="jeju_cafe_content.jsp?id=${jdto.id}">${jdto.title}</a></span>
      </div>
   </c:forEach>
   </div>
  </c:if>
  
  <c:if test="${menu == 'place'}">
   <div style="width:1400px; display: inline-block; font-size:20px;margin-left:270px;">
   <c:forEach var="jdto" items="${jlist}">
      <div style="float:left; padding-left:40px; display: inline-block; margin:auto;"><img id="pho" src="${jdto.imgpath}" width="300" height="200" style="padding-top:80px;"onclick="location='jeju_place_content.jsp?id=${jdto.id}'">
      <span id="title" style="padding-top:25px;text-align:center;"><a href="jeju_place_content.jsp?id=${jdto.id}">${jdto.title}</a></span>
      </div>
   </c:forEach>
   </div>
  </c:if>
  
  <c:if test="${menu == 'food'}">
   <div style="width:1400px; display: inline-block; font-size:20px;margin-left:270px;">
   <c:forEach var="jdto" items="${jlist}">
      <div style="float:left; padding-left:40px; display: inline-block; margin:auto;"><img id="pho" src="${jdto.imgpath}" width="300" height="200" style="padding-top:80px;"onclick="location='jeju_food_content.jsp?id=${jdto.id}'">
      <span id="title" style="padding-top:25px;text-align:center;"><a href="jeju_food_content.jsp?id=${jdto.id}">${jdto.title}</a></span>
      </div>
   </c:forEach>
   </div>
  </c:if>
  
   <c:if test="${menu == 'activity'}">
   <div style="width:1400px; display: inline-block; font-size:20px;margin-left:270px;">
   <c:forEach var="jdto" items="${jlist}">
      <div style="float:left; padding-left:40px; display: inline-block; margin:auto;"><img id="pho" src="${jdto.imgpath}" width="300" height="200" style="padding-top:80px;"onclick="location='jeju_activity_content.jsp?id=${jdto.id}'">
      <span id="title" style="padding-top:25px;text-align:center;"><a href="jeju_activity_content.jsp?id=${jdto.id}">${jdto.title}</a></span>
      </div>
   </c:forEach>
   </div>
  </c:if>
  
   <div style="width:1200; display:inline_block; padding-left:700px;">
   
   
   <c:if test="${page1 > 10}">
      <span style="padding-top:220px;"><a href="jeju_list.jsp?menu=${menu}&page1=${pagestart-1}"> << </a></span>
   </c:if>
   <c:if test="${page1 != 1}">
      <span><a href="jeju_list.jsp?menu=${menu}&page1=${page1-1}"> < </a></span>
   </c:if>
   <c:forEach var="i" begin="${pagestart}" end="${pageend}">
      <c:if test="${page1 == i}">
          <span style="color:red">${i}</span>
      </c:if>
      <c:if test="${page1 != i}">
         <span><a href="jeju_list.jsp?menu=${menu}&page1=${i}">${i}</a></span>
      </c:if>
   </c:forEach>
   
   
   
   <c:if test="${page1 != page_cnt}">
      <span style="padding-top:200px;"><a href="jeju_list.jsp?menu=${menu}&page1=${page1+1}"> > </a></span>
   </c:if>
   <c:if test="${pageend != page_cnt}">
      <span><a href="jeju_list.jsp?menu=${menu}&page1=${pageend+1}"> >> </a></span>
   </c:if>
   </div>
   
   
</body>


     
      
         
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  
  