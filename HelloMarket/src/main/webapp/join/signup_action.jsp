<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.UserDAO"%>
<%@ page import = "java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="User.UserDTO"/>
<jsp:setProperty property="userId" name="user"/>
<jsp:setProperty property="userPass" name="user"/>
<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	if(result== -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		session.setAttribute("userID",user.getUserId());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료 되었습니다.')");
		script.println("location.href = '../login/login.html'");
		script.println("</script>"); 
	}
%>