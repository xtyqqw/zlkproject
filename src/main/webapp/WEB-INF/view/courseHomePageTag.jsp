<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/11/18
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layuiXingxing.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1523298_ebdj0htk708.css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



    <style>
        .layui-tab {
            width: 1050px;
            height: 500px;
            position: relative;
            left: 200px;
            top: 30px;
        }

        .layui-this{
            width:190px;
            color:#000000;
        }
        .layui-tab-title{
            color:#000000;
        }
        .dt1{
            border: solid 0px;
            color: black;
            width: 213px;
            height: 90px;
        }

        .dl1{
            height: 190px;
            width:230px;
        }

        .h61{
            position: relative;
            left: 10px;
            top: 8px;
            color: #1f2022;
            font-weight:bold;
        }
        .h62{
            position: relative;
            left: 135px;
            top: -8px;
            color: #1f2022;
            font-weight:bold;
        }
        .h63{
            position: relative;
            left: 167px;
            top: -23px;
            color: #1f2022;
            font-weight:bold;
        }
        .h64{
            position: relative;
            left: 10px;
            top: -20px;
            color: #ff4413;
            font-size: 13px;
            font-weight:bold;

        }
        .h65{
            position: relative;
            left: 60px;
            top: -34px;
            color: #807d7c;
            font-size: 12px;
        }
        .but1{
            width: 100px;
            height: 25px;
            position: absolute;
            left: 53px;
            top: 52px;
            background-color: #1E9FFF;
            color: white;
            border-radius: 5px;
            font-weight:bold;
            border: none;
        }

        .conceal{
            width: 950px;
            height: 200px;
            position: absolute;
            z-index: 1;
            background-color: #ffffff;
            display: none;
            top:39px;
            left: 0px;
            border: 2px solid #0a61ff;
            border-radius: 3px;
        }

        .badge{


        }

        #badge9{
            position: relative;
            top:40px;
            left: 5px;
            opacity: 0.8;
            pointer-events: none;
        }
        #badge10{
            position: relative;
            top:20px;
            left: 50px;
            opacity: 0.8;
        }

        #new1{
            position: relative;
            top:-14px;
            left: 165px;
            background-color: #ff565d;
            font-weight:bold;
        }
        #hot1{
            background-color: #ffc628;
            font-weight:bold;
            position: relative;
            top:-14px;
            left: 75px;
        }
        .xingxing {
            position: absolute;
            top: 71px;
            left: 110px;
            width: 100px;
            height: 50px;
        }


        .li1{
            float: left;
            height: 190px;
            margin-left: 30px;
        }

        .h51{
            position: relative;
            top:55px;
            left:5px;
            font-weight:bold;
            color: white;
        }

        .dd2{
            position: relative;
            top:-102px;
            left:10px;
        }
        .dd3{
            box-shadow:-2px 0 3px -1px #ebebeb,
            -2px 0 3px -1px #ebebeb,
            2px 0 3px -1px  #ebebeb;
            height: 80px;
            position: relative;
            top: -55px;
            width:212px;
        }

        .layui-this{
            font-weight:bold;
        }
        #xing1{
            position: relative;
            top:-65px;
            left:-40px;
            float: left;
        }
        #xing2{
            position: relative;
            top:-65px;
            left:-60px;
            float: left;

        }
        #xing3{
            position: relative;
            top:-65px;
            left:-80px;
            float: left;

        }
        #xing4{
            position: relative;
            top:-65px;
            left:-100px;
            float: left;

        }
        #xing5{
            position: relative;
            top:-65px;
            left:-120px;
            float: left;

        }

        #biao7{
            width: 100px;
            height: 25px;
            position: relative;
            font-size:15px;
            font-weight:bold;
            cursor: pointer;
            background-color: #1E9FFF;
            color: white;
            border-radius: 3px;
            font-weight:bold;
            border: none;
            margin: 8px;
        }
        /*#biao1:hover{
            text-decoration:none;
            background-color: rgb(208, 209, 255);
            position: relative;
            font-size:15px;
            font-weight:bold;
            border-radius: 3px;
        }
        #biao2:hover{
            text-decoration:none;
            background-color: rgb(208, 209, 255);
            position: relative;
            top: 23px;
            font-size:15px;
            font-weight:bold;
            border-radius: 3px;
        }
        .biao3:hover{
            text-decoration:none;
            background-color: rgb(208, 209, 255);
            position: relative;
            top: 43px;
            font-size:15px;
            font-weight:bold;
            border-radius: 3px;
        }
        .biao4:hover{
            text-decoration:none;
            background-color: rgb(208, 209, 255);
            position: relative;
            top: 63px;
            font-size:15px;
            font-weight:bold;
            border-radius: 3px;
        }*/

    </style>

    <style type="text/css">
        body{margin: 0;}
        #footer{
            background-color: #333C4D;
            height: 130px;
            width: 100%;
            margin-top: 50px;
            margin-bottom: 0;
            position: absolute;
        }
        #footer ul{
            padding-top: 30px;
            width: 800px;
            height: 60px;
            margin: 0 auto;
            border-bottom: 1px solid #999999;
        }
        #footer ul li{
            float: left;
            list-style: none;
            padding-left: 30px;
        }
        #footer ul li a{
            color: #989898;
            text-decoration: none;
            float: left;
            padding-left: 20px;
        }
        #footer ul li a:hover{
            color: #F2F2F2;
        }
        #footer hr{
            width: 800px;
            color: #989898;
        }
        #footer p{
            color: #989898;
            text-align: center;
            padding-top: 10px;
        }
    </style>



