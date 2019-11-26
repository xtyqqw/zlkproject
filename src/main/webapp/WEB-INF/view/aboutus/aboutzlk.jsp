<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/19
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>合作企业</title>
<%--    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">--%>
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
        .line2{
            width: 820px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <!-- 内容 -->
    <div class="about-main">
        <div class="tiao"></div>
        <!-- 关于我们标题 -->
        <div class="about-title">
            <p>合作企业</p>
        </div>
        <!-- 内容 -->
        <div class="aboutus-main">
            <ul>
                <li>
                    <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                    北京大学
                </li>
                <p class="line2">学校的简短介绍学校的简短介绍学校的简短介绍学校的简短介绍学校的简短介绍学校的简短介绍学校的简短介绍学校的简短介绍学校的简短介绍简短介绍学校的简短介绍学校的简短介绍简短介绍学校的简短介绍学校的简短介绍简短介绍学校的简短介绍学校的简短介绍简短介绍学校的简短介绍学校的简短介绍简短介绍学校的简短介绍学校的简短介绍</p>
            </ul>
            <ul>
                <li>
                    <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                    北京科技大学
                </li>
                <p class="line2">学校的简短介绍(最大不超过两行)学校的简短介绍，学校的简短介绍。</p>
            </ul>
            <ul>
                <li>
                    <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                    斯坦福大学
                </li>
                <p class="line2">学校的简短介绍(最大不超过两行)</p>
            </ul>
            <ul>
                <li>
                    <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                    伯克利大学
                </li>
                <p class="line2">学校的简短介绍(最大不超过两行)</p>
            </ul>
            <ul>
                <li>
                    <i class="layui-icon layui-icon-senior" style="padding: 5px"></i>
                    剑桥大学
                </li>
                <p class="line2">智量酷隶属北京荣新科技有限公司，是一家从事互联网在线教育的网络教育企业。秉承“以人为本，教育为真”的办学理念，将互联网特性全面的应用在教育领域，致力于为教育机构及求学者打造一站在线互动学习的教育品牌。</p>
            </ul>
        </div>
    </div>
</body>
</html>
