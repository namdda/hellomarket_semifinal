<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Comment.*" %>
<%@ page import= "java.util.List" %>
<%@ page import ="java.util.ArrayList" %>
<%
	CommentDAO commentDAO = new CommentDAO();
	List<CommentDTO> commentDTO = new ArrayList<CommentDTO>();
	String comment = request.getParameter("comment");
	String userNick = request.getParameter("userNick");
	int pIdx = Integer.parseInt(request.getParameter("pIdx"));
	int cmtCnt =0;
	commentDTO = commentDAO.insertComment(pIdx, userNick, comment);
	for(CommentDTO c : commentDTO){
%>
	
		        <li class="comment_al_list">
		            <div class="cmt_dtl"><a href="/s/@15979427?tab=item"><img src="https://ccimage.hellomarket.com/web/2017/common/img_default_profile_60x60.png" alt="회원 이미지" class="cmt_img"></a>
		                <div class="cmt_info">
		                    <div class="cmt_top">
		                        <div class="nick"><a class="link" href="/s/@15979427?tab=item"><%=c.getUserNick() %></a></div>
		                        <div class="date">방금 전</div><a class="del_btn_link"><img src="https://ccimage.hellomarket.com/mobileWeb/comment/itemdetail_img_comment_overflow.png" alt="답글삭제이미지" class="del_btn"></a>
		                    </div>
		                    <div class="cmt_content"><%=c.getcContent() %></div>
		                    <div class="cmt_bottom">답글</div>
		                </div>
		            </div>
		        </li>
		   
		
		
<% 
	}
%>