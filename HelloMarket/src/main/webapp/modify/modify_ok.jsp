<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	 isELIgnored="false" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="boardDTO" class="Board.BoardDTO"/>
<jsp:useBean id="boardDAO" class="Board.BoardDAO"/>
<jsp:useBean id="boarddto" class="Board.BoardDTO"/>
<jsp:setProperty property="*" name="boardDTO"/>
<jsp:useBean id="boarddao" class="Board.BoardDAO"/>

<c:set var="rows" value="${boardDAO.updateBoard(boardDTO)}" />

<c:if test="${rows >=1}">

	<script>
		alert("게시글이 무사히 수정되었습니다!");
		location.href="detail.jsp?type=${param.type}&id=${boardDTO.id}"; // 이건 상세페이지로 돌아가기나 그게 있어여 넣지....
	</script>
</c:if>

<c:if  test="${rows < 1}">
	<script>
	alert("게시글을 수정하지 못했습니다...");
	history.back();
	</script>
</c:if>
