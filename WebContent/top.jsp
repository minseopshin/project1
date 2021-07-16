






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../main.css"> <!-- 앞에 .. 을붙이는 이유: 경로지정 없으면 무조건 같은 폴더에서 찾기 때문 -->
  <script>  
   function menu_over2(){ //id가 index_sub인 요소를 보여라
      document.getElementById("reserve_sub").style.visibility="visible";
   }
   function menu_out2(){ //id가 index_sub인 요소를 숨겨라
      document.getElementById("reserve_sub").style.visibility="hidden";
   }
   function menu_over3(){ 
	      document.getElementById("trip_sub").style.visibility="visible";
	}
	function menu_out3(){ 
	      document.getElementById("trip_sub").style.visibility="hidden";
	}
	function menu_over4(){ //id가 index_sub인 요소를 보여라
		      document.getElementById("notice_sub").style.visibility="visible";
	}
	function menu_out4(){ //id가 index_sub인 요소를 숨겨라
		      document.getElementById("notice_sub").style.visibility="hidden";
	}
   </script>
   <style>
      #reserve_sub{
         position:absolute;
         background:white;
         padding-left:0px;
         visibility:hidden;
         font-size: 1.0rem;
         }
         
      #reserve_sub li {
          list-style-type:none;
          width:170.5px;
          background-color: #0fb7cc;
          color:white;
          text-align:center;
         }
         
      #trip_sub{
         position:absolute;
         background:white;
         padding-left:0px;
         visibility:hidden;
         font-size: 1.0rem;
         }
         
      #trip_sub li {
          list-style-type:none;
          width:170.5px;
          background-color: #0fb7cc;
          color:white;
          text-align:center;
         }
       #notice_sub{
         position:absolute;
         background:white;
         padding-left:0px;
         visibility:hidden;
         font-size: 1.0rem;
         }
         
         
      #notice_sub li {
          list-style-type:none;
          width:170.5px;
          background-color: #0fb7cc;
          color:white;
          text-align:center;
         }
         
   </style>   
<title>Insert title here</title>
</head>
 <!-- Back to top button -->
   
    <div class="container">
        <div class="header">
        
                <img src="../logomain.png" width="150" height="150" style="margin-left:-60px;margin-top:40px;">            
       
            <div class="container bg-color-1"><a href="../main/index.jsp">
                <h1 class="text-white">JeJu Tour</h1></a>
            </div>
            

               
            <div id ="test" class="container color-8">
               
                   <ul id="test2">
                        <li class="item" onmouseover="menu_over2()" onmouseout="menu_out2()">
                            <a href="#reserve" class="tm-link">
                               <span>예약관리</span>
                            </a>
                            <ul id="reserve_sub">  
                        <li id="reserve1"><span style="cursor:pointer;" onclick="location='../reserve/siteinfo.jsp'">사이트소개</span></li>            
                        <li id="reserve1"><span style="cursor:pointer;" onclick="location='../reserve/reserve.jsp'">예약 하기</span></li>
                        <li id="reserve1"><span style="cursor:pointer;" onclick="location='../reserve/reserveselect.jsp'">나의 예약</span></li>
                     </ul>
                     
                        </li>
                      
                      
                        
                             <li class="item" onmouseover="menu_over3()" onmouseout="menu_out3()">
                            <a href="#chuchun" class="tm-link">
                               
                                <span style="cursor:pointer;" onclick="location='../reserve/reserveshow.jsp'">여행추천지</span>
                            </a>
                            

                     
                        </li>
                         
                        <li class="item" onmouseover="menu_over4()" onmouseout="menu_out4()">
                            <a href="#notice" class="tm-link">
                               
                                <span>공지사항</span>
                            </a>
                            
                             <ul id="notice_sub">         
                        <li id="notice1"> <span style="cursor:pointer;" onclick="location='../notice/nlist.jsp'">공 지 </span> </li> 
                        <li id="notice1"><span style="cursor:pointer;" onclick="location='../board/list.jsp'">여행 후기 </span></li>
                        <li id="notice1"><span style="cursor:pointer;" onclick="location='../board2/list2.jsp'">외국인/外国人推荐<!-- 외국인중국인게시판 --></span></li>
                     </ul>
                     
                     
                        </li>
                   
                     
                         <li class="item">
                         <c:if test="${userid ==null}">
                            <a href="../login/login.jsp" class="tm-link">
                               
                                <span class="tm-nav-text">로그인</span>
                            </a>
                            </c:if>
                            
                            <c:if test="${userid !=null}"> <!-- 널값이 아니어야 회원! -->
     
      <a href="../login/member_info.jsp" class="tm-link">
     
     <span class="tm-nav-text">${userid}님</span></a>
   </c:if>
   
   
   
                            
                        </li>
                    
          
                    

                    
                    </ul>
              
            </div>
        </div>
       
</div> <!-- 로고, 각 메뉴 -->
<div id="third"> <!-- 문서내용// 항상 top이 오는 부분 -->



