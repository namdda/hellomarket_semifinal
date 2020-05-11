<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>헬프센터</title>
  <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
  <link href="../css/swiper4.2.2.min.css" rel="stylesheet" type="text/css">
  <link href="../css/sweetalert.css" rel="stylesheet" type="text/css">
  <link href="../css/styles.6418ba9e.chunk.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="../js/helpcenter.js"></script>
  <script src="../js/common.js"></script>
  <script src="../js/postcode.js"></script>
    <style>
    @media all and (max-width: 800px) {
      img {
        width: 100%;
      }
    }
  </style>

  <style id="__jsx-2573731215">
    #nprogress {
      pointer-events: none;
    }

    #nprogress .bar {
      background: #2299DD;
      position: fixed;
      z-index: 1031;
      top: 0;
      left: 0;
      width: 100%;
      height: 2px;
    }

    #nprogress .peg {
      display: block;
      position: absolute;
      right: 0px;
      width: 100px;
      height: 100%;
      box-shadow: 0 0 10px #2299DD, 0 0 5px #2299DD;
      opacity: 1;
      -webkit-transform: rotate(3deg) translate(0px, -4px);
      -ms-transform: rotate(3deg) translate(0px, -4px);
      -webkit-transform: rotate(3deg) translate(0px, -4px);
      -ms-transform: rotate(3deg) translate(0px, -4px);
      transform: rotate(3deg) translate(0px, -4px);
    }

    #nprogress .spinner {
      display: none;
      position: fixed;
      z-index: 1031;
      top: 15px;
      right: 15px;
    }

    #nprogress .spinner-icon {
      width: 18px;
      height: 18px;
      box-sizing: border-box;
      border: solid 2px transparent;
      border-top-color: #2299DD;
      border-left-color: #2299DD;
      border-radius: 50%;
      -webkit-animation: nprogresss-spinner 400ms linear infinite;
      -webkit-animation: nprogress-spinner 400ms linear infinite;
      animation: nprogress-spinner 400ms linear infinite;
    }

    .nprogress-custom-parent {
      overflow: hidden;
      position: relative;
    }

    .nprogress-custom-parent #nprogress .spinner,
    .nprogress-custom-parent #nprogress .bar {
      position: absolute;
    }

    @-webkit-keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
      }
    }

    @-webkit-keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }

    @keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
  </style>
  <style id="__jsx-1471488780">
    #nprogress {
      pointer-events: none;
    }

    #nprogress .bar {
      background: #2299DD;
      position: fixed;
      z-index: 1031;
      top: 0;
      left: 0;
      width: 100%;
      height: 2px;
    }

    #nprogress .peg {
      display: block;
      position: absolute;
      right: 0px;
      width: 100px;
      height: 100%;
      box-shadow: 0 0 10px #2299DD, 0 0 5px #2299DD;
      opacity: 1;
      -webkit-transform: rotate(3deg) translate(0px, -4px);
      -ms-transform: rotate(3deg) translate(0px, -4px);
      -webkit-transform: rotate(3deg) translate(0px, -4px);
      -ms-transform: rotate(3deg) translate(0px, -4px);
      transform: rotate(3deg) translate(0px, -4px);
    }

    #nprogress .spinner {
      display: block;
      position: fixed;
      z-index: 1031;
      top: 15px;
      right: 15px;
    }

    #nprogress .spinner-icon {
      width: 18px;
      height: 18px;
      box-sizing: border-box;
      border: solid 2px transparent;
      border-top-color: #2299DD;
      border-left-color: #2299DD;
      border-radius: 50%;
      -webkit-animation: nprogresss-spinner 400ms linear infinite;
      -webkit-animation: nprogress-spinner 400ms linear infinite;
      animation: nprogress-spinner 400ms linear infinite;
    }

    .nprogress-custom-parent {
      overflow: hidden;
      position: relative;
    }

    .nprogress-custom-parent #nprogress .spinner,
    .nprogress-custom-parent #nprogress .bar {
      position: absolute;
    }

    @-webkit-keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
      }
    }

    @-webkit-keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }

    @keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
  </style>
</head>

<body>
<%	
	String userId = null;
	String userNick = null;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
	}
%>
    <div id="__next" style="height: auto !important;">
        <div class="mobile_banner">
            <div class="mobile_banner_wrapper"><img alt="앱으로하기 로고"
                    src="https://ccimage.hellomarket.com/web/2019/menu/img_mobile_top_banner_190516_01.png"
                    class="header_down_left"><img alt="앱으로하기"
                    src="https://ccimage.hellomarket.com/web/2019/menu/img_mobile_top_banner_190516_02.png"
                    class="header_down_right"></div>
        </div>
        <header class="">
      <div class="bar hide"></div>
      <section class="header_top">
        <div class="header_logo header_logo_s">
          <div class="log_box"><a href="./Main.jsp"><img src="../img/MarketMain.png" class="logo" alt="헬로마켓"><img
                src="https://ccimage.hellomarket.com/web/2020/common/img_title_logo.png" class="mobile_logo"
                alt="헬로마켓"></a></div>
<%
	if(userId == null ){
%>
          <div class="btn_box">
          <a href="../login/login.html"class="btn_login_box">
          <button class="login_btn">로그인</button>
          </a><a class="btn_signup_box"><button class="signup_btn">회원가입</button></a><a href="../join/signup.html">
              <div class="notification_box"></div>
            </a></div>
<%
	}else{
%>
		<div class="btn_box">
    <div class="nick"><img src="https://ccimage.hellomarket.com/web/2017/common/img_default_profile_60x60.png" width="36" height="36" alt="<%=userNick%>"의 프로필 사진" class="profile_img"><span class="nick_title"><%=userNick %></span></div>
    <div class="notification_box"><a href="https://account.hellomarket.com/messages" target="_blank" rel="noopener noreferrer"><img src="https://ccimage.hellomarket.com/web/2019/common/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">
            <div class="chat_cnt">4</div>
        </a><a href="https://account.hellomarket.com/alarms" target="_blank"><img src="https://ccimage.hellomarket.com/web/2019/common/btn_title_notification.png" alt="알림목록 아이콘" class="alram">
            <div class="alram_cnt">3</div>
        </a></div>
</div>
<% 
	}
%>
          <div style="display: none;">
            <div class="gnb_my_lyr test_type"><a href="/mystore/level.jsp">
                <div class="gnb_my_member_level"><img class="gnb_my_member_level_img" src="../img/img_level_3_420x420.png"
                    alt="뱃지 이미지">
                  <div><span class="level_description">나의등급</span><span class="level_description_name">화이트</span></div>
                </div>
              </a>
              <ul class="gnb_my_list"><a href="/s/@15979427?type=item">
                  <li class="gnb_my_list_first">내상점</li>
                </a><a href="/m/hellopay.hm?type=seller&amp;status=open">
                  <li>헬로페이 거래내역</li>
                </a><a href="/m/coupon">
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
                            alt="<%=userNick%>의 프로필 사진" id="loginProfileImg" class="profile_img"></div>
                        <div class="member_info_txt"><%=userNick%></div>
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
                          href="/hellopay.jsp"><span class="category_text">헬로페이
                            거래내역</span></a></li>
                      <li class="category"><a class="cat_link mobile_cat_link" href="/coupon.jsp"><span
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
                            src="../img/cate_hak0000.png" alt="휴대폰, 테블릿" class="category_img"><span
                            class="category_text">휴대폰, 테블릿</span></a></li>
                      <li class="category"><a class="cat_link" href="search/search_beauty.jsp"><img
                            src="../img/cate_had0000.png" alt="뷰티" class="category_img"><span
                            class="category_text">뷰티</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAA0000"><img
                            src="../img/cate_haa0000.png" alt="여성의류" class="category_img"><span
                            class="category_text">여성의류</span></a></li>
                      <li class="category"><a class="cat_link" href="/search?category=HAC0000"><img
                            src="../img/cate_hac0000.png" alt="신발,가방,잡화" class="category_img"><span
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
                      <li><a href="/community/list.hm?category=DAC0004">헬마뉴스</a><i class="arrow right_arrow"></i></li>
                      <li><a href=".helpcenter.jsp">헬프센터</a><i class="arrow right_arrow"></i></li>
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
              <li><a href="./helpcenter.jsp">헬프센터</a></li>
              <li><a href="ad/index.html" target="_blank" rel="noopener noreferrer"><img
                    src="../img/ico_category_AD_x2.png" alt="광고센터 아이콘이미지">광고센터</a></li>
            </ul>
          </div>
        </div>
      </section>
    </header>
