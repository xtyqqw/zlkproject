<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社区</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/article.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/layui/layui.all.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background-color: #FFFFFF">
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <div>
            <img src="../img/1.png">
        </div>
        <ul class="ul1">
            <li><a href="">首页</a></li>
            <li><a href="">项目</a></li>
            <li><a href="">社区</a></li>
        </ul>
        <ul class="layui-nav layui-layout-center">
            <div class="demoTable">
                <div class="layui-inline">
                    <input class="layui-input" autocomplete="off" placeholder="请输入关键字" style="width: 220px">
                </div>
                <button class="layui-btn" data-type="reload" style="color:#F8F8F8;background-color: #6600FF">搜索</button>
            </div>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-dialogue" style="color: #555555;font-size: 20px"><span class="layui-badge-dot layui-bg-red"></span></i>
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                </a>
            </li>
        </ul>
    </div>
    <div class="layui-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 80px;border:2px solid #6600FF;width: 98%">
        </fieldset>
        <div class="div">
            <div class="div1"></div>
            <div class="div2">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" >
                    <ul class="layui-tab-title">
                        <li class="layui-this">全部</li>
                        <li>我的文章</li>
                        <li>草稿箱</li>
                    </ul>
                    <div class="layui-tab-content" style="height: 100px;">
                        <div class="layui-tab-item layui-show">1</div>
                        <div class="layui-tab-item">内容2</div>
                        <div class="layui-tab-item">内容3</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="div3"></div>
    </div>
</div>
</body>
</html>