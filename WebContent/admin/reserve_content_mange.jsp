<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.dto.BoardDto" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	BoardDao bdao=new BoardDao();
	ArrayList<BoardDto> list=bdao.list();
	pageContext.setAttribute("list",list);
%>
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
	
	String sql="select * from reserve order by id desc limit "+index+",10";
	
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
%>
<c:import url="../top2.jsp"/>
<div id="third">


	<p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>
<!-- 모든 문서의 내용 시작 -->


  	<div class="my_reserve_wrap" align="center">
	 <table class="my_reserve" align="center">
	 
	 
	
	  <caption style="padding-bottom:30px">동행 게시판 관리 </caption>
	 
	 <tr align="center">
	 	<td> 작성자 </td>
	 	<td> 제목  </td>
	 	<td> 예약일자 </td>
	 	<td> 게시물 상태	</td>
	 	<td style="color:blue;"> 비공개처리하기/취소 </td>
	 	<td style="color:red;"> 삭제하기 </td>
	 </tr>
	 <%
	 while(rs.next())
	 {
	 %>
	 <tr align="center">
	 	<td> <%=rs.getString("userid")%> </td>		<!-- 조회수 포함X -->
	 	<td> <a href="../reserve/reserve_content.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("title")%></a> </td>
	 	<td> <%=rs.getString("date") %>
	 	<td> 
	 	<%if(rs.getInt("state")==0)
	 	{
	 	%>
	 	공개
	 	<%
	 	}
	 	else
	 	{
	 	%>
	 	비공개
	 	<%
	 	}
	 	%> 
	 	</td>
	 	<td> 
	 	<%
	 	if(rs.getInt("state")==0)
	 	{
	 	%>
	 	<a onclick="bc1()" href="reserve_state_change.jsp?id=<%=rs.getString("id")%>&state=<%=rs.getString("state")%>"> 클릭 </a> 
	 	<%
	 	}
	 	else
	 	{
	 	%>
	 	<a onclick="bc2()" href="reserve_state_change.jsp?id=<%=rs.getString("id")%>&state=<%=rs.getString("state")%>"> 클릭 </a>
	 	<%
	 	}
	 	%>
	 	</td>
	 	<td> <a onclick="dc()" href="reserve_state_change.jsp?id=<%=rs.getString("id")%>"> 클릭 </a> </td>
	 </tr>
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
      <td colspan="7" align="center">
      <!-- 그룹단위이동 -->
      <%
      if(pstart != 1)
      {
      %>
       <a href="board_content_mange.jsp?pager=<%=pstart-1%>"> ◀◀  </a>
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
       <a href="board_content_mange.jsp?pager=<%=pager-1%>"> ◀ </a>
      <%
        }
        else
        {
      %>
                 ◀
      <%
        }
      
      String sql2="select count(*) as cnt from reserve";
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
        <a href="board_content_mange.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a>
      <%
        }
      %>
      
      <%
      
       if(pager != page_cnt)
       {
      %>
        <a href="board_content_mange.jsp?pager=<%=pager+1%>"> ▶ </a>
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
       <a href="board_content_mange?pager=<%=pend+1%>"> ▶▶  </a>
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

	</table>
	</div>
<!-- 모든 문서의 내용 끝 -->
</div>
<script>
	function bc1()
	{
			alert("비공개 처리 되었습니다.");
	}
	function bc2()
	{
			alert("공개 처리 되었습니다.");
	}
	function dc()
	{
			alert("삭제 되었습니다.");		
	}

</script>
<c:import url="../bottom.jsp"/>