</head>
<body>

<jsp:include page="../jsp/headerXiangmu.jsp"></jsp:include>
<div class="layui-tab layui-tab-brief" >
    <ul class="layui-tab-title">
        <li class="layui-this" >全部内容</li>


    </ul>
    <div class="layui-tab-content" >
        <div class="layui-tab-item layui-show">
            <div class="conceal" >
                <div id="biaoqian">
                    <br>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>

    </div>

    <ul id="LAY_demo2" class="LAY_demo2"></ul>

</div>
</div>



<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>

<script>
    $(".layui-this").mouseenter(function () {
        $(this).css("background-color","#6872ff");
        $(this).css("border-radius","5px");
        $(this).css("color","#fff");
        $(".conceal").show();
        $(this).children().first().css("margin-top","1vw");

    });
    $(".layui-this").mouseleave(function () {
        $(this).css("background-color","#fff");
        $(this).css("height","3vw");
        $(this).css("bordeer-radius","5px");
        $(this).css("margin-top","0vw");
        $(this).css("border","none");
        $(this).css("color","#4ea9cd");
        $(".conceal").hide();
        $(this).children().children().first().css("margin-top","0vw");

    });
    $(".conceal").mouseenter(function () {
        $(this).show();
    });

    $(".conceal").mouseleave(function () {
        $(this).hide();
    });
    $(".layui-this").click( function () {
        $(this).siblings().css("width","185px");
        $(this).siblings().css("color","#4ea9cd");

    });

</script>
<%--<script src="/js/courseHomePage.js" charset="UTF-8"></script>--%>

<script src="/layui/layui.js" charset="utf-8"></script>


