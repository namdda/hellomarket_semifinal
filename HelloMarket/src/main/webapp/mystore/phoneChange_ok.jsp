<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.UserDAO" %>

<%
	int userPhone = Integer.parseInt(request.getParameter("user_ph"));
	String userId = (String) session.getAttribute("userId");

	UserDAO userDAO = new UserDAO();
	userDAO.changePhone(userId, userPhone);
	
%>