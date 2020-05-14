<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "User.*" %>
<%@page import="Board.BoardDTO" %>
<%@page import="Board.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name = "viewport" content= "width-device-width", initial-scale="1">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>안녕마켓 - 100% 안전한 중고거래 장터</title>
  <link href="css/chunk.css" rel="stylesheet" type="text/css">
  <link href="css/slide.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<!--바디 부분이다!!!!-->
<body>
<%
	String userId = null;
	String userNick = null;
	int sellerLevel = 0;
	String levelName = null;
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
	 
	 AlarmDAO alarmDAO = new AlarmDAO();
	 AlarmDTO alarmDTO = new AlarmDTO();
		
		
		int alarm_count =0; // 사용할 변수 선언하는거 (상자 이름)
		alarm_count =alarmDAO.AlarmNum(userId); // 함수 사용하는거
		
		int alarm_zero = 0;	
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
    	<img src="/HelloMarket/img/img_default_profile_60x60.png" width="36" height="36" alt="<%=userNick %>의 프로필 사진" class="profile_img">
    	<span class="nick_title"><%=userNick %>님</span>
    	</div>
    <div class="notification_box">
    	<a href="/HelloMarket/chat.jsp" target="_blank" rel="noopener noreferrer">
    		<img src="/HelloMarket/img/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">
        	<div class="chat_cnt">4</div>
        </a>
        <a id ="alarm_btn" target="_blank">
        	<img src="/HelloMarket/img/btn_title_notification.png" alt="알림목록 아이콘" class="alram">
            <div class="alram_cnt"><%=alarm_count%></div>
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
		<img class="gnb_my_member_level_img" src="img/img_level1_30.png">
<% 
	}else if(sellerLevel ==2){
%>
		<img class="gnb_my_member_level_img" src="img/img_level2_30.png">
<% 
	}else{
%>
		<img class="gnb_my_member_level_img" src="img/img_level3_30.png">
<% 
	}
%>
                  <div><span class="level_description">나의등급</span><span class="level_description_name"><%=levelName %></span></div>
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
                    <div><input type="text" class="com_search" placeholder="어떤 상품을 찾고 계세요?"  value=""
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
                      <li class="category"><a class="cat_link" href="/HelloMarket/search/search.jsp?category=HAC0000"><img
                            src="/HelloMarket/img/cate_hak0000.png" alt="휴대폰, 테블릿" class="category_img"><span
                            class="category_text">휴대폰, 테블릿</span></a></li>
                      <li class="category"><a class="cat_link" href="/HelloMarket/search/search.jsp?category=HAC0001"><img
                            src="/HelloMarket/img/cate_had0000.png" alt="뷰티" class="category_img"><span
                            class="category_text">뷰티</span></a></li>
                      <li class="category"><a class="cat_link" href="/HelloMarket/search/search.jsp?category=HAC0002"><img
                            src="/HelloMarket/img/cate_haa0000.png" alt="여성의류" class="category_img"><span
                            class="category_text">여성의류</span></a></li>
                      <li class="category"><a class="cat_link" href="/HelloMarket/search/search.jsp?category=HAC0003"><img
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
            <div class="selling_bot"><img src="/HelloMarket/img/ico_sell_camera_x2.png" alt="판매하기 이미지" class="selling_bot_img"><span
                class="selling_bot_text">판매하기</span></div>
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







    <!-- 메인 이미지 영역이라 하신다~!!!!-->

    <section class="content" id="very_top">
      <h2>메인 이미지 영역</h2>

      <div class="banner_main_bg">
        <div class="banner_main_promotion">
          <div class="swiper-container banner_main_swipper">
            <div class="swiper-wrapper">
              <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" id="banner" style="transform: translate3d(0px,0px,0px); transition-duration: 0ms;">
                  <div class="swiper-slide swiper-slide-active" style="width: 980px;">
                    <a href="" target="_blank">
                      <img src="img/mainSlide01.png" class="main_img">
                    </a>
                  </div>
                  <div class="swiper-slide swiper-slide-next" style="width: 980px;">
                    <a href="" target="_blank">
                      <img src="img/mainSlide02.png" class="main_img">
                    </a>
                  </div>
                  <div class="swiper-slide swiper-slide-next-next" style="width: 980px;">
                    <a href="" target="_blank">
                      <img src="img/mainSlide03.png" class="main_img">
                    </a>
                  </div>
                </div>
                <div class="swiper-pagination home_banner_pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-bullets-dynamic" style="width: 80px;">
                  <span class="swiper-pagination-bullet swiper-pagination-bullet-active swiper-pagination-bullet-active-main" tabindex="0" role="button" aria-label="Go to slide1" style="left: 16px;"></span>
                  <span class="swiper-pagination-bullet swiper-pagination-bullet-active-next" tabindex="0" role="button" aria-label="Go to slide 2" style="left: 16px;"></span>
                  <span class="swiper-pagination-bullet swiper-pagination-bullet-active-next-next" tabindex="0" role="button" aria-label="Go to slide 3" style="left: 16px;"></span>
                </div>
                <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false">
                  <svg xmlns="https://www.w3.org/2000/svg" viewBox="0 0 27 44">
                    <path d="M27,22L27,22L5,44l-2.1-2.1L22.8,22L2.9,2.1L5,0L27,22L27,22z"></path>
                </svg>
               </div>
               <div class="swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">
                 <svg xmlns="https://www.w3.org/2000/svg" viewBox="0 0 27 44">
                    <path d="M0,22L22,0l2.1,2.1L4.2,22l19.9,19.9L22,44L0,22L0,22L0,22z"></path>
                 </svg>
              </div>
              </div>
            </div>
          </div> 
        </div>
      </div>