<%--瀑布流--%>
<script>
    layui.use(['flow'], function() {
        var flow = layui.flow;
        flow.load({
            elem: '#biaoqian' //流加载容器
            , isAuto: false
            ,end: "<p></p>"
            , done: function (page, next) { //加载下一页
//模拟插入
                setTimeout(function () {
                    var lis = [];
                    var limit = 10;
                    var data = {"page": page, "limit": limit};
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/tagKe/findTagList",
                        dataType: "json",
                        data: data,
                        success: function (result) {
                            layui.each(result.tagList, function (i, tag) {
                                lis.push(
                                    /*'<br><a class="a1">' + tag.tagName + '</a>'*/
                                    //'<input id="biao7" type="button" onclick=window.open("HomePageTag?tagName='+tag.tagName+'") value="' + tag.tagName + '"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                                    '<input class="biao7" id="biao7" type="button"  value="' + tag.tagName + '"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                                );

                            });
                            next(lis.join(''), page < 1); //假设总页数为 6
                        }

                    });
                });
            }
        });
    });




    /*流点击标签筛选*/
    $("#biaoqian").on("click","#biao7",function() {
        $("#LAY_demo2").empty();
        $("#LAY_demo2").append("<ul id='LAY_demo3'class='LAY_demo3'></ul>");
        console.log($(this).val());
        var name=$(this).val();
        layui.use(['flow'], function(){
            var flow = layui.flow;
            flow.load({
                elem: '#LAY_demo3' //流加载容器
                ,isAuto: false
                ,end: "<p>没有更多了</p>"
                ,done: function(page, next){ //加载下一页
                    //模拟插入
                    setTimeout(function(){
                        var lis = [];
                        var limit =8;
                        var tagName= name;
                        var data={"page":page,"limit":limit,"tagName":tagName};
                        console.log(data);
                        $.ajax({
                            type :"POST",
                            url:"<%=request.getContextPath()%>/courseHomePage/findAllByTag",
                            dataType:"json",
                            data:data,
                            success:function(result) {
                                layui.each(result.allListTag, function (i,coursesTag) {
                                    lis.push(

                                        '<div>' +
                                        '<li class="li1">' +
                                        '<dl class="dl1">' +
                                        '<dt class="dt1">' +
                                        '<img id="img1" src="'+coursesTag.introducePic+'" style="height: 90px;width: 213px ">' +
                                        '</dt>' +
                                        '<dd class="dd2">' +
                                        '<h5 class="h51">'+coursesTag.coursesName+'</h5>' +
                                        ' <span class="badge badge-warning" contenteditable="true" id="new1">NEW</span> ' );
                                    if(coursesTag.studentNum>=5000){
                                        lis.push(
                                            ' <span class="badge badge-important" contenteditable="true" id="hot1">HOT</span>  '
                                        );
                                    }
                                    lis.push(
                                        '<p><span class="badge" contenteditable="true" id="badge9">'+coursesTag.tagName+'</span></p>' +
                                        /*'<p><span class="badge" contenteditable="true" id="badge10">html</span></p>' +*/
                                        '<div class="xingxing">');

                                    if(coursesTag.studentNum>=5000){
                                        lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                            '<li id="xing1">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing2">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing3">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing4">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing5">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '</ul>');
                                    }else if(coursesTag.studentNum<5000&&coursesTag.studentNum>=4000){
                                        lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                            '<li id="xing1">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing2">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing3">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing4">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '</ul>');
                                    }else if(coursesTag.studentNum<4000&&coursesTag.studentNum>=3000){
                                        lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                            '<li id="xing1">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing2">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing3">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '</ul>');
                                    }else if(coursesTag.studentNum<3000&&coursesTag.studentNum>=2000){
                                        lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                            '<li id="xing1">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing2">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '</ul>');
                                    }else if(coursesTag.studentNum<2000&&coursesTag.studentNum>=1000){
                                        lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                            '<li id="xing1">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '<li id="xing2">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '</ul>');
                                    }else if(coursesTag.studentNum<1000){
                                        lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                            '<li id="xing1">'+
                                            '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                            '</li>'+
                                            '</ul>');
                                    }
                                    lis.push(
                                        '</div>'+
                                        '</dd>' +
                                        '<dd class="dd3">' +
                                        '<h6 class="h61" id="renshu">学习人数:'+coursesTag.studentNum+'人</h6>' +
                                        '<h6 class="h62" id="zhang">'+coursesTag.chapterNum+'章</h6>' +
                                        '<h6 class="h63" id="jie">'+coursesTag.sectionNum+'节</h6>' +
                                        '<h6 class="h64" id="jin">￥'+coursesTag.price+'</h6>' );
                                    if(coursesTag.lastStudyTime==null){
                                        lis.push(
                                            '<h6 class="h65"></h6>' );
                                    }else{ lis.push(
                                        '<h6 class="h65">上次学习时间：'+coursesTag.lastStudyTime+'</h6>' );
                                    }
                                    console.log(coursesTag);
                                    lis.push(
                                        '<input class="but1" type="button" onclick=window.open("<%=request.getContextPath()%>kecheng/kechengjianjie?coursesId='+coursesTag.coursesId+'") value="查看详情"/>' +
                                        '</dd>' +
                                        '</dl>' +
                                        '</li>' +
                                        '</div>'
                                    );

                                });

                                next(lis.join(''), page < 1); //假设总页数为 6
                            }
                        });
                    },500);

                }
            });
        });

    });


    /*视频加载流*/
    layui.use(['flow'], function(){
        var flow = layui.flow;

        flow.load({
            elem: '#LAY_demo2' //流加载容器
            ,isAuto: false
            ,end: "<p>没有更多了</p>"
            ,done: function(page, next){ //加载下一页
//模拟插入
                setTimeout(function(){
                    var lis = [];
                    var limit =8;
                    var tagName= tagName;
                    var data={"page":page,"limit":limit,"tagName":tagName};
                    console.log(data);
                    $.ajax({
                        type :"POST",
                        url:"<%=request.getContextPath()%>/courseHomePage/findAllByTag1",
                        dataType:"json",
                        data:data,
                        success:function(result) {
                            layui.each(result.allListTag, function (i,coursesTag) {
                                lis.push(

                                    '<div>' +
                                    '<li class="li1">' +
                                    '<dl class="dl1">' +
                                    '<dt class="dt1">' +
                                    '<img id="img1" src="'+coursesTag.introducePic+'" style="height: 90px;width: 213px ">' +
                                    '</dt>' +
                                    '<dd class="dd2">' +
                                    '<h5 class="h51">'+coursesTag.coursesName+'</h5>' +
                                    ' <span class="badge badge-warning" contenteditable="true" id="new1">NEW</span> ' );
                                if(coursesTag.studentNum>=5000){
                                    lis.push(
                                        ' <span class="badge badge-important" contenteditable="true" id="hot1">HOT</span>  '
                                    );
                                }
                                lis.push(
                                    '<p><span class="badge" contenteditable="true" id="badge9">'+coursesTag.tagName+'</span></p>' +
                                    /*'<p><span class="badge" contenteditable="true" id="badge10">html</span></p>' +*/
                                    '<div class="xingxing">');

                                if(coursesTag.studentNum>=5000){
                                    lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                        '<li id="xing1">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing2">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing3">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing4">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing5">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '</ul>');
                                }else if(coursesTag.studentNum<5000&&coursesTag.studentNum>=4000){
                                    lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                        '<li id="xing1">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing2">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing3">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing4">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '</ul>');
                                }else if(coursesTag.studentNum<4000&&coursesTag.studentNum>=3000){
                                    lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                        '<li id="xing1">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing2">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing3">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '</ul>');
                                }else if(coursesTag.studentNum<3000&&coursesTag.studentNum>=2000){
                                    lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                        '<li id="xing1">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing2">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '</ul>');
                                }else if(coursesTag.studentNum<2000&&coursesTag.studentNum>=1000){
                                    lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                        '<li id="xing1">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '<li id="xing2">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '</ul>');
                                }else if(coursesTag.studentNum<1000){
                                    lis.push('<ul class="kechengxiaojeipingfen_ul">'+
                                        '<li id="xing1">'+
                                        '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                        '</li>'+
                                        '</ul>');
                                }
                                lis.push(
                                    '</div>'+
                                    '</dd>' +
                                    '<dd class="dd3">' +
                                    '<h6 class="h61" id="renshu">学习人数:'+coursesTag.studentNum+'人</h6>' +
                                    '<h6 class="h62" id="zhang">'+coursesTag.chapterNum+'章</h6>' +
                                    '<h6 class="h63" id="jie">'+coursesTag.sectionNum+'节</h6>' +
                                    '<h6 class="h64" id="jin">￥'+coursesTag.price+'</h6>' );
                                if(coursesTag.lastStudyTime==null){
                                    lis.push(
                                        '<h6 class="h65"></h6>' );
                                }else{ lis.push(
                                    '<h6 class="h65">上次学习时间：'+coursesTag.lastStudyTime+'</h6>' );
                                }
                                console.log(coursesTag);
                                lis.push(
                                    '<input class="but1" type="button" onclick=window.open("<%=request.getContextPath()%>kecheng/kechengjianjie?coursesId='+coursesTag.coursesId+'") value="查看详情"/>' +
                                    '</dd>' +
                                    '</dl>' +
                                    '</li>' +
                                    '</div>'
                                );

                            });

                            next(lis.join(''), page < 1); //假设总页数为 6
                        }
                    });
                },500);
            }
        });
    });


</script>


<div style="clear: both"></div>

<div id="footer">
    <ul>
        <li>
            <a href="/aboutus/aboutus">关于我们</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">加入我们</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">联系我们</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">讲师合作</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">帮助中心</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">友情链接</a>
        </li>
        <li>
            <a href="/aboutus/aboutus">合作企业</a>
        </li>
    </ul>
    <p>
        copyright&nbsp;&nbsp;&nbsp;&nbsp;2017&nbsp;&nbsp;&nbsp;&nbsp;北京智量酷教育科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;京ICP备09076312号
    </p>
</div>

</body>
</html>