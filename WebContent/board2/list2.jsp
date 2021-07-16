<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao2" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.dto.BoardDto2" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
#third{
	width:1100px;
	height:2200px;
	margin:auto;
	text-align:center;	/*글쓰는내용에서는 반드시 추가 */
	
}

</style>







<%
	BoardDao2 bdao2=new BoardDao2();
	ArrayList<BoardDto2> list=bdao2.list();
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
	
	String sql="select * from board2 order by id desc limit "+index+",10";
	
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
%>
<c:import url="../top3.jsp"/><!-- 외국인전용게시판만 top3사용/ 중국어간체와 한글 사이즈 차이부분에서 스타일 깨짐 방지 -->
<div id="third">
<!-- 모든 문서의 내용 시작 -->
<p align="center"> <img src="../bluebg.png" width="1100" height="35"> <p>

   

<div class="main_text3">
	<h1 style="color:#fd5155;font-size:65px;">" 推荐外国人旅游景点 "</h1>
        
        <div class="contents3"> <span style="font-size:25px;color:black;"> 中国人也可以去济州岛的旅行!  </span> </div>
        

        
             <div class="contents3"> <span style="font-size:25px;color:black;">  欢迎来到济州岛。 和新的韩国朋友们一起制造美好的回忆吧。  </span> </div>
        
        
        
        
        
        <ul class="icons">
          <li>
            <div class="icon_img">
              <span style="cursor:pointer;" onclick="location='../board/flist2.jsp'"><img src="../cjejumain.jpg"></span>
              
              <span style="cursor:pointer;color:blue;text-decoration:underline" onclick="location='../board2/siteinfo2.jsp'"> ▶ 著名的旅游景点说明 </span>
            </div>
            <div class="contents3_bold" style="font-size:25px;"></div>
            <div class="contents3">
            
            </div>

            
          </li>

          <li>
            <div class="icon_img">
              <img src="../cjejureserve.png" width="230px;">
               <span style="cursor:pointer;color:blue;text-decoration:underline" onclick="location='../reserve/reserve.jsp'"> ▶ 立即在线预约</span>
            </div>



          </li>

                   <li>
            <div class="icon_img">
              <img src="../cjejukakao.jpg" width="310px;">
            </div>
            <div class="contents3_bold"><span style="cursor:pointer;color:blue;text-decoration:underline;font-size:30px;">▶ SNS确认优惠>></span>
            <p>
            <span style="cursor:pointer;color:blue;text-decoration:underline;font-size:30px;">
           	 ▶ 微信WeChat>></span>
            </div>
            <div class="contents3">
               
            </div>

          </li>


        </ul>
        
        
      </div>
    

      <p align="center" style="margin-top:-10px;"> <img src="../cjeju.jpg" width="1100" height="720"> <p>
   
   <hr>
      
	<div class="board_list_wrap">
	 <table class="board_list">
	 <caption style="padding-bottom:30px;font-size:35px"> [ 旅行后记公告栏 ] </caption>
	 
	 <tr>
	 	<td> 作者 </td>
	 	<td> 题目  </td>
	 	<td> 点击率 </td>
	 	<td> 写作日期 </td>
	 	
	 </tr>
	 <%
	 while(rs.next())
	 {
	 %>
	 <tr height="90">
	 	<td> <%=rs.getString("userid")%> </td>
	 	<td> <a href="viewcount2.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("title")%></a> </td>
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
      
      
    <!-- 페이징 처리 -->
      <%
        if(pager != 1)
        {
      %>
       <a href="list2.jsp?pager=<%=pager-1%>"> ◀ </a>
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
        <a href="list2.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a>
      <%
        }
      %>
      
      <%
      
       if(pager != page_cnt)
       {
      %>
        <a href="list2.jsp?pager=<%=pager+1%>"> ▶ </a>
      <%
       }
       else
       {
      %>
                     ▶
      <%
       }
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

	 		<a href="write2.jsp"> 会员写作 </a> &nbsp; &nbsp;
	 	</td>
	 </tr>
	 
	  </c:if>
	</table>
<!-- 모든 문서의 내용 끝 -->
</div>









