<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/18
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>头部</title>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/layui/layui.js"></script>
    <style type="text/css">
        body {
            margin: 0;
        }
        .header{
            background-color: #FFFFFF;
            height: 80px;
            width: 100%;
            border-bottom: 1px #989898;
            box-shadow: 1px 1px 5px 3px #D4D4D4;
        }
        /* 头部logo样式 */
        .header .header-logo{
            display: inline;
            margin-left: 30px;
            padding-top: 10px;
            float: left;
        }
        .header .header-nav{
            display: inline;
        }
        /* 头部导航 */
        .header .header-nav .nav{
            color: #000000;
            text-decoration: none;
            font-size: 20px;
            float: left;
            margin: 26px 30px;
            padding: 1px;
        }
        .header .nav:hover{
            color: #914EF3;
        }
        /*点击事件样式*/
        .header .active{
            color: #914EF3 !important;
            text-decoration: none;
            font-size: 20px;
            float: left;
            margin: 26px 30px;
            padding: 1px;
        }
        /* 头部搜索 */
        .header .header-search{
            float: left;
            display: inline;
            margin-left: 400px;
            margin-top: 18px;
        }
        /* 头部搜索框样式 */
        .header .header-search .text{
            height: 40px;
            background-color: #FAFAFA;
            border: 1px #FAFAFA;
            border-radius: 3px;/* 边框圆角 */
            text-indent: 1em;/* 首行缩进 */
            font-size: 16px;
            font-weight: bold;/* 粗体 */
            color: #989898;
        }
        /* 头部搜索按钮样式 */
        .header .header-search .submit{
            background-color: #914FF1;
            border: none;
            color: #FFFFFF;
            height: 40px;
            width: 70px;
            border-radius: 3px;
            font-size: 16px;
        }
        .header .header-login{
            display: inline;
            float: left;
            margin-top: 18px;
            padding: 10px 50px;
        }
        /* 头部注册登录样式 */
        .header .header-login a{
            text-decoration: none;
            color: #000000;
            font-size: 20px;
        }
        .header .header-login a:hover{
            color: #914EF3;
        }
        .name{
            line-height: 20px;
            font-size: 14px;
            text-align: center;
            overflow:hidden;
            text-overflow:ellipsis;
            display:-webkit-box;
            -webkit-box-orient:vertical;
            -webkit-line-clamp:1;
        }
    </style>
</head>
<body>
    <div class="header">
        <!-- logo -->
        <div class="header-logo">
            <img src="/img/logo.png" />
        </div>
        <!-- 导航 -->
        <div class="header-nav">
                <a href="javascript:;" name="nav" class="nav">首页</a>
                <a href="javascript:;" name="nav" class="nav">项目</a>
                <a href="javascript:;" name="nav" class="nav">社区</a>
        </div>
        <!-- 搜索 -->
        <div class="header-search">
            <form action="">
                <input class="text" type="text" placeholder="请输入关键词" />
                <input class="submit" type="submit" value="搜索" />
            </form>
        </div>

        <%--未登录显示注册登录--%>
        <c:if test="${user==null}">
            <!-- 注册登录 -->
            <div class="header-login">
                <a href="/users/tosignup">注册</a>
                <a style="color: #000000;">/</a>
                <a href="/users/tosignin">登录</a>
            </div>
        </c:if>
        <%--已登录显示登录信息--%>
        <c:if test="${user!=null}">
            <div>
                <ul class="layui-nav" style="margin: 0 330px 0 1150px">
                    <li class="layui-nav-item" lay-unselect="" style="margin-top: 10px;text-align: center">
                        <a href="javascript:;">
                            <img src="//t.cn/RCzsdCq" class="layui-nav-img" style="width: 40px;height: 40px;margin: 0 auto">
                            <p class="name" style="">${user.userRealname}</p>
                        </a>
                        <dl class="layui-nav-child">
                            <a href="/personal/person">个人中心</a>
                            <a href="/users/logout;">退了</a>
                        </dl>
                    </li>
                </ul>
            </div>
        </c:if>

    </div>
    <%--鼠标移入移出头像事件--%>
    <script>
        layui.use('element', function(){
            var element = layui.element;
            //监听导航点击
            element.on('nav(demo)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>
    <%--头部导航点击事件--%>
    <script type="text/javascript">
        $(function(){
            $("a[name='nav']").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
            });
        });
    </script>
</body>
</html>
