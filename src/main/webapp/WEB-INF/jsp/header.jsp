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
    <style type="text/css">
        body {
            margin: 0;
            text-align: center;
        }
        .header{
            background-color: #FFFFFF;
            height: 80px;
            width: 100%;
            border-bottom: 1px #989898;
            box-shadow: 1px 1px 5px 3px #D4D4D4;
        }
        /* 头部logo样式 */
        .header-logo{
            display: inline;
            margin-left: 30px;
            padding-top: 10px;
            float: left;
        }
        .header-nav{
            display: inline;
        }
        /* 头部导航 */
        .header-nav a{
            color: #000000;
            text-decoration: none;
            font-size: 20px;
            float: left;
            padding: 26px 30px;
        }
        .header-nav a:hover{
            color: #914EF3;
        }
        /* 头部搜索 */
        .header-search{
            float: left;
            display: inline;
            margin-left: 400px;
            margin-top: 18px;
        }
        /* 头部搜索框样式 */
        .header-search .text{
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
        .header-search .submit{
            background-color: #914FF1;
            border: none;
            color: #FFFFFF;
            height: 40px;
            width: 70px;
            border-radius: 3px;
            font-size: 16px;
        }
        .header-login{
            display: inline;
            float: left;
            margin-top: 18px;
            padding: 10px 50px;
        }
        /* 头部注册登录样式 */
        .header-login a{
            text-decoration: none;
            color: #000000;
            font-size: 20px;
        }
        .header-login a:hover{
            color: #914EF3;
        }
    </style>
</head>
<body>
    <div class="header">
        <!-- logo -->
        <div class="header-logo">
            <img src="img/logo.png" />
        </div>
        <!-- 导航 -->
        <div class="header-nav">
            <div>
                <a href="javascript:;">首页</a>
            </div>
            <div>
                <a href="javascript:;">项目</a>
            </div>
            <div>
                <a href="javascript:;">社区</a>
            </div>
        </div>
        <!-- 搜索 -->
        <div class="header-search">
            <form action="">
                <input class="text" type="text" placeholder="请输入关键词" />
                <input class="submit" type="submit" value="搜索" />
            </form>
        </div>

        <%--未登录显示注册登录--%>
        <c:if test="">
            <!-- 注册登录 -->
            <div class="header-login">
                <a href="javascript:;">注册</a>
                <a style="color: #000000;">/</a>
                <a href="javascript:;">登录</a>
            </div>
        </c:if>
        <%--已登录显示登录信息--%>
        <c:if test="">
            <%--头像--%>
            <div>

            </div>
        </c:if>

    </div>
</body>
</html>
