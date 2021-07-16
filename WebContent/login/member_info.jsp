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
	<!--  새로운 시트 바뀔 때마다 요 중간 부분만 바뀐다!!  -->
<p align="center"> <img src="../orangebg.png" width="1100" height="20"> <p>

  
  	<div class="my_list_wrap">
	 <table class="my_list">
  
    <caption style="padding-bottom:30px"> 회원 정보 </caption>
    <tr>
      <td> 아이디 </td>
      <td> ${mdto.userid} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> ${mdto.email} </td>
    </tr>
    <tr>
      <td> 카카오톡ID </td>
      <td> ${mdto.kakao} </td>
    </tr>
    <tr>
      <td> 전화번호 </td>
      <td> ${mdto.phone} </td>
    </tr>
    <tr>
      <td> 생년월일 </td>
      <td> ${mdto.birth} </td>
    </tr>
    <tr><!-- 단어와 단어의 간격:word-spacing -->
      <td colspan="2" align="center" style="word-spacing:30px;border-bottom:1px solid white;">
      <c:if test="${userid !='admin'}">
      
        <a href="member_update.jsp">정보수정</a>
        <a href="member_out.jsp">회원탈퇴</a>
        
        </c:if>
        
        
    </tr>
    
    		<tr><!-- 관리자 페이지 영역 -->
    		 <td colspan="2" align="center" style="padding-top:10px;border-top:2px solid navy;" >

                         <c:if test="${userid =='admin'}">
                            <a href="../admin/ulist.jsp">       
                                [회원 관리] 
                            </a>
                           
                            
                            <a href="../admin/board_content_mange.jsp">       
                               [게시판 관리] 
                            </a>
                            <a href="../admin/reserve_content_mange.jsp">       
                               [동행 관리] 
                            </a>
                            <a href="../admin/reserve_join_content_mange.jsp">       
                               [동행 예약 관리] 
                            </a>
                             <a href="../admin/f_board_content_mange.jsp">       
                               [외국인 게시판 관리] 
                            </a>
                            
                            <a href="../admin/singo_mange.jsp">       
                               [신고 접수 내역] 
                            </a>
                            </c:if>
                            </td>
              </tr>
              <tr>
              <td colspan="2" align="center">
                            <a href="logout.jsp">       
                              [로그아웃] 
                            </a>
               </td>
                            
                            
             
                    
                    
   			</tr>
   
   
  </table>
  
  
 
   
   
   
   
   
   
   
   
   
  
  
  </div>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  
  
