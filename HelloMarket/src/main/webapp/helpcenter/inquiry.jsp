<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반문의</title>
</head>
<link href="../css/chunk.css" rel="stylesheet" type="text/css">
<body>
    <script type="text/javascript" async="" src="https://cdn.treasuredata.com/sdk/1.6.0/td.min.js"></script>
    <script src="https://cdmedia.hellomarket.com/plugins/sweetalert/sweetalert.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%	
	request.setCharacterEncoding("utf-8");
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
                      <li><a href="./helpcenter.jsp">헬프센터</a><i class="arrow right_arrow"></i></li>
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
        <section class="content">
            <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
            <h2>공지사항 리스트</h2>
            <div class="item_list_min">
                <div class="item_list_area inquiery_list_area">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="/">HOME</a></li>
                        </ul>
                    </div>
                    <div class="main_area">
                        <div class="main_area_center">
                            <div class="main">
                                <div class="left">
                                    <div class="left_nav_type2">
                                        <div class="left_nav_type2_title">헬프센터</div>
                                        <ul class="left_nav_menu">
                                            <li><a href="/help/faq.hm"><span>자주묻는질문</span></a></li>
                                            <li><a href="/help/policy.hm"><span>운영정책</span></a></li>
                                            <li><a class="active" id="scrollMain" href="./inquiry.jsp"><span>일반 문의</span></a></li>
                                            <li><a href="/help/notice.hm"><span>공지사항</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <section class="left_main">
                                    <div class="comunity_content_title_area_contact">
                                        <ul class="inquiry_tab"><a class="" href="./inqlist.jsp">
                                                <li>문의/안내 내역</li>
                                            </a><a class="active" href="./inquiry.jsp">
                                                <li>문의하기</li>
                                            </a></ul>
                                    </div>
                                    <div class="mail_view">
                                        <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
                                        <h2>일반문의 신청 페이지</h2>
                                        <form method="post" action="inquiry_ok.jsp">
                                            <table class="inquiry_table inquiry_auth_table">
                                                <tbody>
                                                    <tr>
                                                        <td class="label">닉네임</td>
                                                        <td class="field"><input name="inqName" type="text" class="" placeholder="이름을 입력해주세요." value="<%=userNick%>" disabled></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="label"">*연락처</td>
                                                        <td class="field"><input name="inqHp" type="text" class="" placeholder="연락처를 입력해주세요.(숫자만)" value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="label">*이메일</td>
                                                        <td class="field"><input name="inqEmail" type="text" class="" placeholder="이메일을 입력해주세요." value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="label">*유형</td>
                                                        <td class="field"><select name="inqType" id="" class="commonSelectbox">
                                                                <option value="" disabled="">카테고리 선택</option>
                                                                <option value="개인정보&회원계정">개인정보&amp;회원계정</option>
                                                                <option value="신고">신고</option>
                                                                <option value="배송">배송</option>
                                                                <option value="오류">오류</option>
                                                                <option value="중고차(개인)">중고차(개인)</option>
                                                                <option value="중고차(딜러)">중고차(딜러)</option>
                                                                <option value="광고센터">광고센터</option>
                                                                <option value="제안하기">제안하기</option>
                                                                <option value="기타">기타</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="label">*하위 유형</td>
                                                        <td class="field"><select name="inqSubType" id="" class="commonSelectbox">
                                                                <option value="" disabled="">카테고리 선택</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="label">*제목</td>
                                                        <td class="field"><input name="inqTitle" type="text" class="" placeholder="제목을 입력해주세요." value=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="field photo_field" colspan="2"><textarea name="inqContent" placeholder="내용 입력" class="textarea" rows="7"></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="field photo_field" colspan="2"><label>사진첨부</label>
                                                            <div class="inquiry_photo_wrapper">
                                                                <ul class="image_list"><input type="file" multiple="" class="multiple">
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="up_img_box"><img src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png" class="item_img" alt="상품 등록 이미지"></div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        <ul class="btn_wrapper btn_wrapper_center">
                                            <li>
                                                <input class="btn" type="submit" value="문의하기">
                                            </li>
                                            <li><a class="btn list_btn" href="./inqlist.jsp">목록</a></li>
                                        </ul>
                                        </form>
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
                            <li><a class="link_info" href="/help/faq.hm">FAQ</a><span class="list_space"></span></li>
                            <li><a class="link_info" href="/terms.hm">이용약관</a><span class="list_space"></span></li>
                            <li><a class="link_info" href="/protection.hm">개인정보 처리방침</a></li>
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
                                <li><span>(주)헬로마켓 대표이사 : 이후국 | </span><span>서울특별시 마포구 와우산로 25길 7 서문빌딩 502호</span></li>
                                <li><span>사업자등록번호 : 105-87-56305</span><span>통신판매업신고번호 : 제2011-서울마포-1010호 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058756305" class="link_info" target="_blank" rel="noopener noreferrer" style="text-decoration: underline;">사업자정보확인</a></span></li>
                                <li><span>헬로페이 문의 : 02-324-4090</span><span>(평일 10시~16시) | 팩스 : 02-3141-4090</span></li>
                                <li><span>일반문의: <a href="https://www.hellomarket.com/help/inquiry/form.hm" target="_blank" rel="noopener noreferrer" style="text-decoration: underline;">헬프센터 - 문의</a></span><span> | <a href="https://www.hellomarket.com/help/inquiry/form.hm?categoryId=IGA0200" target="_blank" rel="noopener noreferrer" style="text-decoration: underline;">제휴문의</a></span></li><br>
                                <li><span>(주)헬로마켓은 통신판매중개자로서 거래당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 (주)헬로마켓은 일체 책임을 지지 않습니다.</span></li>
                                <li><span>©(주)헬로마켓. All rights reserved.</span></li>
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
<script src="/HelloMarket/js/common.js"></script>
</html>