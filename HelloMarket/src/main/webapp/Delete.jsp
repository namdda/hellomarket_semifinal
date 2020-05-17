<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page  import="Board.*" %>



<%
		request.setCharacterEncoding("UTF-8");
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		BoardDTO boarddto = new BoardDTO();
		BoardDAO boardDAO = new BoardDAO();
		//boardDAO.DeleteBoard(p_idx);
%>
<%  
	int like = boardDAO.DeleteLike(p_idx);
	int num = boardDAO.DeleteBoard(p_idx); 

	if(like >=1 ){
		

	if(num >=  1){
%>
	<script>
		alert("게시글 삭제 성공");
		location.href="/HelloMarket/Main.jsp";
	</script>
<%}else{ 
System.out.println(num);
%>
	<script>
		alert("게시글 삭제 실패");
		history.back();
	</script>
<% } 
	}
%>

