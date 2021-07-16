<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ page import="project.dao.JejuCafeDao" %>
<%@ page import="project.dto.JejuCafeDto" %>
<%@ page import="java.util.ArrayList" %>
<%	JejuCafeDao jcdao = new JejuCafeDao(); 
	ArrayList<JejuCafeDto> jlist = jcdao.jeju_map(request);
	
	
	String menu = request.getParameter("menu");
	
	pageContext.setAttribute("jlist", jlist);
	pageContext.setAttribute("menu", menu);
%>  



<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:1800px;
	height:1100px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}
</style>
<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
			<p align="center"> <img src="../bluebg.png" width="1800" height="35"> <p>



     
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
</head>
<body>

<table width=950px; style="margin-left:410px;text-align:center;">
<h1 style="color:#4632fc;font-size:40px;">제주도 지도보기</h1>
<h1 style="color:black;font-size:20px;padding-bottom:60px;">※ 원하는 장소를 클릭하면 상세정보 및 위치 페이지로 이동합니다.</h1>



	<tr>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=한경">한경</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=한림">한림</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=애월">애월</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=제주시">제주</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=조천">조천</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=구좌">구좌</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=추자">추자도</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=비양도">비양도</a></td>
	</tr>
	<tr>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=대정">대정</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=안덕">안덕</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=중문">중문</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=서귀포시">서귀포</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=남원">남원</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=표선">표선</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=성산">성산</a></td>
		<td class="submit_form6"><a href="total_map.jsp?menu=${menu}&region=우도">우도</a></td>
	</tr>
</table>


<div id="map" style="margin-left:300px;width:1200;height:650px;"></div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=975812a387e0775c1518fcc94bac6548&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var positions = [];
var content = [];

<c:forEach var="jdto" items="${jlist}">
var roadaddr = "<c:out value='${jdto.addr}'/>"
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
        if (${menu == "cafe"})	{
        var infowindow = new kakao.maps.InfoWindow({
        	
            content: '<div style="font-size:70px; width:200px;text-align:center;padding:6px 0;"><a href="jeju_cafecontent.jsp?id=${jdto.id}"><font size="0.5px"><c:out value='${jdto.title}'/></font></a></div>'
        });
        infowindow.open(map, marker);
        }
        if (${menu == "place"})	{
            var infowindow = new kakao.maps.InfoWindow({
            	
                content: '<div style="font-size:70px;width:200px;text-align:center;padding:6px 0;"><a href="jeju_place_content.jsp?id=${jdto.id}"><font size="0.5px"><c:out value='${jdto.title}'/></font></a></div>'
            });
            infowindow.open(map, marker);
            }
        if (${menu == "food"})	{
            var infowindow = new kakao.maps.InfoWindow({
            	
                content: '<div style="width:200px;text-align:center;padding:6px 0;"><a href="jeju_food_content.jsp?id=${jdto.id}"><font size="0.5px"><c:out value='${jdto.title}'/></font></a></div>'
            });
            infowindow.open(map, marker);
            }
        if (${menu == "activity"})	{
            var infowindow = new kakao.maps.InfoWindow({
            	
                content: '<div style="font-size:30px;width:200px;text-align:center;padding:6px 0;"><a href="jeju_activity_content.jsp?id=${jdto.id}"><font size="0.5px"><c:out value='${jdto.title}'/></font></a></div>'
            });
            infowindow.open(map, marker);
            }

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</c:forEach>
</script>


</div>


</body>
</html>

<c:import url="../bottom.jsp"/>

