<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Board.*"%>
<%@ page import = "User.*" %>
<%@ page import ="zzim.*" %>
<%
	
	int pIdx = Integer.parseInt(request.getParameter("pIdx"));
	int userIdx = Integer.parseInt(request.getParameter("userIdx"));
	int pLike = Integer.parseInt(request.getParameter("pLike"));
	
	ZzimDAO zzimDAO = new ZzimDAO();
	ZzimDTO zzimDTO = new ZzimDTO();
	
	zzimDAO.zzimCancel(pIdx, userIdx, pLike);
	
%>
	<%=pLike-1 %>
