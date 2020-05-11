<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>
<%@page import="Board.MyBoardDTO" %>
<%@page import="Board.MyBoardDAO" %>
<%@page import ="zzim.*" %>
<%@ page import = "Comment.CommentDAO" %>
<%@ page import = "Comment.CommentDTO" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	String temp = request.getParameter("p_idx");
	int p_idx = Integer.parseInt(temp);
	MyBoardDAO myboardDAO = new MyBoardDAO();
	MyBoardDTO boardDTO = new MyBoardDTO();
	boardDTO = myboardDAO.showThisItem(p_idx);
	
	
	String firstCat = null;
	String secondCat = null;
	if(boardDTO.getP_m_category().equals("1")){
		firstCat = "휴대폰,태블릿";
		if(boardDTO.getP_s_category().equals("sub1")){
			secondCat = "휴대폰";
		}else if(boardDTO.getP_s_category().equals("sub2")){
			secondCat = "태블릿";
		}
	}else if(boardDTO.getP_m_category().equals("2")){
		firstCat = "뷰티";
		if(boardDTO.getP_s_category().equals("sub3")){
			secondCat = "헤어";
		}else if(boardDTO.getP_s_category().equals("sub4")){
			secondCat = "미용";
		}
	}else if(boardDTO.getP_m_category().equals("3")){
		firstCat = "여성의류";
		if(boardDTO.getP_s_category().equals("sub5")){
			secondCat = "여성 상의";
		}else if(boardDTO.getP_s_category().equals("sub6")){
			secondCat = "여성 하의";
		}
	}else {
		firstCat = "신발,가방,잡화";
		if(boardDTO.getP_s_category().equals("sub7")){
			secondCat = "신발";
		}else if(boardDTO.getP_s_category().equals("sub8")){
			secondCat = "가방,잡화";
		}
	}

	
	
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title><%=boardDTO.getP_title()%>|100% 안전한 중고거래</title>
</head>
<link href="/HelloMarket/css/item.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<body>
    <%
	String userId = null;
	String userNick = null;
	int sellerLevel = 0;
	String levelName = null;
	int uploaderLevel = 0;
	int uploaderIdx =0;
	String uploaderLevelName = null;
	int userItemCnt = 0;
	
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
		sellerLevel = (int)session.getAttribute("sellerLevel");
	}
	 if(sellerLevel==1){
			levelName = "화이트";
		}else if(sellerLevel==2){
			levelName ="블루";
		}else{
			levelName="브론즈";
		}
	 
	 if(uploaderLevel==1){
		 uploaderLevelName = "화이트";
		}else if(uploaderLevel==2){
			uploaderLevelName ="블루";
		}else{
			uploaderLevelName="브론즈";
		}
	 String uploaderNick = boardDTO.getUserNick();
	 userItemCnt = myboardDAO.showUserItemCnt(uploaderNick);
	 UserDAO userDAO = new UserDAO();
	 uploaderLevel = userDAO.getUser_level(uploaderNick);
	 uploaderIdx = userDAO.getUserIdx(uploaderNick);
	 
	 CommentDAO commentDAO = new CommentDAO();
	 int cmtCnt = 0;
	 cmtCnt = commentDAO.getCmtCnt(p_idx);
	 
	 List<CommentDTO> commentList = new ArrayList<CommentDTO>();
	 commentList = commentDAO.getCommentList(p_idx);
	 
	 int userIdx = userDAO.getUserIdx(userNick);
	 ZzimDAO zzimDAO = new ZzimDAO();
	 List<ZzimDTO> ZzimList = new ArrayList<ZzimDTO>();
	 
	 ZzimList = zzimDAO.itemZzimed(p_idx);
	 boolean thisZzim = false ; 
	 for(ZzimDTO z : ZzimList){
		 if(z.getUser_idx()==userIdx){
			 thisZzim = true;
		 }
	 }
	 
	 
	 
%>
    <div id="__next" style="height: auto !important;">
        <header class="">
            <div class="bar hide"></div>
            <section class="header_top">
                <div class="header_logo header_logo_s">
                    <div class="log_box"><img src="/HelloMarket/img/MarketMain.png" class="logo" alt="헬로마켓"></div>
                    <%
	if(userId == null ){
%>
                    <div class="btn_box">
                        <a class="btn_login_box">
                            <button class="login_btn">로그인</button>
                        </a><a class="btn_signup_box"><button class="signup_btn">회원가입</button></a><a href="/msearch">
                            <div class="notification_box"></div>
                        </a></div>
                    <%
	}else{
%>
                    <div class="btn_box">
                        <div class="nick">
                            <img src="/HelloMarket/img/img_default_profile_60x60.png" width="36" height="36"
                                alt="<%=userNick %>의 프로필 사진" class="profile_img">
                            <span class="nick_title"><%=userNick %>님</span>
                        </div>
                        <div class="notification_box">
                            <a href="" target="_blank" rel="noopener noreferrer">
                                <img src="/HelloMarket/img/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">
                                <div class="chat_cnt">4</div>
                            </a>
                            <a id="alarm_btn" target="_blank">
                                <img src="/HelloMarket/img/btn_title_notification.png" alt="알림목록 아이콘" class="alram">
                                <div class="alram_cnt">3</div>
                            </a></div>
                    </div>
                    <% 
	}
