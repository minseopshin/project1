<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.ReserveDao"%>
<%	ReserveDao rdao = new ReserveDao();
	rdao.reserve_join_cancel(request);
	
	response.sendRedirect("reserve_check.jsp");
%>