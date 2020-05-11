<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>
<%@ page import="org.json.simple.*" %>


<%
	CouponDTO couponDTO = new CouponDTO();

	int c_idx = Integer.parseInt(request.getParameter("c_idx"));
	String userId = (String) session.getAttribute("userId");
	
	CouponDAO couponDAO = new CouponDAO();
	couponDTO = couponDAO.choicedCoupon(c_idx,userId);
	
	JSONObject json = new JSONObject();
	json.put("c_name",couponDTO.getCouponName());
	json.put("c_price",couponDTO.getCouponPrice());
	json.put("c_couponterms",couponDTO.getCouponTerms());
	json.put("c_idx",couponDTO.getCouponIdx());
	out.println(json);
	
			
%>
