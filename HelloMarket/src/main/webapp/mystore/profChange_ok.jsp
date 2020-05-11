<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.UserDAO" %>
<%@ page import = "User.UserDTO" %>

<%
	String userProf = request.getParameter("user_prof");
	String userId = (String) session.getAttribute("userId");
	
	UserDAO userDAO = new UserDAO();
	userDAO.changeProfile(userId, userProf);
	
	
%>