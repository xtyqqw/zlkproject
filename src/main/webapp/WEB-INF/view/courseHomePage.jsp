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
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>
    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
     .layui-tab {
         width: 950px;
         height: 600px;
         position: absolute;
         left: 200px;
         top: 100px;
     }
     .layui-this{
         width:190px;
         color:#000000;
     }
     .layui-tab-title{
         color:#000000;
     }
     .dt1{
         border: solid 1px;
         color: black;
         width: 213px;
         height: 100px;
     }
     .dl1{
         position: absolute;
         top: 90px;
     }
     .dl2{
         position: absolute;
         left: 240px;
         top: 90px;
     }
     .dl3{
         position: absolute;
         left: 468px;
         top: 90px;
     }
     .dl4{
            position: absolute;
            left: 698px;
            top: 90px;
        }
     .dl5{
         position: absolute;

         top: 320px;
     }
     .dl6{
         position: absolute;
         left: 240px;
         top: 320px;
     }
     .dl7{
         position: absolute;
         left: 468px;
         top: 320px;
     }
     .dl8{
         position: absolute;
         left: 698px;
         top: 320px;
     }
     .dd1{
         box-shadow:-2px 0 3px -1px #ebebeb,
         -2px 0 3px -1px #ebebeb,
         2px 0 3px -1px  #ebebeb;
         height: 100px;

     }
     .h61{
         position: absolute;
         left: 10px;
         top: 103px;
         color: #1f2022;
     }
     .h62{
         position: absolute;
         left: 128px;
         top: 103px;
         color: #1f2022;
     }
     .h63{
         position: absolute;
         left: 155px;
         top: 103px;
         color: #1f2022;
     }
     .h64{
         position: absolute;
         left: 10px;
         top: 123px;
         color: #ff4413;
     }
     .h65{
         position: absolute;
         left: 70px;
         top: 123px;
         color: #807d7c;
     }
     .but1{
         width: 100px;
         height: 30px;
         position: absolute;
         left: 53px;
         top: 153px;
         background-color: #1E9FFF;
         color: white;
         border-radius: 5px;
     }
     .conceal{
         width: 950px;
         height: 300px;
         position: absolute;
         z-index: 1;
         background-color: #f6f1ff;
         display: none;
         top:39px;
         left: -2px;

     }
    </style>


</head>
<body>

<div class="layui-tab layui-tab-brief" >
    <ul class="layui-tab-title">
        <li class="layui-this" >全部内容</li>


    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="conceal" >
                <p>JAVA</p>
                <p>HTML</p>
                <p>CSS</p>
                <p>JS</p>
            </div>
            <dl class="dl1">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl2">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl3">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl4">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl5">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl6">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl7">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
            <dl class="dl8">
                <dt class="dt1"></dt>
                <dd class="dd1">
                    <h6 class="h61">学习人数</h6>
                    <h6 class="h62">章</h6>
                    <h6 class="h63">节</h6>
                    <h6 class="h64">金额</h6>
                    <h6 class="h65">上次学习时间</h6>
                    <input class="but1" type="button" value="查看详情">

                </dd>

            </dl>
        </div>

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
        $(this).css("border-radius","5px");
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




</body>
</html>