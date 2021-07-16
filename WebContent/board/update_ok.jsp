<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.dto.BoardDto" %>
<%
	BoardDao bdao=new BoardDao();
	bdao.update_ok(request, response);
%>