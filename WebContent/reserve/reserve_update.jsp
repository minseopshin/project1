<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>
<%	ReserveDao rdao = new ReserveDao();
	ReserveDto rdto = rdao.reserve_update(request);
	
	pageContext.setAttribute("rdto", rdto);
%>  


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">


<style>
#third{
	width:2000px;
	height:800px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}

</style>
  
<script>
	function init()	{
		document.update.gender[${rdto.gender}].checked = true;
	}
	window.onload = function()	{
		init();
	}
</script>
<c:import url="../top2.jsp"/>
<div id="third">

	<form method="post" name="update" action="reserve_update_ok.jsp">
	
	<input type="hidden" value="${rdto.id}" name="id">
		
		
		<p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>

  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" width="700px">
	 
	 			 <caption style="padding-bottom:30px"> 게시물 수정 </caption>
	 
			<tr>
				<td>제목</td>
				<td><input type="text" class="text_form2" name="title" value ="${rdto.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="text_form4" name="content">${rdto.content}</textarea></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" value="0" name="gender">상관없음
					<input type="radio" value="1" name="gender">남자만
					<input type="radio" value="2" name="gender">여자만
			<tr>
				<td>인원</td>
				<td>
					<select name="min">
					<c:forEach var="i" begin="1" end="5">
						<option value="${i}">${i}</option>
					</c:forEach>
					</select>
				</td>
			<tr>
				<td>최대인원</td>
				<td>
					<select name="max">
					<c:forEach var="j" begin="1" end="5">
						<option value="${j}">${j}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center" style="padding-top:80px;border-top:2px solid navy;border-bottom:1px solid white;"><input type="submit" class="submit_form2" value="수정"></td>
			</tr>
		</table>
		</div>
	</form>
</div>
<c:import url="../bottom.jsp"/>