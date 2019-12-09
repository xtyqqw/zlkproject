<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿},关于我们首页
  Date: 2019/11/22
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关于我们首页</title>
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #guanyuwomenzhuti{
            margin-left: 1vw;
            margin-top: 1vw;
            z-index: -9;
            position: relative;
            float: left;
            margin: 8vw 0vw 5vw 19vw;
            width: 1000px;
            box-shadow: 0vw 0.3vw 0.3vw 0.3vw rgb(235,235,235);
            border-top: 0.3vw solid #713ED7;
            padding-bottom: 5vw;
            margin-left: 1vw;
            margin-top: 1vw;
        }
        #guanyuwomenzhuti #wen_da{
            margin-right: 3vw;
            margin-left: 5vw;
        }
        #guanyuwomenzhuti li{
            font-size: 1vw;
            list-style: disc;
            margin-top: 2vw;
            margin-bottom: 2vw;
        }
        #guanyuwomenzhuti #zhuti_tou{
            border-radius: 0.3VW;
            width: 18vw;
            height: 5vw;
            background-color: #713ED7;
            border: none;
            font-size: 2vw;
            line-height: 4vw;/*垂直居中*/
            text-align: center;
            color: #ffffff;
            margin: 0 auto;
        }
        #guanyuwomenzhuti #wen_da .wen{
            color: rgb(70,70,70);
            font-size: 1.5vw;
        }
        #guanyuwomenzhuti #wen_da .da{
            color: rgb(150,150,150);
            font-size: 1.2vw;
        }



    </style>
</head>
<body>


<div id="guanyuwomenzhuti">
    <div id="zhuti_tou">关&nbsp;于&nbsp;我&nbsp;们</div>

    <ul id="wen_da">
        <li style="display: none">
            <b class="wen">关于我们首页id</b>
            <p class="da">${aboutus.aboutusId}</p>
        </li>
        <li>
            <b class="wen">智量酷是什么机构</b>
            <p class="da">${aboutUs.aboutusOrganization}</p>
        </li>
        <li>
            <b class="wen">平台建立的初衷是什么</b>
            <p class="da">${aboutUs.aboutusCause}</p>
        </li>
        <li>
            <b class="wen">智量酷在做什么</b>
            <p class="da">${aboutUs.aboutusJob}</p>
        </li>
        <li>
            <b class="wen">智量酷在追求什么</b>
            <p class="da">${aboutUs.aboutusChase}</p>
        </li>
        <li>
            <b class="wen">智量酷是谁</b>
            <p class="da">${aboutUs.aboutusZlk}</p>
        </li>

    </ul>

</div>

</body>
</html>
