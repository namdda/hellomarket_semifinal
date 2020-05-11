<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>

<%
 	String userNick = request.getParameter("user_nick");
	String userId = (String) session.getAttribute("userId");	
	session.setAttribute("userNick", userNick);
	System.out.println(userNick);
	
	UserDAO userDAO = new UserDAO();
	userDAO.changeUserNick(userId, userNick);
%>
