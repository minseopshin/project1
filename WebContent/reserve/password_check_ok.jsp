<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="project.dao.MemberDao" %>
<%	MemberDao mdao = new MemberDao(); 
	mdao.password_check_ok(request,session,out);
%>    