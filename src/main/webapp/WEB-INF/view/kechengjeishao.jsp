<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1523298_ebdj0htk708.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1517658_03zd610p4xl.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1523298_1nuc1djggf7.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1355944_zfigtx3pcpa.css">


    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/kechengjeishao.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/courseDetails.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css" >
        body {
            line-height: 0px;
            font: 0px Helvetica Neue,Helvetica,PingFang SC,Tahoma,Arial,sans-serif;
        }
    </style>
    <style>
        .kechengzhu{
            padding: 0px 15vw;
        }
        .kechengzhu .xiangmuxiang{
            margin-top: 1vw;
        }
        .kechengzhu .xiangmuxiangqing1{
            margin-top: 1vw;
        }
        .kechengzhu .xiangmuxiang .xiangqingbiao{
            width: 15%;
            margin:  0 auto;
            line-height: 5vw;
            height: 5vw;
        }
        .kechengzhu .xiangmuxiangqing1 .xiangqingbiaoti1{
            width: 20%;
            margin:  0 auto;
            line-height: 5vw;
            height: 5vw;
        }
        .kechengzhu .xiangmuxiang .xiangqingbiao .xiangqingbiaotinei{
            font-size: 1.5vw;
            height: 2vw;
            float: left;
        }
        .kechengzhu .xiangmuxiangqing1 .xiangqingbiaoti1 .xiangqingbiaotineirong1{
            font-size: 1.5vw;
            height: 2vw;
            float: left;
        }
        .kechengzhu .xiangmuxiang  .xiangqingbiao .xiao{
            margin: 2.2vw 0.2vw 0vw 0.2vw;
            line-height: 5vw;
            width: 0.6vw;
            float: left;
            height: 0.6vw;
        }
        .kechengzhu .xiangmuxiangqing1 .xiangqingbiaoti1 .xiao1{
            margin: 2.2vw 0.2vw 0vw 0.2vw;
            line-height: 5vw;
            width: 0.6vw;
            float: left;
            height: 0.6vw;
        }
        .kechengzhu .xiangmuxiang .xiangqingbiao .da{
            margin-top: 1.7vw;
            width: 1.6vw;
            float: left;
            height: 1.6vw;
        }
        .kechengzhu .xiangmuxiangqing1 .xiangqingbiaoti1 .da1{
            margin-top: 1.7vw;
            width: 1.6vw;
            float: left;
            height: 1.6vw;
        }
        .div-FAQ{
            width: 100%;
            background-color:  #ffffff;
            position: relative;
            border-radius:5px;
            padding-bottom: 18px;
        }

        .p-FAQ2{
            text-align: left;
            width:95%;
            margin:0 auto;
            font-size:12px;
            font-weight:bold;
            letter-spacing:3px;
            color: #333436;
        }
        .p-FAQ1{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            text-align: left;
            width:95%;
            margin:0 auto;
            font-size:11px;
            letter-spacing:3px;
            color: #4f5256;

        }
        .p-FAQ1gai{
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }
        .FAQall{
            float: right;
            margin-top: 8px;
            margin-right: 10px;

        }
        .div-FAQ:hover{
            box-shadow:-2px 0 3px -1px #ebebeb,-2px 0 3px -1px #ebebeb,2px 0 3px -1px  #ebebeb;
            background-color: #f1f4ff ;
        }
        .div1{
            height: 30px;
            background-color: #ffffff ;
        }
        .p-FAQ3{
            text-align: left;
            width:80%;
            font-weight:bold;
            letter-spacing:3px;
            color: #333436;
            height: 57px;
        }
        .p-FAQ4{
            width:65%;
            font-size:12px;
            letter-spacing:3px;
            color: #4f5256;
            display: inline-block;
            float: left;
            margin-left: 40px;
        }


        .span-FAQ5{
            width: 8%;
            border-radius:5px ;
            background-color: #eae944;
            color: #FFFFFF;
            display: inline-block;
            float: left;
        }
        .p-ZAN{
            position: relative;
            width: 7%;
            left:230px ;
            top: 20px;
            border-radius:5px ;
            color: grey;
            height: 30px;
        }
        .p-CAI{
            position: relative;
            width: 7%;
            left:330px;
            top: -10px;
            border-radius:5px ;
            color: grey;
            height: 30px;
        }
        .p-FAQ6{
            display: inline-block;
            float: left;
            width: 40%;
            height: 30PX;
            font-size: 20px;
            margin-top: 5px;
        }
        .p-FAQ7{
            display: inline-block;
            float: left;
            width: 40%;
            height: 30PX;
            margin-left: 30px;
            margin-top: -28px;
            font-size: 20px;
        }

        .div-FAQ1:hover{
            box-shadow:-2px 0 3px -1px #e5e5e5,-2px 0 3px -1px #e5e5e5,2px 0 3px -1px  #e5e5e5;

        }
        .div-FAQ1{
            width: 100%;
            position: relative;
            border-radius:5px;
            height: 200px;
            background: url("img/remenpinglun.png") no-repeat right top #ffffff;
        }
        .sanjiao{
            position: relative;
            left: 790px;
            width: 70px;
            height: 70px;
            top: -338px;
        }
        .daniu{
            width: 13%;
            height: 110px;
            display: inline-block;
        }
        .you{
            width: 86%;
            height: 199px;
            display: inline-block;
            float: right;
            margin-top: -20px;
        }
        .mingzi{
            position: relative;
            text-align:center;
            font-size: 14px;
            font-weight:bold;
            top: 10px;
        }
        #xing1{
            position: relative;
            float: left;
            top: 20px;
            left: 20px;
        }
        #xing2{
            position: relative;
            top: 20px;
            left: 20px;
            float: left;

        }
        #xing3{
            position: relative;
            top: 20px;
            left: 20px;
            float: left;

        }
        #xing4{
            position: relative;
            top: 20px;
            left: 20px;
            float: left;

        }
        #xing5{
            position: relative;
            top: 20px;
            left: 20px;
            float: left;

        }

        .icon-good{
            font-size: 30px;
            display: inline-block;
            float: left;
        }
        .biao1{
            font-size: 30px;
            display: inline-block;
            float: left;
            margin-top: -5px;
        }
        .img1{

            height: 70px;
            width:70px;
            position: relative;
            top: -204px;
            left: 86.5%;
        }
        .img1:hover{
            height: 70px;
            width:70px;
            position: relative;
            top: -204px;
            left: 86.5%;
            background:url("img/remenpinglunbai.png");
        }
    </style>

