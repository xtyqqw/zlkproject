<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 上官螃蟹
  Date: 2019/11/23
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body{margin: 0;}
        .about-main{
            margin: 5px;
            border: 1px #FFFFFF;
            width: 99%;height: 650px;
            box-shadow: 0px 3px 5px 3px #D4D4D4;
        }
        .about-main .tiao{
            height: 4px;
            background-color: #713ED7;
            border-top: none;
        }
        /*关于我们标题*/
        .about-main .about-title{
            width: 180px;height: 55px;
            background-color: #713ED7;
            border-radius: 3px;
            margin: 0 auto;
        }
        /*关于我们字样式*/
        .about-main .about-title p{
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            margin-top: 0;
            padding: 10px 0px;
            letter-spacing: 8px;/* 字间距 */
        }
        /*内容*/
        .about-main .aboutus-main{
            margin: 40px auto;
            width: 900px;height: 500px;
        }
        .about-main .aboutus-main ul{
            margin: 5px 0 40px 0;
        }
        .about-main .aboutus-main li{
            font-size: 18px;
        }
        .about-main .aboutus-main p{
            font-size: 15px;
            color: #999999;
            margin: 5px 30px;
        }
    </style>
</head>
<body style="width: 99%">
<!-- 内容 -->
<div class="about-main">
    <div class="tiao"></div>
    <!-- 关于我们标题 -->
    <div class="about-title">
        <p>帮助中心</p>
    </div>
    <!-- 内容 -->
    <div class="aboutus-main">
        <%--        <c:forEach></c:forEach>--%>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷是什么机构
            </li>
            <p>${help.zlkMsg}</p>
        </ul>

        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                平台建立的初衷是什么
            </li>
            <p>${help.zlkPurpose}</p>
        </ul>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷在做什么
            </li>
            <p>${help.zlkDo}</p>
        </ul>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷的追求是什么
            </li>
            <p>${help.zlkSeek}</p>
        </ul>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷是谁
            </li>
            <p>${help.zlkIswho}</p>
        </ul>
    </div>
</div>
</body>
</html>
