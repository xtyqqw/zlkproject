<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1523298_1nuc1djggf7.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/kechengjeishao.css">
    <link rel="stylesheet" href="/css/courseDetails.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            text-align: left;
            width:95%;
            margin:0 auto;
            font-size:11px;
            letter-spacing:3px;
            color: #4f5256;

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
            width:75%;
            margin:0 auto;
            font-size:12px;
            font-weight:bold;
            letter-spacing:3px;
            color: #333436;
            position: relative;
            left:35px;
            top: -125px;
        }
        .p-FAQ4{
            text-align: left;
            width:65%;
            margin:0 auto;
            font-size:12px;
            letter-spacing:3px;
            color: #4f5256;
            position: relative;
            left:78px;
            top: -155px;
        }
        .p-FAQ5{
            position: relative;
            width: 7%;
            left:140px ;
            top: -125px;
            border-radius:5px ;
            background-color: #eae944;
            color: #FFFFFF;

        }
        .div-FAQ1:hover{
            box-shadow:-2px 0 3px -1px #ebebeb,-2px 0 3px -1px #ebebeb,2px 0 3px -1px  #ebebeb;
            background: url("img/remenpinglunbai.png") no-repeat right top #ffffff ;
        }
        .div-FAQ1{
            width: 100%;
            position: relative;
            border-radius:5px;
            height: 200px;
            background: url("img/remenpinglun.png") no-repeat right top #fbf9ff;
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
            position: relative;
            left: 15px;
            top: -10px;
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
                    <p>项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。项目文字版介绍正文内容，此处正文内容有字数限制，最多显示三百字。<br>
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


<script type="text/javascript" src="/layui/layui.js"  charset="utf-8"></script>
<script type="text/javascript" src="/js/kechengjeishao.js"  charset="utf-8"></script>
<script src="/js/courseDetails.js" charset="utf-8"></script>
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
                        url:"/Faq/findFaqList",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.faqList, function (i, faq) {
                                lis.push(
                                    '<div class="div-FAQ">' +
                                    '<br>' +
                                    '<p class="p-FAQ2">'+faq.answer+'</p> <br>' +
                                    '<p class="p-FAQ1">'+faq.question+'</p><br>'+

                                    '</div>'+
                                    '<div class="div1"></div>'

                                );
                            })
                            next(lis.join(''), page < 3); //假设总页数为 6
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
                    var commentUserId=1;
                    var data={"page":page,"limit":limit,"commentUserId":commentUserId};
                    console.log(data);
                    $.ajax({
                        type :"POST",
                        url:"/comment/findCommentListByUserId",
                        dataType:"json",
                        data:data,
                        success:function(result) {
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
                                    '<p class="p-FAQ3">'+comment.comments+'</p><br>'+
                                    '<div class="p-FAQ5"><div>&nbsp;讲师回复</div></div>'+
                                    '<p class="p-FAQ4">'+comment.teacherAnswer+'</p><br>'+
                                    '<div style="clear: both"></div>'+
                                    '<div class="sanjiao"></div>'+
                                    '</div>'+
                                    '<div class="div1"></div>'
                                );
                            })
                            next(lis.join(''), page < 3); //假设总页数为 6
                        }
                    });
                }, 500);
            }
        });
    });
    $("#liu").on("click",".p-FAQ1",function() {

        $(this).css("-webkit-line-clamp","8");
    });
</script>
</body>
</html>