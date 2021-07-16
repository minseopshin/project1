<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.dao.BoardDao2"%>
<%
	BoardDao2 bdao2=new BoardDao2();
	bdao2.delete2(request,response);
%>