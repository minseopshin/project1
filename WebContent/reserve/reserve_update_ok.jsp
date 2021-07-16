<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@	page import="project.dao.ReserveDao" %>
<%@	page import="project.dto.ReserveJoinDto" %>
<%	ReserveDao rdao = new ReserveDao();
	rdao.reserve_update_ok(request);
	
	response.sendRedirect("reserve_check.jsp");
%>