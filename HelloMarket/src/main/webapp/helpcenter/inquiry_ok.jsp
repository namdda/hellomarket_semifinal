<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="inqDTO" class="User.InqDTO"/>
<jsp:setProperty property="*" name="inqDTO"/>
<jsp:useBean id="inqDAO" class="User.InqDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	inqDTO.setUserNick((String)session.getAttribute("userNick"));
	Boolean result = inqDAO.insertInquiry(inqDTO);

	if(result){
%>
	<script>
		alert("문의성공");
		location.href="./inqlist.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("문의실패");
		history.back();
	</script>
<%
	}
%>