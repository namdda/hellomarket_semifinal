

function checkForm(){
    var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var pwCheck = RegExp(/^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);

    if(!emailCheck.test($("#userid").val())){
    alert("이메일 형식에 맞게 입력하세요.");
    $("#userid").val("");
    $("#userid").focus();
    return false;
}

    if(!pwCheck.test($("#userpw").val())){
    alert("비밀번호를 형식에 맞게 입력하세요.");
    $("#userpw").val("");
    $("#userpw").focus();
    return false;
}

}

function errorEmail(){
    const emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    const emailMsg = $(".phone_and_email_area");
    if(!emailCheck.test($("#userid").val())){
       $(".error_msg").css('display','block');
    }else{
        $(".error_msg").css('display','none');
    }
}

function ifnot(){
    const $body = $("body");
    $body.addClass(". stop-scrolling");

}

$(document).ready(function (){
    const $save_id = $(".feature_option_checkbox_indicator");
    $save_id.on('click',function(){
        $(this).toggleClass('checked');
    })
 })