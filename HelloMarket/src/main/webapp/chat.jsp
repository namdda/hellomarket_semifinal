<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="chat.*" %>
<%@ page import ="User.*" %>
<%@ page import ="Board.*" %>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/HelloMarket/css/chunk.css" rel="stylesheet">
<link href="/HelloMarket/css/chat.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%
	
	String fromNick = (String)session.getAttribute("userNick");	
	
	List<ChatDTO> chatHistory = new ArrayList<ChatDTO>();
	List<ChatDTO> chatList = new ArrayList<ChatDTO>();
	ChatDAO chatDAO = new ChatDAO();
	BoardDAO boardDAO = new BoardDAO();
	UserDAO userDAO = new UserDAO();
	String toNick = "";
	int cnt =0;
	
	if(fromNick == null){
%>
	<script>
		alert('로그인을 해주세요');
		location.href="/HelloMarket/login/login.html";
		
		
	</script>
<% 
	}
	if(request.getParameter("toId") != null){
		toNick = request.getParameter("toId");
		chatHistory = chatDAO.thisChat(toNick, fromNick);
		cnt = boardDAO.showUserItemCnt(toNick);
		
		}
	chatList = chatDAO.userChatList(fromNick);
	int fromIdx = userDAO.getUserIdx(fromNick);
	int toIdx = userDAO.getUserIdx(toNick);
	
	
%>
    <div id="__next">
        <header>
            <section class="header_top">
                <div class="header_logo">
                    <div class="log_box"><a href="/HelloMarket/Main.jsp" target="_blank" rel="noopener noreferrer"><img src="/HelloMarket/img/MarketMain.png" class="logo" alt="헬로마켓" width="115" height="28"></a></div>
                    <div class="profile_box"><a href="/HelloMarket/mystore/index.jsp?userIdx=<%=fromIdx%>" target="_blank" rel="noopener noreferrer">
                            <div class="info"><img src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="프로필 사진"><span><%=fromNick %> 님</span></div>
                        </a></div>
                </div>
            </section>
        </header>
        <section class="content">
            <div class="main_area">
                <div class="left_main">
                    <div class="left_main_header">
                        <div class="title">안녕톡</div>
                    </div>
                    <ul>
                    <%
                    	for(ChatDTO c : chatList){
                    		if(c.getToNick().equals(fromNick)){
                    %>
                    		<div class="card_box">
                    			<a href="/HelloMarket/chat.jsp?toId=<%=c.getFromNick()%>">
                                <li>
                                    <div class="profile"><img src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="n15982734"></div>
                                    <div class="info">
                                        <div class="nick"><%=c.getFromNick() %></div>
                                        <div class="description"><%=c.getcContent()%></div>
                                        <div class="time_ago"><%=c.getcTime() %></div>
                                    </div>
                                </li>
                         	</a>
                            <div class="etc_dots"></div>
                        </div>
                    <% 
                    		}else{
                    %>
                    	<div class="card_box">
                    			<a href="/HelloMarket/chat.jsp?toId=<%=c.getToNick()%>">
                                <li>
                                    <div class="profile"><img src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="n15982734"></div>
                                    <div class="info">
                                        <div class="nick"><%=c.getToNick() %></div>
                                        <div class="description"><%=c.getcContent()%></div>
                                        <div class="time_ago"><%=c.getcTime() %></div>
                                    </div>
                                </li>
                       		  </a>
                            <div class="etc_dots"></div>
                        </div>
                    <% 
                    		}
                    %>
                    	
                        
                    
                    <% 
                    	}
                    %>
                       
                    </ul>
                </div>
                <div class="right_main">
                    <div class="chat_header"><a href="/HelloMarket/mystore/index.jsp?userIdx=<%=toIdx%>" target="_blank" rel="noopener noreferrer">
                            <div class="image_box">
                                <div class="image_table"><img src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="n15982734님의 프로필 이미지"></div>
                            </div>
                            <div class="info">
                            <%
                            	if(toNick == ""){
                            %>
                            		<div id="toUserNick"><span><%=toNick %></span><span></span></div>
                            <% 
                            	}else{
                            %>
                                <div id="toUserNick"><span><%=toNick %></span><span>판매아이템 <%=cnt %>개</span></div>
                            <% 	
                            	}
                            %>
                            </div>
                        </a>
                        <div class="declaration">
                            <div><img src="https://ccimage.hellomarket.com/web/2019/chat/btn_hellotalk_report_x2.png" alt="신고 이미지"></div>
                        </div><a href="/messages">
                            <div class="chat_close"></div>
                        </a>
                    </div>
                    <div class="chat_description" style="bottom: 49px;">
                        <div>
                       <%
                       		for(ChatDTO c : chatHistory){
                       			if(fromNick.equals(c.getToNick())){
                       %>
                       			<div class="chat_opponent">
								    <div class="chat_opponent_box">
								        <div class="chat_opponent_image_box"><img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지"></div>
								        <div class="chat_opponent_title"><%=c.getFromNick() %></div>
								        <div class="chat_opponent_message"><span><%=c.getcContent() %></span>
								            <div class="chat_opponent_timeago"><%=c.getcTime() %></div>
								        </div>
								    </div>
								</div>
                       <% 
                       			}
                       			if(fromNick.equals(c.getFromNick())){
                       %>
                       			<div class="chat_myself">
								    <div class="chat_myself_box">
								        <div class="chat_myself_message"><span><%=c.getcContent()%></span>
								            <div class="chat_myself_ack active"></div>
								            <div class="chat_myself_timeago"><%=c.getcTime() %></div>
								            <div class="chat_myself_timeago"><%=c.getcTime() %></div>
								        </div>
								    </div>
								</div>
					 <% 
                       			}
                       		}
                       %>
                        </div>
                    </div>
                    <div class="chat_footer">
                        <div class="chat_footer_area">
                            <div class="chat_input" contenteditable="true" placeholder="메세지를 입력해주세요."></div><button type="button" onclick="sendMsg('<%=fromNick%>','<%=toNick%>')">전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div>© <a href="https://www.hellomarket.com" target="_blank" rel="noopener noreferrer"><span>(주)헬로마켓</span></a>. All rights reserved.</div>
        </footer>
    </div>
</body>
<script src = "/HelloMarket/js/chat.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
$(document).ready(function (){
	$(".chat_description").scrollTop($(".chat_description")[0].scrollHeight);
	const fromNick = '<%=fromNick%>';
	const toNick = '<%=toNick%>';
	chatInfReload(fromNick,toNick);
	$(".card_box").css('cursor','pointer');
})
</script>
</html>