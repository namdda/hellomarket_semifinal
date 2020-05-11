$(function(){
    const mobiile_ad_list = $(".open_ad");

    function open_ad(){
        for(let i=0;i<$(mobiile_ad_list).length;i++){
            $(mobiile_ad_list[i].addEventListener('click',function(){
                $(mobiile_ad_list[i]).siblings().removeClass('active').end().toggleClass('active');
                if($(mobiile_ad_list[i]).hasClass('active')){
                    $(mobiile_ad_list[i]).children('div').css('display','block');
                }else{
                    $(mobiile_ad_list[i]).children('div').css('display','none');
                }
            }))
        }
    }

    function ad_close(){
        
    }


    function init(){
        open_ad();
    }
    init();
})