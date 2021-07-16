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
	height:2200px;
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
	
	String sql="select * from board order by id desc limit "+index+",10";
	
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
%>
<c:import url="../top2.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 -->
<p align="center"> <img src="../jejuboard.jpg" width="1100" height="200"> <p>

<div class="main_text3">
	<h1 style="color:orange;font-size:50px;">" 생생한 여행후기 "</h1>
        
        <div class="contents3"> <span style="font-size:25px;color:black;"> * 실제 회원님들의 생생한 여행 후기 Best를 담았습니다.  </span> </div>
        
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="../jejufamily.jpg">
            </div>
            <div class="contents3_bold" style="font-size:20px;">가족 할인권 공동구매</div>
            <div class="contents3">
             공동구매로 50% 할인가에 이용해봐요!  
            </div>
             <div class="more">
              <span style="cursor:pointer;" onclick="location='../board/content.jsp?id=41'">클릭하기</span>
            </div>
            
          </li>

          <li>
            <div class="icon_img">
              <img src="../jejuyoutube.jpg">
            </div>
            <div class="contents3_bold" style="font-size:20px;" >제주 유투버가 된 후기</div>
            <div class="contents3">
                제주한달살기  4인동행체험 브 이로그 
            </div>
            <div class="more">
           <span style="cursor:pointer;" onclick="location='../board/content.jsp?id=42'">클릭하기</span>
            </div>
          </li>

                   <li>
            <div class="icon_img">
              <img src="../kakaoev.png">
            </div>
            <div class="contents3_bold" style="font-size:20px;" >카카오혜택확인하기>></div>
            <div class="contents3">
               
            </div>

          </li>

        </ul>
      </div>
    
   
   <hr>
      
	<div class="board_list_wrap">
	 <table class="board_list">
	 <caption style="padding-bottom:30px;font-size:32px"> [ 여행  후기 게시판 ] </caption>
	 
	 <tr>
	 	<td> 작성자 </td>
	 	<td> 제목  </td>
	 	<td> 조회수 </td>
	 	<td> 작성일 </td>
	 	
	 </tr>
	 <%
	 while(rs.next())
	 {
	 %>
	 <tr height="80">
	 	<td> <%=rs.getString("userid")%> </td>
	 	<td> <a href="viewcount.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("title")%></a> </td>
	 	<td> <%=rs.getString("viewcount")%> </td>
	 	<td> <%=rs.getString("reportingdate")%> </td>
	 	
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
       <a href="list.jsp?pager=<%=pstart-1%>"> ◀◀  </a>
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
       <a href="list.jsp?pager=<%=pager-1%>"> ◀ </a>
      <%
        }
        else
        {
      %>
                 ◀
      <%
        }
      
      String sql2="select count(*) as cnt from board";
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
        <a href="list.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a>
      <%
        }
      %>
      
      <%
      
       if(pager != page_cnt)
       {
      %>
        <a href="list.jsp?pager=<%=pager+1%>"> ▶ </a>
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
       <a href="list.jsp?pager=<%=pend+1%>"> ▶▶  </a>
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
		
	  <c:if test="${userid != null}">
	 <tr>
	 	<td colspan="6" align="center" style="padding-top:80px;border-top:2px solid navy;border-bottom:1px solid white;">

	 		<a href="write.jsp"> 회원 글쓰기 </a> &nbsp; &nbsp;
	 	</td>
	 </tr>
	 
	  </c:if>
	</table>
<!-- 모든 문서의 내용 끝 -->
</div>