</head>
<body>
      <section class="content">
          <h1>안녕마켓 - 100% 안전한 중고거래 장터</h1>
          <h2>FAQ</h2>
          <div class="item_list_min">
              <div class="item_list_area">
                  <div class="breadcrumbs">
                      <ul>
                          <li><a href="Main.jsp">HOME</a></li>
                      </ul>
                  </div>
                  <div class="main_area">
                      <div class="main_area_center">
                          <div class="main">
                              <div class="left">
                                  <div class="left_nav_type2">
                                      <div class="left_nav_type2_title">헬프센터</div>
                                      <ul class="left_nav_menu">
                                          <li><a class="active" id="scrollMain" href="Helpcenter.jsp"><span>자주묻는질문</span></a></li>
                                          <li><a href="https://www.hellomarket.com/help/policy.hm"><span>운영정책</span></a></li>
                                          <li><a href="./inquiry.jsp"><span>일반 문의</span></a></li>
                                          <li><a href="https://www.hellomarket.com/help/notice.hm"><span>공지사항</span></a></li>
                                      </ul>
                                  </div>
                              </div>
                              <section class="left_main">
                                  <div class="faq_wrapper">
                                      <div class="search_wrapper" id="searchWrapper" name="searchBox"><label class="search_label"><img src="https://ccimage.hellomarket.com/api/2017/faq/ico_search_n_57x57.png" alt="검색 아이콘"></label><input type="text" class="w_10" id="senderName" maxlength="30" placeholder="질문 키워드를 입력하세요." value="">
                                          <hr>
                                      </div>
                                      <div>
                                          <div class="hide"><span></span>에 대한 총 검색 결과 총 <span>0개</span></div>
                                      </div>
                                      <ul class="faq_tab">
                                          <li class=" active">
                                              <div>Top 10</div>
                                          </li>
                                          <li class="">
                                              <div>헬로페이</div>
                                          </li>
                                          <li class="">
                                              <div>배송</div>
                                          </li>
                                          <li class="">
                                              <div>전문판매자</div>
                                          </li>
                                          <li class="">
                                              <div>광고</div>
                                          </li>
                                          <li class="">
                                              <div>이용방법/기타</div>
                                          </li>
                                      </ul>
                                      <ul class="faq_List">
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[헬로페이] 헬로페이와 직거래는 어떤 차이가 있나요?</div>
                                              </div>
                                              <div class="faq_content">'헬로페이'는 구매자가 안전하게 상품을 받은 후 판매자에게 대금이 전달되는 에스크로 안전결제 시스템입니다. <br><br>'직거래'는 구매자가 상품을 받기 전 판매자의 계좌로 송금하는 등 헬로페이가 아닌 거래 방식으로 안전이 보장되지 않습니다. <br><br>'직거래'는 사기피해가 발생할 경우 안녕마켓이 도움을 드릴 수 없지만, '헬로페이'는 구매확정 전까지 안녕마켓이 판매대금을 안전하게 보관합니다. </div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[헬로페이] 구매자에게 상품을 어떻게 보내야 하나요?</div>
                                              </div>
                                              <div class="faq_content">상품 특성과 거래 상황에 따라 배송방법을 선택할 수 있습니다. <br><br>1. 안녕마켓 배송예약 : 편의점택배, 방문택배 예약이 가능하며, 운송장번호가 자동 연동 됩니다. <br><br>2. 일반택배, (준)등기 : 상품 발송 후 운송장번호를 직접 입력해주셔야 배송현황이 연동됩니다. <br><br>3. 기타전달방법 : 만나서 거래, 용달 등 '택배 외 배송수단'의 경우 이용하세요. <br><br><br>※ '기타전달방법' 기능은 결제수단과 상품금액에 따라 이용이 가능합니다. <br> 이용대상이 아닐 경우 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 접수해주세요. </div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[헬로페이] 인출신청 하면 언제 입금되나요?</div>
                                              </div>
                                              <div class="faq_content">출금은 인출신청일 다음 영업일까지 처리되고 있습니다. <br> <br>평일 오전에 인출신청 하신 경우, 반나절 빠르게 당일 오후까지 출금 처리가 완료됩니다. </div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[헬로페이] 쿠폰 사용방법을 알려주세요</div>
                                              </div>
                                              <div class="faq_content">안녕마켓은 회원등급과 다양한 이벤트를 통해 헬로페이 할인쿠폰을 제공하고 있습니다. <br><br>할인쿠폰은 헬로페이 결제 시 주문서에서 사용이 가능합니다. <br><br>진행 중인 쿠폰 이벤트나 나의메뉴 내 '할인쿠폰'에서 다운 가능한 쿠폰을 확인해보세요. </div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[헬로페이] 반품환불정책을 알려주세요</div>
                                              </div>
                                              <div class="faq_content">헬로페이는 개인들의 입장을 고심하여 자체 개발한 에스크로 안심거래 서비스입니다.<br> <br>안녕마켓은 개인간거래에 최적화 된 안전한 거래환경을 조성하고, 회원 간 원활한 거래가 이루어질 수 있도록 헬로페이 반품환불 정책을 운영합니다.<br><br>1. 개인간거래 특성상 원칙적으로 반품환불은 판매자와 구매자 간 상호 합의를 통해 이루어져야 합니다.<br><br>2. 아이템 배송 후 환불은 헬로톡 대화를 통해 회원 간 이야기를 나누시고, 판매자의 동의 하에 반품환불을 진행해주세요.<br> ※ 구매자가 판매자의 동의없이 일방적인 반품을 진행할 경우, 수취거부로 인한 배송비 부담 등 문제가 발생할 수 있습니다.<br><br>반품환불에 대해 회원 간 합의가 되지 않고 거래분쟁이 발생한 경우, 안녕마켓은 헬로페이 반품환불 정책을 따릅니다.<br> <br>헬로페이를 통해 서로 만족하는 개인간 거래를 즐길 수 있도록 아래의 가이드를 참고하시고, 헬로페이 반품환불 정책을 준수해주세요. <br><br><br><br>[판매자 가이드] <br> <br>1) 안녕마켓 거래부적합 아이템은 판매하지 말아주세요. <br> <br>2) 거래아이템 정보(내용, 상태 등)를 실제 촬영한 사진과 함께 등록해주세요.<br> 결제창 형태나 랜덤박스 아이템은 안녕마켓에서 판매아이템의 정보를 파악하기 어렵기 때문에 거래분쟁 발생 시 도움을 드릴 수 없습니다.<br> <br>3) 헬로페이 결제제한 아이템은 판매수락 하지 말아주세요.<br> 순금, 골드바, 상품권 등 아이템은 헬로페이로 판매하실 수 없습니다.<br> <br>4) 아이템 등록 시 구매자가 알아야 할 정보를 포함해주세요<br> - 아이템 특성에 따라 사이즈, 색상, 브랜드, 보증서 유무를 기재해주세요. <br> - 아이템 상태가 거의새것, 중고의 경우 분쟁의 요소가 있는 사용감(보풀, 스크래치, 터치감, 잔상 등)과 사용기간(제조일자, 구입시기 등)에 대해서는 판매 전 구매자에게 알려주세요. <br><br>5) 아이템의 하자 사실 등 아래의 정보는 구매자에게 배송 전 꼭! 전달해주세요.<br> - 고장, 찢어짐, 얼룩, 곰팡이, 단추 없음 등<br> - A/S, 수선, 리폼, 침수폰 등<br> - 병행수입, 리퍼아이템<br> - 일부 구성품 없음<br> ※ 판매자가 구매자에게 위의 하자 사실 등을 사전 고지하지 않은 경우, 판매자 귀책사항으로 판단하여 판매자의 동의 없이 환불 처리 될 수 있습니다. <br> ※ 아이템의 실제 사진은 구매자가 이미지 확대 없이 아이템 하자 상태를 인식할 수 있어야 합니다.<br><br><br><br>[구매자 가이드] <br> <br>1) 안녕마켓 거래부적합 아이템은 구매하지 말아주세요. <br><br>2) 헬로페이 결제제한 아이템은 결제하지 말아주세요. <br> 순금, 골드바, 상품권 등 아이템은 헬로페이로 구매하실 수 없습니다.<br> <br>3) 판매자에게 아이템에 대해 필요한 정보를 확인해주세요<br> <br> 아이템 특성에 따라 헬로톡 채팅을 통해 판매자에게 충분히 구매에 필요한 정보를 물어봐주세요.<br> <br> 안녕마켓은 개인간 거래 공간으로 판매자가 아이템에 대한 모든 정보를 전문적으로 사전에 명시하기 어렵습니다<br> 때문에 아이템 실제 사진, 사이즈, 색상, 브랜드, 보증서 유무 등 구매에 필요한 정보를 판매자에게 적극 확인해주세요<br> ※ 아이템 정보확인이 불가한 결제창 형태나 랜덤박스 아이템은 거래분쟁 발생 시 도움을 드릴 수 없습니다<br><br> 특히 거의새것, 중고 아이템의 경우 구매자의 꼼꼼한 확인이 필요합니다.<br> 중고아이템의 특성상 아이템 상태에 대해 주관성이 반영될 수 있는 점을 감안하여 판단하신 후 거래를 진행하시기를 권유드립니다.<br> 아이템 수령 후 분쟁을 방지하기 위해, 판매자에게 사용감(보풀, 스크래치, 터치감, 잔상 등)과 사용기간(제조일자, 구입시기 등)에 대해 확인해주세요.<br> <br>※ 반품환불은 판매자와의 합의를 우선으로 안내 드리고 있으며, 거래분쟁이 발생한 경우 안녕마켓은 ‘헬로페이 반품환불 정책‘에 따라 도움을 드릴 수 있습니다.<br><br><br><br> [헬로페이 반품환불 정책] <br> <br>1) 구매확정완료 전 거래는 판매자와 구매자 간 상호 합의된 경우 환불 처리 할 수 있습니다.<br> 구매확정완료 전 [1:1문의]로 환불요청을 접수해주세요. <br> <br>2) 아래의 경우 안녕마켓은 회원 간 거래분쟁에 개입하여 반품환불 처리하지 않습니다.<br> - 구매확정완료 거래<br> - 구매자가 배송완료 후 2영업일 내 1:1문의 접수하지 않을 경우 <br> - 택배 운송장(등기)번호 없는 거래<br> - 거래부적합 아이템<br> - 아이템 정보확인이 불가한 결제창, 랜덤박스 아이템<br> - 헬로페이 결제제한 아이템 (순금, 골드바, 상품권 등)<br> - 자동차, 부동산, 반려동물, 여행숙박, 티켓, 재능서비스, 골동품/희귀품 아이템<br> <br>3) 거래분쟁 발생 시 구매자는 배송완료 후 2영업일 내 [1:1문의]로 반품환불 심사를 요청할 수 있습니다.<br> 구매자의 심사요청이 접수되면 안녕마켓은 객관적인 증빙자료를 검토하여 아래의 판매자 귀책사항에 해당하는지를 판단하고 신속하게 반품환불을 진행합니다. <br> ※ 반품환불 심사요청은 배송완료 후 시간경과로 인한 아이템 사용/훼손 등 추가적인 분쟁사유 방지를 위해, 배송완료 후 2영업일 내 1:1문의를 접수해주셔야 합니다. <br><br> [판매자 귀책사항] <br> 1. 다른 아이템 배송 (색상/사이즈 등)<br> 2. 아이템에 대한 허위정보 제공 (가품을 정품으로 판매 등)<br> 3. 아이템 하자사실 등 아래정보 사전고지 없음<br> - 고장, 파손(액정 등), 기계적 결함, 찢어짐, 얼룩, 곰팡이, 단추없음, 휴대폰 찍힘 등<br> - A/S, 수선, 리폼, 침수폰 등<br> - 병행수입, 리퍼아이템<br> - 일부 구성품 없음<br> 4. 택배포장 미흡으로 인한 파손 (배송사고 제외) <br> <br> ※ 판매자의 귀책사항으로 판단될 경우 판매자의 동의없이 구매자에게 환불 처리 될 수 있습니다. <br> ※ 안녕마켓은 회원에게 귀책사항에 대한 소명 또는 증빙자료를 요청할 수 있으며, 요청기한 내 확인사항에 따라 안녕마켓의 합리적인 판단하에 거래를 종결할 수 있습니다.<br> ※ 안녕마켓 중개자로서 실제 거래상황 및 귀책자를 명확하게 판단하기 어려운 경우, 해당 거래에 개입하여 환불 또는 구매확정 하지 않으며, 판매자와 구매자간 합의 결과에 따라 처리합니다.<br><br> [반품환불 절차('판매자의 귀책'에 해당하는 경우)] <br> - 구매자 1:1문의 심사요청 접수 &gt; 안녕마켓 반품환불 심사 &gt; 판매자 환불 안내 및 반품주소 확인 &gt; 구매자 반품아이템 발송 &gt; 판매자 반품아이템 수령 및 상태확인 &gt; 구매자 환불완료<br> <br>4) 반품환불 배송비 부담 기준<br> 반품환불 시 왕복 배송비는 귀책사유를 제공한 회원이 부담함을 원칙으로 합니다.<br> - 판매자 귀책사항에 해당하는 경우 : 왕복 배송비 판매자 부담<br> - 판매자 귀책사항에 해당하지 않는 경우 : 왕복 배송비 구매자 부담<br> - 귀책자가 명확하지 않은 경우 : 회원 간 합의</div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[배송예약] 어떤 배송 서비스를 지원하나요?</div>
                                              </div>
                                              <div class="faq_content">안녕마켓은 회원님들의 편리한 거래를 위해 배송예약 서비스를 제공하고 있습니다.<br><br><br>1. 편의점택배 - CU/GS25/GS Postbox 퀵(당일택배)<br><br>안녕마켓 앱에서 희망 편의점을 선택하여 택배를 예약하면 보다 저렴한 가격에 서비스를 이용할 수 있습니다.<br>편의점 택배 예약 시 GS Postbox퀵(당일택배)를 선택하고 평일 16시, 토요일 12시 전까지 접수하면 하루 만에 배송이 완료됩니다.(단, 서울지역에서만 접수 가능)<br><br><br>2. 일반 방문택배 - 한진택배/CJ대한통운<br><br>지정한 날짜에 기사님이 방문하여 택배를 수거합니다. <br><br><br>4. 프리미엄 방문택배 - 홈픽/CU홈택배<br><br>집하 희망 일자 및 시간까지 지정이 가능한 방문택배 입니다.<br>홈픽 이용 시 최소 1시간 내에 택배 수거가 가능합니다..<br><br><br>5. 용달/퀵<br><br>회원님의 편리한 배송을 위해 용달/퀵 등 택배가 아닌 오토바이(퀵), 다마스, 라보, 1톤 트럭 배송예약 서비스도 지원하고 있습니다. <br>오토바이(퀵)는 서울/경기 지역만 이용할 수 있으니 이용에 참고 부탁드립니다.</div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[배송예약] 배송비가 어떻게 되나요?</div>
                                              </div>
                                              <div class="faq_content">각 배송수단 별 배송비는 아래의 내용을 참고해주시기 바랍니다. <br><br>1. 편의점택배(5kg 이하 2,600원~3500원, 5~20kg 4,000원)<br><br>350g 이하: 2,600원(타 권역 이동 시 3,100원) <br>350g~5kg: 3000원(타 권역 이동 시 3,500원)<br>5~20kg: 4,000원(동일권역, 타 권역 이동 시 모두 동일)<br><br>* 제주도와 내륙 간 배송은 +3,000원의 운임비가 추가됩니다. <br>* 도서지역은 추가 운송실비가 발생할 수 있습니다. <br>* 가로, 세로, 높이의 합이 140cm을 초과할 경우 편의점택배를 이용할 수 없습니다.<br><br> <br>2. 일반 방문택배(2kg 이하 3,900원부터, 5~20kg 4,900원부터)<br><br>&lt;한진택배&gt;<br>일반(20kg/140cm 이하): 3,900원<br>대형(25kg/160cm이하): 4,900원<br><br>* 제주도와 내륙 간 배송은 +3,000원의 운임비가 추가됩니다. <br>* 도서지역은 +5,000원의 운임비가 추가됩니다. <br><br>
                                                  <cj대한통운><br>일반(20kg/140cm 이하): 4,900원<br><br>* 제주도와 내륙 간 배송은 +4,000원의 운임비가 추가됩니다. <br>* 도서지역은 +4,000원의 운임비가 추가됩니다. <br><br><br>3. 프리미엄 방문택배(2kg 이하 3,500원부터, 20kg 이하 5,000원부터)<br><br>&lt;홈픽&gt;<br>2kg/80cm 이하: 3,500원<br>5kg/100cm 이하: 3,990원<br>10kg/120cm 이하: 5,500원<br>20kg/160cm 이하: 6,500원<br><br>* 제주도와 내륙 간 배송은 +1,000~6,000원의 운임비가 추가됩니다. <br>* 제주도 내 배송은 +5,000원의 운임비가 추가됩니다.<br>* 방문 당일 취소 시 수수료가 발생할 수 있습니다. <br><br>
                                                      <cu홈택배><br>2kg/80cm 이하: 4,000원<br>5kg/80cm 이하: 5,000원<br>10kg/100cm 이하: 6,000원<br>20kg/120cm 이하: 7,500원<br><br>* 제주/도서지역 배송은 +4,000원의 운임비가 추가됩니다.<br>* 방문 당일 취소 시 수수료가 발생할 수 있습니다. <br><br>4. 용달/퀵 서비스는 배송수단 별 예약화면에서 예상 견적을 조회할 수 있습니다.</cu홈택배>
                                                  </cj대한통운>
                                              </div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[광고] 회원직접광고는 무엇인가요?</div>
                                              </div>
                                              <div class="faq_content">회원직접광고는 회원님의 상품을 메인 상품 리스트에 직접 노출 할 수 있는 서비스입니다.<br><br>고정된 위치에서 일정한 비율로 노출되고 있으며 메인화면에 노출되는 만큼 많은 회원이 볼 수 있어 매우 효과적인 광고입니다.<br>전화 문의, 헬로톡, 댓글 등의 다양한 연락수단을 제공하여 구매자와 빠른 연락이 가능합니다.<br><br>대부분의 상품을 등록하실 수 있습니다만, 위조상품 등 거래부적합 상품에 해당하는 경우에는 광고 심사에서 취소처리가 될 수 있습니다.<br>자세한 내용은 나의메뉴 &gt; 광고센터 &gt; 회원직접광고 (자세히 보기)를 참고해주시기 바랍니다.<br><br>- 신청 방법 : 나의메뉴 &gt; 광고센터 &gt; 회원직접광고</div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[광고] 유료 상단업은 무엇인가요?</div>
                                              </div>
                                              <div class="faq_content">유료 상단업은 상품을 많이 노출하여 판매가 빨리 될 수 있도록 도와주는 유료 상품입니다.<br><br>구매 방법 : 앱, 웹사이트 광고센터 &gt; 유료 상단업 ‘구매’<br><br>유효기간 : 구매일로부터 180일<br><br>유효기간은 상단업의 사용기한입니다.<br>상단업은 자동설정이나 수동실행으로 차감되며, 유효기간이 지나면 자동 소멸됩니다. (전문판매자에게 무료지급한 유료 상단업의 유효기간은 30일)<br><br>이용개수 확인 및 자동상단업 설정: 광고센터 &gt; 광고관리 &gt; 유료 상단업</div>
                                          </li>
                                          <li class="faq_section">
                                              <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                  <div class="faq_title">[전문] 전문판매자 상품 개수 기준</div>
                                              </div>
                                              <div class="faq_content">전문판매자 카테고리는 상품 개수 제한이 있으며, 전문판매자로 전환 신청 후 무제한으로 상품을 등록할 수 있습니다.<br><br>상품 개수는 하위 카테고리 등록 기준입니다. <br> <br>예) 컴퓨터,주변기기 카테고리의 경우 노트북, 데스크탑 등 하위 카테고리별 상품 개수가 기준이 됩니다. <br><br><br>자동차: 각 2개 <br>자동차용품: 각 2개<br>바이크: 각 2개 <br>바이크용품: 각 2개 <br>스포츠,레저: 각 6개 (단 등산 / 골프 / 헬스,요가 각 12개) <br>게임: 각 6개 <br>핸드메이드: 각 2개 <br>유아동,완구: 각 9개 (단 신생아,유아의류 / 아동의류는 각 20개) <br>뷰티: 각 6개 <br>여성의류: 각 9개 <br>남성의류: 각 9개 <br>신발,가방,잡화: 각 9개 <br>휴대폰,태블릿: 각 4개 <br>컴퓨터,주변기기: 각 3개 <br>카메라: 각 3개 <br>디지털,가전: 각 2개 (단 주방조리가전 / 건강,계절가전 / MP3,iPod / 기타 디지털,가전 각 4개) <br>음향기기,악기: 각 3개 <br>가구: 각 4개 <br>생활: 각 6개<br>골동품,희귀품: 각 6개 <br>티켓: 각 2개<br>RC카,드론: 각 4개 <br>피규어,키덜트: 각 9개 <br>예술,미술: 각 4개 <br>반려동물용품: 각 6개 <br>포장식품: 각 2개<br>부동산: 각 1개</div>
                                          </li>
                                      </ul>
                                      <ul class="faq_List" style="display: none;">
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 안전결제 헬로페이 란 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">'헬로페이'는 헬로마켓의 에스크로 안전결제 서비스입니다. <br><br>구매자가 결제한 금액을 상품을 받고 실제로 확인할 때까지 헬로마켓이 보관하고, 구매확정이 완료되면 판매자에게 판매대금을 전달해줌으로써 개인 간 중고거래의 불안함과 위험요소를 해결해 줍니다.<br><br>※ '헬로페이'는 헬로마켓 앱(APP)에서 가장 편리하게 이용 가능합니다. 구글플레이 스토어 또는 앱 스토어에서 헬로마켓을 다운로드하세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 헬로페이 판매 방법을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">판매상품 등록 시 거래방법 '헬로페이'를 선택해주세요. <br>헬로페이 판매 상품은 노출, 할인혜택 지원으로 빠른 판매를 도와드려요. <br><br>&lt;헬로페이 판매 과정&gt;<br>1) 구매자 결제<br>2) 판매자 배송 <br>3) 구매자 구매확정<br>4) 판매자 인출신청<br><br>알림메시지를 통해 거래상황을 알려드립니다. <br>문의사항은 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 이용해주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 헬로페이 구매 방법을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">구매를 희망하시는 상품 상세화면에 [헬로페이 안전결제] 버튼이 있습니다. <br>상품에 대해 궁금한 사항은 [헬로톡] 채팅으로 판매자와 대화를 나눠보세요. <br><br>&lt;헬로페이 구매 과정&gt;<br>1) 구매자 결제<br>2) 판매자 배송 <br>3) 구매자 구매확정<br><br>알림메시지를 통해 거래 상황을 알려드립니다. <br>문의사항은 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 이용해주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 헬로페이와 직거래는 어떤 차이가 있나요?</div>
                                            </div>
                                            <div class="faq_content">'헬로페이'는 구매자가 안전하게 상품을 받은 후 판매자에게 대금이 전달되는 에스크로 안전결제 시스템입니다. <br><br>'직거래'는 구매자가 상품을 받기 전 판매자의 계좌로 송금하는 등 헬로페이가 아닌 거래 방식으로 안전이 보장되지 않습니다. <br><br>'직거래'는 사기피해가 발생할 경우 헬로마켓이 도움을 드릴 수 없지만, '헬로페이'는 구매확정 전까지 헬로마켓이 판매대금을 안전하게 보관합니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 헬로페이 거래 중 궁금한 점이 있어요!</div>
                                            </div>
                                            <div class="faq_content">문의사항은 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 이용해주세요. <br><br>헬로페이 운영팀이 빠르고 친절하게 답변 드리겠습니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 결제수단과 수수료가 궁금해요</div>
                                            </div>
                                            <div class="faq_content">헬로페이는 다양한 결제수단을 제공하고 있습니다. <br><br>&lt;결제수수료&gt; <br>- 빠른계좌이체 : 1.5% <br>- 신용카드 : 100만원 미만 3% / 100만원 이상4%<br>- 휴대폰 소액결제 : 3%<br>- 무통장(가상계좌) : 1%<br>- 카카오페이 간편송금 : 1.5%<br>- 티머니 : 3.8%<br>- 카드포인트 : 8.8%<br> <br>&lt;안전거래수수료&gt;<br>- 1,000원<br><br>※ 헬로페이 수수료는 구매자 부담입니다. <br>※ 결제수수료 %는 판매가격 기준으로 적용됩니다. <br>※ 안전거래수수료는 결제 건별 적용 됩니다.<br>※ 헬로페이는 취소 및 환불 수수료가 없습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 결제수단별 거래한도가 있나요?</div>
                                            </div>
                                            <div class="faq_content">헬로페이는 결제수단별 거래한도가 있습니다. <br><br>- 빠른계좌이체 : 199만원 이하 <br>- 휴대폰 소액결제 : 5만원 이하 (월누적 판매 30만원 미만, 구매 10만원 미만 거래 가능)<br>- 무통장(가상계좌) : 10만원 이하 (월누적 판매 50만원 미만, 구매 20만원 미만 거래 가능)<br>- 카카오페이 간편송금 : 5만원 이하 (월누적 판매 30만원 미만, 구매 10만원 미만 거래 가능)<br><br>※ 상품 판매가격 기준입니다. <br>※ 월누적 거래한도는 결제일로부터 1개월 적용되며, 취소된 거래는 한도에서 제외됩니다. <br>※ 신용카드의 경우 해당 카드사 정책에 따라 고액거래가 제한될 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 빠른계좌이체 결제 방법을 알려주세요 </div>
                                            </div>
                                            <div class="faq_content">빠른계좌이체는 최초 1회 등록 후 간편결제 가능합니다. <br><br>1. 주문서 내 결제수단 [빠른계좌이체] 선택<br>2. 본인인증 <br>3. 계좌정보 입력 <br>4. 출금동의 ARS 전화인증 <br>5. 결제비밀번호 설정 <br>6. 비밀번호 입력 후 결제완료<br><br>문의사항은 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 이용해주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 여러 개 상품을 한번에 결제하고 싶어요 </div>
                                            </div>
                                            <div class="faq_content">여러 개의 상품 구매 시, 판매자가 '신규상품'을 등록하거나 '결제용 상품'의 가격 수정 후 결제하는 방법이 있습니다. <br><br>※ '결제용 상품' 기능은 헬로마켓 앱(APP)에서만 이용 가능합니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 카드결제 시 할부가 되나요? 무이자 할부도 있나요?</div>
                                            </div>
                                            <div class="faq_content">신용카드 무이자 할부는 5만원 이상부터 가능하며 카드사마다 적용되는 혜택이 다릅니다.<br><br>헬로페이 결제 시 카드사 선택 화면에서 [무이자안내] 버튼을 눌러 안내되는 내용을 꼼꼼히 확인 후 할부개월을 선택해주세요. <br><br>일부 카드는 무이자 할부 혜택이 적용되지 않을 수 있으며 자세한 사항은 카드사로 문의해주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 쿠폰 사용방법을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">헬로마켓은 회원등급과 다양한 이벤트를 통해 헬로페이 할인쿠폰을 제공하고 있습니다. <br><br>할인쿠폰은 헬로페이 결제 시 주문서에서 사용이 가능합니다. <br><br>진행 중인 쿠폰 이벤트나 '할인쿠폰' 메뉴에서 다운 가능한 쿠폰을 확인해보세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 결제 후 판매자가 응답이 없어요</div>
                                            </div>
                                            <div class="faq_content">헬로마켓은 개인이 만나 거래하는 공간으로 상대 회원의 사정(업무중 등)에 의해 답변이 늦어질 수 있습니다.<br>판매자의 응답을 조금만 더 기다려주세요.<br><br>결제 후 배송정보가 입력되지 않은 상태에서 2영업일 경과 시, 구매자에게 [주문취소] 버튼이 생성되어 주문을 취소할 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 결제 후에 결제금액을 수정할 수 있나요?</div>
                                            </div>
                                            <div class="faq_content">헬로페이 결제 후 결제금액 수정은 불가합니다.<br><br>해당 주문 건을 취소하신 후 상품 가격을 수정하여 재결제 해주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 배송 전 주문을 취소하고 싶어요</div>
                                            </div>
                                            <div class="faq_content">'배송 전 취소'를 희망하실 경우 판매자에게 요청해주세요. <br>판매자가 [주문취소] 버튼을 누르면 취소가 완료됩니다.<br> <br>결제 후 배송정보가 입력되지 않은 상태에서 2영업일 경과 시, 구매자에게 [주문취소] 버튼이 생성되어 주문을 취소할 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 주문취소 된 거래는 언제 환불 되나요?</div>
                                            </div>
                                            <div class="faq_content">신용카드 승인 취소 및 결제계좌 환불은 주문취소 일자로부터 1~3일 정도 소요될 수 있습니다.<br><br>보다 자세한 사항은 해당 카드사 또는 은행으로 문의해주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 구매자에게 상품을 어떻게 보내야 하나요?</div>
                                            </div>
                                            <div class="faq_content">상품 특성과 거래 상황에 따라 배송방법을 선택할 수 있습니다. <br><br>1. 헬로마켓 배송예약 : 편의점택배, 방문택배 예약이 가능하며, 운송장번호가 자동 연동 됩니다. <br><br>2. 일반택배, (준)등기 : 상품 발송 후 운송장번호를 직접 입력해주셔야 배송현황이 연동됩니다. <br><br>3. 기타전달방법 : 만나서 거래, 용달 등 '택배 외 배송수단'의 경우 이용하세요. <br><br><br>※ '기타전달방법' 기능은 결제수단과 상품금액에 따라 이용이 가능합니다. <br> 이용대상이 아닐 경우 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 접수해주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 헬로페이는 택배로만 거래할 수 있나요?</div>
                                            </div>
                                            <div class="faq_content">택배나 등기 이외 배송수단으로 거래하실 경우 [기타 전달방법]을 이용하실 수 있습니다. <br><br>&lt;이용방법&gt; <br>1. 구매자 : 이용가능 결제수단(상품금액) 결제<br>2. 판매자 : 상품을 전달하고 [기타 전달방법] 선택<br>3. 구매자 : 받은 상품 사진을 등록하고 [구매확정] 완료<br><br>&lt;이용제한&gt;<br>아래의 결제수단(상품금액)은 기타 전달방법 이용이 제한됩니다. <br>1. 빠른계좌이체 결제 (100만원 초과 상품)<br>2. 신용카드 결제 (20만원 초과 상품) <br>3. 토스 결제 (100만원 초과 상품) <br><br>'기타 전달방법' 이용 대상이 아닌 경우 웹사이트 [헬프센터] &gt; [헬로페이 문의] 로 알려주세요. <br>구매자에게 상품 수령을 확인 후 [구매확정] 버튼을 만들어드리겠습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 택배 운송장번호를 잘못 입력했어요</div>
                                            </div>
                                            <div class="faq_content">운송장번호는 1회에 한하여 수정이 가능합니다. <br><br>수정이 불가한 경우, 올바른 택배사와 운송장번호를 웹사이트 [헬프센터] &gt; [헬로페이 문의] 로 알려주세요. <br><br>구매자에게 상품 수령을 확인 후 [구매확정] 버튼을 만들어드리겠습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 배송사고로 상품이 분실, 파손 되었어요</div>
                                            </div>
                                            <div class="faq_content">배송 중 발생한 문제일 경우, 먼저 배송사로 배상이 가능한지 상담을 받아보시기 바랍니다.<br><br>&lt;배송사 문의처&gt;<br>- 편의점택배(포스트박스) : 1577-1287<br>- 홈픽 : 1800-0987<br>- CU홈택배 : 1566-1025<br>- 한진택배 : 1588-0011<br>- 대한통운 : 1588-1255<br>- 롯데택배 : 1588-2121<br>- 고고밴(용달/퀵) : 1588-3047<br><br>※ 헬로페이 거래에 대한 조치는 웹사이트 [헬프센터] &gt; [헬로페이 문의] 를 접수해주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 반품환불정책을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">헬로페이는 개인들의 입장을 고심하여 자체 개발한 에스크로 안심거래 서비스입니다.<br> <br>헬로마켓은 개인간거래에 최적화 된 안전한 거래환경을 조성하고, 회원 간 원활한 거래가 이루어질 수 있도록 헬로페이 반품환불 정책을 운영합니다.<br><br>1. 개인간거래 특성상 원칙적으로 반품환불은 판매자와 구매자 간 상호 합의를 통해 이루어져야 합니다.<br><br>2. 아이템 배송 후 환불은 헬로톡 대화를 통해 회원 간 이야기를 나누시고, 판매자의 동의 하에 반품환불을 진행해주세요.<br> ※ 구매자가 판매자의 동의없이 일방적인 반품을 진행할 경우, 수취거부로 인한 배송비 부담 등 문제가 발생할 수 있습니다.<br><br>반품환불에 대해 회원 간 합의가 되지 않고 거래분쟁이 발생한 경우, 헬로마켓은 헬로페이 반품환불 정책을 따릅니다.<br> <br>헬로페이를 통해 서로 만족하는 개인간 거래를 즐길 수 있도록 아래의 가이드를 참고하시고, 헬로페이 반품환불 정책을 준수해주세요. <br><br><br><br>[판매자 가이드] <br> <br>1) 헬로마켓 거래부적합 아이템은 판매하지 말아주세요. <br> <br>2) 거래아이템 정보(내용, 상태 등)를 실제 촬영한 사진과 함께 등록해주세요.<br> 결제창 형태나 랜덤박스 아이템은 헬로마켓에서 판매아이템의 정보를 파악하기 어렵기 때문에 거래분쟁 발생 시 도움을 드릴 수 없습니다.<br> <br>3) 헬로페이 결제제한 아이템은 판매수락 하지 말아주세요.<br> 순금, 골드바, 상품권 등 아이템은 헬로페이로 판매하실 수 없습니다.<br> <br>4) 아이템 등록 시 구매자가 알아야 할 정보를 포함해주세요<br> - 아이템 특성에 따라 사이즈, 색상, 브랜드, 보증서 유무를 기재해주세요. <br> - 아이템 상태가 거의새것, 중고의 경우 분쟁의 요소가 있는 사용감(보풀, 스크래치, 터치감, 잔상 등)과 사용기간(제조일자, 구입시기 등)에 대해서는 판매 전 구매자에게 알려주세요. <br><br>5) 아이템의 하자 사실 등 아래의 정보는 구매자에게 배송 전 꼭! 전달해주세요.<br> - 고장, 찢어짐, 얼룩, 곰팡이, 단추 없음 등<br> - A/S, 수선, 리폼, 침수폰 등<br> - 병행수입, 리퍼아이템<br> - 일부 구성품 없음<br> ※ 판매자가 구매자에게 위의 하자 사실 등을 사전 고지하지 않은 경우, 판매자 귀책사항으로 판단하여 판매자의 동의 없이 환불 처리 될 수 있습니다. <br> ※ 아이템의 실제 사진은 구매자가 이미지 확대 없이 아이템 하자 상태를 인식할 수 있어야 합니다.<br><br><br><br>[구매자 가이드] <br> <br>1) 헬로마켓 거래부적합 아이템은 구매하지 말아주세요. <br><br>2) 헬로페이 결제제한 아이템은 결제하지 말아주세요. <br> 순금, 골드바, 상품권 등 아이템은 헬로페이로 구매하실 수 없습니다.<br> <br>3) 판매자에게 아이템에 대해 필요한 정보를 확인해주세요<br> <br> 아이템 특성에 따라 헬로톡 채팅을 통해 판매자에게 충분히 구매에 필요한 정보를 물어봐주세요.<br> <br> 헬로마켓은 개인간 거래 공간으로 판매자가 아이템에 대한 모든 정보를 전문적으로 사전에 명시하기 어렵습니다<br> 때문에 아이템 실제 사진, 사이즈, 색상, 브랜드, 보증서 유무 등 구매에 필요한 정보를 판매자에게 적극 확인해주세요<br> ※ 아이템 정보확인이 불가한 결제창 형태나 랜덤박스 아이템은 거래분쟁 발생 시 도움을 드릴 수 없습니다<br><br> 특히 거의새것, 중고 아이템의 경우 구매자의 꼼꼼한 확인이 필요합니다.<br> 중고아이템의 특성상 아이템 상태에 대해 주관성이 반영될 수 있는 점을 감안하여 판단하신 후 거래를 진행하시기를 권유드립니다.<br> 아이템 수령 후 분쟁을 방지하기 위해, 판매자에게 사용감(보풀, 스크래치, 터치감, 잔상 등)과 사용기간(제조일자, 구입시기 등)에 대해 확인해주세요.<br> <br>※ 반품환불은 판매자와의 합의를 우선으로 안내 드리고 있으며, 거래분쟁이 발생한 경우 헬로마켓은 ‘헬로페이 반품환불 정책‘에 따라 도움을 드릴 수 있습니다.<br><br><br><br> [헬로페이 반품환불 정책] <br> <br>1) 구매확정완료 전 거래는 판매자와 구매자 간 상호 합의된 경우 환불 처리 할 수 있습니다.<br> 구매확정완료 전 [1:1문의]로 환불요청을 접수해주세요. <br> <br>2) 아래의 경우 헬로마켓은 회원 간 거래분쟁에 개입하여 반품환불 처리하지 않습니다.<br> - 구매확정완료 거래<br> - 구매자가 배송완료 후 2영업일 내 1:1문의 접수하지 않을 경우 <br> - 택배 운송장(등기)번호 없는 거래<br> - 거래부적합 아이템<br> - 아이템 정보확인이 불가한 결제창, 랜덤박스 아이템<br> - 헬로페이 결제제한 아이템 (순금, 골드바, 상품권 등)<br> - 자동차, 부동산, 반려동물, 여행숙박, 티켓, 재능서비스, 골동품/희귀품 아이템<br> <br>3) 거래분쟁 발생 시 구매자는 배송완료 후 2영업일 내 [1:1문의]로 반품환불 심사를 요청할 수 있습니다.<br> 구매자의 심사요청이 접수되면 헬로마켓은 객관적인 증빙자료를 검토하여 아래의 판매자 귀책사항에 해당하는지를 판단하고 신속하게 반품환불을 진행합니다. <br> ※ 반품환불 심사요청은 배송완료 후 시간경과로 인한 아이템 사용/훼손 등 추가적인 분쟁사유 방지를 위해, 배송완료 후 2영업일 내 1:1문의를 접수해주셔야 합니다. <br><br> [판매자 귀책사항] <br> 1. 다른 아이템 배송 (색상/사이즈 등)<br> 2. 아이템에 대한 허위정보 제공 (가품을 정품으로 판매 등)<br> 3. 아이템 하자사실 등 아래정보 사전고지 없음<br> - 고장, 파손(액정 등), 기계적 결함, 찢어짐, 얼룩, 곰팡이, 단추없음, 휴대폰 찍힘 등<br> - A/S, 수선, 리폼, 침수폰 등<br> - 병행수입, 리퍼아이템<br> - 일부 구성품 없음<br> 4. 택배포장 미흡으로 인한 파손 (배송사고 제외) <br> <br> ※ 판매자의 귀책사항으로 판단될 경우 판매자의 동의없이 구매자에게 환불 처리 될 수 있습니다. <br> ※ 헬로마켓은 회원에게 귀책사항에 대한 소명 또는 증빙자료를 요청할 수 있으며, 요청기한 내 확인사항에 따라 헬로마켓의 합리적인 판단하에 거래를 종결할 수 있습니다.<br> ※ 헬로마켓 중개자로서 실제 거래상황 및 귀책자를 명확하게 판단하기 어려운 경우, 해당 거래에 개입하여 환불 또는 구매확정 하지 않으며, 판매자와 구매자간 합의 결과에 따라 처리합니다.<br><br> [반품환불 절차('판매자의 귀책'에 해당하는 경우)] <br> - 구매자 1:1문의 심사요청 접수 &gt; 헬로마켓 반품환불 심사 &gt; 판매자 환불 안내 및 반품주소 확인 &gt; 구매자 반품아이템 발송 &gt; 판매자 반품아이템 수령 및 상태확인 &gt; 구매자 환불완료<br> <br>4) 반품환불 배송비 부담 기준<br> 반품환불 시 왕복 배송비는 귀책사유를 제공한 회원이 부담함을 원칙으로 합니다.<br> - 판매자 귀책사항에 해당하는 경우 : 왕복 배송비 판매자 부담<br> - 판매자 귀책사항에 해당하지 않는 경우 : 왕복 배송비 구매자 부담<br> - 귀책자가 명확하지 않은 경우 : 회원 간 합의</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 자동구매확정은 언제 진행되나요? </div>
                                            </div>
                                            <div class="faq_content">자동구매확정은 아래와 같이 진행됩니다. (반품환불 거래 제외) <br><br>1. 택배거래 '배송완료' 상태로부터 3영업일 이후 (운영자 발송처리 포함) <br>2. 기타전달방법 '배송완료' 상태로부터 7영업일 이후 <br>3. '배송중' 상태로부터 30일 이후 <br><br>※ '배송완료' 상태에서 상품을 받지 못하셨거나, 수령한 상품에 이상이 있는 경우 웹사이트 [헬프센터] &gt; [헬로페이 문의] 로 알려주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 판매대금 인출신청 방법을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">구매자가 상품을 수령 후 구매확정이 완료되면 판매자의 전자지갑으로 판매대금이 지급됩니다.<br><br>전자지갑의 판매대금은 계좌로 현금인출신청 가능합니다. <br><br>- 인출신청 방법: 웹사이트 [내 프로필 사진] &gt; [전자지갑] &gt; [현금인출신청] &gt; 계좌 등록/선택 후 인출금액 입력 &gt; [완료] 버튼을 눌러주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 인출신청 하면 언제 입금되나요?</div>
                                            </div>
                                            <div class="faq_content">출금은 인출신청일 다음 영업일까지 처리되고 있습니다. <br> <br>평일 오전에 인출신청 하신 경우, 반나절 빠르게 당일 오후까지 출금 처리가 완료됩니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로페이] 나의 거래현황은 어디서 확인하나요? </div>
                                            </div>
                                            <div class="faq_content">웹사이트 [내 프로필 사진] &gt; [헬로페이]에서 최근 1년 간의 거래이력을 확인할 수 있습니다. <br><br>1년 이전의 거래이력 확인은 [헬로페이 문의]를 이용해주세요.</div>
                                        </li>
                                    </ul>
                                    <ul class="faq_List" style="display: none;">
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[배송예약] 어떤 배송 서비스를 지원하나요?</div>
                                            </div>
                                            <div class="faq_content">헬로마켓은 회원님들의 편리한 거래를 위해 배송예약 서비스를 제공하고 있습니다.<br><br><br>1. 편의점택배 - CU/GS25/GS Postbox 퀵(당일택배)<br><br>헬로마켓 앱에서 희망 편의점을 선택하여 택배를 예약하면 보다 저렴한 가격에 서비스를 이용할 수 있습니다.<br>편의점 택배 예약 시 GS Postbox퀵(당일택배)를 선택하고 평일 16시, 토요일 12시 전까지 접수하면 하루 만에 배송이 완료됩니다.(단, 서울지역에서만 접수 가능)<br><br><br>2. 일반 방문택배 - 한진택배/CJ대한통운<br><br>지정한 날짜에 기사님이 방문하여 택배를 수거합니다. <br><br><br>4. 프리미엄 방문택배 - 홈픽/CU홈택배<br><br>집하 희망 일자 및 시간까지 지정이 가능한 방문택배 입니다.<br>홈픽 이용 시 최소 1시간 내에 택배 수거가 가능합니다..<br><br><br>5. 용달/퀵<br><br>회원님의 편리한 배송을 위해 용달/퀵 등 택배가 아닌 오토바이(퀵), 다마스, 라보, 1톤 트럭 배송예약 서비스도 지원하고 있습니다. <br>오토바이(퀵)는 서울/경기 지역만 이용할 수 있으니 이용에 참고 부탁드립니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[배송예약] 배송비가 어떻게 되나요?</div>
                                            </div>
                                            <div class="faq_content">각 배송수단 별 배송비는 아래의 내용을 참고해주시기 바랍니다. <br><br>1. 편의점택배(5kg 이하 2,600원~3500원, 5~20kg 4,000원)<br><br>350g 이하: 2,600원(타 권역 이동 시 3,100원) <br>350g~5kg: 3000원(타 권역 이동 시 3,500원)<br>5~20kg: 4,000원(동일권역, 타 권역 이동 시 모두 동일)<br><br>* 제주도와 내륙 간 배송은 +3,000원의 운임비가 추가됩니다. <br>* 도서지역은 추가 운송실비가 발생할 수 있습니다. <br>* 가로, 세로, 높이의 합이 140cm을 초과할 경우 편의점택배를 이용할 수 없습니다.<br><br> <br>※아래의 서비스는 헬로마켓 모바일 앱에서만 지원됩니다.<br>2. 일반 방문택배(2kg 이하 3,900원부터, 5~20kg 4,900원부터)<br><br>&lt;한진택배&gt;<br>일반(20kg/140cm 이하): 3,900원<br>대형(25kg/160cm이하): 4,900원<br><br>* 제주도와 내륙 간 배송은 +3,000원의 운임비가 추가됩니다. <br>* 도서지역은 +5,000원의 운임비가 추가됩니다. <br><br>
                                                <cj대한통운><br>일반(20kg/140cm 이하): 4,900원<br><br>* 제주도와 내륙 간 배송은 +4,000원의 운임비가 추가됩니다. <br>* 도서지역은 +4,000원의 운임비가 추가됩니다. <br><br><br>3. 프리미엄 방문택배(2kg 이하 3,500원부터, 20kg 이하 5,000원부터)<br><br>&lt;홈픽&gt;<br>2kg/80cm 이하: 3,500원<br>5kg/100cm 이하: 3,990원<br>10kg/120cm 이하: 5,500원<br>20kg/160cm 이하: 6,500원<br><br>* 제주도와 내륙 간 배송은 +1,000~6,000원의 운임비가 추가됩니다. <br>* 제주도 내 배송은 +5,000원의 운임비가 추가됩니다.<br>* 방문 당일 취소 시 수수료가 발생할 수 있습니다. <br><br>
                                                    <cu홈택배><br>2kg/80cm 이하: 4,000원<br>5kg/80cm 이하: 5,000원<br>10kg/100cm 이하: 6,000원<br>20kg/120cm 이하: 7,500원<br><br>* 제주/도서지역 배송은 +4,000원의 운임비가 추가됩니다.<br>* 방문 당일 취소 시 수수료가 발생할 수 있습니다. <br><br>4. 용달/퀵 서비스는 배송수단 별 예약화면에서 예상 견적을 조회할 수 있습니다.</cu홈택배>
                                                </cj대한통운>
                                            </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[배송예약] 예약 후 택배의 배송정보는 어떻게 변경하나요?</div>
                                            </div>
                                            <div class="faq_content">이미 예약이 완료된 상태에서는 배송정보를 수정할 수 없습니다.<br>아래의 경로대로 예약을 취소하신 후 새로 예약을 진행해주시기 바랍니다.<br><br>배송예약 취소 방법: 헬로마켓 웹사이트 [나의 닉네임] &gt; [배송관리] &gt; [보내는 배송] &gt; 목록에서 [예약취소] 버튼을 누르면 해당 예약 건이 취소됩니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[배송예약] 예약 후 발송한 택배의 위치를 알고 싶어요</div>
                                            </div>
                                            <div class="faq_content">헬로마켓에서 예약된 택배는 아래의 경로에서 배송추적을 할 수 있습니다..<br><br>배송추적 방법: 헬로마켓 웹사이트 [나의 닉네임] &gt; [배송관리] &gt; [보내는배송] &gt; [배송추적]을 누르면 아이템의 위치를 확인할 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[편의점택배] 편의점택배는 어떻게 이용하나요? </div>
                                            </div>
                                            <div class="faq_content">편의점 택배 예약은 보내는 이와 받는 이가 모두 헬로마켓 회원일 때 이용할 수 있습니다.<br><br>먼저 헬로마켓에서 편의점택배를 예약한 후 해당 편의점에 방문하여 무인택배기에 예약번호를 입력하고 점원에게 택배를 맡기면 기사님 수거 후 배송이 시작됩니다. <br><br>배송예약 방법: 아이템 상세화면 &gt; [배송예약] 버튼을 눌러 CU 또는 GS25 중 가까운 편의점을 선택하여 예약할 수 있습니다. <br><br>예약번호 입력 방법: 편의점 방문 시 무인택배기(포스기)에서 '쇼핑몰 거래 또는 쇼핑몰 택배' 메뉴를 선택하여 헬로마켓 내 예약번호를 입력하시면 운송장이 출력됩니다. <br><br>만약 배송정보, 선/착불 여부, 편의점 변경 등 예약내역 수정이 필요할 경우 예약을 취소한 후 다시 예약해주시기 바랍니다.<br><br>예약취소 방법: 헬로마켓 웹사이트 [나의 닉네임] &gt; [배송관리] &gt; [보내는 배송] &gt; 목록에서 [예약취소] 버튼을 누르면 해당 예약 건이 취소됩니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[편의점택배] 편의점택배 예약번호는 어디서 확인하나요?</div>
                                            </div>
                                            <div class="faq_content">헬로마켓 웹사이트 [나의 닉네임] &gt; [배송관리] &gt; [보내는 배송]에서 지금까지 예약하신 모든 배송예약 이력 및 예약번호를 확인하실 수 있습니다.<br><br>해당 화면에서 예약번호를 확인하신 후 편의점 무인택배기에 입력하여 발송해주시기 바랍니다.<br><br>기사님께서 아이템을 수거하면 배송추적이 시작됩니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[편의점택배] GS Postbox퀵(당일택배)은 어떻게 이용하나요?</div>
                                            </div>
                                            <div class="faq_content">GS Postbox퀵(당일택배)는 서울지역에서만 접수할 수 있으며 평일 16시, 토요일 12시 전까지 접수해야 당일 배송됩니다. <br><br>먼저 헬로마켓에서 GS Postbox(당일택배)를 예약한 후 GS25 편의점에 방문하여 무인택배기에 예약번호를 입력하고 점원에게 택배를 맡기면 기사님 수거 후 배송이 시작됩니다.<br><br>배송예약 방법: 아이템 상세화면 &gt; [배송예약] &gt; [GS Postbox퀵(당일택배)]를 선택하여 예약을 진행하실 수 있습니다. <br><br>예약번호 입력 방법: 편의점 방문 시 무인택배기(포스기)에서 '포스트박스 퀵(당일택배)' 메뉴를 선택하여 헬로마켓 내 예약번호를 입력하면 운송장이 출력됩니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[방문택배] 착불로 방문택배를 예약할 수 있나요?</div>
                                            </div>
                                            <div class="faq_content">※헬로마켓 모바일 앱에서만 지원되는 서비스 입니다.<br><br>아니요. 방문택배는 택배사 요청에 의해 선불로만 예약할 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[방문택배] 방문택배 예약 시 방문시간을 지정할 수 있나요?</div>
                                            </div>
                                            <div class="faq_content">※헬로마켓 모바일 앱에서만 지원되는 서비스 입니다.<br><br>네, 일반 방문택배와 달리 프리미엄 방문택배는 방문희망 시간까지 지정할 수 있습니다. <br><br>프리미엄 방문택배에는 홈픽과 CU홈택배를 지원하고 있으니, 선호하시는 브랜드에 따라 택배예약을 진행해주세요.<br><br>홈픽으로 예약하실 경우 최소 1시간 내에 택배 수거가 가능합니다! </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[방문택배] 방문택배 기사님이 오지 않아요</div>
                                            </div>
                                            <div class="faq_content">※헬로마켓 모바일 앱에서만 지원되는 서비스 입니다.<br><br>택배사 물류 사정에 따라 기사님 방문이 늦어질 수 있습니다.<br>저희에게 문의를 남겨주시면 택배사로 빠른 집하를 요청하겠습니다.<br><br>문의방법: 헬로마켓 웹사이트 [헬프센터] &gt; [헬로페이 문의] 또는 [일반 문의] &gt; 해당 택배 예약번호와 함께 빠른 집하 요청에 대한 문의를 남겨주시기 바랍니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[방문택배] 방문택배비는 어떻게 환불받나요?</div>
                                            </div>
                                            <div class="faq_content">※헬로마켓 모바일 앱에서만 지원되는 서비스 입니다.<br><br>집하 요청일 이후에는 예약취소 버튼이 사라집니다.<br><br>집하 요청일 이후 취소를 희망하실 경우 1:1문의로 문의를 남겨주시면 택배사로 취소 요청하겠습니다.<br>(택배예약이 취소된 후 결제하신 택배비는 1~3일 후 환불 됩니다.)<br><br>문의방법: 헬로마켓 웹사이트 [헬프센터] &gt; [헬로페이 문의] 또는 [일반 문의] &gt; 해당 택배 예약번호와 함께 빠른 집하 요청에 대한 문의를 남겨주시기 바랍니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[용달/퀵] 용달/퀵 배송은 어떻게 이용하나요?</div>
                                            </div>
                                            <div class="faq_content">※헬로마켓 모바일 앱에서만 지원되는 서비스 입니다.<br><br>회원님의 편리한 배송을 위해 용달/퀵 등 택배가 아닌 오토바이(퀵), 다마스, 라보, 1톤 트럭 배송예약 서비스를 지원하고 있습니다. <br>오토바이(퀵)는 서울/경기 지역만 이용할 수 있으니 이용에 참고 부탁드립니다.<br><br>1. 이용방법<br>먼저 오토바이(퀴), 다마스, 라보, 1톤 트럭 중 적적한 배송수단을 선택하여 예약을 진행합니다.<br><br>예약방법: 아이템 상세화면 &gt; [배송예약] 또는 헬로마켓 앱 [나의메뉴] &gt; [배송관리] &gt; [예약할 아이템 선택] &gt; [예약진행]에서 [용달/퀵]에서 적합한 배송수단을 선택하시면 배송비 견적 조회 및 예약 신청할 수 있습니다.<br><br>예약 신청 후 15분 내로 예약 확인 전화를 드리고 있습니다.<br>만약 15분이 지나도록 연락이 오지 않을 경우 배송사 고객센터(1588-3047)로 문의해주시기 바랍니다.<br>* 예약 확인 전화 시 부재중이실 경우 해당 배송예약은 자동으로 취소됩니다.<br><br><br>2. 배송비<br>용달/퀵 배송은 거리와 아이템의 무게/크기, 배송시간 등에 따라 달라집니다.<br>배송예약 화면에서 주소를 입력하면 예상 견적을 확인할 수 있고, 실제 예약을 완료하면 배송사에서 회원님께 전화를 드려 정확한 금액을 다시 안내받으실 수 있습니다.<br><br><br>3. 취소 방법 및 수수료 <br>기사님 배정 전/후에 따라 취소방법 및 취소 수수료에 차이가 있습니다. <br><br>- 기사님 배정 전: 헬로마켓 앱 [나의메뉴] &gt; [배송관리] &gt; [보내는 배송] &gt; 해당 예약 건에 [예약취소] 버튼을 눌러 취소할 수 있으며 취소 수수료가 없습니다.<br><br>- 기사님 배정 후: 고고밴 고객센터(1588-3047)로 문의하여 취소가 가능하며 취소 수수료가 발생할 수 있습니다. </div>
                                        </li>
                                    </ul>
                                    <ul class="faq_List" style="display: none">
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[전문] 전문판매자 상품 개수 기준</div>
                                            </div>
                                            <div class="faq_content">전문판매자 카테고리는 상품 개수 제한이 있으며, 전문판매자로 전환 신청 후 무제한으로 상품을 등록할 수 있습니다.<br><br>상품 개수는 하위 카테고리 등록 기준입니다. <br> <br>예) 컴퓨터,주변기기 카테고리의 경우 노트북, 데스크탑 등 하위 카테고리별 상품 개수가 기준이 됩니다. <br><br><br>자동차: 각 2개 <br>자동차용품: 각 2개<br>바이크: 각 2개 <br>바이크용품: 각 2개 <br>스포츠,레저: 각 6개 (단 등산 / 골프 / 헬스,요가 각 12개) <br>게임: 각 6개 <br>핸드메이드: 각 2개 <br>유아동,완구: 각 9개 (단 신생아,유아의류 / 아동의류는 각 20개) <br>뷰티: 각 6개 <br>여성의류: 각 9개 <br>남성의류: 각 9개 <br>신발,가방,잡화: 각 9개 <br>휴대폰,태블릿: 각 4개 <br>컴퓨터,주변기기: 각 3개 <br>카메라: 각 3개 <br>디지털,가전: 각 2개 (단 주방조리가전 / 건강,계절가전 / MP3,iPod / 기타 디지털,가전 각 4개) <br>음향기기,악기: 각 3개 <br>가구: 각 4개 <br>생활: 각 6개<br>골동품,희귀품: 각 6개 <br>티켓: 각 2개<br>RC카,드론: 각 4개 <br>피규어,키덜트: 각 9개 <br>예술,미술: 각 4개 <br>반려동물용품: 각 6개 <br>포장식품: 각 2개<br>부동산: 각 1개</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[전문] 전문판매자는 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">전문판매자는 개인과 전문을 구분하여 운영하는 서비스입니다. <br> <br>전문판매자 운영으로 개인의 판매 활동을 보호하고, 구매자에게는 더욱 다양한 구매 선택의 기회를 제공합니다. <br> <br>- 신청 방법 : [나의메뉴-설정-프로필설정-전문판매자 신청] <br>- 전문판매자 신청이 보이지 않거나 신청이 정상 완료 되지 않을 경우, 앱을 최신 버전으로 업데이트 후 신청 <br> <br>전문판매자 카테고리는 19개로 카테고리마다 개수 제한이 있으며 전문판매자 신청 시 제한 없이 등록이 가능합니다. <br> <br>개수는 상위 카테고리가 아닌 하위 카테고리에 등록하는 아이템을 기준으로 합니다. <br> <br>예) 컴퓨터, 주변기기 카테고리의 경우 하위 카테고리인 노트북, 데스크톱, 모니터 등에 등록된 아이템 개수가 기준이 됩니다. <br>자동차 : 하위 카테고리별 각 2개 <br> <br>자동차용품 : 하위 카테고리별 각 2개 <br> <br>휴대폰, 태블릿 : 하위 카테고리별 각 4개 <br> <br>여성 의류 : 하위 카테고리별 각 9개 <br> <br>남성 의류 : 하위 카테고리별 각 9개 <br> <br>신발, 가방, 잡화 : 하위 카테고리별 각 9개 <br> <br>뷰티 : 하위 카테고리별 각 6개 <br> <br>유·아동, 완구 : 하위 카테고리별 각 9개 (신생아, 유아 의류, 아동의류는 각 20개) <br> <br>생활 : 하위 카테고리별 각 6개 <br> <br>디지털 가전 : TV, 세탁기, 냉장고, 청소기 각 2개 <br>(MP3, iPod / 주방조리가전 / 건강, 계절가전 / 기타 디지털, 가전은 각 4개) <br> <br>컴퓨터, 주변기기 : 각 3개 <br> <br>카메라 : 각 3개 <br> <br>음향기기, 악기 : 각 3개 <br> <br>게임 : 각 6개 <br> <br>스포츠, 레저 : 각 6개 (등산, 헬스, 요가, 골프는 각 12개) <br> <br>피규어, 키덜트 : 각 9개 <br> <br>포장 식품 : 각 2개 <br> <br>핸드메이드 : 각 2개 <br> <br>모터사이클, 용품 : 각 2개 <br> <br>부동산 : 각 1개 </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[전문] 전문판매자가 되면 어떤 혜택이 있어요?</div>
                                            </div>
                                            <div class="faq_content">전문판매자가 되면 상품 무제한 등록뿐만 아니라 헬로페이 판매에 따른 유료 상단업을 무료로 제공해드립니다.<br><br>1. 매월 안심 등급에 따라 무료 지급<br>- Lv. 1 화이트: 50개<br>- Lv. 2 블루: 200개<br>- Lv. 3 브론즈: 250개<br>- Lv. 4 실버: 300개<br>- Lv. 5 골드: 400개<br><br><br>2. 헬로페이 판매완료 건수에 따라 무료 지급 <br>- 1건당 30개 지급<br><br>*1만원 이상 판매완료 거래 기준<br>*익일 오전 합산하여 지급<br>*사용 기간: 지급일로부터 30일<br><br>또한 앱과 웹사이트의 광고센터 &gt; 유료 상단업에서 직접 구매도 가능합니다.<br>유효기간은 구매일로부터 180일이며, 이용개수는 광고센터 &gt; 광고관리 &gt; 유료 상단업에서 확인하실 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[전문] 전문판매자를 취소하고 싶어요</div>
                                            </div>
                                            <div class="faq_content">전문판매자 신청 후 취소는 불가능합니다.<br>또한 전문판매자가 개인 판매자로 활동할 경우 서비스 이용에 제한이 발생할 수 있습니다.<br>관련하여 문의 사항은 1:1 문의 &gt; 일반 문의로 접수해주시기 바랍니다.</div>
                                        </li>
                                    </ul>
                                    <ul class="faq_List" style="display: none;">
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[광고] 회원직접광고는 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">회원직접광고는 회원님의 상품을 메인 상품 리스트에 직접 노출 할 수 있는 서비스입니다.<br><br>고정된 위치에서 일정한 비율로 노출되고 있으며 메인화면에 노출되는 만큼 많은 회원이 볼 수 있어 매우 효과적인 광고입니다.<br>전화 문의, 헬로톡, 댓글 등의 다양한 연락수단을 제공하여 구매자와 빠른 연락이 가능합니다.<br><br>대부분의 상품을 등록하실 수 있습니다만, 위조상품 등 거래부적합 상품에 해당하는 경우에는 광고 심사에서 취소처리가 될 수 있습니다.<br>자세한 내용은 나의메뉴 &gt; 광고센터 &gt; 회원직접광고 (자세히 보기)를 참고해주시기 바랍니다.<br><br>- 신청 방법 : 나의메뉴 &gt; 광고센터 &gt; 회원직접광고</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[광고] 신청한 회원직접광고를 어디서 확인할 수 있어요?</div>
                                            </div>
                                            <div class="faq_content">광고 위치는 메인 화면의 1번~50번 51번~100번 101번~150번으로 나뉘어 있으며 위치마다 제한된 개수로 광고 신청을 받고 있습니다.<br><br>무제한으로 받지 않는 이유는 더 많은 노출의 기회를 회원분들께 제공하고자 함이며, 균등한 비율로 랜덤하게 노출을 하고 있습니다.<br><br>실제로 회원직접광고를 신청하신 회원분들이 매출증가를 경험하여 지속적인 재결제를 하고 있으니 한번 경험해보시기 바랍니다.<br><br>광고효율은 나의메뉴 &gt; 광고센터 &gt; 광고관리 &gt; 회원직접광고에서 확인하실 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[광고] 유료 상단업은 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">유료 상단업은 상품을 많이 노출하여 판매가 빨리 될 수 있도록 도와주는 유료 상품입니다.<br><br>구매 방법 : 앱, 웹사이트 광고센터 &gt; 유료 상단업 ‘구매’<br><br>유효기간 : 구매일로부터 180일<br><br>유효기간은 상단업의 사용기한입니다.<br>상단업은 자동설정이나 수동실행으로 차감되며, 유효기간이 지나면 자동 소멸됩니다. (전문판매자에게 무료지급한 유료 상단업의 유효기간은 30일)<br><br>이용개수 확인 및 자동상단업 설정: 광고센터 &gt; 광고관리 &gt; 유료 상단업</div>
                                        </li>
                                    </ul>
                                    <ul class="faq_List">
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[상품] 판매할 물건은 어떻게 올리나요?</div>
                                            </div>
                                            <div class="faq_content">헬로마켓 웹사이트 상단 [판매하기] 버튼을 누르시고 상품의 사진과 정보를 입력하여 등록해주시면 됩니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 카테고리 종류를 알려주세요</div>
                                            </div>
                                            <div class="faq_content">아래와 같이 세분화된 카테고리를 통해 아이템을 거래할 수 있습니다. <br><br>자동차<br>자동차용품<br>바이크<br>바이크용품<br>스포츠,레저<br>게임<br>핸드메이드<br>유아동,완구<br>뷰티<br>여성의류<br>남성의류<br>신발,가방,잡화 <br>휴대폰,태블릿<br>컴퓨터,주변기기<br>카메라<br>디지털,가전<br>CD,DVD<br>음향기기,악기<br>가구<br>생활<br>골동품,희귀품<br>여행,숙박<br>티켓<br>부동산<br>도서<br>스타굿즈<br>문구<br>피규어,키덜트<br>예술,미술<br>재능,서비스<br>유기동물입양<br>반려동물용품<br>포장식품<br>기타</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 무료나눔 방법이 궁금해요 </div>
                                            </div>
                                            <div class="faq_content">다른 회원에게 배송비 외 조건 없이 나눔 하시는 물건은 아이템 등록 시 판매형식을 [무료나눔]으로 선택해주시면 됩니다. <br><br>회원님의 판매아이템을 구매 시 추가로 제공하는 아이템은 [덤]으로 등록해주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 판매금지 아이템이 있나요?</div>
                                            </div>
                                            <div class="faq_content">아래의 거래부적합 아이템은 이용약관 및 현행 법률에 따라 마켓 내 등록 및 거래를 금지합니다.<br><br>- 주류<br>- 담배<br>- 의약품<br>- 도수 있는 안경, 콘택트렌즈<br>- 개인정보(신분증, 게임계정 등)<br>- 성인용품(콘돔 제외)<br>- 불법복제품<br>- 반려동물<br> <br>보다 자세한 내용은 헬로마켓 이용약관에서 확인하실 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 반려동물 분양글을 등록해도 되나요? </div>
                                            </div>
                                            <div class="faq_content">반려동물 분양(입양요청 포함) 글은 마켓 내 등록하실 수 없는 글 입니다. <br><br>헬로마켓은 유기동물의 입양 지원을 위해 [유기동물 입양] 카테고리를 운영하고 있습니다. <br><br>[유기동물 입양]에서는 동물보호관리시스템의 공공 API를 활용해 유기동물 보호센터의 입양 정보를 보여드립니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 교신, 택포, 에눌이 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">헬로마켓에서 자주 사용되는 단어의 줄임말입니다.<br><br>- 교신 : 교환 신청<br>- 택포 : 택배비 포함<br>- 에눌 : 에누리</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 어떻게 하면 더 잘 팔릴 수 있나요?</div>
                                            </div>
                                            <div class="faq_content">1. 아이템 상태를 꼼꼼히 적어주세요.<br>아이템 설명이 자세할수록 구매자에게 신뢰를 주고 구매자의 질문에 반복적으로 답변할 필요가 없어 더 편리하고 신속하게 거래할 수 있습니다.<br><br>2. 직접 촬영한 사진이나 영상을 첨부해주세요.<br>아이템의 상태를 잘 확인할 수 있는 전체 컷, 상세컷이나 착용사진 등이 판매에 도움이 됩니다. <br>아이템의 특징을 더 잘 보여줄 수 있는 영상을 촬영하시면 더 빨리 판매할 수 있습니다.<br><br>3. 정확한 카테고리를 선택해서 등록해주세요.<br>올바른 카테고리에 등록하면 회원님의 아이템을 더 잘 찾을 수 있습니다.<br><br>4. 상단업을 이용해보세요.<br>내 아이템의 상세화면 하단에 [상단업] 버튼을 누르면 아이템이 최신순으로 올라가서 구매자들에게 더 많이 노출되는 기회를 얻을 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 아이템 수정/삭제 하고 싶어요</div>
                                            </div>
                                            <div class="faq_content">헬로마켓 웹사이트 [내프로필] &gt; [나의메뉴] &gt; 아이템 상세 화면 [수정] 버튼을 누르면 수정/삭제 할 수 있습니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 상단업은 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">기존에 등록한 아이템을 새로 등록해주는 기능입니다.<br><br>헬로마켓의 아이템 목록은 대부분 최신순으로 정렬되어 있기 때문에 상단업을 하면 목록 상단에 노출될 수 있습니다.<br><br>개인판매자의 상단업은 하루 최대 20개까지 가능하며 한 아이템에 한 번만 상단업 하실 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 홈 화면에 보이는 아이템은 어떻게 올리나요?</div>
                                            </div>
                                            <div class="faq_content">홈 화면 메인에는 헬로마켓에서 주목받고 있는 아이템들이 노출되며, 아이템에 대한 전반적인 인기도, 판매자의 다양한 활동 등 여러 가지 요소들이 복합적으로 고려되고 있습니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 내 아이템을 공유하고 싶어요</div>
                                            </div>
                                            <div class="faq_content">아이템 상세화면 상단의 [공유 아이콘]을 눌러 페이스북, 카카오톡, 인스타그램 등에 아이템을 게시할 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 아이템 검색은 어떻게 하나요?</div>
                                            </div>
                                            <div class="faq_content">웹사이트 상단 검색 란에 키워드를 입력하여 아이템을 검색할 수 있습니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 키워드알림 기능이 궁금해요 </div>
                                            </div>
                                            <div class="faq_content">키워드 알림 기능은 헬로마켓 앱(APP)에서만 이용 가능합니다. <br><br>키워드 알림을 등록하시면 헬로마켓에 해당 아이템이 등록될 때 알림을 받으실 수 있습니다.<br><br>헬로마켓 앱 [나의메뉴] &gt; [키워드알림] &gt; [키워드추가] 버튼을 눌러 등록해주세요.<br><br>이후 알림을 원치 않으실 경우 키워드 옆 [X 아이콘]을 눌러 삭제할 수 있습니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 찜아이템은 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">관심있는 아이템은 '찜' 기능으로 저장하고 찜아이템 목록에서 모아 볼 수 있습니다. <br><br>아이템 상세화면 [하트 모양 아이콘]을 누르면 '찜'이 되고 다시 누르면 '찜'이 해제됩니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[아이템] 저작권 위반 아이템 신고방법을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">아래의 서류를 [1:1문의] 또는 help@hellomarket.com으로 보내주세요. <br><br>1. 사업자 등록증<br>2. 상표등록원부 (또는 관련 조항이 삽입된 증빙서류) / 기타 제재 조항을 확인할 수 있는 자료<br>3. 해당 아이템의 URL 주소</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[계정] 내정보는 어떻게 수정하나요?</div>
                                            </div>
                                            <div class="faq_content">헬로마켓 웹사이트 [내프로필] &gt; [나의메뉴] &gt; [프로필수정] 을 눌러 회원님의 프로필 사진, 닉네임, 비밀번호, 자기소개 등을 수정할 수 있습니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[계정] 휴대폰 인증이 되지 않아요</div>
                                            </div>
                                            <div class="faq_content">휴대폰 인증 실패 시 웹사이트 [헬프센터] &gt; [일반문의]로 해당 휴대폰번호를 기재하여 문의해주세요. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[계정] 회원등급은 무엇인가요?</div>
                                            </div>
                                            <div class="faq_content">매월 헬로페이 거래실적에 따라 아래의 회원등급과 혜택이 부여됩니다.<br><br>[Lv.1] 화이트<br>- 조건 : 헬로페이 거래이력 없음 <br>- 혜택 : 유료 상단업 50개 무료지급 (전문판매자만 해당) <br><br>[Lv.2] 블루<br>- 조건: 헬로페이 1건 이상 거래 <br>- 혜택 : 유료 상단업 200개 무료지급 (전문판매자만 해당) <br><br>[Lv.3] 브론즈<br>- 조건: 헬로페이 3건 이상 거래 <br>- 혜택 : 유료 상단업 250개 무료지급 (전문판매자만 해당) / 헬로페이 할인쿠폰 1장 발급 <br><br>[Lv.4] 실버<br>- 조건: 헬로페이 7건 이상 거래 <br>- 혜택 : 유료 상단업 300개 무료지급 (전문판매자만 해당) / 헬로페이 할인쿠폰 3장 발급 <br><br>[Lv.5] 골드<br>- 조건: 헬로페이 15건 이상 거래 <br>- 혜택 : 유료 상단업 400개 무료지급 (전문판매자만 해당) / 헬로페이 할인쿠폰 6장 발급 <br><br>※ 등급은 아이템 판매가격 1만원 이상의 헬로페이 구매확정완료 거래 실적 기준으로 합니다. <br>※ 등급은 최근 90일간 실적을 반영하여 매월 1일에 적용됩니다.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[계정] 회원탈퇴 방법을 알려주세요</div>
                                            </div>
                                            <div class="faq_content">헬로마켓 앱 [나의메뉴] &gt; [설정] &gt; 하단 [회원탈퇴] 에서 가능합니다.<br><br>탈퇴 시 전자지갑 잔액(보유현금) 및 이용중인 유료서비스가 모두 소멸됩니다. </div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[신고] 직거래 계좌입금 후 사기를 당하면 어떻게 하나요?</div>
                                            </div>
                                            <div class="faq_content">헬로마켓 웹사이트 [헬프센터] &gt; [일반문의] &gt; [직거래피해신고] 에서 판매자 정보와 피해내용을 신고해주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로톡] 다른 회원과 채팅을 하고 싶어요</div>
                                            </div>
                                            <div class="faq_content">아이템 상세 화면 하단 [헬로톡] 버튼을 누르면 채팅창이 열립니다.<br><br>대화 시 서로를 존중하고 배려하는 매너를 준수해주세요.</div>
                                        </li>
                                        <li class="faq_section">
                                            <div class="faq_title_wrapper"><img class="faq_questions" src="https://ccimage.hellomarket.com/web/tag/ico_helmacenter_faq_question.png" alt="질문 이미지">
                                                <div class="faq_title">[헬로톡] 채팅을 보냈는데 답이 없어요</div>
                                            </div>
                                            <div class="faq_content">상대회원이 장시간 무응답인 경우 바로 답변이 어려운 상황일 수 있습니다. <br><br>또는 등록한지 여러 날이 경과한 아이템은 이미 판매되었을 가능성도 있습니다. <br><br>빠른 거래를 희망하실 경우 다른 아이템도 검색해보시길 권유 드립니다.</div>
                                        </li>
                                    </ul>
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
                          <li><a href="http://company.hellomarket.com" class="link_info" target="_blank" rel="noopener noreferrer">Hellomarket Inc.</a></li>
                          <li><a class="link_info" href="Helpcenter.jsp">FAQ</a><span class="list_space"></span></li>
                          <li><a class="link_info" href="terms.jsp">이용약관</a><span class="list_space"></span></li>
                          <li><a class="link_info" href="protection.jsp">개인정보 처리방침</a></li>
                      </ul>
                      <ul class="f_right">
                          <li><a href="https://itunes.apple.com/kr/app/id469381475?mt=8&amp;ls=1" target="_blank" rel="noopener noreferrer"><img src="https://ccimage.hellomarket.com/web/2017/common/img_footer_appstore.png" alt="appstore" class="appstore_n_btn"></a></li>
                          <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket" target="_blank" rel="noopener noreferrer"><img src="https://ccimage.hellomarket.com/web/2017/common/img_footer_googleplay.png" alt="googleplay" class="googleplay_n_btn"></a></li>
                          <li><a href="https://blog.naver.com/tuckandco" target="_blank" rel="noopener noreferrer"><img src="https://ccimage.hellomarket.com/web/2019/footer/img_naver_gray_blog.png" alt="naverblog" class="naver_blog_n_btn"></a></li>
                      </ul>
                  </div>
              </div>
              <div class="footer_bottom">
                  <div class="f_wrapper">
                      <div class="footer_wrapper_left">
                          <div class="fb_logobox"><img src="https://ccimage.hellomarket.com/web/2017/common/footer/img_footer_logo_171127.png" alt="hellomarket"></div>
                          <ul class="footer_company_info">
                              <li><span>(주)안녕마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                              <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305" class="link_info" target="_blank" rel="noopener noreferrer" style="text-decoration: underline;">사업자정보확인</a></span></li>
                              <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                              <li><span>일반문의: <a href="https://www.hellomarket.com/help/inquiry/form.hm" target="_blank" rel="noopener noreferrer" style="text-decoration: underline;">헬프센터 - 문의</a></span><span> | <a href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200" target="_blank" rel="noopener noreferrer" style="text-decoration: underline;">제휴문의</a></span></li><br>
                              <li><span>(주)안녕마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)안녕마켓은 일체 책임을 지지 않습니다.</span></li>
                              <li><span>©(주)안녕마켓. All rights reserved.</span></li>
                          </ul>
                      </div>
                      <div class="footer_wrapper_right">
                          <ul class="box">
                              <li style="font-weight: bold;">기업은행 구매 안전 서비스 (채무지급보증)</li>
                              <li>안전거래를 위해 현금 등으로 결제 시,</li>
                              <li>저희 사이트에서 가입한 기업은행의</li>
                              <li>구매안전서비스를 이용하실 수 있습니다.</li>
                              <li><img src="https://ccimage.hellomarket.com/web/2017/common/footer/btn_footer_service_n.png" alt="services" class="footer_service_btn"></li>
                          </ul>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</body>
</html>