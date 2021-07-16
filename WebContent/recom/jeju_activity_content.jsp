<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="project.dao.JejuActivityDao" %>
<%@ page import="project.dto.JejuActivityDto" %>
<%@ page import="java.util.ArrayList" %>
<%	JejuActivityDao jdao = new JejuActivityDao(); 
	JejuActivityDto jdto = jdao.jeju_activity_content(request);
	ArrayList<JejuActivityDto> jlist = jdao.jeju_activity_photo(request);
	
	pageContext.setAttribute("jdto",jdto);
	pageContext.setAttribute("jlist",jlist);
%>
   
   
   
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:1900px;
	height:2600px;
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
var brr = []
var n = 0;
$(function(){
	$("#left").click(function()	{
		if(n!=0)	{
			n--;
		}
		else	{
			n=brr.length-1;
		}
		$("#photo").attr("src",brr[n])
		$(".photo").eq(0).attr("src",brr[n])
		$(".photo1").eq(brr.length-1).insertBefore($(".photo1").eq(0));	
		
	});
	$("#right").click(function()	{
		if(n!=brr.length-1)	{
			n++;
		}
		else	{
			n=0
		}
		$("#photo").attr("src",brr[n])
		$(".photo1").eq(0).insertAfter($(".photo1").eq(brr.length-1));
	});
	$('.photo1').each(function(){ 
		var a = $(this).attr("src")
		brr.push(a);
	});
	$(".photo1").click(function(){
		var b = $(this).attr("src")
		for(i=0;i<brr.length;i++)	{
			if(brr[i] == b)	{
				n = i;
			}
		}
		$("#photo").attr("src",b)
	});
	$(window).load(function(){
		$("#photo").attr("src",brr[0])
	
	});
});
</script>
<style>
	img{}
	#photo {}
	#main {width:1000px; height:100px;overflow:hidden; display:inline-block;} /*border=1*/
	#sub {width:750px; height:100px;}
</style>
</head>





<c:import url="../top2.jsp"/>
<div id="third">
	<p align="center"> <img src="../bluebg.png" width="1900" height="35"> <p>
	
<body>
  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
	
	<h1 style="color:black;font-size:35px;margin-left:20px;padding-bottom:30px;"  >[투어 추천 BEST]</h1>
	
	
	
		<tr>
			<td rowspan="4" width="500">
				<img src="${jdto.thumbnailpath}" width="500" height="400">
			</td>
			<td>이름</td>
			<td id="title">${jdto.title}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${jdto.phone}</td>
		</tr>
		<tr>
			<td>지번주소</td>
			<td>${jdto.addr}</td>
		</tr>
		<tr>
			<td>도로명주소</td>
			<td id="roadaddr">${jdto.roadaddr}</td>
		</tr>
	</table>
	
	
	
	  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
		<tr>
			<td width="200" height="500">상세설명</td>
			<td colspan="2">${jdto.content}</td>
	</table>
	
	
	<div style="margin-top:80px;">
		<img id="photo" src="" width="600" height="300">
	</div>
	
	<div id="sub" style="margin-left:-250px;margin-bottom:100px;" >

		<div id="main" >
			<c:forEach var="jpdto" items="${jlist}">
			
			<img class="photo1" style="margin-top:30px;" src="activity_photo/${jdto.title}/${jpdto.photo}" width="150" height="120">
			</c:forEach>
		</div>
		
		<div style="margin-top:100px;padding-left:250px;">
		<a href="#a" id="left"> 

	<img src="../pointleft.png" width="25" height="25">

 		</a>
		
		
		<a href="#a" id="right"> 
		
		<img src="../pointright.png" width="25" height="25">
		 </a>
		 </div>
	</div>
	
	

	<div id="map" style="width:1000px;height:450px;margin-top:200px;" ></div>
	
	
	
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	975812a387e0775c1518fcc94bac6548&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {center: new kakao.maps.LatLng(33.450701, 126.570667), level: 3};	// 지도의 중심좌표,지도의 확대 레벨  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var roadaddr = "<c:out value='${jdto.roadaddr}'/>"
		var title = "<c:out value='${jdto.title}'/>"
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(roadaddr, function(result, status) {
    		// 정상적으로 검색이 완료됐으면 
     		if (status === kakao.maps.services.Status.OK) {
        		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        		// 결과값으로 받은 위치를 마커로 표시합니다
        		var marker = new kakao.maps.Marker({
            		map: map,
            		position: coords
        		});
       			// 인포윈도우로 장소에 대한 설명을 표시합니다
       			
       			var infowindow = new kakao.maps.InfoWindow({
            		content: '<div style="width:150px;text-align:center;padding:6px 0;">'+title+'</div>'
        		});
        		infowindow.open(map, marker);
        		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        		map.setCenter(coords);
    		} 
		});    
	</script>
	
	
	
	<div style="margin-top:70px;"><input type="button" class="submit_form2" onclick="location='jeju_list.jsp?menu=activity'" value="목록으로"></div>
	
	
	
	
</body>
</html>
</div>
</div>
</div>
<c:import url="../bottom.jsp"/>

