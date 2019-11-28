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
            width: 1000px;height: 650px;
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
<body>
<!-- 内容 -->
<div class="about-main">
    <div class="tiao"></div>
    <!-- 关于我们标题 -->
    <div class="about-title">
        <p>关于我们</p>
    </div>
    <!-- 内容 -->
    <div class="aboutus-main">
        <%--        <c:forEach></c:forEach>--%>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷是什么机构
            </li>
            <p>智量酷是一家专注于互联网教育的平台，本着为学生负责的理念打造国内顶尖的教育网站。</p>
        </ul>

        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                平台建立的初衷是什么
            </li>
            <p>智量酷平台工作人员希望所有对互联网充满热情的同学都能通过更便捷的方式获得一流的学习资源，让每一位心怀梦想的学员都长出一双在新时代翱翔的翅膀，用新时代的工具创造出完美的人生。</p>
        </ul>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷在做什么
            </li>
            <p>结合像BAT这种知名企业的项目，拆分功能，总结技能知识点，转化成教学课程供学生学习，让学员在学习中就能积累社会经验值。</p>
        </ul>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷的追求是什么
            </li>
            <p>让每一位热爱互联网的学生都能来智量酷学习，并且为止感到骄傲！</p>
        </ul>
        <ul>
            <li>
                <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                智量酷是谁
            </li>
            <p>智量酷隶属北京荣新科技有限公司，是一家从事互联网在线教育的网络教育企业。秉承“以人为本，教育为真”的办学理念，将互联网特性全面的应用在教育领域，致力于为教育机构及求学者打造一站在线互动学习的教育品牌。</p>
        </ul>
    </div>
</div>
</body>
</html>