</head>
<body>
<jsp:include page="../jsp/header.jsp"></jsp:include>
<div id="kechengzhuti">
    <div id="kechengjeishao">
        <input id="kechengId" type="hidden">
        <div id="kechengshipin">

        </div>
        <div id="kechengxinxi">
            <ul>
                <li class="xinxi">
                    <div>
                        <div class="xiaobiaoti"><h6><b>学习人数</b></h6></div>
                        <div id="rensu"><p>123人</p></div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div  class="xiaobiaoti"><h6><b>好评度</b></h6></div>
                        <div id="xingxing">
                        </div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div  class="xiaobiaoti"><h6><b>价格</b></h6></div>
                        <div id="jiage">￥200.00</div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div class="xiaobiaoti"><h6><b>项目量</b></h6></div>
                        <div id="xianmuliang">21步54节</div>
                    </div>
                </li>
                <li class="xinxi">
                    <div>
                        <div class="xiaobiaoti"><h6><b>获星数量</b></h6></div>
                        <div class="layui-progress layui-progress-big"  lay-filter="demo">
                            <div id="huoxingshu" class="layui-progress-bar layui-bg-orange" lay-percent="0%">800/1000</div>
                        </div>
                    </div>
                </li>

            </ul>
            <div id="chanjia">
                <button id="jiaru">
                    参加项目
                </button>
            </div>
        </div>
    </div>
    <div id="xiangmujeishao">
        <div id="jeishaobiaoti">
            <div id="jeishaobiaotidiv">
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
                <span class="layui-badge-dot layui-bg-blue da"></span>
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
                <b id="jeishaobiaotineirong">项目介绍</b>
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
                <span class="layui-badge-dot layui-bg-blue da"></span>
                <span class="layui-badge-dot layui-bg-blue xiao"></span>
            </div>
        </div>
        <div id="jeishaoneirong">
            <div id="jeishaotText">
                <div id="jeishaozhengwen">
                    <p>项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。
                    </p>
                </div>
            </div>
            <div id="jeishaoImg">
                <img src="#">
            </div>
        </div>
    </div>
    <div id="kechengtedian">
        <div id="kechengtedianbiaoti">
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <b id="tedianbiaotineirong">项目特点</b>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
        </div>
        <div id="tedianneirong">
            <div id="tedianImg">
                <img src="#">
            </div>
            <div id="tediantext">
                <div id="tedianzhengwenneirong">
                    <p> 项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
                        项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div id="xiangmuxiangqing">
        <div id="xiangqingbiaoti">
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <b id="xiangqingbiaotineirong">项目详情</b>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
        </div>
        <ul id="xiangqingneirong">
        </ul>
    </div>
</div>

<div class="kechengzhu">
    <div class="xiangmuxiang">
        <div class="xiangqingbiao">
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <b class="xiangqingbiaotinei">FAQ</b>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
        </div>
    </div>
    <div style="clear: both"></div>
    <div id="liu">
    </div>
</div>

