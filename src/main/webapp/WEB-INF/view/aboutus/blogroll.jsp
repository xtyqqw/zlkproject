<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/11/20
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>友情链接</title>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <style type="text/css">
        body{margin: 0;}
        /* 外框 */
        .blogroll-waik{
            margin-left: 5px;
            margin-bottom: 10px;
            border: 1px #FFFFFF;
            width: 1000px;height: 650px;
            box-shadow: 0px 3px 5px 3px #D4D4D4;
        }
        .blogroll-waik .blogroll-tiao{
            height: 4px;
            background-color: #713ED7;
            border-top: none;
        }
        /* 标题 */
        .blogroll-waik .blogroll-title{
            width: 180px;height: 55px;
            background-color: #713ED7;
            border-radius: 3px;
            margin: 0 auto;
        }
        .blogroll-waik .blogroll-title p{
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            margin-top: 0;
            padding: 10px 0px;
            letter-spacing: 8px;/* 字间距 */
        }
        .blogroll-waik .blogroll-main ul{
            float: left;
        }
        .blogroll-waik .blogroll-main .ul1{
            margin: 40px 40px 20px 60px;
        }
        .blogroll-waik .blogroll-main .ul2{
            margin: 40px 20px 20px 20px;
        }
        .blogroll-waik .blogroll-main .ul3,.ul4{
            margin: 40px 40px 20px 20px;
        }
        .blogroll-waik .blogroll-main ul li{
            padding: 30px 15px 40px 20px;
        }
        .blogroll-waik .blogroll-main a{
            text-decoration: none;
            color: #999999;
        }
        .blogroll-waik .blogroll-main a:hover{
            color: #713ED7;
        }
    </style>
</head>
<body>
    <!-- 外框 -->
    <div class="blogroll-waik">
        <!-- 外框上面一条 -->
        <div class="blogroll-tiao"></div>
        <!-- 标题 -->
        <div class="blogroll-title">
            <p>友情链接</p>
        </div>
        <!-- 内容 -->
        <div class="blogroll-main">
            <ul class="ul1">
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.aliyun.com/" target="_blank">阿里云</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="http://mishumao.zcool.com.cn/" target="_blank">秘书猫教育</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="http://fans.tcl.com/guanfang/f40/" target="_blank">铁粉社区</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://v.qq.com/" target="_blank">腾讯视频</a>
                </li>
            </ul>
            <ul class="ul2">
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://hao.360.cn/" target="_blank">360导航</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://wetest.qq.com/" target="_blank">We Test腾讯质量开放平台</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.php.cn/" target="_blank">PHP站中文网</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.ikebang.com/" target="_blank">爱帮课</a>
                </li>
            </ul>
            <ul class="ul3">
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.hao123.com/" target="_blank">hao123</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.aliyun.com/" target="_blank">学习找工作网</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://lbs.amap.com/" target="_blank">高德开发者论坛</a>
                </li>
            </ul>
            <ul class="ul4">
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.iqiyi.com/" target="_blank">爱奇艺</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://cloud.tencent.com/" target="_blank">腾讯云</a>
                </li>
                <li>
                    <i class="layui-icon layui-icon-website" style="padding: 5px"></i>
                    <a href="https://www.zhipin.com/" target="_blank">boss直聘</a>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
