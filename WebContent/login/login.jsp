 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">


<c:import url="../top2.jsp"/>
<style>
#third{
width:1100px;
height:800px;
/*background:red; */
margin:auto;
}
</style>

<div id="third">
<!-- 모든 문서의 내용 시작 -->
<!-- 로그인 폼을 생성  -->

<form method="post" action="login_ok_front.jsp">
 <!-- 메인에서 이미지 출력되는 부분 -->
 <p align="center"> <img src="../jeju3.jpg" width="1100" height="200"> <p>

<!-- ★예약관련 이후 값 넘겨주는 부분// 새로 추가된 부분 / reserve -> login -> login_ok에 전달하는 과정  -->
  <input type="hidden" name="id" value="<%=request.getParameter("id")%>"> <!-- 방의 id -->
  <input type="hidden" name="year" value="<%=request.getParameter("year")%>">
  <input type="hidden" name="month" value="<%=request.getParameter("month")%>">
  <input type="hidden" name="day" value="<%=request.getParameter("day")%>">



<table width="310" align="center" class="login_table"> <!-- 중앙정렬을 위해 사이즈 조정, class이름 지정 -->
    <caption> <h3>  LOGIN  </h3> </caption>
    <tr> <!-- 폼태그에 스타일 반영 class=" " -->
      <td> <input type="text" class="text_form" name="userid" placeholder="아이디"> </td>
    </tr>
    <tr>
      <td> <input type="password" class="pwd_form" name="pwd" placeholder="비밀번호"> </td>
    </tr>
    <tr>
      <td> <input type="submit" class="submit_form" value="로그인">
    </tr>
    <tr>
      <td aglign="center"><!-- 스타일 넣어보기~ -->
         <a href="userid_search.jsp">아이디찾기</a>
         <a href="pwd_search.jsp">비밀번호찾기</a>
      <a href="member.jsp"> 회원가입 </a>
      </td>
    </tr>
  </table>
   <p align="center"> <img src="../skybg.png" width="1100" height="200"> <p>
  
  </form>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

 
  
  