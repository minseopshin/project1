<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="project.dao.MemberDao"%>
<%@ page import="project.dto.MemberDto"%>
<%
	MemberDao mdao=new MemberDao();
	MemberDto mdto=mdao.member_info(session);
	
	pageContext.setAttribute("mdto", mdto);
%>

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
	<!--  새로운 시트 바뀔 때마다 요 중간 부분만 바뀐다!!  -->
<p align="center"> <img src="../orangebg.png" width="1100" height="20"> <p>

<form name="pkc" method="post" action="member_update_ok.jsp">
    	<div class="my_list_wrap">
	 <table class="my_list">
    <caption style="padding-bottom:30px">회원 정보 수정 </caption>
      <tr>
        <td> 아이디 </td>
        <td> ${mdto.userid} </td>
      </tr>
      <tr>  
        <td> 이메일 </td>
        <td> <input type="text" name="email" class="text_form2" value="${mdto.email}"> </td>
      </tr>
      <tr>
        <td> 카카오톡 ID </td>
        <td> <input type="text" name="kakao" class="text_form2" value="${mdto.kakao}"> </td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td> <input type="text" name="phone" class="text_form2" value="${mdto.phone}"> </td>
      </tr>
      <tr align="center">
        <td colspan="2"> <input type="submit" class="submit_form2" value="정보수정"> </td>
      </tr>
    </table>
    
    </div>
  </form>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  
  

  
  