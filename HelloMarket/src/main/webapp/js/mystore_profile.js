$(function(){
    const typed = false;

    function nickchange(){
        const nick_check = RegExp(/^[a-zA-Z0-9]{4,16}$/);
        const nick_button = $("#nick_change")

        $(nick_button).on('click',function(){
            if(!nick_check.test($("#nick_area").val())){
                $(".ReactModalPortal").css('display','block');
                $("#idCheck_not").css('display','block');
                $(".popup_type2_footer").on('click',function(){
                    $(".ReactModalPortal").css('display','none');
                })
            }
            else{
                const changeNick = $("#nick_area").val();
                $("#nick_area").val(changeNick);
                $(".ReactModalPortal").css('display','block');
                $("#idCheck_not").css('display','block');
                $("#idCheck_not").html("닉네임 변경이 완료 되었습니다.");
                $(".popup_type2_footer").on('click',function(){
                    $(".ReactModalPortal").css('display','none');
                    $("#idCheck_not").css('display','none');
                })
                changeNickname(changeNick);
            }
        })
    }
    function changeNickname(changeNick){
        $.ajax({
            url : "/HelloMarket/mystore/nickChange_ok.jsp",
            type : "POST",
            cache : false,
            dataType : "text",
            data : "user_nick="+changeNick,
            success : function(data){
                $(".nick_title").html(changeNick);
                $(".my_profile_nick").html(changeNick);
            },
            error : function(request,status,error){
                var msg = "ERROR : " + request.status + "<br>"
               console.log(msg);   
               }

        });
    }

    function profChange(){
        $(".introduce_button").on('click',function(){
            const changeProf = $(".introduce_textarea").children("textarea").val();
            $(".ReactModalPortal").css('display','block');
            $("#idCheck_not").css('display','block');
            changeProfile(changeProf);
            $("#idCheck_not").html("자기소개가 변경되었습니다.");
            $(".popup_type2_footer").on('click',function(){
                $(".ReactModalPortal").css('display','none');
                $("#idCheck_not").css('display','none');
            })
        })
    }
    function changeProfile(changeProf){
        $.ajax({
            url : "/HelloMarket/mystore/profChange_ok.jsp",
            type : "POST",
            cache : false,
            dataType : "text",
            data : "user_prof="+changeProf,
            success : function(data){
               $("#profile").html("<span>"+changeProf+"</span>");
            },
            error : function(request,status,error){
                var msg = "ERROR : " + request.status + "<br>"
               console.log(msg);   
               }

        });
    }
    
    function phoneChange(){
        $("#phone_button").on('click',function(){
            $(this).addClass("edit_cancel_btn");
            $("#add_btn_div").append("<button type='button' class='phone_button_box'>변경</button>");
            $("#add_text_div").append("<input type='text' placeholder='휴대폰번호를 입력해주세요' class='input_box phone_input_box' value=''>")
            $(".phone_button_box").on('click',function(){
                const changePhone = $(".phone_input_box").val();
                $(".ReactModalPortal").css('display','block');
                $("#idCheck_not").css('display','block');
                changePhoneNum(changePhone);
                $("#idCheck_not").html("휴대폰 번호가 변경되었습니다.");
                $(".popup_type2_footer").on('click',function(){
                    $(".ReactModalPortal").css('display','none');
                    $("#idCheck_not").css('display','none');
                })

            })
        })
    }
    function changePhoneNum(changePhone){
        $.ajax({
            url : "/HelloMarket/mystore/phoneChange_ok.jsp",
            type : "POST",
            cache : false,
            dataType : "text",
            data : "user_ph="+changePhone,
            success : function(data){
               $(".phone_notice").html(changePhone);
               $(".phone_button_box").remove();
               $(".phone_input_box").remove();
               $("#phone_button").removeClass("edit_cancel_btn");

            },
            error : function(request,status,error){
                var msg = "ERROR : " + request.status + "<br>"
               console.log(msg);   
               }

        });
    }
    $("#upProfile").on("click",function(){
    	console.log("this");
    	$("#upFile").click();
    })
    
    $("#upFile").change(function(e){
    	const formData = new FormData($('#form')[0]);

    	
    	$.ajax({
    		url : '/HelloMarket/mystore/imgChange_ok.jsp',
            type : 'POST',
            enctype : 'multipart/form-data',	
            data : formData,
            contentType : false,
            processData : false,
            success : function(data){
            	console.log('suc');

             },
             error : function(request,status,error){
                 var msg = "ERROR : " + request.status + "<br>"
                console.log(msg);   
                }


    	})
    })
    
   
    function init(){
        nickchange();
        profChange();
        phoneChange();
    }
    init();
})