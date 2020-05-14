<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="Board.*" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import = "java.util.List" %>

<%
	request.setCharacterEncoding("UTF-8");
	String subCat1 = "";
	String subCat2 = "";
	String subCatCode1 ="";
	String subCatCode2 ="";
	String catName = "";
	String category = "";
	
	BoardDTO boardDTO = new BoardDTO();
	BoardDAO boardDAO = new BoardDAO();
	List<BoardDTO> board = new ArrayList<BoardDTO>();
	
	if(request.getParameter("category")!=null){
		category = request.getParameter("category");	
		
		if(category.equals("HAC0000")){
			catName = "휴대폰,태블릿";
			subCat1 ="휴대폰";
			subCat2 ="태블릿";
			if(subCat1.equals("휴대폰")){
				subCatCode1 = "HAC0010";
			}
			if(subCat2.equals("태블릿")){
				subCatCode2 = "HAC0020";
			}
		}else if(category.equals("HAC0001")){
			catName = "뷰티";
			subCat1 ="헤어";
			subCat2 ="미용";
			if(subCat1.equals("헤어")){
				subCatCode1 = "HAC0011";
			}
			if(subCat2.equals("미용")){
				subCatCode2 = "HAC0021";
			}
		}else if(category.equals("HAC0002")){
			catName = "여성의류";
			subCat1 ="여성상의";
			subCat2 ="여성하의";
			if(subCat1.equals("여성상의")){
				subCatCode1 = "HAC0012";
			}
			if(subCat2.equals("여성하의")){
				subCatCode2 = "HAC0022";
			}
		}else if(category.equals("HAC0003")){
			catName = "신발,가방,잡화";
			subCat1 ="신발";
			subCat2 ="가방,잡화";
			if(subCat1.equals("신발")){
				subCatCode1 = "HAC0013";
			}
			if(subCat2.equals("가방,잡화")){
				subCatCode2 = "HAC0023";
			}
		}else if(category.equals("HAC0010")){
			catName ="휴대폰";
		}else if(category.equals("HAC0020")){
			catName ="태블릿";
		}else if(category.equals("HAC0011")){
			catName ="헤어";
		}else if(category.equals("HAC0021")){
			catName ="미용";
		}else if(category.equals("HAC0012")){
			catName ="여성상의";
		}else if(category.equals("HAC0022")){
			catName ="여성하의";
		}else if(category.equals("HAC0013")){
			catName ="신발";
		}else if(category.equals("HAC0023")){
			catName ="가방,잡화";
		}else {
			catName = category;
		}
		board = boardDAO.showItemThisCat(category);
	}
	
	
	
	
	
	

%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charSet="utf-8" />
  <title><%=catName %>| 안녕마켓 - 100% 안전한 중고거래 장터</title>
  <link href="/HelloMarket/css/chunk.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  

