<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDTO" class="Board.BoardDTO"/>
<jsp:setProperty property="*" name="boardDTO"/>
<jsp:useBean id="boardDAO" class="Board.BoardDAO"/>
<%@ page import ="User.*" %>
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charSet="utf-8" />
  <title>상품 등록 | 안녕마켓 - 100% 안전한 중고거래 장터</title>
  <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
  <link href="/HelloMarket/css/chunk.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="/HelloMarket/js/postcode.js"></script>
  <style>
    @media all and (max-width: 800px) {
      img {
        width: 100%;
      }
    }
    
   #fileflow { display:none; } 
   #fileflow01 { display:none; } 
   #fileflow02 { display:none; } 
   #fileflow03 { display:none; } 
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
  
<script src="../js/common.js"></script>
</head>

<body>
 <%
	String userId = null;
	String userNick = null;
	int sellerLevel = 0;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
		sellerLevel = (int)session.getAttribute("sellerLevel");
	}
	
	%>
<%	
	
	
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
          <div class="log_box"><img src="../img/MarketMain.png" class="logo" alt="헬로마켓"></div>
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
    	<a href="" target="_blank" rel="noopener noreferrer">
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
                  <div><span class="level_description">나의등급</span><span class="level_description_name">화이트</span></div>
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



    <section class="content">
      <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
      <h2>상품 등록 페이지</h2>
      <div class="main_area">
        <div class="main_area_center">
          <div class="main">
            <div class="breadcrumbs">
              <ul>
                <li><a href="/">HOME</a></li>
                <li>&gt;
                  <!-- --> 상품 등록</li>
                  
                  
              </ul>
            </div>
            <div class="regist_top">
              <div class="regist_box_top">
                <div>상품 등록</div>
              </div>
            </div>
   <form method="post" action="sell_ok.jsp" enctype="multipart/form-data">
            <div class="regist_box">
              <div class="description">
                <dl id="mainDiv">
                  <dt><label style="color:#333333">거래방법</label></dt>
                  <dd>
                    <div class="hellopay_box_area" > <!--일단 얘는 이름 맞는거 같은데   -->
                      <ul>
                        <li class="">
                       <input type="checkbox"  name="deal_m1" value="헬로페이">헬로페이
                       </li>
                        <li>
                        <input type="checkbox"  name="deal_m1" value="직거래">직거래
                        </li>
                      </ul>
                    </div>
                    <div class="hellopay_direct_notice"><span class="normal_notice">헬로페이만 선택 후 등록시 노출, 할인 혜택
                        지원으로 빠른 판매를 도와드립니다.</span></div>
                  </dd>
                </dl>
                <dl class="regist_image_dl" id="registImage">
                  <dt><label style="color:#333333">상품사진</label><span class="photo_max">* 최대 3장</span></dt>
                  <dd>
                    <ul class="image_list">
                        <li>
                          <div class="up_img_box" id="">
                          <input type="file" id="fileflow01" name="fileflow01" /> <!--  얘도 이름 맞는데 -->
                          <input type="hidden" id="p_image1_orig_name" name="p_image1_orig_name"/> <!--  얘도 이름 맞는데 -->
                          
                          <img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" id="img_first" class="item_img" alt="상품 등록 이미지"/>
                          </div>
                        </li>
                    </ul>
                    
                    <div class="up_img_description"><span class="up_img_description_title">* 첫번째 사진은 직접 촬영한 상품
                        사진을 등록해주세요.</span><img
                        src="https://ccimage.hellomarket.com/web/2019/ad/ico_question_gr_60x60.png"
                        alt="물음표이미지" />
                      <div class="up_img_hover"><span>판매자의 상품 보유 유무와 실물 상태 확인을 위해 직접 촬영한 실제 상품 사진을 첫번째 이미지로
                          첨부해주시기 바랍니다.</span><span class="img_hover_margin">상품 첫번째 이미지에 실제 사진이 첨부되지 않은 경우,
                          사전안내 없이 수정 또는 삭제될 수 있습니다.</span><span class="img_hover_margin">*삽니다. 무형의 상품
                          제외</span></div>
                    </div>
                    <div class="box_option box_area watermark_box_area">
                      <div class="can_barter_check">
                      
                      <label class="feature_option feature_option_checkbox no_feature_option" id="reset">이미지리셋</label></div>
                      
                    </div>
                  </dd>
                </dl>
                <dl id="title">
                  <dt><label style="color:#333333">제목</label></dt>
                  <dd><input type="text" class="title_input" placeholder="상품 제목을 입력하세요" value="" name="p_title"/> <!-- 이거도 이름 맞고 -->
                    <ul class="item_recommend_box"></ul>
                  </dd>
                </dl>
                <dl id="category">
                  <dt>
                 
                  <label style="color:#333333">카테고리</label></dt> <!-- 뭐야 이것도 맞는데 -->
                  <dd>
                    <div class="item_select_box">
                    <select name="p_m_category">
                        <option value="" hidden="">카테고리</option>
                            <option id="1" value="1">휴대폰,태블릿</option>
                            <option id="2" value="2">뷰티</option>
                            <option id="3" value="3">여성의류</option>
                            <option id="4" value="4">신발,가방,잡화</option>
                      </select>
                      </div>
                      
                    <div class="item_select_box item_select_margin">
                    <select name="p_s_category">
                        <option selected="" value="" hidden="">하위 카테고리</option>
                           <option id="case1" value="sub1">휴대폰,태블릿(1)</option>
                           <option id="case2" value="sub2">휴대폰,태블릿(2)</option>
                            <option id="case3" value="sub3">뷰티(1)</option>
                            <option id="case4" value="sub4">뷰티(2)</option>
                            <option id="case5" value="sub5">여성의류(1)</option>
                            <option id="case6" value="sub6">여성의류(2)</option>
                            <option id="case7" value="sub7">신발,가방,잡화(1)</option>
                            <option id="case8" value="sub8">신발,가방,잡화(2)</option>
                      </select></div>
                  </dd>
                </dl>
                <dl></dl>`
                <dl id="content">
                  <dt><label style="color:#333333">상품설명</label></dt>
                  <dd><textarea rows="5" class="introduce" placeholder="상품 정보를 상세하게 적어보세요.
설명되지 않은 하자나 문제 발생시 책임은 판매자에게 있습니다.
- 구매정보(구매일시, 구매시 가격)
- 상품 정보(사이즈, 색상, 브랜드 등)
- 상품 사용감(스크래치, 고장, 수리 여부 등)" name="p_description" wrap="hard"></textarea></dd> <!-- 이거도 맞는데 -->
                </dl>
                <dl>
                  <dt><label>상품상태</label></dt>
                  <dd>
                    <ul class="item_status_list">
                      <li class="item_status">
                        
                          <div style="font-size:13px" class="text"> <input type="radio" id="p_status" name="p_status1" value="새상품" checked>새상품</div>
                         
                        
                      </li>
                      
                      <li class="item_status">
                        
                          <div style="font-size:12px" class="text"><input type="radio"  id="p_status" name="p_status1" value="중고">중고</div>
                        
                      </li>
                    
                    </ul>
                  </dd>
                </dl>
                <dl class="sell_method_box">
                  <dt><label id="price" style="color:#333333">거래종류</label></dt>
                  <dd>
                    <div class="box_sell_method box_area">
                      <ul class="item_status_list" >
                        <li>
                          <div class=""> <!-- text_wrapper click text_first -->
                             <input type="radio" id="trade_kind" name="p_trade_kind" value="판매">판매
                          </div>
                        </li>
                     
                        </li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl class="hellopay_options_box direct_options_box" id="price">
                  <dt style="color:#333333">판매가격</dt>
                  <dd>
                    <div class="box_price box_area">
                       <input type="text" placeholder="판매희망 가격을 입력하세요" class="sell_type_input" name="p_price"><span class="box_prive_text">원</span>
                    </div>
                    
                    <dl class="etc_options_box etc_options_box_2">
                      <dd>
                        <div class="box_option box_area check_box_area">
                          <div><label class="feature_option feature_option_checkbox no_feature_option">
                             <input type="checkbox" name="p_delivery" value="무료배송">무료배송</label></div>
                              
                          <div class="can_barter_check can_delivery_check"><label
                              class="feature_option feature_option_checkbox no_feature_option">
                              <input type="checkbox" name="p_delivery" value="교환신청">교환신청</label></div>
                        </div>
                      </dd>
                    </dl>
                  </dd>
                </dl>
                <dl>
                  <dt><label>거래희망 위치 <span>(선택)</span></label></dt>
                  <dd class="map_box">
                  <input type="text" class="my_location_input item_location_input" placeholder="위치 선택" readonly="readonly" value="" name ="p_transac_loc" id="sample6_address"/>
              <input type="hidden" name="" id="sample6_extraAddress"/>
               <input type="hidden" name="" id="sample6_detailAddress"/>
                <input type="hidden" name="" id="sample6_postcode"/>
                    <div class="close_button item_close_button"></div>
                    <div class="my_location_map" onclick="sample6_execDaumPostcode()"><span>검색</span></div>
                  </dd>
                </dl>
              </div>
            </div>
            <div>
              <div class="item_notice">
                <div class="text_bold">상품 등록전에 꼭 확인하세요.</div>
                <div class="text_bottom">비정상적인 상품을 등록하거나, 헬로포인트 사용금지 거래(상품권)에 속하는 상품을 해당 카테고리가 아닌 잘못된 카테고리에
                  등록할 경우 그 정도에 따라 경고, 출금요청 취소, 지급된 헬로포인트 전액 소멸, 계정제재 등의 책임을 물을 수 있음을 알려드립니다.</div>
              </div>
              <div class="item_submit_box">
                <div class="item_area_submit_box"><a href="/"><button class="btn_item_cancel"
                      type="button">취소</button></a><button class="btn_item_mobile_cancel"
                    type="button">삭제</button>
                    <input type="submit" class="btn_item_submit" value="등록완료">
               	</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </form>
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
                  rel="noopener noreferrer"><img
                    src="https://ccimage.hellomarket.com/web/2017/common/img_footer_appstore.png"
                    alt="appstore" class="appstore_n_btn" /></a></li>
              <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket" target="_blank"
                  rel="noopener noreferrer"><img
                    src="https://ccimage.hellomarket.com/web/2017/common/img_footer_googleplay.png"
                    alt="googleplay" class="googleplay_n_btn" /></a></li>
              <li><a href="https://blog.naver.com/tuckandco" target="_blank" rel="noopener noreferrer"><img
                    src="https://ccimage.hellomarket.com/web/2019/footer/img_naver_gray_blog.png"
                    alt="naverblog" class="naver_blog_n_btn" /></a></li>
            </ul>
          </div>
        </div>
        <div class="footer_bottom">
          <div class="f_wrapper">
            <div class="footer_wrapper_left">
              <div class="fb_logobox"><img
                  src="https://ccimage.hellomarket.com/web/2017/common/footer/img_footer_logo_171127.png"
                  alt="hellomarket" /></div>
              <ul class="footer_company_info">
                <li><span>(주)헬로마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호
                    <!-- --> <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305" class="link_info"
                      target="_blank" style="text-decoration:underline"
                      rel="noopener noreferrer">사업자정보확인</a></span></li>
                <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                <li><span>일반문의:
                    <!-- --> <a href="https://www.hellomarket.com/help/inquiry/form.hm" target="_blank"
                      style="text-decoration:underline" rel="noopener noreferrer">헬프센터 - 문의</a></span><span>
                    <!-- -->|
                    <!-- --> <a href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200"
                      target="_blank" style="text-decoration:underline"
                      rel="noopener noreferrer">제휴문의</a></span></li><br />
                <li><span>(주)헬로마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)헬로마켓은 일체 책임을 지지
                    않습니다.</span></li>
                <li><span>©(주)헬로마켓. All rights reserved.</span></li>
              </ul>
            </div>
            <div class="footer_wrapper_right">
              <ul class="box">
                <li style="font-weight:bold">기업은행 구매 안전 서비스 (채무지급보증)</li>
                <li>안전거래를 위해 현금 등으로 결제 시,</li>
                <li>저희 사이트에서 가입한 기업은행의</li>
                <li>구매안전서비스를 이용하실 수 있습니다.</li>
                <li><img src="https://ccimage.hellomarket.com/web/2017/common/footer/btn_footer_service_n.png"
                    alt="services" class="footer_service_btn" /></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>
$(".item_select_margin>select>option").hide();
$(".item_select_box").change(function () {
   
   $(".item_select_margin>select>option").hide();
      var value = $('.item_select_box>select>option:selected').val();
      
      if (value == 1) {
         $(".item_select_box item_select_margin>select>option").hide();
         
         $('#case1').show();
         $('#case2').show();
      }
      if (value == 2) {
         $(".item_select_box item_select_margin>select>option").hide();
         
         $('#case3').show();
         $('#case4').show();
      }
      if (value == 3) {
         $(".item_select_box item_select_margin>select>option").hide();
         
         $('#case5').show();
         $('#case6').show();
      }
      if (value == 4) {
         $(".item_select_box item_select_margin>select>option").hide();
         
         $('#case7').show();
         $('#case8').show();
      }
});
    $('.text_first').on('click',function(e){
        $('.text_second').css('background-color','white');
       $('.text_first').css('background-color','#0484f6');
       $('.hellopay_options_box').show();
       
    });
    
    $('.text_second').on('click',function(e){
        $('.text_second').css('background-color','#0484f6');
        $('.text_first').css('background-color','white');
        $('.text_first>div').css('color','black');
        $('.text_first').css('border-color','#e8ebed');
        $('.hellopay_options_box').hide();
        
     });
    
    
    
    $('.list_first').on('click',function(e){
          $('.list_fourth').css('background-color','white');
          $('.list_third').css('background-color','white');
          $('.list_second').css('background-color','white');
          $('.list_first').css('background-color','#0484f6');
          $('.list_third>div').css('color','black');
          $('.list_third').css('border-color','#e8ebed');
    });
    $('.list_second').on('click',function(e){
          $('.list_fourth').css('background-color','white');
          $('.list_third').css('background-color','white');
          $('.list_second').css('background-color','#0484f6');
          $('.list_first').css('background-color','white');
          $('.list_third>div').css('color','black');
          $('.list_third').css('border-color','#e8ebed');
    });
    $('.list_third').on('click',function(e){
          $('.list_fourth').css('background-color','white');
          $('.list_third').css('background-color','#0484f6');
          $('.list_second').css('background-color','white');
          $('.list_first').css('background-color','white');
          $('.list_third>div').css('color','black');
          $('.list_third').css('border-color','#e8ebed');
    });
    $('.list_fourth').on('click',function(e){
          $('.list_fourth').css('background-color','#0484f6');
          $('.list_third').css('background-color','white');
          $('.list_second').css('background-color','white');
          $('.list_first').css('background-color','white');
          $('.list_third>div').css('color','black');
          $('.list_third').css('border-color','#e8ebed');
    });
    
    
    $(document).ready(function (){
        const $save_id = $(".feature_option_checkbox_indicator");
        $save_id.on('click',function(){
            $(this).toggleClass('checked');
        })
     })
     
     
   $('#fileflow01').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase();    
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#fileflow01').prop("files")[0];   
            blobURL = window.URL.createObjectURL(file);
            $('#img_first').attr('src', blobURL);
            $('#img_first').show(); //업로드한 이미지 미리보기 
            $(this).hide();
            
            var filename = $('#fileflow01').val();
            
            $("#p_image1_orig_name").val(filename);
            
            if(filename != 0){
               
               $('#fileflow02').on('change', function() {
                    
                    ext = $(this).val().split('.').pop().toLowerCase();    
                    
                    //배열에 추출한 확장자가 존재하는지 체크
                    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                        resetFormElement($(this)); //폼 초기화
                        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                    } else {
                        file = $('#fileflow02').prop("files")[0];   
                        blobURL = window.URL.createObjectURL(file);
                        $('#img_second').attr('src', blobURL);
                        $('#img_second').show(); //업로드한 이미지 미리보기 
                        $(this).hide();
                        
                        var filename01 = $('#fileflow02').val();
                        if(filename01 != 0){
                           $('#fileflow03').on('change', function() {
                                
                                ext = $(this).val().split('.').pop().toLowerCase();    
                                
                                //배열에 추출한 확장자가 존재하는지 체크
                                if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                                    resetFormElement($(this)); //폼 초기화
                                    window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                                } else {
                                    file = $('#fileflow03').prop("files")[0];   
                                    blobURL = window.URL.createObjectURL(file);
                                    $('#img_third').attr('src', blobURL);
                                    $('#img_third').show(); //업로드한 이미지 미리보기 
                                    $(this).hide(); //파일 양식 감춤
                                }
                            });
                        }
                    }
                });
            }
        }
    });
    
     
    $(function () {  //이미지 클릭
   $('#img_first').click(function (e) {
   e.preventDefault();
   $('#fileflow01').click();
   });
});
    
    $(function () {  //이미지 클릭
       $('#img_second').click(function (e) {
       e.preventDefault();
       $('#fileflow02').click();
       });
    });
    
    $(function () {  //이미지 클릭
       $('#img_third').click(function (e) {
       e.preventDefault();
       $('#fileflow03').click();
       });
    });
    
    
    //삭제
    
    $('#reset').bind('click', function() {
       alert("클릭");
        resetFormElement($('.item_img')); //전달한 양식 초기화
        $('.item_img').hide(); //파일 양식 보여줌
       
    });
    
    
    function resetFormElement(e) {      //이미지 제거
        e.wrap('<form>').closest('form').get(0).reset(); 
        e.unwrap(); //감싼 <form> 태그를 제거
    }
    
  
    
    $(document).ready(function() {  
        $("#reset").click(function() {  
             $("form").each(function() {  
                this.reset();  
             });  
        });  
        
    });
    
  
</script>

</body>

</html>