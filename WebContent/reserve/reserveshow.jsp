<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:1100px;
	height:1800px;
	margin:auto;
	
	
}
</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>

 
 
<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
<!-- 모든 문서의 내용 시작 -->
	<!--  새로운 시트 바뀔 때마다 요 중간 부분만 바뀐다!!  -->
 <p align="center"> <img src="../skyslide.jpg" width="1100" height="180"> <p>

<div class="main_text0">
	<h1 style="color:navy;font-size:50px;">Travel recommendation</h1>
        
        <div class="contents1"> <span style="font-size:25px;color:black;"> 제주 여행의 모든것! 함께하는 가치 행복한 동행 !</span><p>
        
        <span style="font-size:20px;color:red;"> ※ 원하는 분야를 클릭하면 상세카테고리페이지로 연결됩니다.</span> 
         </div>
        
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="../jejuyellow.jpg">
            </div>
            <div class="contents1_bold">관광명소</div>
            <div class="contents2">
               Tv, 드라마 촬영 핫플부터 사진찍기 좋은 장소!
            </div>
            <div class="more">
              <span style="cursor:pointer;" onclick="location='../recom/jeju_list.jsp?menu=place'">명소검색</span>
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../jejufood.jpg">
            </div>
            <div class="contents1_bold">맛집/카페</div>
            <div class="contents2">
                여행의 별미는 역시 ! 유투버들에게 Hot한 장소 추천!
            </div>
            <div class="more" style="display:inline-block;">
              <span style="cursor:pointer;" onclick="location='../recom/jeju_list.jsp?menu=cafe'">카페검색</span>
            </div>
			<div class="more" style="display:inline-block;">
              <span style="cursor:pointer;" onclick="location='../recom/jeju_list.jsp?menu=food'">음식검색</span>
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../jejuact.jpg">
            </div>
            <div class="contents1_bold">액티비티</div>
            <div class="contents2">
               호캉스!바캉스! 잊지못할 추억의 액티비티!
            </div>
            <div class="more">
              <span style="cursor:pointer;" onclick="location='../recom/jeju_list.jsp?menu=activity'">액티비티</span>
            </div>
          </li>
        </ul>
      </div>
      
     <!-- 2번째 섹션 -->
            <div class="main_text0">
	
        
        <div class="contents1" style="padding-top:90px;padding-bottom:60px;"><span style="font-size:25px;color:black;"> ■ 생생한 동행 여행 후기를 지금 바로 만나보세요! ■ </span> </div>
        <tr>
        	<td><span style="font-size:20px;color:#fd5155;margin-left:35px;margin-top:50px;text-decoration:underline;">
        	<i><span style="cursor:pointer;" onclick="location='../board/list.jsp'"> 여행 후기 바로가기 >> </span></i> 
        	</span></td>
        </tr>
        
          
        
        
        <ul class="icons2">
          <li>
            <div class="icon_img">
              <img src="../jejuyoutube.jpg">
            </div>
            <div class="contents1_bold">유투버픽</div>
            <div class="contents2">
               	인기유투버들의 Hot한 촬영장소! 조회수 100만! 
            </div>
            <div class="clickclick">
              <span style="cursor:pointer;" onclick="location='../board/content.jsp?id=41'"> click </span>
              
     
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../jejufamily.jpg">
            </div>
            <div class="contents1_bold">가족후기best</div>
            <div class="contents2">
                	우리아이에게 새로운 추억을 선물하세요
            </div>
            <div class="clickclick">
               <span style="cursor:pointer;" onclick="location='../board/content.jsp?id=41'"> click </span>
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../jejufour.jpg">
            </div>
            <div class="contents1_bold">사계절top1추천</div>
            <div class="contents2">
               어머!여긴 꼭가야해! 넘버원 인기 장소!
            </div>
            <div class="clickclick">
               <span style="cursor:pointer;" onclick="location='../board/content.jsp?id=41'"> click </span>
            </div>
          </li>
        </ul>
      </div>
      
      
         
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>

  
  
