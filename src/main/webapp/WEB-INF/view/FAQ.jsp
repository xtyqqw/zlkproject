<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/11/25
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layuiXingxing.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1523298_ebdj0htk708.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <style>
        .kechengzhuti{
            padding: 0px 15vw;
        }
        .kechengzhuti .xiangmuxiangqing{
            margin-top: 1vw;
        }
        .kechengzhuti .xiangmuxiangqing1{
            margin-top: 1vw;
        }
        .kechengzhuti .xiangmuxiangqing .xiangqingbiaoti{
            width: 15%;
            margin:  0 auto;
            line-height: 5vw;
            height: 5vw;
        }
        .kechengzhuti .xiangmuxiangqing1 .xiangqingbiaoti1{
            width: 20%;
            margin:  0 auto;
            line-height: 5vw;
            height: 5vw;
        }
        .kechengzhuti .xiangmuxiangqing .xiangqingbiaoti .xiangqingbiaotineirong{
            font-size: 1.5vw;
            height: 2vw;
            float: left;
        }
        .kechengzhuti .xiangmuxiangqing1 .xiangqingbiaoti1 .xiangqingbiaotineirong1{
            font-size: 1.5vw;
            height: 2vw;
            float: left;
        }
        .kechengzhuti .xiangmuxiangqing .xiangqingbiaoti .xiao{
            margin: 2.2vw 0.2vw 0vw 0.2vw;
            line-height: 5vw;
            width: 0.6vw;
            float: left;
            height: 0.6vw;
        }
        .kechengzhuti .xiangmuxiangqing1 .xiangqingbiaoti1 .xiao1{
            margin: 2.2vw 0.2vw 0vw 0.2vw;
            line-height: 5vw;
            width: 0.6vw;
            float: left;
            height: 0.6vw;
        }
        .kechengzhuti .xiangmuxiangqing .xiangqingbiaoti .da{
            margin-top: 1.7vw;
            width: 1.6vw;
            float: left;
            height: 1.6vw;
        }
        .kechengzhuti .xiangmuxiangqing1 .xiangqingbiaoti1 .da1{
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
             width: 9%;
             left:140px ;
             top: -125px;
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
            top: -15px;
        }
        .touxiang{
            background: url("img/courses.png");
            border-radius:50%;
            width: 70px;
            height: 70px;
            position: relative;
            left: 20px;
        }
        .mingzi{
            position: relative;
            text-align:center;
            font-size: 14px;
            font-weight:bold;
        }
        #xing1{
            position: relative;
            float: left;
            top: -15px;
            left: 15px;
        }
        #xing2{
            position: relative;
            top: -15px;
            left: 15px;
            float: left;

        }
        #xing3{
            position: relative;
            top: -15px;
            left: 15px;
            float: left;

        }
        #xing4{
            position: relative;
            top: -15px;
            left: 15px;
            float: left;

        }
        #xing5{
            position: relative;
            top: -15px;
            left: 15px;
            float: left;

        }
    </style>
</head>
<body>
<div class="kechengzhuti">
    <div class="xiangmuxiangqing">
        <div class="xiangqingbiaoti">
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <b class="xiangqingbiaotineirong">FAQ</b>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
            <span class="layui-badge-dot layui-bg-blue da"></span>
            <span class="layui-badge-dot layui-bg-blue xiao"></span>
        </div>
    </div>
    <div style="clear: both"></div>
    <div id="liu">
    </div>
</div>

<div class="kechengzhuti">
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
                                '<div class="touxiang"></div>' +
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
                                '<i class="iconfont icon-star-fill xingxing" style="color: rgb(255,251,27);"></i>'+
                                '</li>'+
                                '</ul>'+
                                '</div>'+
                                '</div>'+
                                '<p class="p-FAQ3">'+comment.comments+'</p><br>'+
                                '<div class="p-FAQ5"><p><span class="badge badge-warning" contenteditable="true">讲师回复</span></p> </div>'+
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
