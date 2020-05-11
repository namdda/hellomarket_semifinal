$(function(){

    const trade_btn = $(".left_nav_menu").children();

    function trade(){
        console.log(trade_btn)
        for(let i=0;i<trade_btn.length;i++){
            $(trade_btn[i]).on('click',function(){
                $(this).children('a').addClass('active');
                $(this).siblings().children('a').removeClass('active');
            })
        }
    }

    function init(){
       trade()
    }

    init();
})