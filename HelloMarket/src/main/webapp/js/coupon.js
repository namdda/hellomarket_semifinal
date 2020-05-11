$(function () {
    const left_coupon = $(".left_coupon");
    const right_coupon = $(".right_coupon");
    const react_modal = $(".ReactModalPortal");
    const modal_close = $(".modal_close");
    const popup_close = $(".popup_type2_footer");

    function cphd() {
        for(let i=0;i<left_coupon.length;i++){
            $(left_coupon[i]).on('click',function(){
                $(this).addClass('active').siblings(".left_coupon").removeClass('active');
            })
        }

    }

    function reactopen(){
        for(let i=0;i<right_coupon.length;i++){
            $(right_coupon[i]).on('click',function(){
                $(react_modal[i]).css('display','block');
            })
        }
        reactclose();
    }

    function reactclose(){
            $(modal_close).on('click', function(){
                $(react_modal).css('display', 'none');
            })
        }
        popupclose();
    function popupclose(){
        $(popup_close).on('click', function(){
            $(react_modal).css('display', 'none');
        })
    }
    

    function init() {
        cphd();
        reactopen();
    }
    init();
})

// use_coupon
// expiration_coupon