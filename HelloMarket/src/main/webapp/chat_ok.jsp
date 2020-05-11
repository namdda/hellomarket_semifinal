<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="chat.*"%>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.ArrayList" %>


<%
	String fromNick = request.getParameter("fromNick");
	String toNick = request.getParameter("toNick");
	String cContent = request.getParameter("cContent");
	
	ChatDAO chatDAO = new ChatDAO();
	chatDAO.sendChat(toNick, fromNick, cContent);
	
	List<ChatDTO> chatHistory = new ArrayList<ChatDTO>();
	chatHistory = chatDAO.thisChat(toNick, fromNick);
	
%>
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