<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.MemberDao"%>
<%
	MemberDao mdao=new MemberDao();
	mdao.userid_search_ok(session, request, response);
%>