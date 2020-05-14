<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*"%>
<%
	String myNick = request.getParameter("myNick");
	String yourNick =request.getParameter("yourNick");
	
	UserDAO userDAO = new UserDAO();
	
	userDAO.following(myNick, yourNick);
	
%>