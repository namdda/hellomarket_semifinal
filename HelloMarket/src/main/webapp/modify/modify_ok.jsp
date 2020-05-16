<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<jsp:useBean id="boardDTO" class="Board.BoardDTO"/>
<jsp:useBean id="boardDAO" class="Board.BoardDAO"/>

<%
request.setCharacterEncoding("UTF-8");



%>

<%
String userNick = (String) session.getAttribute("userNick");
//int p_Idx = (int)session.getAttribute("p_idx");
String realName = "";
String format = "UTF-8";
String uploadFile = "";
int read = 0;
String savePath = "C:/Users/Dawon/git/hellomarket_semifinal/HelloMarket/src/main/webapp/upload/img";
int maxSize = 10 * 1024 * 1024; // 10MB
byte[] buf = new byte[1024];	// 한번에 읽어들일 버퍼의 크기

try {
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());

	uploadFile = multi.getFilesystemName("fileflow01"); // form의 input file객체이며, 실제로 업로드된 파일명 (맞다)
	

	File file1 = new File(savePath + uploadFile);

	//response.sendRedirect("/HelloMarket/Main.jsp"); // 메인으로 가나 보자 (이거 이제 나중에 제품 리스트로 가는 걸로 바꿔요)

	request.setCharacterEncoding("UTF-8");
	 BoardDTO boarddto = new BoardDTO();

	String user_Nick = userNick;
	//int p_idx = p_Idx;
	
	System.out.println(request.getParameter("p_idx")); // null 값 나옴
	System.out.print(userNick);
	
	
	//int p_idx = Integer.parseInt(request.getParameter("p_idx")); // 여기가 null 이 나온다
	//System.out.println(p_idx);
	
	String[] deal_m1 = multi.getParameterValues("deal_m1");
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
	for (int i = 0; i < deal_m1.length; i++) {
		dealstr = dealstr + deal_m1[i] + " ";
	}

	String deliverstr = "";
	for (int j = 0; j < p_delivery.length; j++) {
		deliverstr = deliverstr + p_delivery[j] + " ";
	}
%>


<%

boarddto.setUserNick(user_Nick);
//boarddto.setP_idx(p_idx);
boarddto.setDeal_m1(deal_m1);
//boarddto.setP_image1_path(p_image1_path);
boarddto.setP_image1_orig_name(uploadFile);
boarddto.setP_title(p_title);
boarddto.setP_m_category(p_m_category);
boarddto.setP_s_category(p_s_category);
boarddto.setP_description(p_description);
boarddto.setP_trade_kind(p_trade_kind);
boarddto.setP_price(p_price);
boarddto.setP_delivery(p_delivery);
boarddto.setP_status1(p_status1);
boarddto.setP_transac_loc(p_transac_loc);




	int rows = 0;
	rows = boardDAO.updateBoard(boardDTO);

if (rows >= 1) {
%>
<script>
	alert("게시글이 무사히 수정되었습니다!");
	location.href = "/HelloMarket/Main.jsp"
</script>
<%
	} else {
		
		//System.out.println(p_idx);
		System.out.println(deal_m1); // 뭔가 들어가긴 함
		System.out.println(p_image1_path); // null
		System.out.println(uploadFile); // 들어가짐
		System.out.println(p_m_category); // 들어가짐
		System.out.println(p_s_category); // 들어가짐
		System.out.println(p_description); // 들어가짐
		System.out.println(p_trade_kind); //들어가짐
		System.out.println(p_price); // 들어가짐
		System.out.println(p_delivery); //뭔가 들어가기는 함 
		System.out.println(p_status1); // 들어가짐
		System.out.println(p_transac_loc); // 들어가짐
		//  아니 뭔데 
		
	
%>

<script>
	//alert("게시글을 수정하지 못했습니다...");
	//history.back();
	
</script>
<%
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>

