<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.SingoDao" %>
<%@ page import="project.dto.SingoDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	SingoDao sdao=new SingoDao();
	ArrayList<SingoDto> slist=sdao.slist();
	pageContext.setAttribute("slist",slist);
%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">
<style>
#third{
	width:1100px;
	height:1100px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}
</style>
<%
	Class.forName("com.mysql.jdbc.Driver");
String db="jdbc:mysql://localhost/project";
Connection conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	
	int pager;
	if(request.getParameter("pager")==null)
		pager=1;
	else
		pager=Integer.parseInt(request.getParameter("pager"));
	
	int index=(pager-1)*10;
	
	String sql="select * from singo order by id desc limit "+index+",10";

	
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
%>
<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
<p align="center"> <img src="../partyslide.jpg" width="1100" height="160"> <p>

	<div class="board_list_wrap">
	 <table class="board_list" >
	 <caption style="padding-bottom:30px"> 신고 확인  </caption>
	<thead>
	 <tr>
	  <th width="100"> 피신고자 </th>
	  <th width="300"> 신고 분류 </th>
	  <th> 기타 사항 </th>
	 </tr>
	</thead>
	 <%
	 while(rs.next())
	 {
	 %>
	 <tr height="60">
	 	<td> <%=rs.getString("baduser") %> </td>
	 	<td> <%=rs.getString("sname")%> </td>
	 	<td> <%=rs.getString("scontent")%> </td>
	 
	 </tr>
	 <%
	 }
	 %>
 <!-- 페이지 이동 -->
	<%
 
       int pstart=pager/10;
    
       if(pager%10 == 0)
          pstart=pstart-1;
       
       pstart=Integer.parseInt(pstart+"1"); 
       int pend=pstart+9;
       
     %>
    <tr>
      <td colspan="4" align="center">
      <!-- 그룹단위이동 -->
      <%
      if(pstart != 1)
      {
      %>
       <a href="singo_mange.jsp?pager=<%=pstart-1%>"> ◀◀  </a>
      <%
      }
      else
      {
      %>
                ◀◀
      <%
      }
      %>
      
      <!-- 1페이지 이동 -->
      <%
        if(pager != 1)
        {
      %>
       <a href="singo_mange.jsp?pager=<%=pager-1%>"> ◀ </a>
      <%
        }
        else
        {
      %>
                 ◀
      <%
        }
      
      String sql2="select count(*) as cnt from singo";
      Statement stmt2=conn.createStatement();
      ResultSet rs2=stmt2.executeQuery(sql2);
      rs2.next();
      int cnt=rs2.getInt("cnt");  
      
      int page_cnt=cnt/10;
      
      if(cnt%10 != 0)
   	  page_cnt++; 
      
      
        if(pend > page_cnt)
        	pend=page_cnt;
   	  
        String str=null;
        for(int i=pstart;i<=pend;i++)
        {
           if(pager==i) 			
            str="style='color:red'";
           else
        	str="";
      %>
        <a href="singo_mange.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a>
      <%
        }
      %>
      
      <%
      
       if(pager != page_cnt)
       {
      %>
        <a href="singo_mange.jsp?pager=<%=pager+1%>"> ▶ </a>
      <%
       }
       else
       {
      %>
                     ▶
      <%
       }
      %>
      <!-- 그룹단위이동 -->
      <%
      if(pend != page_cnt)
      {
      %>
       <a href="singo_mange.jsp?pager=<%=pend+1%>"> ▶▶  </a>
      <%
      }
      else
      {
      %> 
                  ▶▶
      <%
      }
        conn.close();
      %>
      </td>
    </tr>
		<%
		stmt.close();
		stmt2.close();
		%>
	 <!-- 페이지 -->
	

	 
	 
	</table>
	</div>
<!-- 모든 문서의 내용 끝 -->
</div>
<c:import url="../bottom.jsp"/>