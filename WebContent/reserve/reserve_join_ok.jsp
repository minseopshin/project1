<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%	ReserveDao rdao = new ReserveDao(); 
	rdao.reserve_join_ok(request, session);
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	response.sendRedirect("reserve_join_current.jsp?id="+request.getParameter("reserveid")+"&year="+year+"&month="+month+"&day="+day);
%>    