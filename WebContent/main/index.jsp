
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<style>
#third{
	width:1800px;
	height:1000px;
	margin:auto;
}
</style>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>  
   var arr=["a1.jpg","a2.jpg","a3.jpg","a4.jpg","b1.jpg","b2.jpg","b3.jpg","b4.jpg"];
   var n=0;
   $(function()  
   {
	   $("#left").click(function()
	   {
		   if(n!=0) 
	    	 n--;
	       else
	    	 n=7; 
		   
		   $("#img").attr("src","img/"+arr[n]);
	   });
	   
	   $("#right").click(function()
	   {
		   if(n!=7)
	         n++;
	       else     
	    	 n=0;  
		   
		   $("#img").attr("src","img/"+arr[n]);
	   });
   });
 </script>
 
</head>

<c:import url="../top.jsp"/> 
	<div id="third" style="background:white;"> <!-- 문서내용// 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
	<!--  새로운 시트 바뀔 때마다 요 중간 부분만 바뀐다!!  -->
 <p align="center"> <img src="../bluebg.png" width="1800" height="45"> <p>

<body>
<div class="rightmain" style="display: inline-block;">
 <a href="#a" id="left" style="margin-left:110px;"> 

<img src="../pointleft.png" width="35" height="35">

</a>
  <img id="img" src="img/a1.jpg" width="900" height="520">
 <a href="#a" id="right"> 

<img src="../pointright.png" width="35" height="35">

 </a>
</div>



<div class="leftmain" style="display: inline-block;margin-top:-150px;margin-left:70px;">

<table width="400">

	
        <tr align="center">
          <td width="50%">
       
            <a href="../board2/list2.jsp"><img class="left" src="../icon/happy.png" width="130" style="background:#ffe3ec;border-radius:40%;"></a>
          </td>
          <td width="50%">
            <a href="../recom/jeju_list.jsp?menu=place"><img class="right" src="../icon/bike.png" width="130" style="background:#fcffdb;border-radius:40%;"></a>
             
           
          </td>  
        </tr>
        <tr align="center" >
        	<td><span onclick="location='../board2/list2'">외국인게시판</span></td>
        	<td><span onclick="location='../recom/jeju_list.jsp?menu=place'">관광명소</span></td>
        	        	 
        	  	
        </tr>
        
        <tr align="center">
          <td style="padding-top:30px;">
         
            <a href="../recom/jeju_list.jsp?menu=food"><img class="left" src="../icon/dish.png" width="130" style="background:#ffead2;border-radius:40%;"></a>
            </td>
          <td style="padding-top:30px;">
            
            <a href="../recom/jeju_list.jsp?menu=cafe"><img class="right" src="../icon/coffee-cup.png" width="130" style="background:#eadbff;border-radius:40%;"></a>

          </td>
        </tr>
        <tr align="center">
        	<td><span onclick="location='../recom/jeju_list.jsp?menu=food'">맛집</span></td>
        	<td><span onclick="location='../recom/jeju_list.jsp?menu=cafe'">카페</span></td>  
        	
        	  	
        </tr>
        <tr align="center">
          <td style="padding-top:30px;">
          
            <a href="../recom/jeju_list.jsp?menu=activity"><img class="left" src="../icon/kitesurfing.png" width="130" style="background:#dbfff9;border-radius:40%;" ></a>
             </td>
          <td style="padding-top:30px;">
            <a href="../reserve/reserve.jsp"><img class="right" src="../icon/support.png" width="130" style="background:#e9ffdb;border-radius:40%;" ></a>
 
          </td>
   		<tr align="center">
        	<td><span onclick="location='../recom/jeju_list.jsp?menu=activity'">액티비티</span></td>
        	<td><span onclick="location='../reserve/reserve.jsp'">예약하기</span></td>  
        	
        </tr>
        
      </table>


</div>



</body>
</html>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  