</head>

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

    	<img src="../img/img_default_profile_60x60.png" width="36" height="36" alt="<%=userNick %>의 프로필 사진" class="profile_img">

    	<span class="nick_title"><%=userNick %>님</span>

    	</div>

    <div class="notification_box">

    	<a href="" target="_blank" rel="noopener noreferrer">

    		<img src="../img/btn_title_hellotalk.png" alt="채팅 아이콘" class="chat">

        	<div class="chat_cnt">4</div>

        </a>

        <a id ="alarm_btn" target="_blank">

        	<img src="../img/btn_title_notification.png" alt="알림목록 아이콘" class="alram">

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

                    <div><input type="text" id="value"  class="com_search" placeholder="어떤 상품을 찾고 계세요?" style="border-bottom: 1px solid rgb(158, 164, 170);">

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

            <div class="selling_bot"><img src="../img/ico_sell_camera_x2.png" alt="판매하기 이미지" class="selling_bot_img"><span

                class="selling_bot_text"><a href="/HelloMarket/sell/sell.jsp">판매하기</a></span></div>

          </div>

          <div class="link_box header_wrapper_sub">

            <ul>

              <li><a href="/help/faq.html">헬프센터</a></li>


            </ul>

          </div>

        </div>

      </section>

    </header>
    
    <section class="content">
      <h1>헬로마켓 - 100% 안전한 중고거래 장터</h1>
      <h2>검색 리스트</h2>
      <div class="item_list_min">
        <div class="item_list_area">
          <div class="breadcrumbs">
            <ul>
              <li><a>HOME</a></li>
              <li>&gt; <a href="/HelloMarket/search/search.jsp?category=<%=category%>"><%=catName %></a></li>
            </ul>
          </div>
          <div class="main_area">
            <div class="main_area_center">
              <div class="main">
                <div class="left">
                  <div class="category_filter">
                    <div class="category_title">
                      <div class="category_title_txt"><%=catName %></div>
                    </div>
                    <div class="category_sub"><span>
                        <ul class="category_sub_list">
                          <li class=""><a href="/HelloMarket/search/search.jsp?category=<%=subCatCode1%>"><%=subCat1 %></a></li>
                          <li class=""><a href="/HelloMarket/search/search.jsp?category=<%=subCatCode2%>"><%=subCat2 %></a></li>
                         
                        </ul>
                      </span></div>
                  </div>
                  
                  <div class="search_filter">
                    <div class="title">상품상태</div>
                    <div class="middle">
                      <ul><a href="/search?category=HAE0000&amp;page=1">
                          <li><label class="feature_option feature_option_checkbox">전체<div
                                class="feature_option_checkbox_indicator checked"></div></label></li>
                        </a><a href="/HelloMarket/search/search.jsp?category=<%=category%>&usedType=NotUsed">
                          <li><label class="feature_option feature_option_checkbox">새상품<div
                                class="feature_option_checkbox_indicator"></div></label></li>
                        </a><a href="/HelloMarket/search/search.jsp?category=<%=category%>&usedType=AsNew">
                          <li><label class="feature_option feature_option_checkbox">거의새것<div
                                class="feature_option_checkbox_indicator"></div></label></li>
                        </a><a href="/HelloMarket/search/search.jsp?category=<%=category%>&usedType=SecondHand">
                          <li><label class="feature_option feature_option_checkbox">중고<div
                                class="feature_option_checkbox_indicator"></div></label></li>
                        </a><a href="/HelloMarket/search/search.jsp?category=<%=category%>&usedType=SomeFlaw">
                          <li><label class="feature_option feature_option_checkbox">하자있음<div
                                class="feature_option_checkbox_indicator"></div></label></li>
                        </a></ul>
                    </div>
                    <div class="item_left_bottom"></div>
                  </div>
                  
                  <div class="search_filter no_padding">
                    <div class="middle safe_middle">
                      <ul><a href="/search?category=HAE0000&amp;page=1&amp;canBarter=true">
                          <li><label class="feature_option feature_option_checkbox">교환가능<div
                                class="feature_option_checkbox_indicator"></div></label></li>
                        </a><a href="/search?category=HAE0000&amp;page=1&amp;hasDeliveryFee=true">
                          <li><label class="feature_option feature_option_checkbox">무료배송<div
                                class="feature_option_checkbox_indicator"></div></label></li>
                        </a></ul>
                    </div>
                    <div class="item_left_bottom"></div>
                  </div>
                </div>
                <section class="left_main">
                  <div class="tab_area biz_area">
                    
                    <div class="tab_type_box"><a
                        href="/search?category=HAE0000&amp;page=1&amp;isEscrowOnly=true">
                        <div class="hellopay_only_tab"><label
                            class="feature_option feature_option_checkbox"><span
                              class="hellopay_only_color">안전결제 전용</span><span>만 보기</span>
                            <div class="feature_option_checkbox_indicator"></div>
                          </label></div>
                      </a>
                      <div class="tab_type biz_type mobile_type">
                        <ul><a href="/search?category=HAE0000&amp;page=1&amp;tabType=list">
                            <li class="list"></li>
                          </a><a href="/search?category=HAE0000&amp;page=1&amp;tabType=thumbnail">
                            <li class="thumbnail active"></li>
                          </a>
                          <li class="mobile_filter_icon"></li>
                        </ul>
                      </div>
                    </div>
                   
                    <div class="sort_filter biz_sort"><label for="sortTitle">최신순</label><select>
                        <option value="">최신순</option>
                        <option value="lowprice">저가순</option>
                        <option value="highprice">고가순</option>
                        
                      </select></div>
                  </div>
                  <div class="list_area">
                    <div class="tab_content">
                      <div>
                        <div class="infinite-scroll-component "
                          style="height:auto;overflow:auto;-webkit-overflow-scrolling:touch;overflow-y:auto;overflow-x:hidden">
                          <ul class="mian_row auto_mian_row">
                          
                          <%
                          	for(BoardDTO b : board){
                          		System.out.println(b.getP_image1_orig_name());
                          	%>
                          		<li class="main_col_3" style="height:auto">
                                <div class="item_wrapper_card">
                                  <div class="dibs_card"><button type="button"><svg viewBox="0 0 24 24"
                                        fill="#484848" fill-opacity="0.5" stroke="#ffffff" stroke-width="2"
                                        focusable="false" aria-label="찜하기" role="img" stroke-linecap="round"
                                        stroke-linejoin="round" class="dib_img">
                                        <path
                                          d="m17.5 2.9c-2.1 0-4.1 1.3-5.4 2.8-1.6-1.6-3.8-3.2-6.2-2.7-1.5.2-2.9 1.2-3.6 2.6-2.3 4.1 1 8.3 3.9 11.1 1.4 1.3 2.8 2.5 4.3 3.6.4.3 1.1.9 1.6.9s1.2-.6 1.6-.9c3.2-2.3 6.6-5.1 8.2-8.8 1.5-3.4 0-8.6-4.4-8.6"
                                          stroke-linejoin="round"></path>
                                      </svg></button></div><a class="card card_list"
                                    href="/HelloMarket/item/item.jsp?p_idx=<%=b.getP_idx()%>">
                                    <div class="card_box">
                                      <div class="image_wrapper">
                                        <div class="image_outside">
                                          <div class="image_centerbox"><img src="/HelloMarket/upload/img/<%=b.getP_image1_orig_name()%>"
                                              
                                              alt="120~130사이즈 아이옷" class="thumbnail_img" /><label data-index="0"
                                              style="display:none">0</label></div>
                                        
                                        </div>
                                      </div>
                                      <div class="cont">
                                        <div class="item_title"><%=b.getP_title() %></div>
                                        <div class="item_price"><%=b.getP_price() %>원</div>
                                      </div>
                                    </div>
                                  </a>
                                </div>
                              </li>
                           <% 
                          	}
                          %>
               
                          </ul>
                        </div>
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
<script src = "/HelloMarket/js/common.js?v=<%=System.currentTimeMillis() %>"></script>
</body>

</html>