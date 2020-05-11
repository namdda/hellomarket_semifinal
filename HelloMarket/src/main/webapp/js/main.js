$(function(){
    const nick_title = $(".nick");

    function silde_up_nick(){
        $('body').on('click',function(e){
            if($(".gnb_my_lyr").parent().css('display')=="block"){
                if(!$(".gnb_my_lyr, .nick").has(e.target).length){
                    $(".gnb_my_lyr").parent().hide()
                }
            }
        });
    }
    function slide_nick(){
        $('.gnb_my_lyr').parent().show()
    }

    const open_cat = $("#open_cat");
    let open_cat_type = false;
    
   function open_category(){
        if(!open_cat_type){
            $(open_cat).on('click',function(){
                $(open_cat).addClass('active');
                $("#category_display").css('display','block');
                open_cat_type = true;
                close_category();
            })
        }
   }
   
   function close_category(){
       if(open_cat_type){
           $(open_cat).on('click',function(){
               $(open_cat).removeClass('active');
               $("#category_display").css('display','none');
           })
           $('body').on('click',function(e){
               if(!$(open_cat).has(e.target).length){
                   $(open_cat).removeClass('active');
                   $("#category_display").css('display','none');
               }
           })
           open_cat_type = false;
           open_category();
       }
   }

    function init(){
        silde_up_nick();
        $(nick_title).on('click',slide_nick)
        open_category()
    }
    init();
})