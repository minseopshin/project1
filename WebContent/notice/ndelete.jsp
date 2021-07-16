<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.NoticeDao"%>
<%
	NoticeDao ndao=new NoticeDao();
	ndao.ndelete(request,response);
%>