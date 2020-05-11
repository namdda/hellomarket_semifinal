<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
	String userNick = (String)session.getAttribute("userNick");
	String fileName = request.getParameter("user_pic");
	String savePath = "/Users/kyrie/Desktop/Java/WorkSpace/HelloMarket/WebContent/userPic/img/";
	System.out.println("현재경로 : " + savePath);
	System.out.println("현재경로 : " + fileName);
	
	String format = "UTF-8";
	int maxSize = 10 * 1024 * 1024;
	String uploadFile = null;
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, 
				new DefaultFileRenamePolicy());
		
		uploadFile = multi.getFilesystemName("formData");
		System.out.println(uploadFile);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>