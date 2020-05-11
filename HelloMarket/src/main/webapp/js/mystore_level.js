$(function(){
    const grade_pop = $("#grade_advantage");

    function popup(){
       $(grade_pop).on('click',function(){
           $('body').addClass("ReactModal__Body--open modal_open");
           $(".ReactModalPortal").css('display','block');
       });
       popupClose();
    }

    function popupClose(){
        $(".modal_close").on('click',function(){
            $('body').removeClass("ReactModal__Body--open modal_open");
            $(".ReactModalPortal").css('display','none');
        });
    }

    function init(){
        popup();
    }
    init();
})