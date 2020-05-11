<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    isELIgnored="false" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!-- 여기까지는 upload_ok에도 있었던 것 -->

<%@page import="Board.MyBoardDTO" %>
<%@page import="Board.MyBoardDAO" %>
<jsp:useBean id="myboardDTO" class="Board.MyBoardDTO"/>
<jsp:useBean id="myboardDAO" class="Board.MyBoardDAO"/>

<%
    String userNick = (String)session.getAttribute("userNick");	

	String realName="";
	int maxSize = 10 * 1024 * 1024; // 10MB
	String savePath = "C:/dawon_project/project/HelloMarket/src/main/webapp/upload/img";
	System.out.println("현재경로 : " + savePath);
	String format = "UTF-8";
	String uploadFile = "";
	int read = 0;
	byte[] buf = new byte[1024];	// 한번에 읽어들일 버퍼의 크기
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, 
				new DefaultFileRenamePolicy());
		
		uploadFile = multi.getFilesystemName("fileflow01"); // form의 input file객체이며, 실제로 업로드된 파일명 (맞다)
		
		
		System.out.println(uploadFile);
	
		File file1 = new File(savePath + uploadFile);
		
		response.sendRedirect("/HelloMarket/Main.jsp"); // 메인으로 가나 보자 (이거 이제 나중에 제품 리스트로 가는 걸로 바꿔요)
		
		
		 request.setCharacterEncoding("UTF-8");
		   MyBoardDTO myboarddto = new MyBoardDTO();
		  	
		   	String user_Nick = userNick;
		    String [] deal_m1 = multi.getParameterValues("deal_m1");
		    String p_image1_path = multi.getParameter("p_image1_path");
		   
		    String p_title = multi.getParameter("p_title");
		    String p_m_category = multi.getParameter("p_m_category");
		    String p_s_category = multi.getParameter("p_s_category");
		    String p_description = multi.getParameter("p_description");
		    String p_trade_kind = multi.getParameter("p_trade_kind");
		    String p_price = multi.getParameter("p_price");
		    String[] p_delivery = multi.getParameterValues("p_delivery");
		    String p_status1 = multi.getParameter("p_status1");
		    String p_transac_loc = multi.getParameter("p_transac_loc");
		   
		    
		    String dealstr = "";
		   	for(int i=0; i<deal_m1.length; i++){
		   		dealstr = dealstr + deal_m1[i] + " "; 
		   	}
		   	
		   	String deliverstr = "";
		   	for(int j=0; j<p_delivery.length; j++){
				deliverstr = deliverstr + p_delivery[j] + " "; 
			}
		    
		    %>
		    
		    <% 
		    
		    myboarddto.setUserNick(user_Nick);
		    myboarddto.setDeal_m1(deal_m1);
		    myboarddto.setP_image1_path(p_image1_path);
		    myboarddto.setP_image1_orig_name(uploadFile);
		    myboarddto.setP_title(p_title);
		    myboarddto.setP_m_category(p_m_category);
		    myboarddto.setP_s_category(p_s_category);
		    myboarddto.setP_description(p_description);
		    myboarddto.setP_trade_kind(p_trade_kind);
		    myboarddto.setP_price(p_price);
		    myboarddto.setP_delivery(p_delivery);
		    myboarddto.setP_status1(p_status1);
		    myboarddto.setP_transac_loc(p_transac_loc);
		    
		   
		    
		 
		      int num = myboardDAO.registBoard(myboarddto);
		      
		      if(num>=1){
		         
		         out.println("값 성공");
		         
		      } else {
		         out.println("값 실패");
		      }
			}catch(Exception e){
				e.printStackTrace();
			}    
		   
   
%>
