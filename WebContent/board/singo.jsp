<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="project.dao.BoardDao" %>
<%@ page import="project.dto.BoardDto" %>
<%
	BoardDao bdao=new BoardDao();
	BoardDto bdto=bdao.content(request);
	pageContext.setAttribute("bdto",bdto);
	/* String chk=request.getParameter("chk");
	pageContext.setAttribute("chk",chk); */
%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">

<style>
#third{
	width:1100px;
	height:1100px;
	margin:auto;
	/*text-align:center;*/	/*글쓰는내용에서는 반드시 추가 */
	
}
</style>


<style>



 #etcTxtBox{
 	visibility:hidden;
 	padding-left:50px;
 }
</style>
<script>
function showta(id) {
	document.all.etcTxtBox.style.visibility="visible";
}
function hidta(id) {
	document.all.etcTxtBox.style.visibility="hidden";
}
function finish() {
	alert("신고가 성공적으로 접수되었습니다.")
}
</script>
<c:import url="../top2.jsp"/>


	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->

<p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>


<!-- 문서내용// 항상 top에 오는 부분 -->
<div id="third">
<!-- 모든 문서의 내용 시작 -->

	 <h1 style="color:black;font-size:30px;text-align:center;"> 게시물 신고하기  </h1>
	 	  <form method="post" action="singo_ok.jsp?state=${bdto.state}&singo=${bdto.singo}&userid=${bdto.userid}&id=${bdto.id}">
	   
	  <div class="my_reserve_wrap"> 
	  	 <table class="my_list" >
	   <tr height="80px">
	   	<td> 제목  : ${bdto.title}</td>
	   	<td>&nbsp;</td>
	  	<td> 작성자 : ${bdto.userid} </td>
	  	
	  	
	  	</table>
</div>


	  <div class="my_reserve_wrap"> 
	  	 <table class="my_list" >

	 
	 
<li style="list-style-type:none;font-size:25px;color:red;"> ※ 신고사유 선택 : 여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요. </li><p>


	  	
	  		 
	 <input type="hidden" name="id" value="${bdto.id}">
	 <input type="hidden" name="singo" value="${bdto.singo}">
	 <input type="hidden" name="singo" value="${bdto.state}">
	  	
	  	
	  	 <li style="list-style-type:none;font-size:20px;">
			<input type="radio" onclick="hidta('etcTB')" name="sname" value="1"> 부적절한 아이디<p>
		 </li>
		 <li style="list-style-type:none;font-size:20px;">
		  	<input type="radio" onclick="hidta('etcTB')" name="sname" value="2"> 부적절한 홍보 게시글 <p>
		 </li>
		 <li style="list-style-type:none;font-size:20px;">
		  	<input type="radio" onclick="hidta('etcTB')" name="sname" value="3"> 음란성 또는 청소년에게 부적합한 내용 <p>
		 </li>
		 <li style="list-style-type:none;font-size:20px;">
		  	<input type="radio" onclick="hidta('etcTB')" name="sname" value="4"> 명예훼손/사생활 침해 등 <p>
		 </li>
		 <li style="list-style-type:none;font-size:20px;">
		  	<input type="radio" onclick="hidta('etcTB')" name="sname" value="5"> 불법촬영물등 신고 <p>
		 </li>
		 <li style="list-style-type:none;font-size:20px;">
		  	<input type="radio" onclick="hidta('etcTB')" name="sname" value="6"> 부적절한 프로필 사진 <p>
		 </li>
		 <li style="list-style-type:none;font-size:20px;">
		  	<input type="radio" onclick="showta('etcTB')" id="rdo_etc" name="sname" value="7"> 기타 
		 </li>
	  	
	  	
	  
	  	
	  	
	  	
	  	<div id="etcTxtBox">
	  	<textarea  placeholder="해당 신고는 운영자에게 전달됩니다." name="scontent" class="txt_area" style="width:405px; height:80px;"></textarea>
        </div>
        
        
       
	  	<dd> <input type="submit" style="margin-left:400px;" class="submit_form2" value="신고하기" onclick="finish()"> </dd>
	  </dl>
	 </div>
	 </form>
	
	 </table>
	 
	</div>
	</form>
	</div>
	
	
	 
</div>
<c:import url="../bottom.jsp"/>