%>
                    <div style="display: none;">
                        <div class="gnb_my_lyr test_type">
                            <div class="gnb_my_member_level">
                                <%
	if(sellerLevel==1){
%>
                                <img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level1_30.png">
                                <% 
	}else if(sellerLevel ==2){
%>
                                <img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level2_30.png">
                                <% 
	}else{
%>
                                <img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level3_30.png">
                                <% 
	}
%>
                                <div><span class="level_description">나의등급</span><span
                                        class="level_description_name"><%=levelName %></span></div>
                            </div>
                            <ul class="gnb_my_list">
                                <li class="gnb_my_list_first">내상점</li>
                                <li class="gnb_my_list_second">할인쿠폰</li>
                                <li class="gnb_my_list_last">로그아웃</li>
                            </ul>
                        </div>
                    </div>
                    <div class="header_search" id="tebas">
                        <div class="com_search_box">
                            <div>
                                <div><input type="text" class="com_search" placeholder="어떤 상품을 찾고 계세요?" value=""
                                        style="border-bottom: 1px solid rgb(158, 164, 170);">
                                    <div class="search_icon_box">
                                        <div class="search_icon">
                                            <div class="search_circle" style="border-color: rgb(158, 164, 170);"></div>
                                            <div class="search_rectangle" style="border-color: rgb(158, 164, 170);">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w_search_modal" style="display: none;">
                                        <div>
                                            <div class="search_contents">
                                                <div class="search_recent">
                                                    <p>최근 검색</p>
                                                    <ul>
                                                        <div class="search_empty">우리조 1등 </div>
                                                    </ul>
                                                </div>
                                                <div class="line"></div>
                                                <div class="search_popular">
                                                    <p>인기 키워드</p>
                                                    <ul>
                                                        <li class=""><span>1</span> 눈누난나</li>
                                                        <li class=""><span>2</span> ~@~@~@</li>
                                                        <li class=""><span>3</span> !@#!@$</li>
                                                        <li class=""><span>4</span> css 경로는 알아서</li>
                                                        <li class=""><span>5</span> 메인페이지 누구함?</li>
                                                        <li class=""><span>6</span> 프린터</li>
                                                        <li class=""><span>7</span> jbl</li>
                                                        <li class=""><span>8</span> 키보드</li>
                                                        <li class=""><span>9</span> 에어컨</li>
                                                        <li class="last_child"><span>10</span> 안마기</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="search_close">
                                            <div>닫기</div>
                                        </div>
                                    </div>
            </section>
            <section class="header_cat">
                <div class="header_wrapper">
                    <div>
                        <div class="btn_box header_wrapper_sub" id="open_cat">
                            <input type="checkbox" class="cat_checkbox chkbox1">
                            <i class="arrow"></i>
                            <span for="cat_checkbox" class="selectbox">카테고리</span>
                            <div style="display: none;" id="category_display">
                                <div class="cat_list_box left_slidein">
                                    <div class="mobile_nav">
                                        <div class="cat_avt">
                                            <ul class="cat_avt_top">
                                                <li><a href="/search?sort=current">최신순 &gt;</a></li>
                                                <li><a>가까운순 &gt;</a></li>
                                            </ul>
                                        </div>
                                        <ul class="cat_list mobile_cat_list">
                                            <li class="category"><a class="cat_link mobile_cat_link"
                                                    href="/m/hellopay.hm?type=seller&amp;status=open"><span
                                                        class="category_text">헬로페이
                                                        거래내역</span></a></li>
                                            <li class="category"><a class="cat_link mobile_cat_link"
                                                    href="/m/wallet/history"><span class="category_text">전자지갑 ·
                                                        결제관리</span></a></li>
                                            <li class="category"><a class="cat_link mobile_cat_link"
                                                    href="/m/order/auto/sales/list.hm"><span class="category_text">일반
                                                        결제내역</span></a></li>
                                            <li class="category"><a class="cat_link mobile_cat_link"
                                                    href="/m/shipping.hm?type=sender"><span
                                                        class="category_text">배송관리</span></a></li>
                                            <li class="category"><a class="cat_link mobile_cat_link"
                                                    href="/m/coupon"><span class="category_text">할인쿠폰</span></a></li>
                                        </ul>
                                        <div class="mobile_category_line"></div>
                                        <ul class="cat_list mobile_cat_list_none">
                                            <li class="cat_space"><a></a></li>
                                            <li class="cat_space"><a></a></li>
                                            <li class="cat_space"><a></a></li>
                                            <li class="cat_space"><a></a></li>
                                            <li class="cat_space"><a></a></li>
                                            <li class="cat_space"><a></a></li>
                                            <li class="category"><a class="cat_link"
                                                    href="/search?category=HAK0000"><img
                                                        src="/HelloMarket/img/cate_hak0000.png" alt="휴대폰, 테블릿"
                                                        class="category_img"><span class="category_text">휴대폰,
                                                        테블릿</span></a></li>
                                            <li class="category"><a class="cat_link"
                                                    href="/search?category=HAD0000"><img
                                                        src="/HelloMarket/img/cate_had0000.png" alt="뷰티"
                                                        class="category_img"><span class="category_text">뷰티</span></a>
                                            </li>
                                            <li class="category"><a class="cat_link"
                                                    href="/search?category=HAA0000"><img
                                                        src="/HelloMarket/img/cate_haa0000.png" alt="여성의류"
                                                        class="category_img"><span class="category_text">여성의류</span></a>
                                            </li>
                                            <li class="category"><a class="cat_link"
                                                    href="/search?category=HAC0000"><img
                                                        src="/HelloMarket/img/cate_hac0000.png" alt="신발,가방,잡화"
                                                        class="category_img"><span
                                                        class="category_text">신발,가방,잡화</span></a></li>
                                            <li class="category_blank"></li>
                                            <li class="category_blank"></li>
                                            <li class="category_blank"></li>
                                            <li class="category_blank"></li>
                                            <li class="category_blank"></li>
                                            <li class="category_blank"></li>
                                            <li class="category_blank"></li>
                                        </ul>
                                        <ul class="mobile mobile_sub_category">
                                            <li><a href="/community/list.hm?category=DAC0002">이벤트</a><i
                                                    class="arrow right_arrow"></i></li>
                                            <li><a href="/community/list.hm?category=DAC0004">헬마뉴스</a><i
                                                    class="arrow right_arrow"></i></li>
                                            <li><a href="/help/faq.hm">헬프센터</a><i class="arrow right_arrow"></i></li>
                                            <li><a href="./ad/index.html" target="_blank"
                                                    rel="noopener noreferrer">광고센터</a><i class="arrow right_arrow"></i>
                                            </li>
                                        </ul>
                                        <ul class="logout_wrapper">
                                            <li>
                                                <div class="btn logout">로그아웃</div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sellimg_sub_box header_wrapper_sub" onclick="sellimg('<%=userId%>')">
                        <script>
                            function sellimg(userId) {

                                if (userId != null) {

                                    location.href = "/HelloMarket/sell/sell.jsp";

                                } else {

                                    alert("로그인해주세요!");
                                    location.href = "/HelloMarket/login/login.html";

                                }

                            }
                        </script>
                        <div class="selling_bot"><img src="/HelloMarket/img/ico_sell_camera_x2.png" alt="판매하기 이미지"
                                class="selling_bot_img"><span class="selling_bot_text">판매하기</span></div>
                    </div>
                    <div class="link_box header_wrapper_sub">
                        <ul>
                            <li><a href="/community/list.hm?category=DAC0002&amp;status=begin">이벤트</a></li>
                            <li><a href="/help/faq.html">헬프센터</a></li>
                            <li><a href="/HelloMarket/ad/index.html" target="_blank" rel="noopener noreferrer"><img
                                        src="/HelloMarket/img/ico_category_AD_x2.png" alt="광고센터 아이콘이미지">광고센터</a></li>
                        </ul>
                    </div>
                </div>
            </section>
        </header>


        <section class="content" style="height: auto !important;">
            <h1><%=boardDTO.getP_title() %></h1>
            <h2><%=boardDTO.getP_description() %></h2>
            <div class="banner_area pc_display">
                <div class="banner_pos">

                </div>
            </div>
            <div class="item_list_area" style="height: auto !important;">
                <div class="item_list_area_box" style="height: auto !important;">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="/HelloMarket/Main.jsp">HOME</a></li>
                            <li><a href="/search?category=HAC0000">&gt; <%=firstCat %></a></li>
                            <li><a href="/search?category=HAC0007">&gt; <%=secondCat %></a></li>
                        </ul>
                    </div>
                    <div class="main_area" style="height: auto !important;">
                        <div class="main_area_center" style="height: auto !important;">
                            <div class="main">
                                <div class="detail_box">
                                    <div class="detail_box_top">
                                        <div class="detail_top_area">
                                            <div class="photo_area">
                                                <div class="large_img">
                                                    <div
                                                        class="swiper-container swiper-container-initialized swiper-container-horizontal">
                                                        <div class="swiper-wrapper"
                                                            style="transform: translate3d(0px, 0px, 0px);">
                                                            <div class="swiper-slide thumbnail_wrapper swiper-slide-active"
                                                                style="width: 460px;">
                                                                <div class="badeagle">
                                                                    <div class="centered"><img alt="14k 반지의 상세 이미지 1"
                                                                            class="view thumbnail_img"
                                                                            src="/HelloMarket/upload/img/<%=boardDTO.getP_image1_orig_name() %>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="swiper-slide thumbnail_wrapper swiper-slide-next"
                                                                style="width: 460px;">

                                                            </div>

                                                        </div>
                                                        <span class="swiper-notification" aria-live="assertive"
                                                            aria-atomic="true"></span>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="item_info">
                                                <div class="item_title_area">
                                                    <span class="item_tag">
                                                        <span class="used_type_tag"><%=boardDTO.getP_status1() %></span> 
                                                        <span
                                                            class="delivery_tag used_type_tag_active  used_type_tag_active"><%= boardDTO.getDeliverstr()%></span><!-- for 문 돌려서 (length개수 만큼 돌리면서 찍으면 된다)  -->
                                                        <span class="share_box item_share_box"><img
                                                                src="https://ccimage.hellomarket.com/web/2018/item/btn_share_16x16_x2.png"
                                                                alt="공유이미지" class="share_icon"></span>
                                                        <span class="wish_box">
                                                            <img src="https://ccimage.hellomarket.com/web/2020/item/ico_zzim_24x23_s_x2.png"
                                                                alt="찜하기이미지" class="wish_icon">
                                                            <label id ="likeCnt"><%=boardDTO.getP_like()%></label>
                                                        </span>
                                                    </span></div><span
                                                    class="item_title"><%=boardDTO.getP_title() %></span>
                                                <div class="item_price_box item_price_box_bottom">
                                                    <div class="item_price_box_bottom_low">
                                                        <div class="item_price item_price_bottom"><%=boardDTO.getP_price() %></div>
                                                    </div>
                                                    <div class="only_description_hellopay common_description_deal">
                                                        <table>
                                                            <tbody>
                                                                <tr class="first">
                                                                    <td class="title">거래방법</td>
                                                                    <td class="description"
                                                                        style="padding-bottom: 3px;"><%=boardDTO.getDealstr() %></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="title"></td>
                                                                    <td class="description direct_description">당사자간 원하는
                                                                        방법으로 거래합니다.<br>직거래시 발생하는 피해는 거래당사자에게 있으며, 헬로마켓의
                                                                        <br>도움을 받을 수 없습니다.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="title">배송비</td>
                                                                    <td class="description"><%=boardDTO.getDeliverstr() %> </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <div style="margin-top: 0px;"></div>
                                                    </div>
                                                    <div class="item_sns item_detail_sns">
                                                        <div class="item_hello_box">
                                                            <div class="item_hello_box_talk item_copy_box_talk">
                                                            <%
                                                            		if(thisZzim){
                                                            %>
                                                            			<div class="wish_img_box" onclick="zzimedItem(<%=p_idx%>,<%=userIdx%>,<%=boardDTO.getP_like()%>)">
                                                                        <img src="/HelloMarket/img/ico_zzimed.png" alt="찜하기이미지" class="wish_icon">
                                                                        </div>
                                                            <% 
                                                            		}else{
                                                            %>
                                                            			<div class="wish_img_box" onclick="zzimItem(<%=p_idx%>,<%=userIdx%>,<%=boardDTO.getP_like()%>)">
                                                                        <img src="/HelloMarket/img/ico_zzim.png" alt="찜하기이미지" class="wish_icon">
                                                                        </div>
                                                             <%            
                                                            		}
                                                            	if(!uploaderNick.equals(userNick)){
                                                             %>	
                                                                 <button type="button" class="hello_talk_btn item_copy_btn" onclick="gotoChat('<%=uploaderNick%>')">안녕톡</button>
                                                            
                                                             <%	
                                                            	}
                                                            %>
                                                                
                                                            </div>
                                                            <div class="item_hello_box_pay item_hello_box_chat_pay">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                           	 if(userNick != null){
                                           		 
                                           		 if(userNick.equals(uploaderNick)){
                                        
                                           	%>
                                           		<div class="item_user_info">
												    <div class="modify_box_left">
												        <div class="modify_box_left_margin">
												            <div class="modify_box_left_admin">상품 판매 관리</div>
												            <div class="modify_box_left_status">상태변경</div>
												            <ul>
												                <li><input type="radio" class="radio1" name="sellState" readonly="" value="ForSale" checked=""><label class="label2" for="sellState01">판매중</label></li>
												                <li><input type="radio" class="radio1" name="sellState" readonly="" value="SoldOut"><label class="label2" for="sellState01">판매완료</label></li>
												                <li><input type="radio" class="radio1" name="sellState" readonly="" value="Hidden"><label class="label2" for="sellState01">숨기기</label></li>
												            </ul>
												        </div>
												    </div>
												    <div class="modify_box_right">
												        <ul class="modify_box_ul"><a href="/shipping/cvs/reservation/form.hm?itemIdx=166099896">
												                <li class="modify_box_right_parcel">
												                    <div class="modify_box_right_border"><img src="https://ccimage.hellomarket.com/web/2019/item/ico_myproduct_delivery.png" alt="배송예약 이미지" class="modify_box_right_img modify_box_right_img_delivery">
												                        <div class="modify_box_right_text">배송예약</div>
												                    </div>
												                </li>
												            </a>
												           
												            <li class="modify_box_right_parcel">
												                <div class="modify_box_right_border"><img src="https://ccimage.hellomarket.com/web/2019/item/ico_myproduct_status_edit.png" alt="상태변경" class="modify_box_right_img">
												                    <div class="modify_box_right_text">상태변경</div>
												                </div>
												            </li>
												         
												            <li><a href="/item/form.hm?idx=166099896" >
												                    <div class="modify_box_right_border"><img src="https://ccimage.hellomarket.com/web/2019/item/ico_myproduct_edit.png" alt="수정 이미지" class="modify_box_right_img">
												                        <div class="modify_box_right_text">수정</div> <!-- onclick="/HelloMarket/modify/modify.jsp?id=${board.id}" 지금 생각해보니까 어느 페이지 수정하는건지 모르니까 그걸 get 방식으로 받아야할거 같은데...  -->
												                    </div>
												                </a></li>
												            <li class="modify_mobile_delete_right">
												                <div class="modify_box_right_border"><img src="https://ccimage.hellomarket.com/web/2018/item/ico_myitem_edit_item_x4.png" alt="상품 수정" class="modify_box_right_img">
												                    <div class="modify_box_right_text">삭제</div>
												                </div>
												            </li>
												        </ul>
												    </div>
												</div>
												<%
												} 
                                           	 }
												%>
                                           
                                            
                                        </div>
                                        <div class="detail_box_bottom detail_box_item" style="padding-top: 20px;">
                                            <div class="detail_comment">
                                                <div class="pc_item_user_info">
                                                    <div class="profile_img"><a href="/s/@1388926">
                                                    <img class="profile" src="https://ccimg.hellomarket.com/images/2018/member_profile/06/28/15/3517_277815_1.jpg?size=s4" alt="모바일 상품 회원 프로필 이미지">
                                                                
                                                                <%
                                                                	if(uploaderLevel==1){
                                                                %>
                                                                	<img class="profile_img_level" src="/HelloMarket/img/img_level1_30.png" alt="뱃지 이미지">
                                                                <% 
                                                                	}else if(uploaderLevel ==2){
                                                               	%>
                                                                	<img class="profile_img_level" src="/HelloMarket/img/img_level2_30.png" alt="뱃지 이미지">
                                                                <% 
                                                                	}else{
                                                                %>
                                                                	<img class="profile_img_level" src="/HelloMarket/img/img_level3_30.png" alt="뱃지 이미지">
                                                                <% 
                                                                	}
                                                                %>
                                         
                                                                </a></div>
                                                    <div class="nick"><a href="/HelloMarket/mystore/index.jsp?userIdx=<%=uploaderIdx%>"><%=uploaderNick %></a>
                                                        <div class="detail_member_level">Lv <%=uploaderLevel %> <%=uploaderLevelName %></div>
                                                    </div>
                                                    <div class="item_count"><a href="/s/@1388926?type=item"><span
                                                                class="item_count_title">상품</span><span
                                                                class="item_count_number"><%=userItemCnt %></span></a></div>
                                                   
                                                </div>
                                                <div class="description">
                                                    <div class="description_title">상세설명</div>
                                                    <div class="detail_item_description">
                                                        <div class="description_text"><%=boardDTO.getP_description() %>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="detail_bottom_box">
                                                    <div class="detail_bottom_area"><img
                                                            src="https://ccimage.hellomarket.com/web/2020/item/ico_detail_info_time_x2.png"
                                                            alt="지도아이콘" class="item_location_img"><span
                                                            class="time"><%=boardDTO.getP_regist_date() %></span></div>
                                                    <div class="detail_bottom_area"><img
                                                            src="https://ccimage.hellomarket.com/web/2020/item/ico_detail_info_location_x2.png"
                                                            alt="지도아이콘" class="item_location_img">
                                                            <span><%=boardDTO.getP_transac_loc() %></span></div>
                                                    <div class="detail_bottom_area"><img
                                                            src="https://ccimage.hellomarket.com/web/2020/item/ico_detail_info_category_x2.png"
                                                            alt="지도아이콘" class="item_location_img"><a
                                                            href="/search?category=HAC0000"><span><%=firstCat %></span></a>
                                                        <div> &gt; </div><a
                                                            href="/search?category=HAC0007"><span><%=secondCat %></span></a>
                                                    </div>
                                                </div>
                                                <div class="item_buy_area">
                                                    <div class="item_wish_box">
                                                        <div class="item_wish_box_border"><button type="button"
                                                                class="image_wish_box_btn"><img
                                                                    src="https://ccimage.hellomarket.com/web/2018/item/ico_zzim.png"
                                                                    alt="찜하기이미지" class="ad_wish_icon"></button></div>
                                                    </div>
                                                    <div class="item_talk_box">
                                                        <div class="item_talk">헬로톡</div>
                                                    </div>
                                                    <div class="item_buy_box"><button type="button"
                                                            class="item_buy">헬로페이 구매</button></div>
                                                </div>
                                             <%
                                             	int cnt = cmtCnt;
                                             %>
                                             
                                                <div class="comment_title">
                                                    <div class="comment_title_comment">댓글</div>
                                                    <span id="commentCnt"><%=cmtCnt %></span>
                                                </div>
                                                <div class="input_custorm">
                                                    <div class="cm_in_box"><textarea type="text"
                                                            placeholder="댓글을 입력해주세요." class="input_txt"></textarea>
                                                    </div>
                                                    <div class="cms_btn_box" onclick= "commentup('<%=userNick%>','<%=p_idx%>','<%=cmtCnt%>')">
                                                        <div class="comment_send_btn">댓글등록</div>
                                                    </div>
                                                </div> 
                                                		<div class="comment_list_box">
														    <ul class="comment_list">
                                                <%
                                                	if(cmtCnt>0){
                                                		for(CommentDTO c : commentList){
                                                		
                                                %>
                                    
														        <li class="comment_al_list">
														            <div class="cmt_dtl"><a href="/s/@15979427?tab=item"><img src="https://ccimage.hellomarket.com/web/2017/common/img_default_profile_60x60.png" alt="회원 이미지" class="cmt_img"></a>
														                <div class="cmt_info">
														                    <div class="cmt_top">
														                        <div class="nick"><a class="link" href="/s/@15979427?tab=item"><%=c.getUserNick() %></a></div>
														                        <div class="date"><%=c.getcDate() %></div><a class="del_btn_link"><img src="https://ccimage.hellomarket.com/mobileWeb/comment/itemdetail_img_comment_overflow.png" alt="답글삭제이미지" class="del_btn"></a>
														                    </div>
														                    <div class="cmt_content"><%=c.getcContent() %></div>
														                    <div class="cmt_bottom" onclick="answer_answer()">답글</div>
														                </div>
														            </div>
														            <div class="answer_area" style="display : none">
																		 <textarea placeholder="댓글을 입력해주세요."></textarea>
																  	 	 <img src="https://ccimage.hellomarket.com/web/button/btn_input_comment_normal.png" alt="댓글등록" class="comment_btn">
																  	 </div>
														        </li>
                                                <% 
                                                		}
                                                	}
                                                %>                 
														    </ul>
														</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pc_display_center" style="height: auto !important;"><ins class=" adsbygoogle"
                                    data-ad-client="ca-pub-9169594828612333" data-ad-slot="9845669852" data-ad-layout=""
                                    data-ad-layout-key="" data-ad-format="auto" data-full-width-responsive="false"
                                    style="width: 970px; height: 350px; display: inline-block;"
                                    data-adsbygoogle-status="done"><ins id="aswift_2_expand"
                                        style="display: inline-table; border: none; height: 350px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 970px; background-color: transparent;"><ins
                                            id="aswift_2_anchor"
                                            style="display: block; border: none; height: 350px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 970px; background-color: transparent; overflow: hidden;"><iframe
                                                id="aswift_2" name="aswift_2"
                                                style="left: 0px; position: absolute; top: 0px; border: 0px; width: 970px; height: 350px;"
                                                sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"
                                                width="970" height="350" frameborder="0"
                                                src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-9169594828612333&amp;output=html&amp;h=280&amp;slotname=9845669852&amp;adk=3806366087&amp;adf=286206833&amp;w=970&amp;fwrn=1&amp;fwrnh=100&amp;lmt=1588138289&amp;rafmt=1&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=970x280&amp;url=https%3A%2F%2Fwww.hellomarket.com%2Fitem%2F166593275%3FviewPath%3Dmain_feed%26clickPath%3Dhome%26feedType%3Dranking%26featuredFeedType%3DRankingItem%26escrowType%3Dcommon%26feedPosition%3D3&amp;flash=0&amp;fwr=0&amp;fwrattr=false&amp;rh=250&amp;rw=970&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;dt=1588138289907&amp;bpp=1&amp;bdt=946512&amp;idt=1&amp;shv=r20200427&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dd077faa77778f306%3AT%3D1583485911%3AS%3DALNI_MZ4jvWIHPkHvPhWKywGCZFHfS2HIA&amp;crv=1&amp;prev_fmts=250x336%2C0x0%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C250x336%2C160x600%2C160x600%2C970x280%2C250x336%2C250x336%2C160x600%2C250x336%2C160x600&amp;nras=1&amp;correlator=3639033420052&amp;frm=20&amp;pv=1&amp;ga_vid=1440211444.1583485911&amp;ga_sid=1588137344&amp;ga_hid=1951705424&amp;ga_fc=0&amp;iag=0&amp;icsg=561034296895&amp;dssz=25&amp;mdo=0&amp;mso=0&amp;u_tz=540&amp;u_his=16&amp;u_java=0&amp;u_h=1120&amp;u_w=1792&amp;u_ah=1024&amp;u_aw=1792&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=11&amp;ady=1845&amp;biw=991&amp;bih=913&amp;scr_x=0&amp;scr_y=0&amp;eid=21065472%2C21065474%2C44716443%2C44716445&amp;oid=3&amp;psts=AKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCI89OQPBIV3Eyv-5D0u6RpVW-R0AjIJqHQiXqS0V1llZGr1ZeNael7mPKn3LrrB%2CAKB7eCJXEdrESIGWCZQPs0k7tilP0sKSuFdEPzA7doBNN6tSdhRH5Cg5q7s%2CAKB7eCJXEdrESIGWCZQPs0k7tilP0sKSuFdEPzA7doBNN6tSdhRH5Cg5q7s%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCI98vEZT-SgamfOFT98rZ5dGwBTz9nkz_5DtytPlOlyINkGnQwzU-nze77r85W2%2CAKB7eCJoKaWxSE6RfWROJ_qXYmcpy7h8nrh1GkNIjYT6cHfm4z4sThkT16A%2CAKB7eCJoKaWxSE6RfWROJ_qXYmcpy7h8nrh1GkNIjYT6cHfm4z4sThkT16A%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCKFacPpiQymHOXC1OyNbri1NvdyYSHe3mrqvMpoVgT-oQedjej4yd0%2CAKB7eCLAZYbcT2me7JfBug18auY85RrmDsuv2fCGQbERG6b1qJH700F6zTA%2CAKB7eCLAZYbcT2me7JfBug18auY85RrmDsuv2fCGQbERG6b1qJH700F6zTA%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCK8ymgXs_YtQon2j5-7TFn4oSclh9M2Ogm9_IRRgQoj6VLK8FgXxZTcypyjo1AZMw%2CAKB7eCI9_o6FOKW5MmZpXUGhrQn9_SKjGd3RCwHgp499zQU0u4ZEJ5X37B7CPa3bkp81QQ%2CAKB7eCI9_o6FOKW5MmZpXUGhrQn9_SKjGd3RCwHgp499zQU0u4ZEJ5X37B7CPa3bkp81QQ%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCLxGa-eEXar5ls8mknbmdqRN9oGwBpZ2IG04-9HJtzzCU1dLZPmar5KejhaJYk7Iw%2CAKB7eCKuVClZD4z2stQ1lHDWIVrv7aiFk1ChaVq0bdu_jYKkU5NXLHT2pVY%2CAKB7eCKuVClZD4z2stQ1lHDWIVrv7aiFk1ChaVq0bdu_jYKkU5NXLHT2pVY%2C%2C%2C%2C&amp;pvsid=3798168746060099&amp;pem=294&amp;ref=https%3A%2F%2Faccount.hellomarket.com%2Flogin%3Fcontinue_url%3Dhttps%253A%252F%252Fwww.hellomarket.com%252F&amp;rx=0&amp;eae=0&amp;fc=896&amp;brdim=0%2C23%2C0%2C23%2C1792%2C23%2C1792%2C1024%2C991%2C913&amp;vis=1&amp;rsz=%7C%7CoeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8336&amp;bc=31&amp;ifi=36&amp;uci=a!10&amp;btvi=22&amp;fsb=1&amp;xpc=umeGIEaoYI&amp;p=https%3A//www.hellomarket.com&amp;dtd=17"
                                                marginwidth="0" marginheight="0" vspace="0" hspace="0"
                                                allowtransparency="true" scrolling="no" allowfullscreen="true"
                                                data-google-container-id="a!10"
                                                data-google-query-id="CK-EjJX0jOkCFdh6iwodOzcBBw"
                                                data-load-complete="true"></iframe></ins></ins></ins></div>
                            <div class="item_relation_wrapper">
                                <div class="item_relation">
                                    <div class="item_relation_normal_title">이런 상품은 어때요?</div>
                                    <div class="item_relation_item_list">
                                        <div>
                                            <div class="infinite-scroll-component "
                                                style="height: auto; overflow: hidden auto;">
                                                <ul>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166591808?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="/HelloMarket/upload/img/<%=boardDTO.getP_image1_orig_name() %>"
                                                                                alt="14k반지의 사진" class="thumbnail_img">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">
                                                                        <%=boardDTO.getP_title() %></div>
                                                                    <div class="item_price relation_item_price">
                                                                        <%=boardDTO.getP_price() %>원</div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/160729889?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2018/item/12/16/18/5157_2738734_1.jpg?size=s4"
                                                                                alt="레이싱휠 거치대의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">레이싱휠 거치대
                                                                    </div>
                                                                    <div class="item_price relation_item_price">50,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166583977?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/26/15/4624477_4131060_1.jpg?size=s4"
                                                                                alt="14k반지의 사진" class="thumbnail_img">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">
                                                                        <%=boardDTO.getP_title() %></div>
                                                                    <div class="item_price relation_item_price">
                                                                        <%=boardDTO.getP_price() %></div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/161256958?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/02/06/12/5245_3660789_1.jpg?size=s4"
                                                                                alt="아리아퍼니처 엔틱 빈티지 4인식탁세트의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">아리아퍼니처
                                                                        엔틱 빈티지 4인식탁세트</div>
                                                                    <div class="item_price relation_item_price">400,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166566056?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/24/22/0159116_3056614_1.jpg?size=s4"
                                                                                alt="14k 반지의 사진" class="thumbnail_img">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 반지
                                                                    </div>
                                                                    <div class="item_price relation_item_price">120,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/162219497?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/04/23/21/3138_4071694_1.jpg?size=s4"
                                                                                alt="14k 하트반지의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 하트반지
                                                                    </div>
                                                                    <div class="item_price relation_item_price">143,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166620703?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/29/13/3311234_3342475_1.jpg?size=s4"
                                                                                alt="14k 반지의 사진" class="thumbnail_img">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 반지
                                                                    </div>
                                                                    <div class="item_price relation_item_price">210,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/162380126?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/05/11/20/5823_3361655_2.jpg?size=s4"
                                                                                alt="14K로렉스팔찌+반지12호의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">
                                                                        14K로렉스팔찌+반지12호</div>
                                                                    <div class="item_price relation_item_price">950,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166582315?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/26/12/5545182_4867421_1.jpg?size=s4"
                                                                                alt="14k반지의 사진" class="thumbnail_img">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k반지
                                                                    </div>
                                                                    <div class="item_price relation_item_price">290,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166535472?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/22/18/2617133_1107191_2.jpg?size=s4"
                                                                                alt="필그림 14k 반지의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">필그림 14k
                                                                        반지</div>
                                                                    <div class="item_price relation_item_price">80,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/162733399?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/06/07/14/3608_277815_1.png?size=s4"
                                                                                alt="14k 나사목걸이의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k
                                                                        나사목걸이</div>
                                                                    <div class="item_price relation_item_price">140,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166579166?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/26/00/5006189_4099160_1.jpg?size=s4"
                                                                                alt="14k 블루큐 반지의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 블루큐
                                                                        반지</div>
                                                                    <div class="item_price relation_item_price">202,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/162880835?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/06/19/17/2855_887945_1.jpg?size=s4"
                                                                                alt="특특가[95~110] (정품) 디스커버리 남성 에어닷 공유 블루종의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">
                                                                        특특가[95~110] (정품) 디스커버리 남성 에어닷 공유 블루종</div>
                                                                    <div class="item_price relation_item_price">59,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166562496?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/24/17/4244024_4667984_1.jpg?size=s4"
                                                                                alt="14k 반지 귀걸이의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 반지
                                                                        귀걸이</div>
                                                                    <div class="item_price relation_item_price">270,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/162887713?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/06/20/09/0152_563727_1.jpg?size=s4"
                                                                                alt="14k 샤엘 민써클 팔찌의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 샤엘
                                                                        민써클 팔찌</div>
                                                                    <div class="item_price relation_item_price">235,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166565792?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/06/13/19/3033_4202918_1.jpg?size=s4"
                                                                                alt="✔14k컷팅반지의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">✔14k컷팅반지
                                                                    </div>
                                                                    <div class="item_price relation_item_price">24,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/163029254?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/07/02/11/0122_277815_1.png?size=s4"
                                                                                alt="14k 18k 커플링의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 18k
                                                                        커플링</div>
                                                                    <div class="item_price relation_item_price">250,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166584470?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/26/16/3020704_4884394_1.jpg?size=s4"
                                                                                alt="14k 티파니반지의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k
                                                                        티파니반지</div>
                                                                    <div class="item_price relation_item_price">150,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/163147793?viewPath=together&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2019/item/07/12/11/3816_277815_5.png?size=s4"
                                                                                alt="14k 18k 컷팅 사각 두줄팔찌의 사진"
                                                                                class="thumbnail_img"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k 18k
                                                                        컷팅 사각 두줄팔찌</div>
                                                                    <div class="item_price relation_item_price">290,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                    <div>전문</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                    <li class="main_col_4"><a class="card card_list relation_card_list"
                                                            href="/item/166552489?viewPath=similar&amp;clickPath=relation">
                                                            <div class="card_box">
                                                                <div class="image_wrapper">
                                                                    <div class="image_outside">
                                                                        <div class="image_centerbox"><img
                                                                                src="https://ccimg.hellomarket.com/images/2020/item/04/23/21/5744168_4631756_1.jpg?size=s4"
                                                                                alt="14k진주반지의 사진" class="thumbnail_img">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="cont">
                                                                    <div class="item_title relation_item_title">14k진주반지
                                                                    </div>
                                                                    <div class="item_price relation_item_price">290,000원
                                                                    </div>
                                                                </div>
                                                                <div class="item_type">
                                                                    <div>헬로페이</div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <div class="relation_image_wish_box image_wish_box"><button
                                                                type="button" class="image_wish_box_btn"><svg
                                                                    viewBox="0 0 24 24" fill="#484848"
                                                                    fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                                                    focusable="false" aria-label="찜하기" role="img"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="image_wish_box_img">
                                                                    <path
                                                                        d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                                                        stroke-linejoin="round"></path>
                                                                </svg></button></div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</body>
<script src="/HelloMarket/js/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="/HelloMarket/js/item.js?v=<%=System.currentTimeMillis() %>"></script>
</html>