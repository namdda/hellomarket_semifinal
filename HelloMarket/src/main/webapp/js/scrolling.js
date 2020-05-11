$(document).ready(function () {
    const $banner = $("#banner");
    const $banner_width = $banner.children().outerWidth(); // 배너의 너비 
    const $slide_next_btn = $(".swiper-button-next"); // 다음 배너 버튼 
    const $slide_prev_btn = $(".swiper-button-prev"); // 이전 배너 버튼 
    const $banner_img = $(".swiper-slide") //배너 이미지 배열 
    const $banner_slide_btn = $(".swiper-pagination-bullet"); //현재 배너 위치 
    let banner_count = 0; //배너를 슬라이드 하는데 사용
    let img_cnt = 1; // 배너가 슬라이드 되면 현재 배너 위치를 나타내기 위한 변수 


    auto(); // 실행함수 
    function auto() {
        rollingId = setInterval(function () { rollingStart() }, 3000); //3초 간격으로 실행
        slide_next_img()
        slide_prev_img()
    }

    //다음 버튼을 눌렀을 경우에 다음 이미지로 넘어가기 위한 함수 
    function slide_next_img() {
        if (!$slide_next_btn.hasClass("swiper-button-disabled")) {
            $slide_next_btn.on('click', function () {
                clearInterval(rollingId) //3초마다 실행된 함수 시간 초기화 시켜주고 
                rollingStart()  //다음 이미지로 옆으로 슬라이드 해주고 ~ 
                rollingId = setInterval(function () { rollingStart() }, 3000); //다시 3초마다 실행~ 
            })
        }
    }
    // 이전 버튼을 눌렀을 경우에 이전 이미지로 넘어가기 위한 함수 
    function slide_prev_img(){
        $slide_prev_btn.on('click',function(){
            clearInterval(rollingId); //똑같이 함수 시간 초기화 시켜주고 
            banner_count-=$banner_width*2; //다음으로 넘어가는 함수와는 다르게 이전 이미지를 보여주어야 하기 때문에 배너 너비의*2를 - 해줌 
            if(banner_count===-$banner_width*3){ //만약에 마지막 이미지에서 이전 이미지로 가기를 누르게 되면 밑에 if(banner_count===$banner_width) 때문에 초기화가 되기 때문에 여기서 다시 설정해줌 
                banner_count= 0; // banner_count를 0으로 해주게 되면 rollingStart 함수에서 다시 너비만큼 다시 더해지니까 0으로 설정
                img_cnt=3; // 현재 이미지 위치도 마지막 이미지에서 다시 0으로 설정 되기 때문에 3으로 설정 그러면 밑에 -2가 되고 rolling 함수에서 다시 +1 되어 2번째 이미지 위치를 보여줌 
            }
            img_cnt-=2;
            rollingStart();
            rollingId = setInterval(function () { rollingStart() }, 3000); // 다시 3초 실행 
        })
    }


    function rollingStart() {
        banner_count += $banner_width;
        $banner.css("transform", "translate3d(" + (-banner_count) + "px,0,0)"); //배너 이미지를 옮겨주고~
        $banner.css("transition-duration", "1000ms"); //배너가 보여지기까지 보여지는 시간은 1초 
        img_cnt++;

        img_slide();
        if (banner_count === $banner_width * 2) {
            banner_count = -$banner_width
        }
    }
    function img_slide() {
        //현재 첫번째 이미지일 경우 현재 위치를 보여주는 아이콘들 설정 
        if (img_cnt == 1) {
            $slide_next_btn.removeClass("swiper-button-disabled");
            $slide_prev_btn.addClass("swiper-button-disabled");
            $banner_img.removeClass();
            $banner_img.addClass("swiper_slide")
            $banner_img.first().addClass('swiper-slide-active').end().eq(1).addClass('swiper-slide-next').end().last().addClass('swiper-slide-next-next');
            $banner_slide_btn.removeClass().addClass("swiper-pagination-bullet").css("left", "16px")
            $banner_slide_btn.first().addClass("swiper-pagination-bullet-active swiper-pagination-bullet-active-main").end().eq(1).addClass("swiper-pagination-bullet-active-next").end().last().addClass("swiper-pagination-bullet-active-next-next");

        
        }
        if (img_cnt == 2) {
            $slide_prev_btn.removeClass("swiper-button-disabled");
            $banner_img.removeClass();
            $banner_img.addClass("swiper_slide");
            $banner_img.first().addClass('swiper-slide-prev').end().eq(1).addClass('swiper-slide-active').end().last().addClass('swiper-slide-next');
            $banner_slide_btn.removeClass().addClass("swiper-pagination-bullet").css("left", "0px");
            $banner_slide_btn.first().addClass("swiper-pagination-bullet-active-prev").end().eq(1).addClass("swiper-pagination-bullet-active swiper-pagination-bullet-active-main").end().last().addClass("swiper-pagination-bullet-active-next")

        }
        if (img_cnt == 3) {
            $slide_next_btn.addClass("swiper-button-disabled");
            $banner_img.removeClass();
            $banner_img.addClass("swiper_slide");
            $banner_img.eq(1).addClass('swiper-slide-prev').end().last().addClass('swiper-slide-active');
            $banner_slide_btn.removeClass().addClass("swiper-pagination-bullet").css("left", "-16px")
            $banner_slide_btn.first().addClass("swiper-pagination-bullet-active-prev-prev").end().eq(1).addClass("swiper-pagination-bullet-active-prev").end().last().addClass("swiper-pagination-bullet-active swiper-pagination-bullet-active-main");

            img_cnt = 0; // 이미지 카운트 0으로 다시 초기화 시켜주면서 다시 이미지 카운트 1 부터 진행하도록 한다 . 
        }

    }
})
