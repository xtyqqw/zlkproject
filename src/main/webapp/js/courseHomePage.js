$(function () {
    $.ajax({
        type : "POST",
        async: false,
        url :"/courseHomePage/selectAccountByUnitId?id=1",
        data:"",
        success: function (data) {
            console.log(data.url);
            console.log(data);
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