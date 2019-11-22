<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>社区</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/article.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">

    <script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>

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
            <div class="div1">

            </div>

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
        <%--<div class="div3">--%>
        <div class="wz_remenwenzhang">
            <div class="wz_remen">
                <div class="wz_remen_wz">
                    <span>热门文章</span>
                </div>
                <div class="anniu">
                    <span class="yueanniu">月</span><span class="zonganniu">总</span>
                </div>
            </div>
            <div class="wz_remen_zt1">
                <ul>
                    <c:forEach items="${alist}" var="article">
                    <li>
                        <a href="/test/community">
                            <div class="wz_remen_img">
                                <img src="<c:out value="${article.userImg}"></c:out>" >
                            </div>
                            <div class="wz_remen_bt">
                                <div class="bt"><c:out value="${article.title}"></c:out></div>
                                <div class="wz_bt_bq">
                                    <span><i class="layui-icon">&#xe705;</i>阅读<c:out value="${article.browseCount}"></c:out></span>
                                    <span><i class="layui-icon">&#xe611;</i>评论<c:out value="${article.commentCount}"></c:out></span>
                                </div>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="wz_remen_zt2">
                <ul>
                    <c:forEach items="${blist}" var="article">
                        <li>
                            <a href="/test/community">
                                <div class="wz_remen_img">
                                    <img src="<c:out value="${article.userImg}"></c:out>" >
                                </div>
                                <div class="wz_remen_bt">
                                    <span><c:out value="${article.title}"></c:out></span>
                                    <div class="wz_bt_bq">
                                        <span><i class="layui-icon">&#xe705;</i>阅读<c:out value="${article.browseCount}"></c:out></span>
                                        <span><i class="layui-icon">&#xe611;</i>评论<c:out value="${article.commentCount}"></c:out></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>


    </div>
</div>

<script type="text/javascript">
    $(document).on('mouseenter','.wz_remen_zt1>ul>li',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
        $(this).children().css('color','blue');
    })
    $(document).on('mouseleave','.wz_remen_zt1>ul>li',function(){
        $(this).css('box-shadow','none');
        $(this).children().css('color','black');
    })
    $(document).on('mouseenter','.wz_remen_zt2>ul>li',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
        $(this).children().css('color','blue');
    })
    $(document).on('mouseleave','.wz_remen_zt2>ul>li',function(){
        $(this).css('box-shadow','none');
        $(this).children().css('color','black');
    })

    $(document).on('mouseenter','.yueanniu',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
    })
    $(document).on('mouseleave','.yueanniu',function(){
        $(this).css('box-shadow','none');
    })

    $(document).on('mouseenter','.zonganniu',function(){
        $(this).css('box-shadow','#D8D8D8 0 0 0.4vw');
    })
    $(document).on('mouseleave','.zonganniu',function(){
        $(this).css('box-shadow','none');
    })

    $(document).on('click','.yueanniu',function(){
        $('.yueanniu').css('background-color','blue');
        $('.yueanniu').css('color','white');
        $('.zonganniu').css('background-color','white');
        $('.zonganniu').css('color','black');
    })
    $(document).on('click','.zonganniu',function(){
        $('.yueanniu').css('background-color','white');
        $('.yueanniu').css('color','black');
        $('.zonganniu').css('background-color','blue');
        $('.zonganniu').css('color','white');
    })
    $(document).on('click','.yueanniu',function(){
        $('.wz_remen_zt1').css('display','block');
        $('.wz_remen_zt2').css('display','none');
    })
    $(document).on('click','.zonganniu',function(){
        $('.wz_remen_zt2').css('display','block');
        $('.wz_remen_zt1').css('display','none');
    })
</script>
</body>
</html>