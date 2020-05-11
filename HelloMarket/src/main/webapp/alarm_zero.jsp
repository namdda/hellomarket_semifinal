<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="User.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>안녕마켓 : 알림</title>
    <link href="css/bed_chunk.css" rel="stylesheet">
</head>

<%
String userId = (String) session.getAttribute("userId");
String userNick = (String) session.getAttribute("userNick");

%>
<% 
	AlarmDAO alarmDAO = new AlarmDAO();
	AlarmDTO alarmDTO = new AlarmDTO();
	
	alarmDTO = alarmDAO.Showalarm();
	
	alarmDAO.AlarmZero(userId);
	
	
		
%>





<body>
    <div id="__next">
        <div class="mobile_banner">
            <div class="mobile_banner_wrapper"><img alt="앱으로하기 로고"
                    src="https://ccimage.hellomarket.com/web/2019/menu/img_mobile_top_banner_190516_01.png"
                    class="header_down_left"><img alt="앱으로하기"
                    src="https://ccimage.hellomarket.com/web/2019/menu/img_mobile_top_banner_190516_02.png"
                    class="header_down_right"></div>
        </div>
        <header>
            <section class="header_top">
                <div class="header_logo">
                    <div class="log_box"><a href="Main.jsp" target="_blank"
                            rel="noopener noreferrer"><img
                                src="img/MarketMain.png" class="logo"
                                alt="헬로마켓" width="115" height="28"></a></div>
                    <div class="profile_box"><a href="/HelloMarket/mystore/level.jsp" target="_blank"
                            rel="noopener noreferrer">
                            <div class="info"><img
                                    src="img/img_apply_profile_4x_0419.png"
                                    alt="프로필 사진"><span><%=userNick %> 님</span></div>
                        </a></div>
                </div>
            </section>
        </header>
        <section class="alarm_container">
            <div class="main_header">
                <div class="title">알림</div>
                <div class="close_page"></div>
            </div>
            <div class="scroll">
                <div>
                    <div class="alarm_update"><button>
                            <div></div>
                        </button></div>
                   
                </div>
            </div>
        </section>

        <footer>
            <div>©
                <!-- --> <a href="https://www.hellomarket.com" target="_blank"
                    rel="noopener noreferrer"><span>(주)헬로마켓</span></a>. All rights reserved.</div>
        </footer>
    </div>
    
</body>
</html>