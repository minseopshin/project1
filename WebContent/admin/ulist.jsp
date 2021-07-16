<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.MemberDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.dto.MemberDto" %>
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


<%-- <%
	MemberDao mdao=new MemberDao();
	ArrayList<MemberDto> mlist=mdao.mlist();
	pageContext.setAttribute("mlist",mlist);
%> --%>
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
	
	String sql="select * from member where userid != 'admin' order by id desc limit "+index+",10";
	
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
%>
<c:import url="../top2.jsp"/>
<div id="third">
	<p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>
	
	<div class="board_list_wrap">
	 <table class="board_list" >
	 
<!-- 모든 문서의 내용 시작 -->
	
<caption style="padding-bottom:30px"> 회원 관리 페이지</caption>
	 <tr align="center">
	  <td> 아이디 </td>
	  <td> 이메일 </td>
	  <td> 카카오톡 아이디 </td>
	  <td> HP </td>
	  <td> 생년월일 </td>
	  <td> 성별 </td>
	  <td> 계정 상태 </td>
	  <td style="color:blue;"> 회원정지 </td>
	  <td style="color:red;"> 회원삭제 </td>
	 </tr>
	 <%
	 while(rs.next())
	 {
	 %>
	 <tr align="center">
	  <td> <%=rs.getString("userid") %> </td>
	  <td> <%=rs.getString("email") %> </td>
	  <td> <%=rs.getString("kakao") %> </td>
	  <td> <%=rs.getString("phone") %> </td>
	  <td> <%=rs.getInt("birth") %> </td>
	  <td>
	  
	   <%if(rs.getInt("gender")==1)
		{%>
		남
		<%
		}
		else
		{%> 
	         여
	   <%
		}
	   %>
	  </td>
	  <td> 
	  <%if(rs.getInt("state")==0)
	  {%>
	  	활동중
	  <%}
	  else if(rs.getInt("state")==1)
	  {%>
	  활동정지
	  <%
	  }
	  else
	  {
	  %>
	  추방
	  <%
	  }
	  %>
	  </td>
	  <td>
	  <%if(rs.getInt("state")==0) 
	  {%>
	   <a href="user_state_change.jsp?id=<%=rs.getString("id")%>&state=<%=rs.getString("state")%>"> 정지 </a> 
	  <%
	  }
	  else if(rs.getInt("state")==1)
	  {
	  %>
	   <a href="user_state_change.jsp?id=<%=rs.getString("id")%>&state=<%=rs.getString("state")%>"> 정지해제 </a>
	  <%
	  }
	  %>
	   </td>
	  <td> <a href="user_delete.jsp?id=<%=rs.getString("id")%>"> 삭제 </a> </td>
	 </tr>
	 <%
	 }
	 %>
	  <!-- 페이지 이동 -->
	  <br>
	 <%
 
       int pstart=pager/10;
    
       if(pager%10 == 0)
          pstart=pstart-1;
       
       pstart=Integer.parseInt(pstart+"1"); 
       int pend=pstart+9;
       
     %>
    <tr>
      <td colspan="9" align="center">
      <!-- 그룹단위이동 -->
      <%
      if(pstart != 1)
      {
      %>
       <a href="ulist.jsp?pager=<%=pstart-1%>"> ◀◀  </a>
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
       <a href="ulist.jsp?pager=<%=pager-1%>"> ◀ </a>
      <%
        }
        else
        {
      %>
                 ◀
      <%
        }
      
      String sql2="select count(*) as cnt from member";
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
        <a href="ulist.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a>
      <%
        }
      %>
      
      <%
      
       if(pager != page_cnt)
       {
      %>
        <a href="ulist.jsp?pager=<%=pager+1%>"> ▶ </a>
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
       <a href="ulist.jsp?pager=<%=pend+1%>"> ▶▶  </a>
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
<c:import url="../bottom.jsp"/>