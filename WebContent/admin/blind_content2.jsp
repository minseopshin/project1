<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao2" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.dto.BoardDto" %>
<%
	BoardDao2 bdao2=new BoardDao2();
	bdao2.blind_content2(request, response);
%>