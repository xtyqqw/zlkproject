var xingsu ;
var baifansu ;
$(function () {
    $.ajax({
        type : "POST",
        async: false,
        url :"/kechengshipin/selectOne?id=1",
        data:"",
        success: function (data) {
            console.log(data.id);
            console.log(data);
            $("#kechengId").val(data.id);
            $("#kechengshipin").html("<video width='100%' height='100%' controls style='border-radius: 5px;' >"
                +"<source src="+data.url+" type='video/mp4'>"
                +"您的浏览器不支持 HTML5 video 标签。"
                +" </video>");
            $("#rensu").text(data.rensu+"人");
            xingsu = data.haopindu;
            baifansu = data.yiwanchengkecheng/data.zhongkecheng*100;
            $("#jiage").text("￥"+data.jiage);
            $("#xianmuliang").text(data.xiangmuliang);
            $("#huoxingshu").text(data.yiwanchengkecheng+"/"+data.zhongkecheng);


        },
        error: function (data) {
            alert(JSON.stringify(data));
        }
    });
});
/*
* 这个是layui中的评分必要的js代码
*/
layui.use(['rate'], function(){
    var rate = layui.rate;

    //只读
    rate.render({
        elem: '#xingxing'
        ,value: xingsu
        ,readonly: true
    });
});
/*
 * 这个是layui进度条需要的js代码
 */
layui.use('element', function(){
    var $ = layui.jquery
        ,element = layui.element;
    element.progress('demo', baifansu+"%")
});
$(".xinxi").mouseenter(function () {
    $(this).css("background-color","#fff");
    $(this).css("height","7vw");
    $(this).css("width","7vw");
    $(this).css("margin-top","-1vw");
    $(this).css("box-shadow","0.1px 0.1px 0.1px 0.1px rgb(150,150,150)");
    $("#kechengshipin").css("z-index","-1");
    $(this).css("border-radius","3px");
    $(this).children().children().first().css("margin-top","1vw");
});
$(".xinxi").mouseleave(function () {
    $(this).css("background-color","rgb(235,235,235)");
    $(this).css("height","5vw");
    $(this).css("width","10%");
    $(this).css("margin-top","0vw");
    $(this).css("border-radius","0px");
    $("#kechengshipin").css("z-index","1");
    $(this).css("box-shadow","none");
    $(this).children().children().first().css("margin-top","0vw");
});