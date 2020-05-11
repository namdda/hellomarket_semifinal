<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 등급 | 안녕마켓 - 100% 안전한 중고거래 장터</title>
    <link href="../css/chunk.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body class="">
<%
	String userId = null;
	String userNick = null;
	String userProfile = null;
	int sellerLevel = 0;
	String levelName = null;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
		userProfile = (String) session.getAttribute("userProf");
		sellerLevel = (int)session.getAttribute("sellerLevel");
	}
	
	if(sellerLevel==1){
		levelName = "화이트";
	}else if(sellerLevel==2){
		levelName ="블루";
	}else{
		levelName="브론즈";
	}
%>
      
        
          <header class="">
      <div class="bar hide"></div>
      <section class="header_top">
        <div class="header_logo header_logo_s">
          <div class="log_box"><a href="../Main.jsp"><img src="../img/MarketMain.png" class="logo" alt="헬로마켓"><img
                src="https://ccimage.hellomarket.com/web/2020/common/img_title_logo.png" class="mobile_logo"
                alt="헬로마켓"></a></div>
<%
	if(userId == null ){
%>
   	<script>
   		alert('로그인을 해주세요');
   		location.href = "../login/login.html";
   	</script>
<%
	}else{
%>
		<div class="btn_box">
    <div class="nick">
    	<img src="/HelloMarket/img/img_default_profile_60x60.png" width="36" height="36" alt="<%=userNick %>의 프로필 사진" class="profile_img">
    	<span class="nick_title"><%=userNick %>님</span>
    	</div>
    <div class="notification_box">
    	<a href="" target="_blank" rel="noopener noreferrer">
    		<img src="/HelloMarket/img/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">
        	<div class="chat_cnt">4</div>
        </a>
        <a id ="alarm_btn" target="_blank">
        	<img src="/HelloMarket/img/btn_title_notification.png" alt="알림목록 아이콘" class="alram">
            <div class="alram_cnt">3</div>
        </a></div>
</div>
<% 
	}
%>
          <div style="display: none;">
            <div class="gnb_my_lyr test_type"><a href="mystore/level.jsp">
                <div class="gnb_my_member_level">
<%
		  if(sellerLevel==1){
%>
		<img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level1_30.png" alt="뱃지 이미지">
<% 			  
		  }else if(sellerLevel==2){
%>
		<img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level2_30.png" alt="뱃지 이미지">
<%
		  }else{
%>
		<img class="gnb_my_member_level_img" src="/HelloMarket/img/img_level3_30.png" alt="뱃지 이미지">
<% 
		  }
