<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.NoticeDao"%>
<%
	NoticeDao ndao=new NoticeDao();
	ndao.nupdate_ok(request);
	
	response.sendRedirect("nlist.jsp");
%>