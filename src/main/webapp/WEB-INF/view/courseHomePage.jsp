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
     .tabbable{
         width: 950px;
         height: 600px;
         position: absolute;
         left: 150px;
         top: 200px;
     }
    </style>
</head>
<body>


<div class="tabbable" id="tabs-360466"> <!-- Only required for left/right tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#panel-401510" data-toggle="tab" contenteditable="true">全部</a></li>
        <li class=""><a href="#panel-622356" data-toggle="tab" contenteditable="true">JAVA</a></li>
        <li class=""><a href="#panel-111111" data-toggle="tab" contenteditable="true">HTML</a></li>
        <li class=""><a href="#panel-111112" data-toggle="tab" contenteditable="true">CSS</a></li>
        <li class=""><a href="#panel-111113" data-toggle="tab" contenteditable="true">JS</a></li>

    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="panel-401510" contenteditable="true">
            <p>
                <a class="btn" href="#" contenteditable="true">JAVA</a>
                <a class="btn" href="#" contenteditable="true">HTML</a>
                <a class="btn" href="#" contenteditable="true">CSS</a>
                <a class="btn" href="#" contenteditable="true">JS</a>
            </p>

        </div>
        <div class="tab-pane" id="panel-622356" contenteditable="true">
            <p><a>JAVA</a></p>
        </div>
        <div class="tab-pane" id="panel-111111" contenteditable="true">
            <p><a>HTML</a></p>
        </div>
        <div class="tab-pane" id="panel-111112" contenteditable="true">
            <p><a>CSS</a></p>
        </div>
        <div class="tab-pane" id="panel-111113" contenteditable="true">
            <p><a>JS</a></p>
        </div>
    </div>
</div>

<%--<ul class="thumbnails">
    <li class="span4">
        <div class="thumbnail"> <img alt="300x200" src="img/timg.jpg">
            <div class="caption" contenteditable="true">
                <h3>冯诺尔曼结构</h3>
                <p>也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。</p>
                <p><a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a></p>
            </div>
        </div>
    </li>
    <li class="span4">
        <div class="thumbnail"> <img alt="300x200" src="img/timg.jpg">
            <div class="caption" contenteditable="true">
                <h3>哈佛结构</h3>
                <p>哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。</p>
                <p><a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a></p>
            </div>
        </div>
    </li>
    <li class="span4">
        <div class="thumbnail"> <img alt="300x200" src="img/timg.jpg">
            <div class="caption" contenteditable="true">
                <h3>改进型哈佛结构</h3>
                <p>改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。</p>
                <p><a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a></p>
            </div>
        </div>
    </li>

    <li class="span4">
        <div class="thumbnail"> <img alt="300x200" src="img/timg.jpg">
            <div class="caption" contenteditable="true">
                <h3>改进型哈佛结构</h3>
                <p>改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。</p>
                <p><a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a></p>
            </div>
        </div>
    </li>
</ul>--%>

</body>
</html>