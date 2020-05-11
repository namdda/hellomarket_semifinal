<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*" %>
<%@ page import="User.CouponDAO"%>
<%@ page import ="User.CouponDTO" %>
<%@ page import ="User.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="coupon" class="User.CouponDAO" scope="page"/>
<!DOCTYPE html>
<html lang="en">
<%
	List<CouponDTO> couponList = new ArrayList<CouponDTO>();
	couponList = coupon.showCouponList();
%>
  <%
	String userId = null;
	String userNick = null;
	if (session.getAttribute("userId") != null){
		userId = (String) session.getAttribute("userId");
		userNick = (String) session.getAttribute("userNick");
	}
	
%>
      
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../css/chunk.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
    <div class="ReactModalPortal" style="display: none;">
        <div class="ReactModal__Overlay ReactModal__Overlay--after-open overlay" style="overflow: auto;">
            <div class="ReactModal__Content ReactModal__Content--after-open modal_main" tabindex="-1" role="dialog">
                <div class="modal_parent">
                    <div class="modal_container">
                        <div class="modal_wrapper popup_type2_modal">
                            <div class="modal_body">
                                <div class="title">유의사항</div>
                                <div class="popup_type2_notice">
                                    <ul>
                                        <li><span class="dot_position">•</span><span class="description_position">쿠폰 종류에 따라 적용대상과 유효기간 등 조건이 상이합니다.</span></li>
                                        <li><span class="dot_position">•</span><span class="description_position">쿠폰을 사용한 거래가 배송 전 주문취소 된 경우 유효기간 내 재발급 되며, 유효기간이 경과시 재발급이 불가합니다.</span></li>
                                        <li><span class="dot_position">•</span><span class="description_position">당사 사정에 따라 사전고지 없이 제공중인 쿠폰 내용이 변경되거나 종료될 수 있습니다.</span></li>
                                    </ul>
                                </div>
                                <div class="popup_type2_footer"><button type="button">확인</button></div>
                            </div>
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
                        <div class="modal_wrapper coupon_modal">
                            <div class="modal_header">
                                <div class="modal_title">
                                    <div class="label">할인 쿠폰 받기</div>
                                </div>
                                <div class="modal_close"></div>
                            </div>
                            <div class="modal_body">
                                <div class="coupon_list">
    <ul>
 <%
 	for(CouponDTO c : couponList){
 %>		
 	<li>
            <div class="coupon_left">
                <div class="title"><%=c.getCouponName() %></div>
                <div class="price"><%=c.getCouponPrice() %>원</div>
                <div class="condition"><span>이용조건 확인하기</span><img src="https://ccimage.hellomarket.com/web/2019/item/btn_info_13x13_600_x2.png" alt="느낌표 이미지">
                    <div class="history_coupon_condition"><%=c.getCouponTerms() %></div>
                </div>
            </div>
            <div class="coupon_right" onclick= "updateForm(<%=c.getCouponIdx()%>)"><img src="../img/ico_download_white_x2.png" alt="다운로드 이미지"><span style="visibility:hidden"><%=c.getCouponIdx() %></span></div>
        </li>
        
 <% 	
 	}
 %>
  <script>
  
	 function updateForm(c_idx){
	 	$.ajax({
	 		url : "coupon_action.jsp",
	 		type : "POST",
	 		cache : false,
	 		dataType : "json",
	 		data : "c_idx="+c_idx,
	 		success: function(data){
	 			$(".history_title coupon_history_title").html(data.c_idx);
	 			$("#c_name").val(data.c_name);
	 			$("#c_price").val(data.c_price);
	 			$("#c_couponterms").val(data.c_couponterms);
	 			$(".modal_close").css('display','none');
	 			$(".ReactModalPortal").css('display','none');
	 		},
	 		
	 		error : function(request,status,error){
	 			 var msg = "ERROR : " + request.status + "<br>"
				 console.log(msg);   
	 		    }
	 		
	 	});
	 	}
	
	 
	 
 	
 </script>

    </ul>
