<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="project.dao.ReserveDao" %>    
<%	ReserveDao rdao = new ReserveDao();
	rdao.reserve_ok(request,session);
	
	response.sendRedirect("reserve_content.jsp?id="+request.getParameter("id"));
%>    