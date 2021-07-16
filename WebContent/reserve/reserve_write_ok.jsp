<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="project.dao.ReserveDao" %>    
<% 	ReserveDao rdao = new ReserveDao();
	rdao.reserve_write_ok(request, session,response);
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	response.sendRedirect("reserve_board_current.jsp?year="+year+"&month="+month+"&day="+day);
%>