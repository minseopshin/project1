<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="project.dao.MemberDao"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://192.168.0.139/project";
	Connection conn=DriverManager.getConnection(db,"project","1234");
	
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	
	String sql="select * from member where userid=? and pwd=?";
	
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, pwd);
	
	ResultSet rs=pstmt.executeQuery();
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	if(rs.next()==true)
	{
		if(rs.getInt("state")==0)
		{
			session.setAttribute("userid", rs.getString("userid"));
			pstmt.close();
			conn.close();
			
			
			if(year.equals("null"))	{
				response.sendRedirect("../main/index.jsp");
			}
			else	{
				response.sendRedirect("../reserve/reserve_board.jsp?year="+year+"&month="+month+"&day="+day);
			}
		}
		else
		{
			pstmt.close();
			conn.close();
			
			response.sendRedirect("login.jsp?userid="+userid);
		}
	}
	else
	{
		response.sendRedirect("login.jsp?userid="+userid);
	}
%>