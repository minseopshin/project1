<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.MemberDao"%>
<%
	MemberDao mdao=new MemberDao();
	mdao.user_state_change(request,response);
%>