<%
	List<BoardDTO> boardDTO = new ArrayList<BoardDTO>();
	BoardDAO boardDAO =new BoardDAO();
	boardDTO = boardDAO.showAllItem();
%>

      <!-- 리스트 메인 에리어-->
      <div class="main_area">
        <div class="main_area_center">
          <div class="main_home">
            <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
            <h2>모바일 중고나라, 무료나눔이 많은 직거래 중고장터</h2>
            <div>
              <div class="infinite-scroll-component " style="height: auto; overflow: auto;">
                <ul class="mian_row">
<%
	for(BoardDTO b : boardDTO){
%>
	<li class="main_col_4" style="height: auto;">
		<a class="card card_list" href="/HelloMarket/item/item.jsp?p_idx=<%=b.getP_idx()%>">
       		 <div class="card_box">
                 <div class="image_wrapper">
                     <div class="image_outside">
                            <div class="image_centerbox"><img src="/HelloMarket/upload/img/<%=b.getP_image1_orig_name()%>"
                                alt="<%=b.getP_title() %>" class="thumbnail_img"></div>
                          </div>
                        </div>
                        <div class="cont">
                          <div class="item_title"><%=b.getP_title() %></div>
                          <div class="item_price"><%=b.getP_price() %> 원</div>
                        </div>
                      </div>
                    </a></li>
	
<% 
	}
%>


             
                </ul>
              </div>
            </div>



            <!-- 제가 다운 받은 리스트 최종 -->

            <div class="scroll_top_btn_warpper">
              <div class="scroll_top_btn"><a href="#very_top"><img src="img/btn_top_n_x2.png" alt="페이지 업 버튼"></a></div>
            </div>

            <div class="ad_banner_absolute" style="top: -207px;">
              <div class="ad_banner"><a href="ad/direct/content.html" target="_blank" rel="noopener noreferrer"><img
                    src="img/img_banner_main_ad_0903_x2.png" alt="회원직접광고 배너 이미지"></a></div>
            </div>
            <div class="police_banner_absolute" style="top: 30px;">
              <div class="police_banner">
                <div><img src="img/img_main_banner_crime_prevention_day_1_x2.jpg" alt="경찰청&nbsp;배너&nbsp;이미지"></div>
              </div>
            </div>

            <!-- 여기다 푸터 넣으면 잘 된다 하더라!-->
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
                          rel="noopener noreferrer"><img
                            src="https://ccimage.hellomarket.com/web/2017/common/img_footer_appstore.png" alt="appstore"
                            class="appstore_n_btn"></a></li>
                      <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket" target="_blank"
                          rel="noopener noreferrer"><img
                            src="https://ccimage.hellomarket.com/web/2017/common/img_footer_googleplay.png"
                            alt="googleplay" class="googleplay_n_btn"></a></li>
                      <li><a href="https://blog.naver.com/tuckandco" target="_blank" rel="noopener noreferrer"><img
                            src="https://ccimage.hellomarket.com/web/2019/footer/img_naver_gray_blog.png"
                            alt="naverblog" class="naver_blog_n_btn"></a></li>
                    </ul>
                  </div>
                </div>
                <div class="footer_bottom">
                  <div class="f_wrapper">
                    <div class="footer_wrapper_left">
                      <div class="fb_logobox"><img
                          src="https://ccimage.hellomarket.com/web/2017/common/footer/img_footer_logo_171127.png"
                          alt="hellomarket"></div>
                      <ul class="footer_company_info">
                        <li><span>(주)헬로마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                        <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호 <a
                              href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305" class="link_info"
                              target="_blank" rel="noopener noreferrer"
                              style="text-decoration: underline;">사업자정보확인</a></span></li>
                        <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                        <li><span>일반문의: <a href="https://www.hellomarket.com/help/inquiry/form.hm" target="_blank"
                              rel="noopener noreferrer" style="text-decoration: underline;">헬프센터 - 문의</a></span><span> |
                            <a href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200"
                              target="_blank" rel="noopener noreferrer"
                              style="text-decoration: underline;">제휴문의</a></span></li><br>
                        <li><span>(주)헬로마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)헬로마켓은 일체 책임을 지지 않습니다.</span>
                        </li>
                        <li><span>©(주)헬로마켓. All rights reserved.</span></li>
                      </ul>
                    </div>
                    <div class="footer_wrapper_right">
                      <ul class="box">
                        <li style="font-weight: bold;">기업은행 구매 안전 서비스 (채무지급보증)</li>
                        <li>안전거래를 위해 현금 등으로 결제 시,</li>
                        <li>저희 사이트에서 가입한 기업은행의</li>
                        <li>구매안전서비스를 이용하실 수 있습니다.</li>
                        <li><img src="https://ccimage.hellomarket.com/web/2017/common/footer/btn_footer_service_n.png"
                            alt="services" class="footer_service_btn"></li>
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


  <!-- 푸터 찾았다!!!!!-->

</body>
<script src="js/common.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="js/scrolling.js"></script>
</html>