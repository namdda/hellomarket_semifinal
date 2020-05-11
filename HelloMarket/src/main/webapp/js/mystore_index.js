$(function(){
    const profile_menu = $(".my_profile_item_menu").children().children('li');

    function profile_slide(){
        for(let i=0;i<$(profile_menu).length;i++){
            $(profile_menu[i]).on('click',function(e){
                $(this).addClass('active').children('a').addClass('active');
                $(this).siblings().children('a').removeClass('active').end().siblings().removeClass('active')
            })
        }
    }

    function init(){
        $(profile_menu).on('click',profile_slide)
    }

    init();
})