</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        
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
    <div class="nick"><img src="https://ccimage.hellomarket.com/web/2017/common/img_default_profile_60x60.png" width="36" height="36" alt="n15979427의 프로필 사진" class="profile_img"><span class="nick_title"><%=userNick %>님</span></div>
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
            <div class="gnb_my_lyr test_type"><a href="mystore/level.jsp">
                <div class="gnb_my_member_level"><img class="gnb_my_member_level_img" src="../img/img_level_3_420x420.png"
                    alt="뱃지 이미지">
                  <div><span class="level_description">나의등급</span><span class="level_description_name">화이트</span></div>
                </div>
              </a>
              <ul class="gnb_my_list"><a href="/s/@15979427?type=item">
                  <li class="gnb_my_list_first">내상점</li>
                </a><a href="/m/hellopay.hm?type=seller&amp;status=open">
                  <li>헬로페이 거래내역</li>
                </a><a href="./coupon.jsp">
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

        <script src="../js/common.js?v=<%=System.currentTimeMillis()%>"></script>
        <section class="content">
            <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
            <h2>헬로페이 쿠폰</h2>
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
                                    <div class="left_nav">
                                        <ul class="left_nav_menu">
                                            <li><a class="active" id="scrollMain" href="/m/coupon"><span>할인쿠폰</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <section class="left_main">
                                    <div class="coupon_header">
                                        <div class="use_coupon active left_coupon"><a>보유쿠폰</a></div>
                                        <div class="expiration_coupon left_coupon"><a>사용완료/기간만료</a>
                                        </div>
                                        <div class="notice_coupon right_coupon">쿠폰 유의사항</div>
                                        <div class="download_coupon right_coupon">다운 가능한 쿠폰</div>
                                    </div>
                                    <div class="member_history_box member_coupon_box">
                                        <ul class="">
                                            <li class="title_history">
                                                <div class="history_title">쿠폰명</div>
                                                <div class="history_sale_price">할인금액</div>
                                                <div class="history_coupon_period">유효기간</div>
                                                <div class="history_coupon_available">이용조건</div>
                                            </li>
                                            <script>
												let indexNum = new Array();
												$(".coupon_right").on('click',function(){
													$(this).addClass("coupon_right_back");
													$(this).html("<span>받기<br>완료</span>");
												})
											
												
											</script>
				
<%
	UserDAO user = new UserDAO();
	CouponDTO selectedCoupon = new CouponDTO();
	int couponIdx = user.user_coupon(userId);
	if(couponIdx == 0){
%>
                                            <div>
                                            
                                                <div class="member_payment_title">보유한 쿠폰이 없습니다.</div>
                                                <div class="member_payment_btn_box"></div>
                                            </div>

<% 
	}

	else{
		selectedCoupon = coupon.showReceivedCoupon(couponIdx);
%>
		<li class="description_history">
	    <div class="history_left_main">
	        <div class="history_title coupon_history_title"><%=selectedCoupon.getCouponName() %></div>
	        <div class="history_sale_price coupon_history_sale_price"><%=selectedCoupon.getCouponPrice() %></div>
	    </div>
	    <div class="history_coupon_available"><span>이용조건 확인</span>
	        <div class="history_coupon_condition"><%=selectedCoupon.getCouponTerms() %></div>
	    </div>
	</li>
<% 
	}
%>
                                        </ul>
                                    </div>
                                    <div class="mobile_coupon_notice">
                                        <div class="title">유의사항</div>
                                        <ul>
                                            <li><span>•</span><span>쿠폰 종류에 따라 적용대상과 유효기간 등 조건이 상이합니다.</span></li>
                                            <li><span>•</span><span>쿠폰을 사용한 거래가 배송 전 주문취소 된 경우 유효기간 내 재발급 되며, 유효기간이 경과시
                                                    재발급이 불가합니다.</span></li>
                                            <li><span>•</span><span>당사 사정에 따라 사전고지 없이 제공중인 쿠폰 내용이 변경되거나 종료될 수
                                                    있습니다.</span></li>
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
                                        alt="appstore" class="appstore_n_btn"></a></li>
                            <li><a href="https://play.google.com/store/apps/details?id=com.tuck.hellomarket"
                                    target="_blank" rel="noopener noreferrer"><img
                                        src="https://ccimage.hellomarket.com/web/2017/common/img_footer_googleplay.png"
                                        alt="googleplay" class="googleplay_n_btn"></a></li>
                            <li><a href="https://blog.naver.com/tuckandco" target="_blank"
                                    rel="noopener noreferrer"><img
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
                                <li><img src="https://ccimage.hellomarket.com/web/2017/common/footer/btn_footer_service_n.png"
                                        alt="services" class="footer_service_btn"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
        <script src="../js/coupon.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>