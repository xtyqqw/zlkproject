/*点击已关注 取消关注*/
$(".att_success1,.att_success2,.att_success3,.att_success4,.att_success5").hide();
$(".ok_zi").click(function () {
    let str = $(this).prev().prev().text() + '';
    nofollow(str,$(this));
});
function nofollow(userId,mythis){
    $.ajax({
        url:"/follow/defollow?userId="+userId,
        type:"GET",
        dataType:"json",
        context: userId,
        success:function (data) {
            if (data.code === '1'){
                mythis.hide();
                mythis.siblings(".ok").hide();
                mythis.siblings(".jia,.no_zi").show();
                mythis.parents().siblings(".att_tan").children(".att_success1").show().delay(2000).hide(300);
            } else {
                mythis.parents().siblings(".att_tan").children(".att_success2").show().delay(2000).hide(300);
            }
        },
        error:function () {
            mythis.parents().siblings(".att_tan").children(".att_success3").show().delay(2000).hide(300);
        }
    });
}
/*点击加关注*/
$(".no_zi").click(function () {
    let str = $(this).prev().prev().text() + '';
    jiafollow(str,$(this));
});
function jiafollow(userId,mythis){
    $.ajax({
        url:"/follow/follow?userId="+userId,
        type:"GET",
        dataType:"json",
        success:function (data) {
            if (data.code === '1'){
                mythis.hide();
                mythis.siblings(".jia").hide();
                mythis.siblings(".ok,.ok_zi").show();
                mythis.parents().siblings(".att_tan").children(".att_success4").show().delay(2000).hide(300);
            } else {
                mythis.parents().siblings(".att_tan").children(".att_success5").show().delay(2000).hide(300);
            }
        },
        error:function () {
            mythis.parents().siblings(".att_tan").children(".att_success3").show().delay(2000).hide(300);
        }
    });
}