<div class="kechengzhu">
    <div class="xiangmuxiangqing1">
        <div class="xiangqingbiaoti1">
            <span class="layui-badge-dot layui-bg-blue xiao1"></span>
            <span class="layui-badge-dot layui-bg-blue da1"></span>
            <span class="layui-badge-dot layui-bg-blue xiao1"></span>
            <b class="xiangqingbiaotineirong1">评论详情</b>
            <span class="layui-badge-dot layui-bg-blue xiao1"></span>
            <span class="layui-badge-dot layui-bg-blue da1"></span>
            <span class="layui-badge-dot layui-bg-blue xiao1"></span>
        </div>
    </div>

    <div style="clear: both"></div>
    <div id="liu1">
    </div>


</div>

<jsp:include page="../jsp/footer.jsp"></jsp:include>


<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"  charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/kechengjeishao.js"  charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/courseDetails.js" charset="utf-8"></script>
<%--瀑布流--%>
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        flow.load({
            elem: '#liu' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
//模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit =2;
                    var data={"page":page,"limit":limit};
                    console.log(data);
                    $.ajax({
                        type :"POST",
                        url:"<%=request.getContextPath()%>/Faq/findFaqList",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.faqList, function (i, faq) {

                                lis.push(
                                    '<div class="div-FAQ">' +
                                    '<br>' +
                                    '<p class="p-FAQ2">'+faq.answer+'</p><br>' +
                                    '<p class="p-FAQ1 p-FAQ1gai">'+faq.question+'</p><br>'+

                                    '</div>'+
                                    '<div class="div1"></div>'

                                );
                            })
                            next(lis.join(''), page < 2); //假设总页数为 6
                        }
                    });
                }, 500);
            }
        });
    });
</script>

<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        flow.load({
            elem: '#liu1' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
//模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit =2;
                    var number;
                    var data={"page":page,"limit":limit};
                    console.log(data);
                    $.ajax({
                        type :"POST",
                        url:"<%=request.getContextPath()%>/comment/findCommentListByUserId",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            number=result.yeishu;
                            console.log(result.yeishu);
                            layui.each(result.commentList, function (i, comment) {
                                lis.push(
                                    '<div class="div-FAQ1" ><br><br>' +
                                    '<div class="daniu">' +
                                    '<div class="touxiang"> <img id="img1" src="'+comment.userImg+'" style="height: 70px;width: 70px;border-radius:50%;"></div>' +
                                    '<div class="mingzi">'+comment.userRealname+'</div>'+
                                    '<div class="daxingxing">'+
                                    '<ul class="kechengxiaojeipingfen_ul">'+
                                    '<li id="xing1">'+
                                    '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                    '</li>'+
                                    '<li id="xing2">'+
                                    '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                    ' </li>'+
                                    '<li id="xing3">'+
                                    '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                    '</li>'+
                                    '<li id="xing4">'+
                                    '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                    ' </li>'+
                                    '<li id="xing5">'+
                                    '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,222,30);"></i>'+
                                    '</li>'+
                                    '</ul>'+
                                    '</div>'+
                                    '</div>'+
                                    '<div class="you">' +

                                    '<p class="p-FAQ3">'+comment.comments+'</p>'+
                                    '<div class="p-FAQ5"><span class="span-FAQ5">&nbsp;讲师回复</span>' +
                                    '<p class="p-FAQ4">'+comment.teacherAnswer+'</p><br>'+
                                    '</div>'+

                                    '<div style="clear: both"></div>'+
                                    '<div class="sanjiao"></div>'+
                                    '</div>'+
                                    '<div class="p-ZAN"><i class="iconfont icon-good"></i>' +
                                        '<p class="p-FAQ6">&nbsp'+comment.like+'</p>'+
                                    '</div>' +
                                    '<div class="p-CAI"><i class="iconfont icon-bad biao1"></i>' +
                                    '<p class="p-FAQ7">&nbsp'+comment.dislike+'</p>'+
                                    '</div>');
                                if(comment.flag === "true"){

                                    lis.push('<img class="img1" src="../img/remenpinglunbai.png">');
                                }else{

                                }
                                lis.push(
                                    '</div>'+
                                    '<div class="div1"></div>'
                                );
                            });
                            next(lis.join(''), page < number); //假设总页数为 6
                        }
                    });
                }, 500);
            }
        });
    });
    $("#liu").on("click",".p-FAQ1",function() {
        if($(this).hasClass("p-FAQ1gai")){
            $(this).removeClass("p-FAQ1gai");
        }else{
            $(this).addClass("p-FAQ1gai");
        }

    });
    /*$(function () {
        $("#liu").on("click", ".FAQall", function () {
            if (($(this).html())==="查看详情") {

                $(this).siblings(".p-FAQ1").removeClass("p-FAQ1gai");
                $(this).html("收起");
            } else {
                $(this).siblings(".p-FAQ1").addClass("p-FAQ1gai");
                $(this).html("查看详情");
            }

        });
    });*/


</script>
</body>
</html>