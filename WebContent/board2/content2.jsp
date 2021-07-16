<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao2" %>
<%@ page import="project.dto.BoardDto2" %>
<%
	BoardDao2 bdao2=new BoardDao2();
	BoardDto2 bdto2=bdao2.content2(request);
	pageContext.setAttribute("bdto2",bdto2);

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<style>
#third{
	width:1100px;
	height:1200px;
	margin:auto;
}
</style>




<c:import url="../top3.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 -->
 <p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>

  	<div class="my_list_wrap">
	 <table class="my_list">
	 
 <caption style="padding-bottom:30px;font-size:40px;"> 旅行后记内容 </caption>
	
	
		<tr height="30">
			<td> 作者 </td>
			<td> ${bdto2.userid} </td>
			<td> 点击率 </td>
			<td> ${bdto2.viewcount} </td>
			<td> 写作日期 </td>
			<td> ${bdto2.reportingdate} </td>
		</tr>
		<tr height="60">
			<td style="text-align:center;"> 题目 </td>
			<td colspan="5"> ${bdto2.title} </td>
		</tr>
		<tr height="200">
			<td> 内容 </td>
			<td colspan="5"> ${bdto2.content} </td>
		</tr>
		<!-- 사진 td 추가 -->
		<c:if test="bdto.fname != null}">
		<tr height="430">
			<td> 相片 </td>
			<td colspan="5"> <img src="img/${bdto2.fname}" width="300" height="300"> </td>
		</tr>
		</c:if>
		<tr>
		 <td colspan="6" align="center" style="padding-top:80px;border-top:2px solid navy;border-bottom:1px solid white;word-spacing:30px;" >
			<c:if test="${userid == bdto2.userid}">
			<input type="button" value="目录" class="submit_form2" onclick="location.href='list2.jsp'">
			<input type="button" value="修改" class="submit_form2" onclick="location.href='update2.jsp?id=${bdto2.id}'">
			<input type="button" value="删除" class="submit_form2" onclick="location.href='delete2.jsp?id=${bdto2.id}'">
			</c:if>
			
			<c:if test="${userid != bdto2.userid}">
			<input type="button" value="目录" class="submit_form2" onclick="location.href='list2.jsp'">
			</c:if>
		 </td>
		</tr>
	</table>
	</div>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>