%>
                  <div><span class="level_description">나의등급</span><span class="level_description_name"><%=levelName %></span></div>
                </div>
              </a>
              <ul class="gnb_my_list">
              	<a href="/HelloMarket/mystore/index.jsp?<%=userNick%>">
                  <li class="gnb_my_list_first">내상점</li>
                </a>
                <a href="/HelloMarket/mystore/coupon.jsp">
                  <li>할인쿠폰</li>
                </a>
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
                  <div class="mobile_login_wrapper">
                    <div class="btn_close_wrapper"><input type="checkbox" class="close_checkbox chkbox1" id="btnClose"
                        name="btnClose"><button type="button" class="btn_close" for="btnClose">닫기</button></div>
                    <div class="member_info"><a class="nick" href="/s/@15979427?tab=item">
                        <div class="profile_wrapper"><img src="../img/img_default_profile_60x60.png"
                            alt="n15979427의 프로필 사진" id="loginProfileImg" class="profile_img"></div>
                        <div class="member_info_txt">n15979427</div>
                      </a></div>
                  </div>
                  <div class="mobile_nav">
                    <div class="cat_avt">
                      <ul class="cat_avt_top">
                        <li><a href="/search?sort=current">최신순 &gt;</a></li>
                        <li><a>가까운순 &gt;</a></li>
                      </ul>
                    </div>
                    <ul class="cat_list mobile_cat_list">
                      <li class="category"><a class="cat_link mobile_cat_link"
                          href="/m/hellopay.hm?type=seller&amp;status=open"><span class="category_text">헬로페이
                            거래내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/wallet/history"><span
                            class="category_text">전자지갑 · 결제관리</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/order/auto/sales/list.hm"><span
                            class="category_text">일반 결제내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/shipping.hm?type=sender"><span
                            class="category_text">배송관리</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/m/coupon"><span
                            class="category_text">할인쿠폰</span></a></li>
                    </ul>
                    <div class="mobile_category_line"></div>
                    <ul class="cat_list mobile_cat_list_none">
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="cat_space"><a></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAK0000"><img
                            src="/HelloMarket/img/cate_hak0000.png" alt="휴대폰, 테블릿" class="category_img"><span
                            class="category_text">휴대폰, 테블릿</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAD0000"><img
                            src="/HelloMarket/img/cate_had0000.png" alt="뷰티" class="category_img"><span
                            class="category_text">뷰티</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAA0000"><img
                            src="/HelloMarket/img/cate_haa0000.png" alt="여성의류" class="category_img"><span
                            class="category_text">여성의류</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAC0000"><img
                            src="/HelloMarket/img/cate_hac0000.png" alt="신발,가방,잡화" class="category_img"><span
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
                      <li><a href="/community/list.hm?category=DAC0002">이벤트</a><i class="arrow right_arrow"></i></li>
                      <li><a href="/community/list.hm?category=DAC0004">헬마뉴스</a><i class="arrow right_arrow"></i></li>
                      <li><a href="/help/faq.hm">헬프센터</a><i class="arrow right_arrow"></i></li>
                      <li><a href="./ad/index.html" target="_blank" rel="noopener noreferrer">광고센터</a><i
                          class="arrow right_arrow"></i></li>
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
          <div class="sellimg_sub_box header_wrapper_sub">
            <div class="selling_bot"><img src="../img/ico_sell_camera_x2.png" alt="판매하기 이미지" class="selling_bot_img"><span
                class="selling_bot_text">판매하기</span></div>
          </div>
          <div class="link_box header_wrapper_sub">
            <ul>
              <li><a href="/community/list.hm?category=DAC0002&amp;status=begin">이벤트</a></li>
              <li><a href="/help/faq.html">헬프센터</a></li>
              <li><a href="ad/index.html" target="_blank" rel="noopener noreferrer"><img
                    src="../img/ico_category_AD_x2.png" alt="광고센터 아이콘이미지">광고센터</a></li>
            </ul>
          </div>
        </div>
      </section>
    </header>


        <section class="content">
            <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
            <h2>나의 등급</h2>
            <div class="item_list_min">
                <div class="item_list_area">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="/">HOME</a></li>
                        </ul>
                    </div>
                    <div class="main_area">
                        <div class="main_area_center">
                            <div class="main">
                                <div class="left">
                                    <div class="my_profile_left">
                                        <div class="my_profile_info">
                                            <div class="my_profile_image"><img
                                                    src="../img/img_apply_profile_4x_0419.png"
                                                    alt="n14474743의 프로필 이미지"><img src="../img/img_level_5_x2.png"
                                                    alt="뱃지 이미지"></div>
                                            <div class="my_profile_nick"><%=userNick %></div>
                                            <div class="my_profile_shop_created">
                                                <div class="my_profile_start_mobile">태조 2년 시작</div>
                                                <div class="my_profile_shop"><a href="/m/profile"><button
                                                            type="button">상점주소생성(빼는게 좋음)</button></a></div>
                                                <div class="my_profile_start">태조 2년 시작</div>
                                            </div>
                                            <div class="my_profile_follow"><a href="/m/following">
                                                    <div class="my_profile_follow_count">
                                                        <span>팔로잉</span><span>7777</span>
                                                    </div>
                                                </a>
                                                <div class="my_profile_follow_line">|</div><a href="/m/followers">
                                                    <div class="my_profile_follow_count">
                                                        <span>팔로워</span><span>60억명</span>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="my_profile_pro_review">
                                                <div class="my_profile_pro_review_box"><a
                                                        href="/s/@14474743?tab=item"><span>상품</span><span>2351214</span></a>
                                                </div>
                                                <div class="my_profile_pro_review_box"><a
                                                        href="/s/@14474743?tab=review"><span>거래후기</span><span>56439522341</span>
                                                        <div class="my_profile_pro_review_rating"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 1"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 2"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 3"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 4"><img
                                                                src="../img/img_review_star_half_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 5"></div>
                                                    </a></div>
                                            </div><span class="my_profile_more_text" width="0"><span><span><%=userProfile %></span></span><span
                                                    style="position: fixed; visibility: hidden; top: 0px; left: 0px;"><span
                                                        class="text_trcucate_more">... <p>전체보기</p></span></span></span>
                                        </div>
                                        <div class="my_profile_nav">
                                            <ul>
                                                <li class="my_profile_m_nav"><a href="/s/@14474743?tab=item"><span>상품
                                                            0</span></a></li>
                                                <li class="my_profile_m_nav"><a
                                                        href="/s/@14474743?tab=review"><span>거래후기&nbsp;</span><span>127838</span>
                                                        <div class="my_profile_pro_review_rating"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 1"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 2"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 3"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 4"><img
                                                                src="../img/img_review_star_16x16_x2.png"
                                                                alt="프로필 별점 없는 이미지 5"></div>
                                                    </a></li>
                                                <li><a class="active" id="scrollMain" href="level.html"><span>나의
                                                            등급</span></a></li>
                                                <li><a href="profile.jsp"><span>내정보 설정</span></a></li>
                                                <li><a href=""><span>전문판매자 신청</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <section class="left_main">
                                    <div class="level_top">
                                        <div class="level_header">
                                        <%if(sellerLevel == 1){
                                        %>
                                            <div class="level_image"><img src="../img/img_level1_30.png"
                                                    alt="나의 등급 뱃지 이미지"></div>
                                        <%        
                                        }else if(sellerLevel == 2){
                                        %>
                                        	<div class="level_image"><img src="../img/img_level2_30.png"
                                                    alt="나의 등급 뱃지 이미지"></div>
                                        <% 
                                        }else{
                                        %>
                                        	<div class="level_image"><img src="../img/img_level_3_420x420.png"
                                                    alt="나의 등급 뱃지 이미지"></div>
                                        <% 
                                        }
                                        %>
                                            <div class="level_title"><%= userNick %> 님의 현재 등급은<span>Level <%=sellerLevel %></span> 입니다.</div>
                                            <div class="level_next">거래 1건 이상 거래 시 Level <%=sellerLevel+1 %>등급으로 변경됩니다.</div>
                                        </div>
                                        <div class="level_body">
                                            <div class="level_title">내가 받고 있는 혜택</div>
                                            <div class="level_description_table">
                                                <table class="level_table_next">
                                                    <tbody>
                                                        <tr>
                                                            <td class="level_table_next_title">페이지 관리권</td>
                                                            <td>무료 광고 12312335개 지급</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="level_table_next_title">뱃지획득</td>
                                                            <td>최고 등급 노출</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="level_view"><button type="button" id="grade_advantage">등급별 혜택
                                                    보기</button></div>
                                            <div class="level_title">최근 90일 거래실적</div>
                                            <div class="level_history">
                                                <table class="level_table">
                                                    <thead>
                                                        <tr class="table_main">
                                                            <td class="table_month"></td>
                                                            <td class="table_cell">판매 수</td>
                                                            <td class="table_price">구매 수</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>01월</td>
                                                            <td>124124124</td>
                                                            <td>0</td>
                                                        </tr>
                                                        <tr>
                                                            <td>02월</td>
                                                            <td>124125532</td>
                                                            <td>0</td>
                                                        </tr>
                                                        <tr>
                                                            <td>03월</td>
                                                            <td>45734653</td>
                                                            <td>0</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="level_title">유의사항</div>
                                            <div class="level_notice">
                                                <ul>
                                                    <li>등급은 상품 판매가격 1만원 이상의 헬로페이 구매확정완료 거래실적 기준으로 합니다.</li>
                                                    <li>등급은 최근 90일간 실적을 반영하여 매월 1일에 적용됩니다.</li>
                                                    <li>등급 산정 및 혜택은 당사 사정에 의해 변경될 수 있습니다.</li>
                                                    <li>부정한 방법으로 등급을 획득한 경우, 등급이 조정되거나 회원제재가 진행될 수 있습니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="footer">
            <div class="footer_area">
                <div class="footer_top">
                    <div class="f_wrapper">
                        <ul class="f_left">
                            <li><a href="http://company.hellomarket.com" class="link_info" target="_blank"
                                    rel="noopener noreferrer">Hellomarket Inc.</a></li>
                            <li><a class="link_info" href="/help/faq.hm">FAQ</a><span class="list_space"></span></li>
                            <li><a class="link_info" href="/terms.hm">이용약관</a><span class="list_space"></span></li>
                            <li><a class="link_info" href="/protection.hm">개인정보 처리방침</a></li>
                        </ul>
                        <ul class="f_right">
                            <li><a href="https://itunes.apple.com/kr/app/id469381475?mt=8&amp;ls=1" target="_blank"
                                    rel="noopener noreferrer"><img src="../img/img_footer_appstore.png" alt="appstore"
                                        class="appstore_n_btn"></a></li>
                            <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket"
                                    target="_blank" rel="noopener noreferrer"><img
                                        src="../img/img_footer_googleplay.png" alt="googleplay"
                                        class="googleplay_n_btn"></a></li>
                            <li><a href="https://blog.naver.com/tuckandco" target="_blank"
                                    rel="noopener noreferrer"><img src="../img/img_naver_gray_blog.png" alt="naverblog"
                                        class="naver_blog_n_btn"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer_bottom">
                    <div class="f_wrapper">
                        <div class="footer_wrapper_left">
                            <div class="fb_logobox"><img src="../img/img_footer_logo_171127.png" alt="hellomarket">
                            </div>
                            <ul class="footer_company_info">
                                <li><span>(주)헬로마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                                <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호 <a
                                            href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305"
                                            class="link_info" target="_blank" rel="noopener noreferrer"
                                            style="text-decoration: underline;">사업자정보확인</a></span></li>
                                <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                                <li><span>일반문의: <a href="https://www.hellomarket.com/help/inquiry/form.hm"
                                            target="_blank" rel="noopener noreferrer"
                                            style="text-decoration: underline;">헬프센터 - 문의</a></span><span> | <a
                                            href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200"
                                            target="_blank" rel="noopener noreferrer"
                                            style="text-decoration: underline;">제휴문의</a></span></li><br>
                                <li><span>(주)헬로마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)헬로마켓은 일체 책임을 지지
                                        않습니다.</span></li>
                                <li><span>©(주)헬로마켓. All rights reserved.</span></li>
                            </ul>
                        </div>
                        <div class="footer_wrapper_right">
                            <ul class="box">
                                <li style="font-weight: bold;">기업은행 구매 안전 서비스 (채무지급보증)</li>
                                <li>안전거래를 위해 현금 등으로 결제 시,</li>
                                <li>저희 사이트에서 가입한 기업은행의</li>
                                <li>구매안전서비스를 이용하실 수 있습니다.</li>
                                <li><img src="../img/btn_footer_service_n.png" alt="services"
                                        class="footer_service_btn"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="ReactModalPortal" style="display: none;">
        <div class="ReactModal__Overlay ReactModal__Overlay--after-open overlay" style="overflow: auto;">
            <div class="ReactModal__Content ReactModal__Content--after-open modal_main" tabindex="-1" role="dialog">
                <div class="modal_parent">
                    <div class="modal_container">
                        <div class="modal_wrapper member_level_modal">
                            <div class="modal_header utils_header">
                                <div class="modal_close"></div>
                            </div>
                            <div class="modal_body">
                                <div class="member_level_view_img">
                                    <ul class="menu_level">
                                        <li>
                                            <div class="badge_wrapper"><img
                                                    src="../img/img_level_3_420x420.png"
                                                    class="icon_level" alt="화이트 이미지">
                                                <div class="badge_title">
                                                    <p>브론즈</p><span>기본등급</span>
                                                </div>
                                            </div>
                                            <div class="level_wrapper">
                                                <div class="title">판매자</div>
                                                <ul class="level_table type2">
                                                    <li><label>유료 상단업</label>
                                                        <p>50개 무료지급 (전문판매자만 해당)</p>
                                                    </li>
                                                    <li><label>뱃지획득</label>
                                                        <p>Lv.1 브론즈뱃지 노출</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="badge_wrapper"><img
                                                    src="https://ccimage.hellomarket.com/api/member/img_level_2_420x420.png"
                                                    class="icon_level" alt="블루 이미지">
                                                <div class="badge_title">
                                                    <p>실버</p><span>최근 90일간 헬로페이 1건 이상</span>
                                                </div>
                                            </div>
                                            <div class="level_wrapper">
                                                <div class="title">판매자</div>
                                                <ul class="level_table type3">
                                                    <li><label>유료 상단업</label>
                                                        <p>200개 무료지급 (전문판매자만 해당)</p>
                                                    </li>
                                                    <li><label>뱃지획득</label>
                                                        <p>Lv.2 실버뱃지 노출</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="badge_wrapper"><img
                                                    src="https://ccimage.hellomarket.com/api/member/img_level_3_420x420.png"
                                                    class="icon_level" alt="브론즈 이미지">
                                                <div class="badge_title">
                                                    <p>브론즈</p><span>최근 90일간 헬로페이 3건 이상</span>
                                                </div>
                                            </div>
                                            <div class="level_wrapper">
                                                <div class="title">판매자</div>
                                                <ul class="level_table type3">
                                                    <li><label>유료 상단업</label>
                                                        <p>250개 무료지급 (전문판매자만 해당)</p>
                                                    </li>
                                                    <li><label>뱃지획득</label>
                                                        <p>Lv.3 골드뱃지 노출</p>
                                                    </li>
                                                    <li><label>쿠폰</label>
                                                        <p>헬로페이 상품 3천원 할인 쿠폰(1장)</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="menu_level_footer">등급 산정 및 혜택은 당사 사정에 의해 변경 될 수 있습니다.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../js/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="../js/mystore_level.js"></script>

</html>